"""One local-only diagnostic recheck of each timed-out reference; never rewrites a gate."""
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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--audit', required=True)
    parser.add_argument('--config', default='config/models/mistral-small-4.yaml')
    parser.add_argument('--output', required=True)
    parser.add_argument('--timeout-ms', type=int, default=30000,
                        help='one diagnostic verification at this larger PostgreSQL statement timeout')
    args = parser.parse_args()
    if Path(args.output).exists():
        raise ValueError('Use a new output; diagnostic history must not be overwritten')
    audit = read_json(args.audit)
    if not audit.get('complete') or audit.get('model_calls') != 0:
        raise ValueError('Requires a completed local reference audit')
    if args.timeout_ms <= 0:
        raise ValueError('--timeout-ms must be positive')
    import er2sql
    package = Path(er2sql.__file__).parent
    source_hashes = {str(p.relative_to(package)):hashlib.sha256(p.read_bytes()).hexdigest()
                     for p in sorted(package.rglob('*.py'))}
    config = load_config(args.config)
    roots = {Path(t.sql_dir).resolve() for t in config.tiers.values()}
    if len(roots) != 1:
        raise ValueError('Requires a common source SQL directory')
    root = roots.pop()
    rows = []
    logging.disable(logging.CRITICAL)
    conn = build_connection(config.database)
    try:
        for previous in audit['rows']:
            if (previous.get('verification') or {}).get('ddl_execution', {}).get('error_sqlstate') != '57014':
                continue
            sid = previous['schema_id']
            source = (root / f'{sid}.sql').resolve()
            if source.parent != root:
                raise ValueError('Invalid schema ID')
            reference = Path(previous['reference_path'])
            for path, key in [(source, 'source_sha256'), (reference, 'reference_sha256')]:
                if hashlib.sha256(path.read_bytes()).hexdigest() != previous[key]:
                    raise ValueError(f'Changed input: {sid}')
            parsed = parse_ground_truth_sql(source.read_text(encoding='utf-8-sig'), sid)
            suite = generate_constraint_tests(parsed.ir, sid, 'ground_truth_sql')
            result = verify_schema(conn, reference.read_text(encoding='utf-8-sig'), suite,
                                   'oracle_audit', sid, config.database.schema_prefix,
                                   args.timeout_ms, 'ground_truth_sql').as_dict()
            rows.append({'schema_id':sid, 'source_sha256':previous['source_sha256'],
                         'reference_sha256':previous['reference_sha256'], 'attempts_in_this_recheck':1,
                         'previous_ddl':previous['verification']['ddl_execution'],
                         'planned_tests':len(suite.tests), 'warnings':parsed.warnings + suite.generation_warnings,
                         'verification':result})
    finally:
        conn.close()
    write_json(args.output, {'model_calls':0, 'diagnostic_only':True, 'launch_gate_updated':False,
                            'original_audit_modified':False, 'source_sha256':source_hashes,
                            'previous_source_sha256':audit.get('source_sha256'),
                            'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                            'audit_sha256':hashlib.sha256(Path(args.audit).read_bytes()).hexdigest(),
                            'previous_statement_timeout_ms':audit.get('database_runtime', {}).get('statement_timeout_ms'),
                            'statement_timeout_ms':args.timeout_ms, 'rows':rows})
    print(f'Rechecked {len(rows)} timed-out reference(s) once each at {args.timeout_ms} ms; originals/gate unchanged; LLM calls: 0')


if __name__ == '__main__':
    main()
