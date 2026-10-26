"""Revalidate the fixed Module 4/5 edge-case references using local PostgreSQL only."""
import argparse
import hashlib
import logging
from pathlib import Path

from er2sql.config import load_config
from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module4_constraint_tests.generator import generate_constraint_tests
from er2sql.module5_verification.db import build_connection
from er2sql.module5_verification.executor import verify_schema
from er2sql.utils.io_utils import read_json, write_json


FINAL_SCHEMA_IDS = (
    'schema_0198', 'schema_0482', 'schema_0503', 'schema_0521', 'schema_0612',
    'schema_0871', 'schema_0899', 'schema_0933_155171', 'schema_0984_334739',
    'schema_1101_650753', 'schema_1112_007491', 'schema_1173_307431',
    'schema_1224_512880', 'schema_1315_574283',
)
PILOT_SCHEMA_IDS = ('schema_1206_432694',)
SCHEMA_IDS = FINAL_SCHEMA_IDS + PILOT_SCHEMA_IDS


def sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--audit', required=True, help='completed, no-LLM candidate audit to pin the exact reference files')
    parser.add_argument('--pilot-audit', required=True,
                        help='completed, no-LLM pilot audit containing the additional edge-case schema')
    parser.add_argument('--config', default='config/models/mistral-small-4.yaml')
    parser.add_argument('--json-output', required=True)
    parser.add_argument('--markdown-output', required=True)
    args = parser.parse_args()
    for output in (args.json_output, args.markdown_output):
        if Path(output).exists():
            raise ValueError(f'Refusing to overwrite diagnostic history: {output}')

    audits = [read_json(args.audit), read_json(args.pilot_audit)]
    for prior in audits:
        if not prior.get('complete') or prior.get('model_calls') != 0:
            raise ValueError('Requires complete local-only reference audits')
    by_id = {row['schema_id']: row for prior in audits for row in prior['rows']}
    missing = [sid for sid in SCHEMA_IDS if sid not in by_id]
    if missing:
        raise ValueError(f'Audit is missing requested references: {missing}')

    config = load_config(args.config)
    tier_config = next(iter(config.tiers.values()))
    source_root = Path(tier_config.sql_dir).resolve()
    logging.disable(logging.CRITICAL)
    conn = build_connection(config.database)
    results = []
    try:
        import er2sql
        package = Path(er2sql.__file__).parent
        source_hashes = {str(path.relative_to(package)): sha256(path)
                         for path in sorted(package.rglob('*.py'))}
        for sid in SCHEMA_IDS:
            baseline = by_id[sid]
            source = source_root / f'{sid}.sql'
            reference = Path(baseline['reference_path'])
            if sha256(source) != baseline['source_sha256']:
                raise ValueError(f'Original source changed since baseline: {sid}')
            if sha256(reference) != baseline['reference_sha256']:
                raise ValueError(f'Candidate reference changed since baseline: {sid}')
            parsed = parse_ground_truth_sql(source.read_text(encoding='utf-8-sig'), sid)
            suite = generate_constraint_tests(parsed.ir, sid, 'ground_truth_sql')
            verification = verify_schema(
                conn, reference.read_text(encoding='utf-8-sig'), suite,
                'oracle_audit', sid, config.database.schema_prefix,
                config.database.statement_timeout_ms, 'ground_truth_sql',
            ).as_dict()
            failed = [test for test in verification.get('test_results', []) if not test.get('passed')]
            results.append({
                'schema_id': sid,
                'source_sha256': baseline['source_sha256'],
                'reference_sha256': baseline['reference_sha256'],
                'planned_tests': len(suite.tests),
                'parser_warnings': parsed.warnings,
                'generator_warnings': suite.generation_warnings,
                'verification': verification,
                'failed_tests': [{key: test.get(key) for key in (
                    'test_id', 'test_type', 'table', 'description', 'error_sqlstate',
                    'error_constraint', 'failure_phase', 'failure_category',
                    'rejection_target_matched', 'error_message')}
                    for test in failed],
            })
    finally:
        conn.close()

    total = len(results)
    ddl_ok = sum(bool(row['verification']['ddl_execution']['success']) for row in results)
    all_test_pass = sum(row['verification']['tests_passed'] == row['verification']['tests_total']
                        and row['verification']['tests_total'] > 0 for row in results)
    warning_schemas = sum(bool(row['parser_warnings'] or row['generator_warnings']) for row in results)
    payload = {
        'audit_type': 'targeted_evaluator_edge_case_revalidation',
        'model_calls': 0,
        'diagnostic_only': True,
        'launch_gate_updated': False,
        'prior_audits': [str(Path(args.audit)), str(Path(args.pilot_audit))],
        'prior_audit_sha256': {
            str(Path(args.audit)): sha256(args.audit),
            str(Path(args.pilot_audit)): sha256(args.pilot_audit),
        },
        'current_source_sha256': source_hashes,
        'protocol': 'target_attribution_v6',
        'statement_timeout_ms': config.database.statement_timeout_ms,
        'summary': {'schemas': total, 'ddl_success': ddl_ok,
                    'schemas_with_all_generated_tests_passed': all_test_pass,
                    'schemas_with_parse_or_generation_warnings': warning_schemas},
        'interpretation_notes': [
            'schema_1224_512880 has PostgreSQL-incompatible/unsatisfiable LIKE checks for CHAR(11)/CHAR(3); fixtures depending on them are omitted and the schema is not fully behaviorally covered.',
            'schema_1206_432694 is the additional pilot-split case; delete-action rejection must be attributed to the intended relationship, not merely any FK on the same parent row.',
            'Overlapping FK cases without an isolatable invalid-parent witness are reported as warnings and omitted, not counted as passed constraint tests.',
            'A schema with parser or generator warnings is not equivalent to complete constraint coverage, even when all generated tests pass.',
        ],
        'rows': results,
    }
    write_json(args.json_output, payload)

    lines = [
        '# Module 4/5 evaluator edge-case revalidation', '',
        'Local PostgreSQL verification of the fixed known edge-case references. No model/API calls were made. '
        'This diagnostic does not update the launch gate or rewrite candidate/original SQL.', '',
        f'- Protocol: `{payload["protocol"]}`',
        f'- PostgreSQL statement timeout: {payload["statement_timeout_ms"]} ms',
        f'- Schemas checked: {total}; DDL compiled: {ddl_ok}/{total}; '
        f'all generated tests passed: {all_test_pass}/{total}; schemas with parser/generator warnings: {warning_schemas}/{total}.',
        '- A passing test count applies only to tests that could be generated. Warnings identify omitted/non-isolatable checks; they are not treated as passed.', '',
        '## Interpretation notes', '',
        '- `schema_1224_512880` contains `LIKE` bracket patterns on `CHAR(11)`/`CHAR(3)` columns that are not satisfiable under PostgreSQL `LIKE` semantics. The constrained fixtures are therefore omitted, not credited; this source/reference dialect issue needs review before using the schema in a paper run.',
        '- `schema_1206_432694` is the additional pilot-split case. Its interacting delete actions are accepted only when the rejection is attributable to the intended relationship.',
        '- Overlapping-FK negative tests are omitted when another required relationship guarantees the target parent or no independent sibling parent can be synthesized. Those cases are warnings, not passes.',
        '- More generally, any parser/generator warning means the schema has incomplete generated-test coverage and must not be described as fully validated.', '',
        '| Schema | DDL | Tests passed | Warnings |',
        '|---|---:|---:|---:|',
    ]
    for row in results:
        verification = row['verification']
        warning_count = len(row['parser_warnings']) + len(row['generator_warnings'])
        lines.append(f'| `{row["schema_id"]}` | {"pass" if verification["ddl_execution"]["success"] else "FAIL"} '
                     f'| {verification["tests_passed"]}/{verification["tests_total"]} | {warning_count} |')
    lines += ['', '## Remaining failed tests and warnings', '']
    for row in results:
        if not row['failed_tests'] and not row['parser_warnings'] and not row['generator_warnings']:
            continue
        lines.append(f'### {row["schema_id"]}')
        for failure in row['failed_tests']:
            lines.append(f'- **{failure["test_type"]} / {failure["table"]}**: '
                         f'{failure["failure_category"] or failure["error_sqlstate"]}; '
                         f'target matched={failure["rejection_target_matched"]}. '
                         f'{failure["error_message"] or failure["description"]}')
        for warning in row['parser_warnings'] + row['generator_warnings']:
            lines.append(f'- Warning: {warning}')
        lines.append('')
    Path(args.markdown_output).parent.mkdir(parents=True, exist_ok=True)
    Path(args.markdown_output).write_text('\n'.join(lines) + '\n', encoding='utf-8')
    print(f'Validated {total} edge-case references: DDL {ddl_ok}/{total}; all tests {all_test_pass}/{total}; model calls 0')


if __name__ == '__main__':
    main()
