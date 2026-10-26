"""
Module 5: SQL Verification / Database Execution.

    SQL DDL + TestSuite  --[real Postgres execution]-->  VerificationResult

This is the module that replaces MDCAgent's LLM-based "Check Agent"
with execution-grounded verification, per the locked plan's core
architectural differentiator: "Verification is grounded in actual
database execution... Constraint behavior can be tested objectively."

No LLM call happens anywhere in this module.

Isolation strategy
-------------------
Everything for one schema's verification -- creating a dedicated
schema namespace, executing the DDL, and running every TestCase --
happens inside a SINGLE Postgres transaction on a connection the
caller provides. Each TestCase's setup_sql + action_sql (+ optional
post_check) runs inside its own SAVEPOINT, which is always rolled
back afterwards regardless of pass/fail, so:

  - one test's failure (a rejected INSERT is often EXPECTED to fail)
    never poisons the rest of the transaction, and
  - tests never see side effects from earlier tests -- every TestCase
    in a TestSuite is independent, matching Module 4's own design.

At the very end of `verify_schema`, the ENTIRE transaction is rolled
back, whether or not verification succeeded. Nothing is ever
committed. The target database is left exactly as it was found.
"""

from __future__ import annotations

import logging
import re
from dataclasses import replace
from typing import Optional

import psycopg2
import sqlparse

from ..module4_constraint_tests.models import TestCase, TestSuite
from ..module5_verification.models import (
    STRUCTURAL_TEST_TYPES,
    DDLExecutionResult,
    TestCaseResult,
    VerificationResult,
)
from .db import make_namespace
from ..utils.sql_normalization import normalize_sql_for_ablation

logger = logging.getLogger("er2sql.module5_verification")


def _bind_identifier_spelling(sql: str, names: set[str], table_columns=None) -> str:
    """Align canonical case-insensitive names with unambiguous PostgreSQL names.

    Preserve exact identifiers, string literals, and ambiguous names. This
    does not rename objects or infer missing tables/columns.
    """
    target_span, target_name = None, None
    if table_columns:
        grammar = re.sub(r"'(?:''|[^'])*'", lambda m: ' ' * len(m[0]), sql)
        targets = list(re.finditer(r'\b(?:INTO|FROM|UPDATE)\s+("(?:""|[^"])*")', grammar, re.I))
        # Fixtures are single-table statements. Never guess bindings across
        # joins/subqueries, where aliases and scope need a real SQL parser.
        if len(targets) != 1:
            return sql
        target = targets[0]
        requested = target[1][1:-1].replace('""', '"')
        candidates = [n for n in table_columns if n.casefold() == requested.casefold()]
        target_name = requested if requested in table_columns else candidates[0] if len(candidates) == 1 else None
        if target_name is None:
            return sql
        names = table_columns[target_name]
        target_span = target.span(1)

    def substitute(match):
        token = match.group(0)
        if not token.startswith('"'):
            return token
        if target_span == match.span():
            return '"' + target_name.replace('"', '""') + '"'
        name = token[1:-1].replace('""', '"')
        if name in names:
            return token
        candidates = [n for n in names if n.casefold() == name.casefold()]
        if len(candidates) != 1:
            return token
        return '"' + candidates[0].replace('"', '""') + '"'
    return re.sub(r"'(?:''|[^'])*'|\"(?:\"\"|[^\"])*\"", substitute, sql)


def _execute_ddl(cur, sql_ddl: str) -> DDLExecutionResult:
    """
    Execute Module 3's raw SQL DDL text as a single statement batch.
    Postgres's simple query protocol (which psycopg2 uses for a plain
    cursor.execute() call) natively supports multiple ';'-separated
    statements in one call, so no manual statement-splitting is done
    here -- splitting naively on ';' would break on any DDL containing
    a semicolon inside a string literal, comment, or CHECK expression.
    """
    if not sql_ddl or not sql_ddl.strip():
        return DDLExecutionResult(success=False, error_message="SQL DDL text was empty.")
    try:
        # DDL commonly arrives explicitly qualified with PostgreSQL's
        # `public` schema. Verification runs in a per-schema namespace, so
        # map that default schema into the active search_path rather than
        # silently creating public objects that the isolated tests cannot see.
        sql_ddl = _rewrite_public_schema(sql_ddl)
        cur.execute(sql_ddl)
        return DDLExecutionResult(success=True)
    except psycopg2.Error as exc:
        return DDLExecutionResult(
            success=False,
            error_message=str(exc).strip(),
            error_detail=getattr(exc, "pgerror", None),
            error_sqlstate=getattr(exc, "pgcode", None),
            failure_category='database_timeout_or_cancel' if getattr(exc, 'pgcode', None) == '57014' else 'ddl_error',
        )


def _evaluate_post_check(cur, post_check) -> tuple[bool, str]:
    cur.execute(post_check.sql)
    rows = cur.fetchall()

    if post_check.expected_row_count is not None:
        actual = len(rows)
        ok = actual == post_check.expected_row_count
        return ok, f"expected {post_check.expected_row_count} row(s), got {actual}"

    if post_check.expected_column is not None:
        if not rows:
            return False, "post-check query returned no rows"
        value = rows[0][0]
        expected = post_check.expected_value
        ok = value == expected
        return ok, f"expected {post_check.expected_column}={expected!r}, got {value!r}"

    return True, "no post-check assertion configured"


def _rejection_matches(test, diagnostic, constraints):
    expected = test.columns or ([test.column] if test.column else [])
    # Fail closed: a matching SQLSTATE alone cannot identify the constraint.
    if not expected:
        return False
    same = lambda a, b: str(a).casefold() == str(b).casefold()
    if not same(diagnostic.get('table_name'), test.table):
        return False
    if test.test_type == 'not_null_reject_null':
        return same(diagnostic.get('column_name'), test.column)
    if test.rejection_kind == 'not_null':
        return any(same(diagnostic.get('column_name'), c) for c in expected)
    constraint = constraints.get((diagnostic.get('table_name'), diagnostic.get('constraint_name')))
    if not constraint:
        return False
    kind, columns, ref_table, ref_columns = constraint
    if test.test_type == 'unique_reject_duplicate' and kind == 'p' and test.equivalent_primary_key:
        # A gold-declared PK contained in a gold UNIQUE tuple already entails
        # that uniqueness. Do not confuse this with an unrelated PK error.
        return (set(c.casefold() for c in columns) == set(c.casefold() for c in test.equivalent_primary_key)
                and set(c.casefold() for c in columns) <= set(c.casefold() for c in expected))
    expected_kind = {'primary_key_duplicate_rejected':'p', 'unique_reject_duplicate':'u',
                     'foreign_key_reject_invalid_parent':'f', 'cascade_behavior':'f',
                     'check_constraint_reject_invalid':'c'}.get(test.test_type)
    if kind != expected_kind or sorted(c.casefold() for c in columns) != sorted(c.casefold() for c in expected):
        return False
    if test.ref_table:
        return same(ref_table, test.ref_table) and [c.casefold() for c in columns] == [c.casefold() for c in expected] and [c.casefold() for c in ref_columns] == [c.casefold() for c in test.ref_columns or []]
    return True


def _run_test_case(cur, test: TestCase, index: int, constraints=None) -> TestCaseResult:
    savepoint = f"sp_{index}"
    category = "structural" if test.test_type in STRUCTURAL_TEST_TYPES else "constraint"

    action_succeeded: Optional[bool] = None
    error_message: Optional[str] = None
    error_sqlstate: Optional[str] = None
    post_check_passed: Optional[bool] = None
    post_check_detail: Optional[str] = None
    pre_check_passed = None
    pre_check_detail = None
    failure_phase = None
    diagnostic = {}
    target_matched = None

    cur.execute(f"SAVEPOINT {savepoint};")

    # Setup failures are test-fixture failures, not evidence that a generated
    # constraint rejected the action.  Keep action_succeeded=None so they can
    # never satisfy an expect="failure" test.
    try:
        for stmt in test.setup_sql:
            cur.execute(stmt)
        # Validate deferred setup errors before the action, then exercise all
        # deferrable constraints in immediate mode within this savepoint.
        cur.execute('SET CONSTRAINTS ALL IMMEDIATE;')
        if test.pre_check is not None:
            pre_check_passed, pre_check_detail = _evaluate_post_check(cur, test.pre_check)
    except psycopg2.Error as exc:
        error_message = f"setup failed: {str(exc).strip()}"
        failure_phase = "setup"
        error_sqlstate = getattr(exc, "pgcode", None)
        cur.execute(f"ROLLBACK TO SAVEPOINT {savepoint};")
    else:
        if pre_check_passed is False:
            failure_phase = 'setup'
            error_message = 'setup precondition failed: ' + pre_check_detail
        else:
            try:
                cur.execute(test.action_sql)
                action_succeeded = True
            except psycopg2.Error as exc:
                action_succeeded = False
                failure_phase = "action"
                error_message = str(exc).strip()
                error_sqlstate = getattr(exc, "pgcode", None)
                diagnostic = {key: getattr(exc.diag, key, None) for key in ('table_name', 'column_name', 'constraint_name')}
                cur.execute(f"ROLLBACK TO SAVEPOINT {savepoint};")

    if action_succeeded and test.post_check is not None:
        try:
            post_check_passed, post_check_detail = _evaluate_post_check(cur, test.post_check)
        except psycopg2.Error as exc:
            post_check_passed = False
            failure_phase = "post_check"
            error_sqlstate = getattr(exc, 'pgcode', None)
            post_check_detail = f"post-check query itself errored: {exc}".strip()
            cur.execute(f"ROLLBACK TO SAVEPOINT {savepoint};")

    # Always undo this test's effects, whether it passed or failed, so
    # the next test starts from the same clean state.
    try:
        cur.execute(f"ROLLBACK TO SAVEPOINT {savepoint};")
        cur.execute(f"RELEASE SAVEPOINT {savepoint};")
    except psycopg2.Error:
        # Rolling back a savepoint that was already rolled back / never
        # dirtied is harmless; ignore if this cleanup step itself no-ops.
        pass

    if test.expect == "success":
        passed = bool(action_succeeded) and (post_check_passed is not False)
    else:  # expect == "failure"
        if action_succeeded is False and constraints is not None:
            target_matched = _rejection_matches(test, diagnostic, constraints)
        passed = (
            action_succeeded is False
            and bool(test.expected_sqlstates)
            and error_sqlstate in test.expected_sqlstates
            and target_matched is True
        )

    return TestCaseResult(
        pre_check_passed=pre_check_passed,
        pre_check_detail=pre_check_detail,
        rejection_target_matched=target_matched,
        error_constraint=diagnostic.get('constraint_name'),
        failure_phase=failure_phase if not passed else None,
        failure_category=(None if passed else (
            "database_timeout_or_cancel" if error_sqlstate == "57014" else
            "missing_table" if error_sqlstate == "42P01" else
            "missing_column" if error_sqlstate == "42703" else
            "setup_failure" if failure_phase == "setup" else
            "wrong_constraint_rejection" if error_sqlstate and error_sqlstate.startswith("23") else
            "unexpected_database_error" if error_sqlstate else
            "post_check_mismatch" if post_check_passed is False else
            "expected_rejection_missing" if test.expect == "failure" else "assertion_failed")),
        test_id=test.test_id,
        test_type=test.test_type,
        table=test.table,
        description=test.description,
        expect=test.expect,
        category=category,
        action_succeeded=action_succeeded,
        passed=passed,
        error_message=error_message,
        error_sqlstate=error_sqlstate,
        expected_sqlstates=list(test.expected_sqlstates),
        post_check_passed=post_check_passed,
        post_check_detail=post_check_detail,
    )


def _salvage_ddl_tables(cur, sql_ddl: str, test_suite: TestSuite) -> dict:
    """Diagnostic only: execute statements independently, rolling all back."""
    statements = [statement.strip() for statement in sqlparse.split(sql_ddl) if statement.strip()]
    gold_tables = sorted({
        str(test.table) for test in test_suite.tests
        if test.test_type == "table_exists" and test.table
    })
    created = set()
    errors = []
    outer = "salvage_all"
    cur.execute(f"SAVEPOINT {outer};")
    try:
        for index, statement in enumerate(statements):
            savepoint = f"salvage_stmt_{index}"
            cur.execute(f"SAVEPOINT {savepoint};")
            try:
                cur.execute(_rewrite_public_schema(statement))
            except psycopg2.Error as exc:
                errors.append({
                    "statement_index": index,
                    "sqlstate": getattr(exc, "pgcode", None),
                    "message": str(exc).strip(),
                })
                cur.execute(f"ROLLBACK TO SAVEPOINT {savepoint};")
            finally:
                cur.execute(f"RELEASE SAVEPOINT {savepoint};")
        cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = current_schema() AND table_type = 'BASE TABLE'")
        created = {row[0] for row in cur.fetchall()}
    finally:
        cur.execute(f"ROLLBACK TO SAVEPOINT {outer};")
        cur.execute(f"RELEASE SAVEPOINT {outer};")
    matched = sorted(created.intersection(gold_tables))
    return {
        "statement_count": len(statements),
        "gold_table_count": len(gold_tables),
        "gold_tables_created": matched,
        "gold_table_fraction": len(matched) / len(gold_tables) if gold_tables else None,
        "statement_errors": errors,
    }


INFRASTRUCTURE_SQLSTATES = {"57014", "57P01"}


def _is_infrastructure_sqlstate(sqlstate: Optional[str]) -> bool:
    return bool(sqlstate and (sqlstate in INFRASTRUCTURE_SQLSTATES or sqlstate.startswith(("08", "53"))))


def _verify_schema_with_infra_retry(*args, **kwargs) -> VerificationResult:
    """Retry one verification once for pre-registered PostgreSQL infra errors."""
    try:
        result = verify_schema(*args, **kwargs)
    except psycopg2.Error as exc:
        state = getattr(exc, "pgcode", None)
        if not _is_infrastructure_sqlstate(state):
            raise
        result = None
        first_state = state
    else:
        first_state = None
    states = set()
    if result is not None and _is_infrastructure_sqlstate(result.ddl_execution.error_sqlstate):
        states.add(result.ddl_execution.error_sqlstate)
    for test in result.test_results if result is not None else []:
        if _is_infrastructure_sqlstate(test.error_sqlstate):
            states.add(test.error_sqlstate)
    for error in (result.salvage_diagnostic.get("statement_errors", []) if result is not None else []):
        if _is_infrastructure_sqlstate(error.get("sqlstate")):
            states.add(error["sqlstate"])
    if first_state:
        states.add(first_state)
    if not states:
        return result
    try:
        retried = verify_schema(*args, **kwargs)
    except psycopg2.Error as exc:
        state = getattr(exc, "pgcode", None)
        if not _is_infrastructure_sqlstate(state):
            raise
        schema_id = kwargs.get("schema_id", args[4] if len(args) > 4 else "unknown")
        tier = kwargs.get("tier", args[3] if len(args) > 3 else "unknown")
        retried = VerificationResult(
            schema_id=str(schema_id), tier=str(tier),
            ddl_execution=DDLExecutionResult(success=False, error_message=str(exc).strip(), error_sqlstate=state,
                                             failure_category="infrastructure_error"),
            skipped_reason="Persistent PostgreSQL infrastructure error after one retry.",
        )
        retried.infrastructure_error = True
        retried.infrastructure_sqlstates = sorted({*states, state})
        return retried
    final_states = set()
    if _is_infrastructure_sqlstate(retried.ddl_execution.error_sqlstate):
        final_states.add(retried.ddl_execution.error_sqlstate)
    for test in retried.test_results:
        if _is_infrastructure_sqlstate(test.error_sqlstate):
            final_states.add(test.error_sqlstate)
    for error in retried.salvage_diagnostic.get("statement_errors", []):
        if _is_infrastructure_sqlstate(error.get("sqlstate")):
            final_states.add(error["sqlstate"])
    retried.infrastructure_error = bool(final_states)
    retried.infrastructure_sqlstates = sorted(final_states or states)
    return retried


def verify_schema_with_infra_retry(*args, **kwargs) -> VerificationResult:
    """Primary raw-SQL verification plus a separately reported formatter ablation."""
    result = _verify_schema_with_infra_retry(*args, **kwargs)
    sql_ddl = kwargs.get("sql_ddl", args[1] if len(args) > 1 else "")
    if not isinstance(sql_ddl, str) or not sql_ddl.strip():
        return result
    normalized = normalize_sql_for_ablation(sql_ddl)
    if normalized == sql_ddl:
        # Still report that the secondary pass used the same bytes.
        pass
    if "sql_ddl" in kwargs:
        ablation_kwargs = dict(kwargs)
        ablation_kwargs["sql_ddl"] = normalized
        secondary = _verify_schema_with_infra_retry(*args, **ablation_kwargs)
    else:
        positional = list(args)
        positional[1] = normalized
        secondary = _verify_schema_with_infra_retry(*positional, **kwargs)
    result.normalized_sql_ablation = {
        "normalizer": "sqlparse.format",
        "ddl_execution_success": secondary.ddl_execution.success,
        "error_sqlstate": secondary.ddl_execution.error_sqlstate,
        "infrastructure_error": secondary.infrastructure_error,
        "infrastructure_sqlstates": secondary.infrastructure_sqlstates,
        "constraint_tests_total": secondary.constraint_tests_total,
        "constraint_tests_passed": secondary.constraint_tests_passed,
        "constraint_enforcement_rate": secondary.constraint_enforcement_rate,
    }
    if secondary.infrastructure_error:
        result.infrastructure_error = True
        result.infrastructure_sqlstates = sorted(set(result.infrastructure_sqlstates) | set(secondary.infrastructure_sqlstates))
    return result


def _rewrite_public_schema(sql: str) -> str:
    """Remove only public-schema qualifiers outside literals and comments."""
    protected = re.compile(r"'(?:''|[^'])*'|--[^\n]*|/\*.*?\*/", re.DOTALL)
    qualifier = re.compile(r'(?i)(?:"public"|public)\s*\.\s*')
    parts, start = [], 0
    for match in protected.finditer(sql):
        parts.append(qualifier.sub('', sql[start:match.start()]))
        parts.append(match.group(0))
        start = match.end()
    parts.append(qualifier.sub('', sql[start:]))
    return ''.join(parts)


def verify_schema(
    conn,
    sql_ddl: str,
    test_suite: TestSuite,
    tier: str,
    schema_id: str,
    schema_prefix: str,
    statement_timeout_ms: int = 5000,
    constraint_source: str = "predicted_ir",
) -> VerificationResult:
    """
    Run one schema's full verification: create an isolated namespace,
    execute the DDL, run every TestCase in test_suite, then roll
    everything back. `conn` is an open psycopg2 connection the caller
    owns (see pipeline/runner.py) -- this function always leaves it in
    a clean, idle-in-transaction-free state before returning, whether
    it succeeds or raises.
    """
    namespace = make_namespace(schema_prefix, tier, schema_id)
    result = VerificationResult(
        schema_id=schema_id,
        tier=tier,
        ddl_execution=DDLExecutionResult(success=False),
        constraint_source=constraint_source,
        generation_warnings=list(test_suite.generation_warnings),
    )

    cur = conn.cursor()
    try:
        cur.execute(f"SET LOCAL statement_timeout = '{statement_timeout_ms}';")
        cur.execute(f'CREATE SCHEMA IF NOT EXISTS "{namespace}";')
        cur.execute(f'SET LOCAL search_path TO "{namespace}";')

        result.salvage_diagnostic = _salvage_ddl_tables(cur, sql_ddl, test_suite)

        ddl_result = _execute_ddl(cur, sql_ddl)
        result.ddl_execution = ddl_result

        if not ddl_result.success:
            result.skipped_reason = (
                "DDL execution failed; no constraint tests were run against it."
            )
            logger.warning(
                "[%s/%s] DDL execution failed: %s", tier, schema_id, ddl_result.error_message
            )
            return result

        cur.execute("SELECT table_name, column_name FROM information_schema.columns WHERE table_schema = %s", (namespace,))
        catalog = cur.fetchall()
        names = {name for pair in catalog for name in pair}
        table_columns = {}
        for table_name, column_name in catalog:
            table_columns.setdefault(table_name, set()).add(column_name)
        cur.execute('''SELECT r.relname, c.conname, c.contype,
            ARRAY(SELECT a.attname FROM unnest(c.conkey) WITH ORDINALITY k(num, ord)
                  JOIN pg_attribute a ON a.attrelid=c.conrelid AND a.attnum=k.num ORDER BY k.ord),
            rr.relname,
            ARRAY(SELECT a.attname FROM unnest(c.confkey) WITH ORDINALITY k(num, ord)
                  JOIN pg_attribute a ON a.attrelid=c.confrelid AND a.attnum=k.num ORDER BY k.ord)
            FROM pg_constraint c JOIN pg_class r ON r.oid=c.conrelid
            JOIN pg_namespace n ON n.oid=r.relnamespace
            LEFT JOIN pg_class rr ON rr.oid=c.confrelid WHERE n.nspname=%s''', (namespace,))
        constraints = {(table, name):(kind, columns, remote, remote_columns)
                       for table, name, kind, columns, remote, remote_columns in cur.fetchall()}
        # A plain UNIQUE index also enforces uniqueness; do not require the
        # model to express it using ALTER/CREATE TABLE ... UNIQUE syntax.
        cur.execute('''SELECT r.relname, ix.relname,
            ARRAY(SELECT a.attname FROM unnest(i.indkey::smallint[]) WITH ORDINALITY k(num, ord)
                  JOIN pg_attribute a ON a.attrelid=i.indrelid AND a.attnum=k.num
                  WHERE k.ord <= i.indnkeyatts ORDER BY k.ord)
            FROM pg_index i JOIN pg_class r ON r.oid=i.indrelid
            JOIN pg_class ix ON ix.oid=i.indexrelid JOIN pg_namespace n ON n.oid=r.relnamespace
            WHERE n.nspname=%s AND i.indisunique AND i.indpred IS NULL AND i.indexprs IS NULL''', (namespace,))
        for table, name, columns in cur.fetchall():
            constraints.setdefault((table, name), ('u', columns, None, []))
        for i, test in enumerate(test_suite.tests):
            test = replace(test,
                setup_sql=[_bind_identifier_spelling(sql, names, table_columns) for sql in test.setup_sql],
                action_sql=_bind_identifier_spelling(test.action_sql, names, table_columns),
                pre_check=replace(test.pre_check, sql=_bind_identifier_spelling(test.pre_check.sql, names, table_columns)) if test.pre_check else None,
                post_check=replace(test.post_check, sql=_bind_identifier_spelling(test.post_check.sql, names, table_columns)) if test.post_check else None)
            test_result = _run_test_case(cur, test, i, constraints)
            result.test_results.append(test_result)

        result.tests_total = len(result.test_results)
        result.tests_passed = sum(1 for t in result.test_results if t.passed)
        result.tests_failed = result.tests_total - result.tests_passed

        constraint_results = [t for t in result.test_results if t.category == "constraint"]
        result.constraint_tests_total = len(constraint_results)
        result.constraint_tests_passed = sum(1 for t in constraint_results if t.passed)
        if result.constraint_tests_total > 0:
            result.constraint_enforcement_rate = (
                result.constraint_tests_passed / result.constraint_tests_total
            )

        return result
    finally:
        cur.close()
        # Always fully roll back: nothing this function does should
        # ever persist in the target database, win or lose.
        conn.rollback()
