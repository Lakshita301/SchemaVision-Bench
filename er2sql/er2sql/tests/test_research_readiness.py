"""Offline normalization/solver/archive tests; opt-in local mutation controls."""
import hashlib
import json
import os
import tempfile
import unittest
import zipfile
from pathlib import Path

from er2sql.module4_constraint_tests.check_solver import parse_check, evaluate, parsed_checks, witness
from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module4_constraint_tests.generator import generate_constraint_tests
from er2sql.module7_evaluation.reference_normalization import normalize_source
from er2sql.module7_evaluation.reproducibility import verify_bundle


class ResearchReadinessTests(unittest.TestCase):
    def test_compound_check_witness_and_unknown_semantics(self):
        table = parse_ground_truth_sql("CREATE TABLE t(id INT PRIMARY KEY, n INT CHECK(n>10 AND n<20), c CHAR(1) CHECK(c='H' OR c='P'));", 's').ir['tables'][0]
        nodes, warnings = parsed_checks(table)
        self.assertFalse(warnings)
        valid = witness(table, nodes, {'id':1, 'n':1000, 'c':'X'})
        self.assertTrue(10 < valid['n'] < 20)
        self.assertIn(valid['c'], ('H','P'))
        invalid = witness(table, nodes, valid, reject_index=0)
        self.assertFalse(evaluate(nodes[0][1], invalid))
        self.assertTrue(evaluate(nodes[1][1], invalid))
        self.assertIsNone(evaluate(parse_check('n > 1'), {'n':None}))
        with self.assertRaises(ValueError):
            parse_check('custom_function(n) > 0')
        between = parse_check('n BETWEEN 1 AND 3 AND c IN (\'H\',\'P\')')
        self.assertTrue(evaluate(between, {'n':2,'c':'H'}))

    def test_composite_unique_in_gold_and_generated_suite(self):
        parsed = parse_ground_truth_sql('CREATE TABLE t(id INT PRIMARY KEY, a INT, b INT, UNIQUE(a,b));', 's')
        self.assertEqual(parsed.ir['tables'][0]['unique_constraints'], [['a','b']])
        suite = generate_constraint_tests(parsed.ir, 's')
        self.assertFalse(suite.generation_warnings)
        self.assertTrue(any(t.columns == ['a','b'] and t.test_type == 'unique_reject_duplicate' for t in suite.tests))
        invalid = parse_ground_truth_sql('CREATE TABLE t(id INT, UNIQUE(id, missing));', 'invalid')
        self.assertTrue(generate_constraint_tests(invalid.ir, 'invalid').generation_warnings)

    def test_normalization_preserves_literals_constraints_and_blocks_guessing(self):
        source = "CREATE TABLE `t` (`id` INT(11) PRIMARY KEY, `note` LONGTEXT DEFAULT 'blob ENGINE=foo', CHECK (`id` > 0)) ENGINE=InnoDB;"
        result = normalize_source(source)
        self.assertIn("DEFAULT 'blob ENGINE=foo'", result['sql'])
        self.assertIn('id INT PRIMARY KEY', result['sql'])
        self.assertIn('note TEXT', result['sql'])
        self.assertIn('CHECK (id > 0)', result['sql'])
        self.assertNotIn('ENGINE=InnoDB', result['sql'])
        original_ir = parse_ground_truth_sql(source, 's').ir
        target_ir = parse_ground_truth_sql(result['sql'], 's').ir
        self.assertEqual(original_ir['tables'][0]['primary_key'], target_ir['tables'][0]['primary_key'])
        self.assertIn('id BIGINT', normalize_source('CREATE TABLE t(id INT UNSIGNED);')['sql'])
        self.assertTrue(normalize_source('CREATE TABLE t(id NOT NULL);')['blockers'])
        self.assertTrue(normalize_source('CREATE TABLE t(id INT); CREATE TABLE t(id TEXT);')['blockers'])
        native = 'CREATE TABLE t(id INTEGER PRIMARY KEY);'
        self.assertEqual(normalize_source(native)['sql'], native)

    def test_gold_suite_uses_source_final_alter_state_and_enum_domain(self):
        source = """CREATE TABLE t(id INT PRIMARY KEY, old_col INT, state ENUM('new','done'));
          ALTER TABLE t DROP COLUMN old_col;
          ALTER TABLE t ADD COLUMN enabled BOOLEAN;"""
        parsed = parse_ground_truth_sql(source, 'source_state')
        self.assertFalse(parsed.warnings, parsed.warnings)
        table = parsed.ir['tables'][0]
        names = {column['name'] for column in table['columns']}
        self.assertIn('enabled', names)
        self.assertNotIn('old_col', names)
        self.assertIn("state IN ('new', 'done')", table['check_constraints'])

    def test_bundle_integrity_rejects_modified_bytes(self):
        with tempfile.TemporaryDirectory() as d:
            path = Path(d)/'bundle.zip'
            inventory = {'files':{'source.sql':hashlib.sha256(b'original').hexdigest()}}
            with zipfile.ZipFile(path, 'w') as bundle:
                bundle.writestr('bundle_manifest.json', json.dumps(inventory))
                bundle.writestr('source.sql', b'changed')
            with self.assertRaisesRegex(ValueError, 'checksum'):
                verify_bundle(path)

    @unittest.skipUnless(os.environ.get('ER2SQL_RUN_POSTGRES_INTEGRATION') == '1', 'requires local PostgreSQL')
    def test_mutation_controls_in_real_postgres(self):
        from er2sql.config import load_config
        from er2sql.module7_evaluation.mutation_validation import run_mutations
        with tempfile.TemporaryDirectory() as d:
            result = run_mutations(load_config('config/config.yaml'), Path(d)/'mutations.json')
        self.assertTrue(result['all_passed'], result)
        self.assertEqual(len(result['mutations']), 9)
        self.assertEqual(len(result['independent_controls']), 15)
        self.assertTrue(all(row['passed'] for row in result['independent_controls']))


if __name__ == '__main__':
    unittest.main()
