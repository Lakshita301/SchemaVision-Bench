"""
Module 4: Constraint Test Generator.

    canonical JSON IR  --[deterministic, no LLM]-->  TestSuite

Per the locked plan: "The Constraint Test Generator should generate
tests programmatically from the schema/constraint definitions
wherever possible rather than using an additional LLM." This module
makes no LLM call and opens no database connection -- every test's
SQL and literal values are computed directly from the IR.

Test types generated (see models.TEST_TYPES):
  - table_exists / column_exists: structural fidelity of the
    generated SQL against the IR.
  - primary_key_duplicate_rejected: inserting a second row with a
    duplicate (possibly composite) PK must be rejected.
  - not_null_reject_null: inserting NULL into a column the IR marks
    NOT NULL must be rejected.
  - unique_reject_duplicate: inserting a duplicate value into a
    column the IR marks UNIQUE must be rejected.
  - foreign_key_reject_invalid_parent / foreign_key_accept_valid_parent:
    the locked plan's REQUIRED bidirectional FK test -- an insert
    referencing a non-existent parent must be rejected, and an insert
    referencing a real, pre-existing parent must be accepted.
  - cascade_behavior: for any FK with a declared on_delete policy
    (CASCADE / SET NULL / RESTRICT / NO ACTION), deleting the parent
    while a child row references it must produce the policy-correct
    outcome.
  - check_constraint_accept_valid / check_constraint_reject_invalid:
    paired behavior checks for supported simple CHECK expressions.
"""

from __future__ import annotations

import re
from typing import Any, Optional

from .models import PostCheck, TestCase, TestSuite
from .value_factory import EnsureRowBuilder, ValueFactory, build_schema_index


def generate_constraint_tests(
    ir: dict, schema_id: str, constraint_source: str = "predicted_ir"
) -> TestSuite:
    index = build_schema_index(ir)
    tests: list[TestCase] = []
    warnings: list[str] = []
    counter = {"n": 0}

    def next_id(prefix: str) -> str:
        counter["n"] += 1
        return f"{prefix}_{counter['n']:03d}"

    tables = ir.get("tables", []) or []

    # --- structural checks: table_exists / column_exists ---
    for table in tables:
        tname = table["name"]
        tests.append(
            TestCase(
                test_id=next_id("table_exists"),
                test_type="table_exists",
                table=tname,
                description=f"Table '{tname}' should exist after DDL execution.",
                action_sql=f'SELECT * FROM "{tname}" LIMIT 0;',
                expect="success",
            )
        )
        for col in table.get("columns", []) or []:
            cname = col["name"]
            tests.append(
                TestCase(
                    test_id=next_id("column_exists"),
                    test_type="column_exists",
                    table=tname,
                    column=cname,
                    description=f"Column '{tname}.{cname}' should exist after DDL execution.",
                    action_sql=f'SELECT "{cname}" FROM "{tname}" LIMIT 0;',
                    expect="success",
                )
            )

    # --- behavioral checks: each gets its own fresh ValueFactory/EnsureRowBuilder
    #     so every test is a fully independent, self-contained specification ---
    for table in tables:
        tname = table["name"]
        pk_cols = table.get("primary_key") or []
        fks = table.get("foreign_keys") or []
        columns = table.get("columns") or []

        # primary_key_duplicate_rejected
        if pk_cols:
            vf = ValueFactory()
            builder = EnsureRowBuilder(index, vf)
            base_row = builder.ensure_row(tname)
            if base_row is not None:
                forced = {c: base_row.get(c) for c in pk_cols}
                dup_row = builder.build_row_values(tname, forced_values=forced)
                if dup_row is not None:
                    tests.append(
                        TestCase(
                            test_id=next_id("pk_dup"),
                            test_type="primary_key_duplicate_rejected",
                            table=tname,
                            columns=list(pk_cols),
                            description=(
                                f"Inserting a second row into '{tname}' with a "
                                f"duplicate primary key {pk_cols} should be rejected."
                            ),
                            setup_sql=list(builder.setup_sql),
                            action_sql=builder.build_insert(tname, dup_row),
                            expect="failure",
                            expected_sqlstates=["23505"],  # unique_violation
                        )
                    )
            else:
                warnings.append(f"Could not synthesize a base row for the PK test on '{tname}'.")
            warnings.extend(builder.warnings)

        # not_null_reject_null (skip PK columns -- NOT NULL is implied there already)
        for col in columns:
            cname = col["name"]
            if col.get("nullable") is False and cname not in pk_cols:
                vf = ValueFactory()
                builder = EnsureRowBuilder(index, vf)
                row = builder.build_row_values(tname, forced_values={cname: None})
                if row is not None:
                    tests.append(
                        TestCase(
                            test_id=next_id("not_null"),
                            test_type="not_null_reject_null",
                            table=tname,
                            column=cname,
                            description=(
                                f"Inserting a row into '{tname}' with NULL '{cname}' "
                                f"should be rejected (column is NOT NULL in the IR)."
                            ),
                            setup_sql=list(builder.setup_sql),
                            action_sql=builder.build_insert(tname, row),
                            expect="failure",
                            expected_sqlstates=["23502"],  # not_null_violation
                        )
                    )
                warnings.extend(builder.warnings)

        # unique_reject_duplicate
        for col in columns:
            cname = col["name"]
            if col.get("unique") and cname not in pk_cols:
                vf = ValueFactory()
                builder = EnsureRowBuilder(index, vf)
                required_values = _nonnull_unique_fk_values(table, {cname}, builder)
                base_row = builder.ensure_row(tname, forced_values=required_values)
                if base_row is not None:
                    dup_row = builder.build_row_values(
                        tname, forced_values={cname: base_row.get(cname)}
                    )
                    if dup_row is not None:
                        _avoid_unrelated_unique_fk_collisions(
                            table, dup_row, builder, exclude_cols={cname}
                        )
                        tests.append(
                            TestCase(
                                test_id=next_id("unique"),
                                test_type="unique_reject_duplicate",
                                equivalent_primary_key=list(pk_cols) if set(pk_cols) <= {cname} else None,
                                table=tname,
                                column=cname,
                                description=(
                                    f"Inserting a second row into '{tname}' with a "
                                    f"duplicate value in UNIQUE column '{cname}' "
                                    f"should be rejected."
                                ),
                                setup_sql=list(builder.setup_sql),
                                action_sql=builder.build_insert(tname, dup_row),
                                expect="failure",
                                expected_sqlstates=["23505"],  # unique_violation
                            )
                        )
                warnings.extend(builder.warnings)

        for unique_cols in table.get('unique_constraints', []):
            if any(c not in {column['name'] for column in columns} for c in unique_cols):
                warnings.append(f"Composite UNIQUE on '{tname}' references unresolved columns: {unique_cols!r}")
                continue
            builder = EnsureRowBuilder(index, ValueFactory())
            required_values = _nonnull_unique_fk_values(table, set(unique_cols), builder)
            base = builder.ensure_row(tname, forced_values=required_values)
            if base is not None:
                duplicate = builder.build_row_values(tname, forced_values={c: base[c] for c in unique_cols})
                if duplicate is not None:
                    _avoid_unrelated_unique_fk_collisions(
                        table, duplicate, builder, exclude_cols=set(unique_cols)
                    )
                    tests.append(TestCase(test_id=next_id('unique_composite'), test_type='unique_reject_duplicate',
                        equivalent_primary_key=list(pk_cols) if set(pk_cols) <= set(unique_cols) else None,
                        table=tname, columns=list(unique_cols), description=f'Composite UNIQUE {unique_cols} rejects duplicate tuple.',
                        setup_sql=list(builder.setup_sql), action_sql=builder.build_insert(tname, duplicate),
                        expect='failure', expected_sqlstates=['23505']))
            warnings.extend(builder.warnings)

        # foreign key tests: reject-invalid-parent, accept-valid-parent, cascade_behavior
        for fk in fks:
            fk_cols = fk.get("columns") or []
            ref_table = fk.get("ref_table")
            ref_cols = fk.get("ref_columns") or []
            if not fk_cols or not ref_table or not ref_cols:
                continue

            # (a) MUST reject an insert referencing a non-existent parent
            vf = ValueFactory()
            builder = EnsureRowBuilder(index, vf)
            other_fk_cols = {c for other in fks if other is not fk for c in other.get('columns', [])}
            private_cols = [c for c in fk_cols if c not in other_fk_cols]
            implied_by_sibling = any(
                other is not fk and set(other.get('columns') or []) & set(fk_cols)
                and other.get('ref_table') != ref_table
                and all(_is_not_null_column(table, col) for col in (other.get('columns') or []))
                and _table_reaches(index, other.get('ref_table'), ref_table)
                for other in fks
            )
            can_isolate_with_sibling = any(
                other is not fk and set(other.get('columns') or []) & set(fk_cols)
                and other.get('ref_table') != ref_table
                and all(_is_not_null_column(table, col) for col in (other.get('columns') or []))
                and not _table_reaches(index, other.get('ref_table'), ref_table)
                for other in fks
            )
            invalid_cols = [] if implied_by_sibling else (private_cols or (fk_cols if can_isolate_with_sibling else []))
            forced = {}
            if private_cols:
                baseline_parent = builder.ensure_row(ref_table)
                if baseline_parent is not None:
                    forced.update({c: baseline_parent.get(rc) for c, rc in zip(fk_cols, ref_cols)})
            forced.update({
                c: vf.sentinel_invalid_value(next(
                    (col.get("data_type") for col in columns if col["name"] == c), None
                ))
                for c in invalid_cols
            })
            # Start with real parents for every relationship. Perturb only
            # target-private columns. For a fully overlapping FK, an isolated
            # witness exists only if a distinct sibling parent can contain the
            # sentinel tuple while the target parent does not.
            row = builder.build_row_values(tname, forced_values=forced, skip_fk=fk) if invalid_cols else None
            if not invalid_cols:
                reason = 'a sibling relationship already guarantees the target parent' if implied_by_sibling else 'no target-private columns or independent sibling parent'
                warnings.append(f"No isolated invalid-parent witness for FK {tname}.{fk_cols} -> {ref_table}: {reason}.")
            if row is not None:
                tests.append(
                    TestCase(
                        test_id=next_id("fk_reject"),
                        ref_table=ref_table, ref_columns=list(ref_cols),
                        test_type="foreign_key_reject_invalid_parent",
                        table=tname,
                        columns=list(fk_cols),
                        description=(
                            f"Inserting a row into '{tname}' with {fk_cols} pointing "
                            f"to a non-existent row in '{ref_table}' should be rejected."
                        ),
                        setup_sql=list(builder.setup_sql),
                        action_sql=builder.build_insert(tname, row),
                        expect="failure",
                        expected_sqlstates=["23503"],  # foreign_key_violation
                    )
                )
            warnings.extend(builder.warnings)

            # (b) MUST accept an insert referencing a real, pre-existing parent
            vf2 = ValueFactory()
            builder2 = EnsureRowBuilder(index, vf2)
            parent_row = builder2.ensure_row(ref_table)
            if parent_row is not None:
                forced2 = {c: parent_row.get(rc) for c, rc in zip(fk_cols, ref_cols)}
                child_row = builder2.build_row_values(
                    tname,
                    forced_values=forced2,
                    visiting=frozenset({ref_table}) if tname != ref_table else frozenset(),
                )
                if child_row is not None:
                    tests.append(
                        TestCase(
                            test_id=next_id("fk_accept"),
                            test_type="foreign_key_accept_valid_parent",
                            table=tname,
                            columns=list(fk_cols),
                            description=(
                                f"Inserting a row into '{tname}' with {fk_cols} "
                                f"pointing to a real, pre-existing row in "
                                f"'{ref_table}' should be accepted."
                            ),
                            setup_sql=list(builder2.setup_sql),
                            action_sql=builder2.build_insert(tname, child_row),
                            expect="success",
                        )
                    )
            else:
                warnings.append(
                    f"Could not synthesize a parent row in '{ref_table}' for the "
                    f"FK-accept test on '{tname}'."
                )
            warnings.extend(builder2.warnings)

            # cascade_behavior: only when on_delete is declared
            on_delete = fk.get("on_delete")
            if on_delete:
                cascade_test, cascade_warnings = _build_cascade_test(
                    index, next_id("cascade"), tname, ref_table, fk_cols, ref_cols, on_delete
                )
                warnings.extend(cascade_warnings)
                if cascade_test is not None:
                    tests.append(cascade_test)

        check_tests, check_warnings = _build_check_tests(index, table, next_id)
        tests.extend(check_tests)
        warnings.extend(check_warnings)

    return TestSuite(
        schema_id=schema_id,
        constraint_source=constraint_source,
        tests=tests,
        generation_warnings=warnings,
    )


def _avoid_unrelated_unique_fk_collisions(table: dict, row: dict, builder: EnsureRowBuilder,
                                          exclude_cols: set[str]) -> None:
    """Give unique FK columns a second valid parent so the intended duplicate wins."""
    unique_keys = []
    pk = set(table.get('primary_key') or [])
    if pk:
        unique_keys.append(pk)
    unique_keys.extend({c['name']} for c in table.get('columns', []) if c.get('unique'))
    unique_keys.extend(set(key) for key in table.get('unique_constraints', []))
    for fk in table.get('foreign_keys', []) or []:
        local = fk.get('columns') or []
        remote = fk.get('ref_columns') or []
        parent = fk.get('ref_table')
        if not local or not remote or not parent:
            continue
        if set(local) & exclude_cols:
            continue
        if not any(set(local) <= key for key in unique_keys):
            continue
        additional = builder.ensure_additional_row(parent)
        if additional is not None:
            for local_col, remote_col in zip(local, remote):
                row[local_col] = additional.get(remote_col)


def _nonnull_unique_fk_values(table: dict, unique_cols: set[str],
                              builder: EnsureRowBuilder) -> dict:
    """Use real non-NULL parent keys so UNIQUE tests exercise SQL NULL semantics correctly."""
    values = {}
    for fk in table.get('foreign_keys', []) or []:
        local = fk.get('columns') or []
        remote = fk.get('ref_columns') or []
        parent_name = fk.get('ref_table')
        if not local or not remote or not parent_name or not set(local) <= unique_cols:
            continue
        parent = builder.ensure_row(parent_name)
        if parent is not None:
            values.update({local_col: parent.get(remote_col)
                           for local_col, remote_col in zip(local, remote)})
    return values


def _table_reaches(index: dict, start: Optional[str], target: str, seen=frozenset()) -> bool:
    """Whether every row in `start` is constrained to reference `target` through an FK path."""
    if not start or start not in index['tables'] or start in seen:
        return False
    table = index['tables'][start]
    for fk in table.get('foreign_keys', []) or []:
        ref = fk.get('ref_table')
        if ref == target or _table_reaches(index, ref, target, seen | {start}):
            return True
    return False


def _is_not_null_column(table: dict, name: str) -> bool:
    return any(column['name'] == name and column.get('nullable') is False
               for column in table.get('columns', []) or [])


def _build_cascade_test(
    index: dict,
    test_id: str,
    child_table: str,
    parent_table: str,
    fk_cols: list[str],
    ref_cols: list[str],
    on_delete: str,
) -> tuple[Optional[TestCase], list[str]]:
    vf = ValueFactory()
    builder = EnsureRowBuilder(index, vf)
    parent_row = builder.ensure_row(parent_table)
    if parent_row is None:
        return None, [
            f"Could not synthesize a parent row in '{parent_table}' for the "
            f"cascade_behavior test on '{child_table}'."
        ]

    forced = {c: parent_row.get(rc) for c, rc in zip(fk_cols, ref_cols)}
    builder.isolate_parent_table = parent_table
    builder.isolate_fk_columns = frozenset(fk_cols)
    builder.isolate_fk_table = child_table
    child_row = builder.build_row_values(
        child_table,
        forced_values=forced,
        visiting=frozenset({parent_table}) if child_table != parent_table else frozenset(),
    )
    if child_row is None:
        return None, builder.warnings + [
            f"Could not synthesize a child row in '{child_table}' for the "
            f"cascade_behavior test."
        ]

    child_insert = builder.build_insert(child_table, child_row)
    setup_sql = list(builder.setup_sql) + [child_insert]

    parent_table_def = index["tables"][parent_table]
    parent_pk = parent_table_def.get("primary_key") or ref_cols
    parent_predicate = " AND ".join(
        f'"{c}" IS NOT DISTINCT FROM {vf.sql_literal(parent_row.get(c))}' for c in parent_pk
    )
    delete_sql = f'DELETE FROM "{parent_table}" WHERE {parent_predicate};'

    # Identify the child row using something OTHER than the FK columns
    # themselves where possible, since CASCADE/SET NULL changes those
    # columns' values (or removes the row) as part of the action.
    child_table_def = index["tables"][child_table]
    child_pk = child_table_def.get("primary_key") or []
    identify_cols = [c for c in child_pk if c not in fk_cols]
    can_identify_child = True
    if not identify_cols:
        other_cols = [
            c["name"] for c in (child_table_def.get("columns") or []) if c["name"] not in fk_cols
        ]
        identify_cols = other_cols[:1]
    if not identify_cols:
        identify_cols = list(fk_cols)
        can_identify_child = False  # fk-based identification is unreliable post-action

    child_predicate = " AND ".join(
        f'"{c}" IS NOT DISTINCT FROM {vf.sql_literal(child_row.get(c))}' for c in identify_cols
    )

    description_suffix = {
        "CASCADE": "the delete succeeding and the child row being removed.",
        "SET NULL": "the delete succeeding and the child's FK column becoming NULL.",
    }.get(on_delete, "the delete being rejected because a child row still references it.")

    description = (
        f"Deleting the referenced parent row in '{parent_table}' while a child "
        f"row in '{child_table}' references it via {fk_cols} (ON DELETE "
        f"{on_delete}) should result in: {description_suffix}"
    )

    warnings: list[str] = list(builder.warnings)
    # SET NULL combined with a gold NOT NULL column is a valid PostgreSQL
    # declaration: deleting its parent must fail, not successfully null it.
    non_nullable = [c['name'] for c in child_table_def.get('columns', [])
                    if c['name'] in fk_cols and c.get('nullable') is False]
    null_conflict = on_delete == 'SET NULL' and bool(non_nullable)

    if null_conflict:
        post_check = None
        expect = 'failure'
        description = f"ON DELETE SET NULL must be rejected by gold NOT NULL columns {non_nullable} on '{child_table}'."
    elif on_delete == "CASCADE":
        post_check = PostCheck(
            sql=f'SELECT * FROM "{child_table}" WHERE {child_predicate};' if can_identify_child else f'SELECT * FROM "{child_table}";',
            expected_row_count=0,
        )
        expect = "success"
    elif on_delete == "SET NULL":
        all_null = ' AND '.join(f'"{c}" IS NULL' for c in fk_cols)
        predicate = f' WHERE {child_predicate}' if can_identify_child else ''
        post_check = PostCheck(
            sql=f'SELECT COUNT(*) = 1 AND COALESCE(BOOL_AND({all_null}), FALSE) FROM "{child_table}"{predicate};',
            expected_column='all_fk_columns_null',
            expected_value=True,
        )
        expect = "success"
    else:  # RESTRICT / NO ACTION
        post_check = None
        expect = "failure"

    return (
        TestCase(
            test_id=test_id,
            test_type="cascade_behavior",
            table=child_table,
            columns=non_nullable if null_conflict else list(fk_cols),
            rejection_kind='not_null' if null_conflict else None,
            ref_table=parent_table,
            ref_columns=list(ref_cols),
            description=description,
            setup_sql=setup_sql,
            pre_check=PostCheck(
                sql=f'SELECT * FROM "{child_table}" WHERE {child_predicate};' if can_identify_child else f'SELECT * FROM "{child_table}";',
                expected_row_count=1,
            ),
            action_sql=delete_sql,
            expect=expect,
            # PostgreSQL versions may report restrict_violation (23001)
            # rather than foreign_key_violation for explicit RESTRICT.
            # Both still require attribution to the exact target FK.
            expected_sqlstates=['23502'] if null_conflict else ["23503", "23001"] if expect == "failure" else [],
            post_check=post_check,
        ),
        warnings,
    )


_IDENTIFIER = r'(?:"[^"]+"|`[^`]+`|\[[^\]]+\]|[A-Za-z_][\w$]*)'
_LITERAL = r"(?:'(?:''|[^'])*'|-?\d+(?:\.\d+)?|TRUE|FALSE)"


def _unquote_identifier(identifier: str) -> str:
    identifier = identifier.strip()
    return identifier[1:-1] if identifier[:1] in ('"', "`", "[") else identifier


def _literal_value(token: str) -> Any:
    token = token.strip()
    if token.upper() == "TRUE":
        return True
    if token.upper() == "FALSE":
        return False
    if token.startswith("'"):
        return token[1:-1].replace("''", "'")
    return float(token) if "." in token else int(token)


def _split_literals(values: str) -> list[str]:
    result: list[str] = []
    start = 0
    in_string = False
    i = 0
    while i < len(values):
        if values[i] == "'":
            if in_string and i + 1 < len(values) and values[i + 1] == "'":
                i += 2
                continue
            in_string = not in_string
        elif values[i] == "," and not in_string:
            result.append(values[start:i].strip())
            start = i + 1
        i += 1
    result.append(values[start:].strip())
    return [value for value in result if value]


def _simple_check_values(expression: str) -> tuple[str, Any, Any] | None:
    """Return (column, valid value, invalid value) for a safe CHECK subset."""
    expression = expression.strip()
    while expression.startswith("(") and expression.endswith(")"):
        expression = expression[1:-1].strip()
    wrapped = re.fullmatch(r"CHECK\s*\((.*)\)", expression, re.IGNORECASE | re.DOTALL)
    if wrapped:
        expression = wrapped.group(1).strip()

    between = re.fullmatch(
        rf"(?P<column>{_IDENTIFIER})\s+BETWEEN\s+(?P<low>{_LITERAL})\s+AND\s+(?P<high>{_LITERAL})",
        expression,
        re.IGNORECASE,
    )
    if between:
        low = _literal_value(between.group("low"))
        high = _literal_value(between.group("high"))
        if isinstance(low, (int, float)) and not isinstance(low, bool) and isinstance(high, (int, float)):
            return _unquote_identifier(between.group("column")), low, low - 1
        return None

    in_list = re.fullmatch(
        rf"(?P<column>{_IDENTIFIER})\s+IN\s*\((?P<values>.*)\)",
        expression,
        re.IGNORECASE | re.DOTALL,
    )
    if in_list:
        raw_values = _split_literals(in_list.group("values"))
        if not raw_values or not all(re.fullmatch(_LITERAL, value, re.IGNORECASE) for value in raw_values):
            return None
        values = [_literal_value(value) for value in raw_values]
        valid = values[0]
        if all(isinstance(value, (int, float)) and not isinstance(value, bool) for value in values):
            invalid = min(values) - 1
            while invalid in values:
                invalid -= 1
        elif all(isinstance(value, bool) for value in values):
            if len(set(values)) == 2:
                return None
            invalid = not valid
        else:
            invalid = "__ER2SQL_CHECK_VIOLATION__"
            while invalid in values:
                invalid += "_X"
        return _unquote_identifier(in_list.group("column")), valid, invalid

    comparison = re.fullmatch(
        rf"(?P<column>{_IDENTIFIER})\s*(?P<operator>>=|<=|<>|!=|=|>|<)\s*(?P<value>{_LITERAL})",
        expression,
        re.IGNORECASE,
    )
    if not comparison:
        return None
    column = _unquote_identifier(comparison.group("column"))
    operator = comparison.group("operator")
    value = _literal_value(comparison.group("value"))
    if operator == "=":
        invalid = (value + 1) if isinstance(value, (int, float)) and not isinstance(value, bool) else "__ER2SQL_CHECK_VIOLATION__"
        return column, value, invalid
    if operator in ("!=", "<>"):
        valid = (value + 1) if isinstance(value, (int, float)) and not isinstance(value, bool) else "__ER2SQL_CHECK_VALID__"
        return column, valid, value
    if not isinstance(value, (int, float)) or isinstance(value, bool):
        return None
    if operator == ">=":
        return column, value, value - 1
    if operator == ">":
        return column, value + 1, value
    if operator == "<=":
        return column, value, value + 1
    return column, value - 1, value


def _build_check_tests(index: dict, table: dict, next_id) -> tuple[list[TestCase], list[str]]:
    from .check_solver import parsed_checks, witness, leaves
    nodes, warnings = parsed_checks(table)
    deduplicated = []
    seen_expressions = set()
    for expression, node in nodes:
        canonical = re.sub(r'\s+', '', expression).casefold()
        if canonical in seen_expressions:
            continue
        seen_expressions.add(canonical)
        deduplicated.append((expression, node))
    nodes = deduplicated
    tests = []
    fk_columns = {c for fk in table.get('foreign_keys', []) for c in fk.get('columns', [])}
    for check_index, (expression, node) in enumerate(nodes):
        names = sorted({v for kind, v in leaves(node) if kind == 'column'})
        for reject in (False, True):
            builder = EnsureRowBuilder(index, ValueFactory())
            row = builder.build_row_values(table['name'])
            fitted = witness(table, nodes, row, locked=fk_columns,
                             reject_index=check_index if reject else None) if row is not None else None
            if fitted is None:
                warnings.append(f"No isolated {'invalid' if reject else 'valid'} CHECK witness for {table['name']}: {expression!r}")
            else:
                tests.append(TestCase(
                    test_id=next_id('check_reject' if reject else 'check_accept'),
                    test_type='check_constraint_reject_invalid' if reject else 'check_constraint_accept_valid',
                    table=table['name'], columns=names, column=names[0] if len(names) == 1 else None,
                    description=f"{'Violate' if reject else 'Satisfy'} CHECK ({expression}); satisfy other supported checks.",
                    setup_sql=list(builder.setup_sql), action_sql=builder.build_insert(table['name'], fitted),
                    expect='failure' if reject else 'success', expected_sqlstates=['23514'] if reject else []))
            warnings.extend(builder.warnings)
    return tests, list(dict.fromkeys(warnings))
