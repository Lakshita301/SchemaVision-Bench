"""Freeze v4 reference eligibility from completed local PostgreSQL audits."""
import argparse
import hashlib
from collections import Counter
from pathlib import Path

from ..utils.io_utils import read_json, write_json, write_text


def _reason_categories(row):
    sid = row['schema_id']
    categories = set()
    if sid == 'schema_0924_372982':
        categories.add('sqlite_internal_metadata_not_application_schema')
    blockers = (row.get('normalization') or {}).get('blockers', [])
    warnings = row.get('warnings', [])
    details = ' '.join([*blockers, *warnings]).casefold()
    verification = row.get('verification') or {}
    ddl = verification.get('ddl_execution') or {}
    ddl_error = (ddl.get('error_message') or '').casefold()
    if 'non-unique' in details or 'no unique constraint matching' in ddl_error:
        categories.add('source_foreign_key_targets_non_unique_column')
    if 'duplicate create table' in details or 'conflicting duplicate' in details:
        categories.add('conflicting_duplicate_source_table_definitions')
    if 'set domain' in details:
        categories.add('unrepresentable_set_domain')
    if 'unsupported alter table' in details or 'unresolved alter table' in details:
        categories.add('unresolved_source_alter_operation')
    if 'enum' in details and ('could not' in details or 'unrepresentable' in details):
        categories.add('unresolved_enum_representation')
    if any(marker in details for marker in ('could not parse', 'could not determine data type', 'no create table')):
        categories.add('malformed_or_unparseable_source_ddl')
    if any(marker in details for marker in ('unsupported check', 'unsupported constraint semantics',
                                             'no isolated invalid-parent witness', 'generation warning')):
        categories.add('reference_test_generation_or_evaluator_limit')
    if not ddl.get('success'):
        categories.add('postgresql_ddl_execution_failure')
    elif verification.get('tests_passed') != row.get('planned_tests'):
        categories.add('generated_reference_checks_failed')
    if row.get('review_required'):
        categories.add('changed_reference_not_eligible_for_policy_approval')
    if not categories:
        categories.add('other_reference_gate_failure')
    return sorted(categories)


def freeze_reference_eligibility(split_file, pilot_audit, final_audit, output_split, output_report):
    split = read_json(split_file)
    audits = {'pilot':read_json(pilot_audit), 'final':read_json(final_audit)}
    original = {'pilot':set(split['pilot']), 'final':set(split['final'])}
    output = {'version':4, 'policy':'paper_protocol_v4',
              'source_split_sha256':hashlib.sha256(Path(split_file).read_bytes()).hexdigest(),
              'database_runtime':audits['final'].get('database_runtime'),
              'phases':{}}
    new_split = {'version':4,
                 'selection':'paper protocol v4; reference-gate-passing IDs from the frozen v3 populations; no replacements',
                 'development':split['development']}
    for phase, audit in audits.items():
        expected = original[phase]
        rows = audit.get('rows', [])
        if not audit.get('complete') or audit.get('model_calls') != 0:
            raise ValueError(f'{phase} reference audit is incomplete or records model calls')
        if len(rows) != len(expected) or {r['schema_id'] for r in rows} != expected:
            raise ValueError(f'{phase} audit does not cover the exact frozen source split')
        eligible, excluded = [], []
        for row in rows:
            if row.get('passed'):
                eligible.append(row['schema_id'])
            else:
                excluded.append({'schema_id':row['schema_id'], 'categories':_reason_categories(row),
                                 'normalization_blockers':(row.get('normalization') or {}).get('blockers', []),
                                 'warnings':row.get('warnings', []),
                                 'ddl_error_sqlstate':((row.get('verification') or {}).get('ddl_execution') or {}).get('error_sqlstate'),
                                 'ddl_error':((row.get('verification') or {}).get('ddl_execution') or {}).get('error_message'),
                                 'planned_tests':row.get('planned_tests'),
                                 'tests_passed':(row.get('verification') or {}).get('tests_passed')})
        if set(eligible) & set(new_split.get('pilot', [])):
            raise ValueError('Pilot/final eligible sets unexpectedly overlap')
        new_split[phase] = sorted(eligible)
        counts = Counter(c for item in excluded for c in item['categories'])
        output['phases'][phase] = {
            'source_audit_sha256':hashlib.sha256(Path(pilot_audit if phase == 'pilot' else final_audit).read_bytes()).hexdigest(),
            'source_count':len(rows), 'eligible_count':len(eligible), 'excluded_count':len(excluded),
            'eligible_ids':sorted(eligible), 'exclusion_category_schema_counts':dict(counts),
            'excluded':excluded}
    write_json(output_split, new_split)
    write_json(output_report, output)
    lines = ['# Protocol v4 reference eligibility', '',
             'Local PostgreSQL gate only; zero LLM calls. Exclusions are determined from source/reference evidence before model evaluation. No replacement IDs were selected.', '',
             f"Frozen source split SHA-256: `{output['source_split_sha256']}`", '',
             '| Phase | Frozen IDs | Eligible | Excluded |', '|---|---:|---:|---:|']
    for phase in ('pilot','final'):
        record = output['phases'][phase]
        lines.append(f"| {phase} | {record['source_count']} | {record['eligible_count']} | {record['excluded_count']} |")
        lines.extend(['', f"## {phase.title()} exclusion details", ''])
        for item in record['excluded']:
            lines.extend([f"### {item['schema_id']}", '', '- Categories: ' + ', '.join(item['categories'])])
            if item['normalization_blockers']:
                lines.extend('- Converter blocker: ' + value for value in item['normalization_blockers'])
            if item['ddl_error']:
                lines.extend(['- PostgreSQL SQLSTATE: `' + str(item['ddl_error_sqlstate']) + '`', '- DDL error: ' + item['ddl_error']])
            if item['warnings']:
                lines.extend('- Gate warning: ' + value for value in item['warnings'])
            if item['planned_tests'] is not None:
                lines.append(f"- Generated checks: {item['tests_passed']}/{item['planned_tests']} passed.")
            lines.append('')
    write_text(output_report.replace('.json', '.md'), '\n'.join(lines) + '\n')
    return output


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--split-file', default='config/paper_splits.json')
    parser.add_argument('--pilot-audit', default='docs/audits/pilot_oracle_v4.json')
    parser.add_argument('--final-audit', default='docs/audits/final_oracle_v4.json')
    parser.add_argument('--output-split', default='config/paper_splits_v4.json')
    parser.add_argument('--output-report', default='docs/audits/reference_eligibility_v4.json')
    args = parser.parse_args()
    payload = freeze_reference_eligibility(args.split_file, args.pilot_audit, args.final_audit,
                                           args.output_split, args.output_report)
    print('Protocol v4 eligible references: ' + ', '.join(
        f"{phase}={payload['phases'][phase]['eligible_count']}/{payload['phases'][phase]['source_count']}"
        for phase in ('pilot','final')) + '; LLM calls: 0')


if __name__ == '__main__':
    main()
