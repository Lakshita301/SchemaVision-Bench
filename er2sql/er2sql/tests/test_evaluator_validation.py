"""Targeted evaluator regressions. No model calls, even in integration mode."""
import os
import unittest

from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module4_constraint_tests.generator import generate_constraint_tests
from er2sql.module5_verification.models import VERIFICATION_PROTOCOL


class GoldParserRegressionTests(unittest.TestCase):
    def test_like_check_witnesses_match_sql_wildcards_and_varchar2_bounds(self):
        from er2sql.module4_constraint_tests.check_solver import parsed_checks, witness
        table = {'name':'staff', 'columns':[{'name':'email','data_type':'VARCHAR2(40)','nullable':False}],
                 'foreign_keys':[], 'check_constraints':["email LIKE '%@%'"]}
        nodes, warnings = parsed_checks(table)
        self.assertFalse(warnings)
        valid = witness(table, nodes, {'email':'x'}, reject_index=None)
        invalid = witness(table, nodes, {'email':'x'}, reject_index=0)
        self.assertIn('@', valid['email'])
        self.assertNotIn('@', invalid['email'])
        self.assertLessEqual(len(valid['email']), 40)

    def test_is_null_and_is_not_null_checks_have_real_witnesses(self):
        from er2sql.module4_constraint_tests.check_solver import parsed_checks, witness
        table = {
            'name': 'staff',
            'columns': [
                {'name': 'required_value', 'data_type': 'TEXT', 'nullable': True},
                {'name': 'empty_value', 'data_type': 'TEXT', 'nullable': True},
            ],
            'foreign_keys': [],
            'check_constraints': [
                'required_value IS NOT NULL',
                'empty_value IS NULL',
            ],
        }
        nodes, warnings = parsed_checks(table)
        self.assertFalse(warnings)
        valid = witness(table, nodes, {}, reject_index=None)
        reject_required = witness(table, nodes, {}, reject_index=0)
        reject_empty = witness(table, nodes, {}, reject_index=1)
        self.assertIsNotNone(valid['required_value'])
        self.assertIsNone(valid['empty_value'])
        self.assertIsNone(reject_required['required_value'])
        self.assertIsNotNone(reject_empty['empty_value'])

    def test_public_schema_rewrite_preserves_strings_and_comments(self):
        from er2sql.module5_verification.executor import _rewrite_public_schema
        sql = "CREATE TABLE public.t(x TEXT DEFAULT 'public.keep'); -- public.comment\nCREATE TABLE \"public\".u(id INT);"
        self.assertEqual(_rewrite_public_schema(sql),
                         "CREATE TABLE t(x TEXT DEFAULT 'public.keep'); -- public.comment\nCREATE TABLE u(id INT);")

    def test_multi_clause_alter_keeps_every_constraint(self):
        parsed = parse_ground_truth_sql('''CREATE TABLE p(a INT PRIMARY KEY);
            CREATE TABLE c(id INT,x INT,y INT);
            ALTER TABLE c ADD PRIMARY KEY(id), ADD UNIQUE(x,y),
                ADD CHECK(y>0), ADD FOREIGN KEY(x) REFERENCES p(a);''', 's')
        table = parsed.ir['tables'][1]
        self.assertFalse(parsed.warnings)
        self.assertEqual(table['primary_key'], ['id'])
        self.assertEqual(table['unique_constraints'], [['x','y']])
        self.assertEqual(table['check_constraints'], ['y>0'])
        self.assertEqual(len(table['foreign_keys']), 1)

    def test_literal_comments_and_fake_keywords_do_not_change_gold(self):
        parsed = parse_ground_truth_sql("""-- CREATE TABLE fake(x INT);
            CREATE TABLE real(id INT PRIMARY KEY,
                v TEXT DEFAULT 'NOT NULL UNIQUE; CREATE TABLE fake(x INT); -- /* hi */',
                n INT CHECK(n>0) CHECK(n<10),
                label TEXT CHECK(label IN ('a--b','c/*d*/','it''s,ok')));
            /* ALTER TABLE real ADD UNIQUE(v); */""", 's')
        self.assertFalse(parsed.warnings)
        self.assertEqual(len(parsed.ir['tables']), 1)
        table = parsed.ir['tables'][0]
        self.assertEqual(len(table['columns']), 4)
        self.assertTrue(table['columns'][1]['nullable'])
        self.assertFalse(table['columns'][1]['unique'])
        self.assertEqual(table['check_constraints'], ['n>0', 'n<10', "label IN ('a--b','c/*d*/','it''s,ok')"])

    def test_unhandled_alter_clause_is_reported(self):
        parsed = parse_ground_truth_sql('CREATE TABLE t(id INT); ALTER TABLE t ADD PRIMARY KEY(id), ALTER COLUMN id SET DEFAULT 1;', 's')
        self.assertTrue(any('ALTER COLUMN' in w for w in parsed.warnings))

    def test_key_reference_case_and_unique_index(self):
        parsed = parse_ground_truth_sql('CREATE TABLE Parent(ID INT PRIMARY KEY); CREATE TABLE Child(OID INT,x INT, PRIMARY KEY(oid),FOREIGN KEY(x) REFERENCES parent(id)); CREATE UNIQUE INDEX uq ON Child(x);', 's')
        self.assertFalse(parsed.warnings)
        child = parsed.ir['tables'][1]
        self.assertEqual(child['primary_key'], ['OID'])
        self.assertEqual(child['foreign_keys'][0]['ref_table'], 'Parent')
        self.assertEqual(child['foreign_keys'][0]['ref_columns'], ['ID'])
        self.assertTrue(child['columns'][1]['unique'])
        partial = parse_ground_truth_sql('CREATE TABLE t(x INT); CREATE UNIQUE INDEX uq ON t(x) WHERE x>0;', 's')
        self.assertTrue(partial.warnings)

    def test_resume_requires_current_verifier_not_just_existing_results(self):
        from er2sql.pipeline.runner import _has_verification
        from er2sql.module6_direct_baseline.runner import _gold_verified
        artifact = {'module5_verification': {'constraint_source':'ground_truth_sql',
                    'ddl_execution':{'success':True}, 'test_results':[]}}
        for check in (_has_verification, _gold_verified):
            self.assertFalse(check(artifact))
        artifact['module5_verification']['verification_protocol'] = VERIFICATION_PROTOCOL
        for check in (_has_verification, _gold_verified):
            self.assertTrue(check(artifact))


@unittest.skipUnless(os.environ.get('ER2SQL_RUN_POSTGRES_INTEGRATION') == '1', 'requires local PostgreSQL')
class ExtendedPostgresTests(unittest.TestCase):
    def test_generated_suites_for_multi_checks_deferred_and_delete_actions(self):
        from er2sql.config import load_config
        from er2sql.module5_verification.db import build_connection
        from er2sql.module5_verification.executor import verify_schema
        config = load_config('config/config.yaml')
        conn = build_connection(config.database)
        cases = {
            'multi_check': 'CREATE TABLE t(id INT PRIMARY KEY,n INT CHECK(n>0) CHECK(n<10));',
            'deferred': 'CREATE TABLE t(id INT PRIMARY KEY DEFERRABLE INITIALLY DEFERRED);',
            'restrict': 'CREATE TABLE p(id INT PRIMARY KEY); CREATE TABLE c(id INT PRIMARY KEY,x INT REFERENCES p(id) ON DELETE RESTRICT);',
            'no_child_key_cascade': 'CREATE TABLE p(id INT PRIMARY KEY); CREATE TABLE c(x INT REFERENCES p(id) ON DELETE CASCADE);',
            'no_child_key_null': 'CREATE TABLE p(a INT,b INT,PRIMARY KEY(a,b)); CREATE TABLE c(x INT,y INT,FOREIGN KEY(x,y) REFERENCES p(a,b) ON DELETE SET NULL);',
            'multi_alter': 'CREATE TABLE t(id INT,a INT,b INT); ALTER TABLE t ADD PRIMARY KEY(id), ADD UNIQUE(a,b), ADD CHECK(a>0);',
            'identity': 'CREATE TABLE t(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,v TEXT UNIQUE);',
            'narrow_types': 'CREATE TABLE t(id INT PRIMARY KEY,c CHAR NOT NULL,n NUMERIC(4,4) NOT NULL,d DATE UNIQUE);',
            'many_checks': 'CREATE TABLE t(id INT PRIMARY KEY,' + ','.join(f'c{i} INT CHECK(c{i} BETWEEN 0 AND 10)' for i in range(8)) + ');',
            'composite_not_null': 'CREATE TABLE p(a INT,b INT,PRIMARY KEY(a,b)); CREATE TABLE c(id INT PRIMARY KEY,x INT NOT NULL,y INT NOT NULL,FOREIGN KEY(x,y) REFERENCES p(a,b));',
            'nullable_cycle': 'CREATE TABLE e(id INT PRIMARY KEY,d INT); CREATE TABLE d(id INT PRIMARY KEY,e INT NOT NULL REFERENCES e(id)); ALTER TABLE e ADD FOREIGN KEY(d) REFERENCES d(id);',
            'set_null_not_null': 'CREATE TABLE p(id INT PRIMARY KEY); CREATE TABLE c(id INT PRIMARY KEY,x INT NOT NULL REFERENCES p(id) ON DELETE SET NULL);',
            'redundant_unique': 'CREATE TABLE t(id INT PRIMARY KEY,x INT,UNIQUE(id,x));',
            'numeric_check_bounds': 'CREATE TABLE t(id INT PRIMARY KEY,n NUMERIC(4,2) CHECK(n BETWEEN 1 AND 10),m NUMERIC(5,2) CHECK(m BETWEEN 0 AND 100));',
            'string_length': 'CREATE TABLE t(id INT PRIMARY KEY,a TEXT,b TEXT,CHECK(length(a)<15 AND char_length(b)<15));',
            'overlapping_fk': 'CREATE TABLE p(a INT,b INT,PRIMARY KEY(a,b)); CREATE TABLE q(a INT,c INT,PRIMARY KEY(a,c)); CREATE TABLE t(id INT PRIMARY KEY,a INT,b INT,c INT,FOREIGN KEY(a,b) REFERENCES p(a,b),FOREIGN KEY(a,c) REFERENCES q(a,c));',
            'public_namespace': 'CREATE TABLE public.ns_table(id INT PRIMARY KEY,v TEXT UNIQUE);',
        }
        try:
            for name, ddl in cases.items():
                with self.subTest(name=name):
                    parsed = parse_ground_truth_sql(ddl, name)
                    suite = generate_constraint_tests(parsed.ir, name, 'ground_truth_sql')
                    self.assertFalse(parsed.warnings + suite.generation_warnings)
                    result = verify_schema(conn, ddl, suite, 'integration', name, config.database.schema_prefix)
                    self.assertTrue(result.ddl_execution.success, result.as_dict())
                    self.assertGreater(result.tests_total, 0)
                    self.assertEqual(result.tests_passed, result.tests_total, result.as_dict())
        finally:
            conn.close()
