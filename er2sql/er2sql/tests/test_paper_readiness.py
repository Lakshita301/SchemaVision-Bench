"""Regression checks for the paid-run protocol; no provider calls."""
import json
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import Mock, patch

from er2sql.llm_client import LLMCallResult
from er2sql.module2_parsing.agent import parse_er_diagram
from er2sql.module3_generation.agent import generate_sql_from_ir
from er2sql.module6_direct_baseline.agent import generate_sql_directly_from_image
from er2sql.module7_evaluation.evaluator import _schema_metrics, _aggregate_rows, _prf
from er2sql.module7_evaluation.statistics import clustered_estimates
from er2sql.module5_verification.executor import _bind_identifier_spelling
from er2sql.pipeline.runner import _is_fully_done, _has_verification
from er2sql.utils.io_utils import read_json, write_json


class ReadinessTests(unittest.TestCase):
    def test_read_json_accepts_utf8_bom_manifests(self):
        with tempfile.TemporaryDirectory() as d:
            path = Path(d) / 'manifest.json'
            path.write_bytes(b'\xef\xbb\xbf{"ok": true}')
            self.assertEqual(read_json(path), {'ok': True})

    def test_local_audit_only_manifest_is_rejected_before_provider_work(self):
        from er2sql.module7_evaluation.orchestrator import run_experiment, ExperimentManifestError
        with patch('er2sql.module7_evaluation.orchestrator.prepare_experiment',
                   return_value=(SimpleNamespace(local_audit_only=True), Path('.'), [])), \
             patch('er2sql.module7_evaluation.orchestrator.build_experiment_plan') as plan:
            with self.assertRaisesRegex(ExperimentManifestError, 'local-audit-only'):
                run_experiment('unused.yaml')
            plan.assert_not_called()

    def test_failed_or_stale_oracle_blocks_before_any_model_call(self):
        from er2sql.module7_evaluation.orchestrator import run_experiment, ExperimentManifestError
        with tempfile.TemporaryDirectory() as d:
            audit = Path(d)/'audit.json'
            spec = SimpleNamespace(oracle_audit=str(audit), phase='pilot')
            for passing, fingerprint in ((False, 'current'), (True, 'old')):
                write_json(audit, {'all_passed':passing, 'plan_sha256':fingerprint})
                with patch('er2sql.module7_evaluation.orchestrator.prepare_experiment', return_value=(spec, Path(d), [])), \
                     patch('er2sql.module7_evaluation.orchestrator.build_experiment_plan', return_value={'plan_sha256':'current'}), \
                     patch('er2sql.module7_evaluation.orchestrator.run_tier') as run:
                    with self.assertRaises(ExperimentManifestError):
                        run_experiment('unused.yaml')
                    run.assert_not_called()

    def test_absent_constraint_category_is_not_perfect_f1(self):
        self.assertIsNone(_prf(set(), set())['f1'])

    def test_fixture_literals_fit_postgres_types(self):
        from er2sql.module4_constraint_tests.value_factory import ValueFactory
        vf = ValueFactory()
        self.assertEqual(len(vf.sentinel_invalid_value('varchar(5)')), 5)
        self.assertEqual(vf.sql_literal(b'abc'), "decode('616263', 'hex')")
        self.assertEqual(vf.sql_literal(vf.dummy_value('boolean')), 'TRUE')
        self.assertNotEqual(vf.dummy_value('char(2)'), vf.dummy_value('char(2)'))
    def test_valid_looking_truncated_json_is_terminal(self):
        client = Mock()
        client.complete_with_image.return_value = LLMCallResult(True, '{"tables":[]}', 1, finish_reason='length')
        result = parse_er_diagram('unused.png', 'a', 'tier1', client)
        self.assertFalse(result.success)
        self.assertTrue(result.failure_terminal)
        self.assertEqual(result.raw_responses, ['{"tables":[]}'])
        self.assertEqual(client.complete_with_image.call_count, 1)

    def test_truncated_sql_is_retained_but_not_accepted(self):
        client = Mock()
        response = LLMCallResult(True, 'CREATE TABLE t (id int);', 1, finish_reason='length')
        client.complete_text_only.return_value = response
        client.complete_with_image.return_value = response
        for result in (generate_sql_from_ir({}, 'a', 'tier1', client),
                       generate_sql_directly_from_image('x', 'a', 'tier1', client)):
            self.assertFalse(result.success)
            self.assertTrue(result.failure_terminal)
            self.assertEqual(result.raw_response, response.text)

    def test_resume_skips_terminal_model_failure_but_not_infrastructure_failure(self):
        self.assertTrue(_is_fully_done({'terminal_model_failure': True}, True))
        self.assertFalse(_is_fully_done({'terminal_model_failure': False}, True))
        self.assertFalse(_has_verification({'module5_verification': {'constraint_source':'ground_truth_sql', 'error':'offline'}}))

    def test_failed_generation_retains_gold_denominator(self):
        row = _schema_metrics({'schema_id':'s', 'tier':'tier1',
            'ground_truth_sql':'CREATE TABLE t (id INTEGER PRIMARY KEY, name TEXT NOT NULL);',
            'module3_generation': {'success':False}}, 'structured')
        self.assertGreater(row['planned_constraint_tests_total'], 0)
        self.assertEqual(row['constraint_tests_passed'], 0)
        overall = _aggregate_rows([row])
        self.assertEqual(overall['unconditional_constraint_coverage'], 0)
        self.assertIsNone(overall['constraint_enforcement_rate'])

    def test_cluster_pairing_and_determinism(self):
        rows = [{'schema_id':sid,'tier':tier,'ddl_execution_success':sid=='a'}
                for sid in ('a','b') for tier in ('tier2','tier3')]
        estimate = clustered_estimates(rows, rows, replicates=100)
        self.assertEqual(estimate['clusters'], 2)
        for metric in estimate['metrics'].values():
            self.assertEqual(metric['estimate'], 0)
            self.assertEqual(metric['ci95'], {'lower':0,'upper':0})

    def test_atomic_history_does_not_enter_result_glob(self):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)/'schema_1.json'
            write_json(p, {'attempt':1})
            write_json(p, {'attempt':2})
            self.assertEqual(json.loads(p.read_text())['attempt'], 2)
            archived = list((Path(d)/'attempt_history'/'schema_1').glob('*.json'))
            self.assertEqual(len(archived), 1)
            self.assertEqual(json.loads(archived[0].read_text())['attempt'], 1)

    def test_identifier_binding_preserves_literals_and_ambiguity(self):
        self.assertEqual(_bind_identifier_spelling('SELECT "Id" FROM "Teacher" WHERE x=\'Teacher\'', {'id','teacher'}),
                         'SELECT "id" FROM "teacher" WHERE x=\'Teacher\'')
        self.assertEqual(_bind_identifier_spelling('SELECT "TEACHER"', {'Teacher','teacher'}), 'SELECT "TEACHER"')


if __name__ == '__main__':
    unittest.main()
