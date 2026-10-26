"""No-provider tests for independent reference provenance and parser blockers."""
import hashlib
import tempfile
import unittest
from copy import deepcopy
from pathlib import Path

from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module7_evaluation.reference_gate import validate_reference_evidence


class ReferenceGateTests(unittest.TestCase):
    def test_indexes_are_not_columns_and_duplicate_variants_are_flagged(self):
        parsed = parse_ground_truth_sql('CREATE TABLE t (id INT, key VARCHAR(255) NOT NULL, INDEX ix (id), KEY iy (id));', 's')
        self.assertEqual([c['name'] for c in parsed.ir['tables'][0]['columns']], ['id', 'key'])
        self.assertFalse(parsed.warnings)
        duplicate = parse_ground_truth_sql('CREATE TABLE t (id INT); CREATE TABLE t (id TEXT);', 's')
        self.assertTrue(any('Duplicate CREATE' in w for w in duplicate.warnings))
        ordinary = parse_ground_truth_sql('CREATE TABLE t(checkin_interval BIGINT NOT NULL, unique_code TEXT);', 's')
        self.assertEqual([c['name'] for c in ordinary.ir['tables'][0]['columns']], ['checkin_interval', 'unique_code'])
        self.assertFalse(ordinary.warnings)

    def test_repeated_parent_and_whitespace_fk_are_supported(self):
        from er2sql.module4_constraint_tests.generator import generate_constraint_tests
        parsed = parse_ground_truth_sql('''CREATE TABLE parent(id INT PRIMARY KEY);
            CREATE TABLE child(id INT PRIMARY KEY, a INT NOT NULL, b INT NOT NULL,
            FOREIGN  KEY(a) REFERENCES parent(id), FOREIGN KEY(b) REFERENCES parent(id));''', 's')
        self.assertEqual(len(parsed.ir['tables'][1]['foreign_keys']), 2)
        self.assertFalse(parsed.warnings)
        suite = generate_constraint_tests(parsed.ir, 's')
        self.assertFalse(suite.generation_warnings)

    def test_reference_hashes_coverage_and_review_are_enforced(self):
        with tempfile.TemporaryDirectory() as d:
            reference = Path(d)/'s.sql'
            reference.write_text('CREATE TABLE t(id INT);', encoding='utf-8')
            sha = hashlib.sha256(reference.read_bytes()).hexdigest()
            plan = {'plan_sha256':'plan', 'models':[{'input_sha256':{'tier1':{'s':{'sql':sha}}}}]}
            audit = {'audit_version':2, 'complete':True, 'all_passed':True, 'plan_sha256':'plan',
                     'rows':[{'schema_id':'s', 'source_sha256':sha, 'reference_sha256':sha,
                              'reference_path':str(reference), 'passed':True, 'warnings':[], 'planned_tests':1,
                              'verification':{'ddl_execution':{'success':True}, 'tests_passed':1}}]}
            validate_reference_evidence(audit, plan)
            retried = deepcopy(audit)
            retried['rows'][0]['timeout_recheck'] = {'diagnostic_only':True, 'verification':{'ddl_execution':{'success':True}}}
            with self.assertRaisesRegex(ValueError, 'timeout/cancellation'):
                validate_reference_evidence(retried, plan)
            missing = deepcopy(audit)
            missing['rows'] = []
            with self.assertRaisesRegex(ValueError, 'exactly'):
                validate_reference_evidence(missing, plan)
            reference.write_text('CREATE TABLE changed(id INT);', encoding='utf-8')
            with self.assertRaisesRegex(ValueError, 'changed'):
                validate_reference_evidence(audit, plan)
            revised = deepcopy(audit)
            revised['rows'][0]['reference_sha256'] = hashlib.sha256(reference.read_bytes()).hexdigest()
            with self.assertRaisesRegex(ValueError, 'semantic review'):
                validate_reference_evidence(revised, plan)
            revised['rows'][0]['review'] = {'reviewer':'test reviewer', 'notes':'fixture only',
                'source_sha256':sha, 'reference_sha256':revised['rows'][0]['reference_sha256']}
            validate_reference_evidence(revised, plan)
            different = deepcopy(plan)
            different['models'][0]['input_sha256']['tier2'] = {'s':{'sql':'different'}}
            with self.assertRaisesRegex(ValueError, 'differs'):
                validate_reference_evidence(audit, different)

    def test_locked_inherited_policy_approval_requires_matching_policy_file(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            reference = root/'s.sql'
            reference.write_text('CREATE TABLE t(id INT);', encoding='utf-8')
            policy = root/'paper_protocol_v4.yaml'
            policy.write_text('locked reference conversion policy', encoding='utf-8')
            source_sha = hashlib.sha256(b'original source').hexdigest()
            reference_sha = hashlib.sha256(reference.read_bytes()).hexdigest()
            policy_sha = hashlib.sha256(policy.read_bytes()).hexdigest()
            audit = {'audit_version':2, 'complete':True, 'all_passed':True, 'plan_sha256':'plan',
                     'protocol_sha256':'v6-protocol-hash',
                     'reference_policy':{'path':str(policy), 'sha256':policy_sha},
                     'rows':[{'schema_id':'s', 'source_sha256':source_sha, 'reference_sha256':reference_sha,
                              'reference_path':str(reference), 'passed':True, 'warnings':[], 'planned_tests':1,
                              'policy_approval':{'status':'policy-approved', 'categories':['approved_type_mapping'],
                                  'record':f'inherited protocol v4 approval ({policy_sha})',
                                  'source_sha256':source_sha, 'reference_sha256':reference_sha},
                              'verification':{'ddl_execution':{'success':True}, 'tests_passed':1}}]}
            plan = {'plan_sha256':'plan', 'models':[{'input_sha256':{'tier1':{'s':{'sql':source_sha}}}}]}
            validate_reference_evidence(audit, plan)
            policy.write_text('changed policy', encoding='utf-8')
            with self.assertRaisesRegex(ValueError, 'policy file'):
                validate_reference_evidence(audit, plan)

    def test_reference_evidence_is_bound_to_schema_inputs_not_local_output_paths(self):
        with tempfile.TemporaryDirectory() as d:
            reference = Path(d)/'s.sql'
            reference.write_text('CREATE TABLE t(id INT);', encoding='utf-8')
            sha = hashlib.sha256(reference.read_bytes()).hexdigest()
            audit = {'audit_version':2, 'complete':True, 'all_passed':True,
                     'plan_sha256':'local-plan', 'reference_plan_sha256':'reference-plan',
                     'rows':[{'schema_id':'s', 'source_sha256':sha, 'reference_sha256':sha,
                              'reference_path':str(reference), 'passed':True, 'warnings':[], 'planned_tests':1,
                              'verification':{'ddl_execution':{'success':True}, 'tests_passed':1}}]}
            plan = {'plan_sha256':'paid-plan', 'reference_plan_sha256':'reference-plan',
                    'models':[{'input_sha256':{'tier1':{'s':{'sql':sha}}}}]}
            validate_reference_evidence(audit, plan)
            plan['reference_plan_sha256'] = 'different-schema-inputs'
            with self.assertRaisesRegex(ValueError, 'stale'):
                validate_reference_evidence(audit, plan)


if __name__ == '__main__':
    unittest.main()
