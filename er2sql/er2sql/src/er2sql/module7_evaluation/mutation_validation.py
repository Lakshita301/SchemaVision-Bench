"""Local, hand-authored evaluator controls: reference passes; defects fail.

This suite is deliberately independent of model outputs and of normalization.
It is a bounded regression suite, not proof of general semantic equivalence.
"""
import argparse
import hashlib

from ..config import load_config
from ..module4_constraint_tests.gold_schema import parse_ground_truth_sql
from ..module4_constraint_tests.generator import generate_constraint_tests
from ..module4_constraint_tests.models import TestCase, TestSuite
from ..module5_verification.db import build_connection
from ..module5_verification.executor import verify_schema
from ..utils.io_utils import write_json, write_text
from pathlib import Path
from .evaluator_controls import independent_controls

REFERENCE = '''CREATE TABLE parent(id INTEGER PRIMARY KEY, alternate INTEGER UNIQUE);
CREATE TABLE child(id INTEGER PRIMARY KEY, parent_id INTEGER,
    required_text TEXT NOT NULL, tag TEXT UNIQUE, a INTEGER, b INTEGER,
    score INTEGER CHECK(score >= 1 AND score <= 10),
    CONSTRAINT uq_pair UNIQUE(a,b),
    FOREIGN KEY(parent_id) REFERENCES parent(id) ON DELETE CASCADE);'''

MUTANTS = (
    ('missing_pk', 'child(id INTEGER PRIMARY KEY', 'child(id INTEGER', 'primary_key_duplicate_rejected'),
    ('missing_not_null', 'required_text TEXT NOT NULL', 'required_text TEXT', 'not_null_reject_null'),
    ('missing_unique', 'tag TEXT UNIQUE', 'tag TEXT', 'unique_reject_duplicate'),
    ('missing_composite_unique', 'CONSTRAINT uq_pair UNIQUE(a,b),', '', 'unique_reject_duplicate'),
    ('missing_check', 'CHECK(score >= 1 AND score <= 10)', '', 'check_constraint_reject_invalid'),
    ('missing_fk', ',\n    FOREIGN KEY(parent_id) REFERENCES parent(id) ON DELETE CASCADE', '', 'foreign_key_reject_invalid_parent'),
    ('wrong_fk_target', 'REFERENCES parent(id)', 'REFERENCES parent(alternate)', 'foreign_key_accept_valid_parent'),
    ('wrong_delete_action', 'ON DELETE CASCADE', 'ON DELETE RESTRICT', 'cascade_behavior'),
    ('overrestrictive_check', 'score >= 1 AND score <= 10', 'score >= 4 AND score <= 6', 'check_constraint_accept_valid'),
)


def run_mutations(config, output):
    parsed = parse_ground_truth_sql(REFERENCE, 'mutation_reference')
    suite = generate_constraint_tests(parsed.ir, 'mutation_reference', 'ground_truth_sql')
    conn = build_connection(config.database)
    def verify(sql, tests, name):
        return verify_schema(conn, sql, tests, 'mutation', name, config.database.schema_prefix,
                             config.database.statement_timeout_ms, 'ground_truth_sql').as_dict()
    try:
        baseline = verify(REFERENCE, suite, 'reference')
        baseline_ok = not parsed.warnings and not suite.generation_warnings and baseline['ddl_execution']['success'] and baseline['tests_total'] > 0 and baseline['tests_passed'] == baseline['tests_total']
        rows = []
        for name, before, after, target_type in MUTANTS:
            assert REFERENCE.count(before) == 1, name
            sql = REFERENCE.replace(before, after)
            result = verify(sql, suite, name)
            detected = [r['test_id'] for r in result['test_results'] if r['test_type'] == target_type
                        and not r['passed'] and r.get('action_succeeded') is not None]
            rows.append({'name':name, 'mutant_sql':sql, 'target_test_type':target_type,
                         'detected_by':detected, 'passed':bool(baseline_ok and result['ddl_execution']['success'] and detected),
                         'verification':result})
        wrong_target = TestCase(test_id='wrong_unique', test_type='unique_reject_duplicate', table='t',
            column='a', description='Same SQLSTATE from b must not earn credit for missing UNIQUE(a)',
            setup_sql=['INSERT INTO t VALUES (1,1,1)'], action_sql='INSERT INTO t VALUES (2,2,1)',
            expect='failure', expected_sqlstates=['23505'])
        target_result = verify('CREATE TABLE t(id INT PRIMARY KEY,a INT,b INT UNIQUE);',
                               TestSuite(schema_id='wrong_target', tests=[wrong_target]), 'wrong_target')
        case = target_result['test_results'][0]
        target_ok = case['error_sqlstate'] == '23505' and case['rejection_target_matched'] is False and not case['passed']
        controls = independent_controls(verify)
        with conn.cursor() as cursor:
            cursor.execute('SELECT version(), current_setting(\'server_encoding\')')
            version, encoding = cursor.fetchone()
        conn.rollback()
        package = Path(__file__).resolve().parents[1]
        payload = {'source_sha256':{str(p.relative_to(package)):hashlib.sha256(p.read_bytes()).hexdigest()
                                  for p in sorted(package.rglob('*.py'))},
                   'model_calls':0, 'reference_sql':REFERENCE,
                   'validation_version':2,
                   'postgresql': {'version':version, 'encoding':encoding,
                                  'statement_timeout_ms':config.database.statement_timeout_ms},
                   'reference_sha256':hashlib.sha256(REFERENCE.encode()).hexdigest(),
                   'reference_passed':baseline_ok, 'reference':baseline, 'warnings':parsed.warnings + suite.generation_warnings,
                   'same_sqlstate_wrong_constraint_control_passed':target_ok, 'wrong_target_control':target_result,
                   'independent_controls':controls,
                   'all_passed':baseline_ok and target_ok and all(r['passed'] for r in rows + controls), 'mutations':rows}
    finally:
        conn.close()
    write_json(output, payload)
    lines = ['# Evaluator mutation validation', '', 'Local PostgreSQL; zero LLM calls.', '',
             f'Reference passed: {baseline_ok}. Wrong-constraint false-positive control passed: {target_ok}.', '',
             '| Deliberate defect | Expected detector | Detected |', '|---|---|---|']
    lines += [f"| {r['name']} | {r['target_test_type']} | {r['passed']} |" for r in rows]
    lines += ['', '## Independent hand-authored controls', '',
              'These bypass the gold parser and test generator, avoiding a shared-parser-only acceptance check.', '',
              '| Control | Expected outcome verified |', '|---|---|']
    lines += [f"| {r['name']} | {r['passed']} |" for r in controls]
    lines += ['', 'These finite controls test sensitivity and acceptance, not complete semantic equivalence.', '']
    write_text(Path(output).with_suffix('.md'), '\n'.join(lines))
    return payload


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', default='config/config.yaml')
    parser.add_argument('--output', default='docs/audits/evaluator_mutations.json')
    args = parser.parse_args()
    result = run_mutations(load_config(args.config), args.output)
    print(f"Mutation controls passed: {result['all_passed']}; LLM calls: 0")
    return 0 if result['all_passed'] else 2


if __name__ == '__main__':
    raise SystemExit(main())
