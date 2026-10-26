"""Minimal scoring-safety regressions; no external model requests."""
import os
import unittest
from types import SimpleNamespace
from unittest.mock import patch

from er2sql.module4_constraint_tests.models import PostCheck, TestCase, TestSuite
from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module4_constraint_tests.generator import generate_constraint_tests
from er2sql.module7_evaluation.readiness import _verify_reference_with_diagnostic, _has_query_cancellation


class MinimalReadinessTests(unittest.TestCase):
    def test_cancellation_recheck_cannot_replace_primary(self):
        failed = {'ddl_execution':{'success':False, 'error_sqlstate':'57014'}, 'test_results':[]}
        success = {'ddl_execution':{'success':True}, 'test_results':[]}
        db = SimpleNamespace(schema_prefix='test', statement_timeout_ms=5000)
        replies = [SimpleNamespace(as_dict=lambda: failed), SimpleNamespace(as_dict=lambda: success)]
        with patch('er2sql.module7_evaluation.readiness.verify_schema', side_effect=replies) as verify:
            primary, diagnostic = _verify_reference_with_diagnostic(None, 'DDL', None, 's', db)
        self.assertIs(primary, failed)
        self.assertTrue(diagnostic['diagnostic_only'])
        self.assertIs(diagnostic['verification'], success)
        self.assertEqual(verify.call_count, 2)
        self.assertEqual(verify.call_args_list[0], verify.call_args_list[1])

    def test_no_recheck_for_other_failures_and_diagnostic_exceptions_retained(self):
        db = SimpleNamespace(schema_prefix='test', statement_timeout_ms=5000)
        failed = {'ddl_execution':{'success':False, 'error_sqlstate':'42601'}}
        with patch('er2sql.module7_evaluation.readiness.verify_schema', return_value=SimpleNamespace(as_dict=lambda: failed)) as verify:
            primary, diagnostic = _verify_reference_with_diagnostic(None, 'DDL', None, 's', db)
        self.assertIsNone(diagnostic)
        self.assertEqual(verify.call_count, 1)
        timeout = {'ddl_execution':{'success':True}, 'test_results':[{'error_sqlstate':'57014'}]}
        self.assertTrue(_has_query_cancellation(timeout))
        conn = SimpleNamespace(rollback=lambda: None)
        with patch('er2sql.module7_evaluation.readiness.verify_schema', side_effect=[SimpleNamespace(as_dict=lambda: timeout), RuntimeError('diagnostic unavailable')]):
            primary, diagnostic = _verify_reference_with_diagnostic(conn, 'DDL', None, 's', db)
        self.assertIs(primary, timeout)
        self.assertIn('diagnostic unavailable', diagnostic['audit_error'])

    def test_generated_cascades_require_existing_child_and_null_safe_predicate(self):
        sql = 'CREATE TABLE p(id INT PRIMARY KEY); CREATE TABLE c(id INT PRIMARY KEY,x INT REFERENCES p(id) ON DELETE CASCADE);'
        suite = generate_constraint_tests(parse_ground_truth_sql(sql, 's').ir, 's')
        test = next(t for t in suite.tests if t.test_type == 'cascade_behavior')
        self.assertEqual(test.pre_check.expected_row_count, 1)
        self.assertIn('IS NOT DISTINCT FROM', test.post_check.sql)
        self.assertIn('pre_check', test.as_dict())

    @unittest.skipUnless(os.environ.get('ER2SQL_RUN_POSTGRES_INTEGRATION') == '1', 'requires local PostgreSQL')
    def test_preconditions_mutants_timeout_and_rollback_in_postgres(self):
        from er2sql.config import load_config
        from er2sql.module5_verification.db import build_connection
        from er2sql.module5_verification.executor import verify_schema
        config = load_config('config/config.yaml')
        conn = build_connection(config.database)
        source = 'CREATE TABLE p(id INT PRIMARY KEY); CREATE TABLE c(x INT REFERENCES p(id) ON DELETE CASCADE,marker TEXT);'
        try:
            # A missing child must not count as a successful CASCADE even if the
            # post-action empty-result assertion would otherwise pass.
            test = TestCase('empty', 'cascade_behavior', 'c', 'empty setup',
                setup_sql=['INSERT INTO p VALUES(1);'], action_sql='DELETE FROM p WHERE id=1;',
                pre_check=PostCheck('SELECT * FROM c;', expected_row_count=1),
                post_check=PostCheck('SELECT * FROM c;', expected_row_count=0))
            result = verify_schema(conn, source, TestSuite('s', tests=[test]), 'test', 'empty', config.database.schema_prefix)
            self.assertFalse(result.test_results[0].passed)
            self.assertIsNone(result.test_results[0].action_succeeded)
            self.assertFalse(result.test_results[0].pre_check_passed)
            self.assertEqual(result.test_results[0].failure_category, 'setup_failure')
            # NULL locator: gold removes the row; missing FK must not receive
            # credit from an SQL '= NULL' empty selection.
            test.setup_sql.append('INSERT INTO c VALUES(1,NULL);')
            test.pre_check = PostCheck('SELECT * FROM c WHERE marker IS NOT DISTINCT FROM NULL;', expected_row_count=1)
            test.post_check = PostCheck(test.pre_check.sql, expected_row_count=0)
            for ddl, passed in [(source, True), (source.replace(' REFERENCES p(id) ON DELETE CASCADE', ''), False)]:
                result = verify_schema(conn, ddl, TestSuite('s', tests=[test]), 'test', 'null_marker', config.database.schema_prefix)
                self.assertEqual(result.test_results[0].passed, passed, result.as_dict())
            timeout = TestCase('timeout', 'table_exists', 'p', 'bounded timeout', action_sql='SELECT pg_sleep(0.05);')
            result = verify_schema(conn, source, TestSuite('s', tests=[timeout]), 'test', 'timeout', config.database.schema_prefix, 10)
            if result.ddl_execution.success:
                self.assertEqual(result.test_results[0].failure_category, 'database_timeout_or_cancel')
            else:
                self.assertEqual(result.ddl_execution.failure_category, 'database_timeout_or_cancel')
            # Same connection remains usable after failed fixtures/timeouts.
            control = TestCase('control', 'table_exists', 'p', 'connection recovered', action_sql='SELECT * FROM p;')
            result = verify_schema(conn, source, TestSuite('s', tests=[control]), 'test', 'control', config.database.schema_prefix)
            self.assertTrue(result.test_results[0].passed)
        finally:
            conn.close()


if __name__ == '__main__':
    unittest.main()
