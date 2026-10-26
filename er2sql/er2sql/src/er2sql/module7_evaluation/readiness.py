"""Local reference-oracle audit. No model client is created or called.

python -m er2sql.module7_evaluation.readiness --manifest ... --output ...
Reference overrides must be independently reviewed PostgreSQL equivalents,
named SCHEMA_ID.sql; never use model-generated SQL as the reference.
"""
import argparse
import hashlib
import logging
from collections import Counter
from pathlib import Path

from .orchestrator import prepare_experiment, build_experiment_plan
from ..dataset import discover_tier_dataset
from ..module4_constraint_tests.gold_schema import parse_ground_truth_sql
from ..module4_constraint_tests.generator import generate_constraint_tests
from ..module5_verification.db import build_connection
from ..module5_verification.executor import verify_schema
from ..utils.io_utils import write_json, write_text, read_json
from ..config import load_config


REFERENCE_EXECUTION_POLICY = 'primary_attempt_with_one_cancellation_diagnostic_v1'


def _has_query_cancellation(result):
    # SQLSTATE 57014 covers statement timeout and explicit query cancellation.
    return (result.get('ddl_execution', {}).get('error_sqlstate') == '57014'
            or any(t.get('error_sqlstate') == '57014' for t in result.get('test_results', [])))


def _verify_reference_with_diagnostic(conn, sql, suite, sid, database):
    """One scored reference attempt; at most one unscored cancellation recheck.

    Same SQL, tests and timeout; never select the best attempt or increase limits.
    This applies only to reference diagnostics, not model attempts or CER.
    """
    def execute():
        return verify_schema(conn, sql, suite, 'oracle_audit', sid, database.schema_prefix,
                             database.statement_timeout_ms, 'ground_truth_sql').as_dict()
    primary = execute()
    diagnostic = None
    if _has_query_cancellation(primary):
        try:
            diagnostic = {'diagnostic_only':True, 'verification':execute()}
        except Exception as exc:
            conn.rollback()
            diagnostic = {'diagnostic_only':True, 'audit_error':f'{type(exc).__name__}: {exc}'}
    return primary, diagnostic


def _publish_audit(output, plan_hash, rows, expected, complete, database_runtime=None, plan=None, reference_policy=None):
    categories = Counter()
    for row in rows:
        v = row.get('verification') or {}
        if _has_query_cancellation(v):
            categories['reference_timeout_or_cancel'] += 1
        if row.get('audit_error'):
            categories['audit_error'] += 1
        elif not v.get('ddl_execution', {}).get('success'):
            categories['reference_ddl_failure'] += 1
        if row.get('warnings'):
            categories['parser_generator_or_review_warnings'] += 1
        if v.get('ddl_execution', {}).get('success') and v.get('tests_passed') != row.get('planned_tests'):
            categories['reference_behavior_failure'] += 1
    payload = {'audit_version': 2, 'plan_sha256': plan_hash, 'model_calls': 0,
               'reference_execution_policy': REFERENCE_EXECUTION_POLICY,
               'source_sha256': (plan or {}).get('source_sha256'),
               'protocol_sha256': (plan or {}).get('protocol_sha256'),
               'reference_plan_sha256': (plan or {}).get('reference_plan_sha256'),
               'reference_policy': reference_policy,
               'database_runtime': database_runtime,
               'expected_schemas': expected, 'complete': complete,
               'ddl_passed': sum(bool((r.get('verification') or {}).get('ddl_execution', {}).get('success')) for r in rows),
               'execution_checks_passed': sum(bool(r.get('execution_checks_passed')) for r in rows),
               'technical_passed': sum(bool(r.get('technical_passed')) for r in rows),
               'review_required': sum(bool(r.get('review_required')) for r in rows),
               'all_passed': complete and len(rows) == expected and bool(rows) and all(r['passed'] for r in rows),
               'category_schema_counts': dict(categories),
               'ddl_sqlstate_schema_counts': dict(Counter((r.get('verification') or {}).get('ddl_execution', {}).get('error_sqlstate') or 'unknown'
                    for r in rows if not (r.get('verification') or {}).get('ddl_execution', {}).get('success'))),
               'rows': rows}
    write_json(output, payload)
    lines = ['# Reference oracle audit', '',
             f"Local PostgreSQL only; no LLM calls. Complete: {complete}. Passed: {sum(r['passed'] for r in rows)}/{expected}.", '',
             f"DDL compiles: {payload['ddl_passed']}; all finite execution checks pass: {payload['execution_checks_passed']}; "
             f"technical checks without warnings/blockers pass: {payload['technical_passed']}; conversion review missing: {payload['review_required']}.", '',
             'Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.', '',
             'Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.', '',
             '| Schema | DDL | Passed/planned | Warnings | Gate |', '|---|---|---:|---:|---|']
    for r in rows:
        v = r.get('verification') or {}
        lines.append(f"| {r['schema_id']} | {v.get('ddl_execution', {}).get('success', False)} | {v.get('tests_passed', 0)}/{r.get('planned_tests', 0)} | {len(r.get('warnings', []))} | {r['passed']} |")
    lines.extend(['', '## Blocker details', ''])
    for r in rows:
        if r['passed']:
            continue
        v = r.get('verification') or {}
        lines.append(f"### {r['schema_id']}")
        lines.append('')
        error = r.get('audit_error') or v.get('ddl_execution', {}).get('error_message')
        if error:
            lines.extend(['```text', error, '```', ''])
        lines.extend('- ' + w for w in r.get('warnings', []))
        if r.get('failure_categories'):
            lines.append(f"- Failed test categories: {r['failure_categories']}")
        if r.get('timeout_recheck'):
            diagnostic = r['timeout_recheck']
            lines.append(f"- Unscored timeout/cancellation recheck retained in JSON; DDL success: {diagnostic.get('verification', {}).get('ddl_execution', {}).get('success', False)}. Original failure not replaced.")
        lines.append('')
    write_text(Path(output).with_suffix('.md'), '\n'.join(lines)+'\n')
    return payload


def _load_policy_approvals(approval_audits, policy_sha256):
    """Load prior hash-matched approvals made under the still-locked v4 policy."""
    approvals = {}
    for audit_path in approval_audits or []:
        payload = read_json(audit_path)
        if payload.get('audit_version') != 2 or not payload.get('complete'):
            raise ValueError(f'Approval evidence is not a complete v2 audit: {audit_path}')
        if payload.get('protocol_sha256') != policy_sha256:
            raise ValueError(f'Approval evidence was not produced under the locked reference policy: {audit_path}')
        audit_file_sha256 = hashlib.sha256(Path(audit_path).read_bytes()).hexdigest()
        for prior in payload.get('rows', []):
            approval = prior.get('policy_approval') or {}
            if not prior.get('passed') or approval.get('status') != 'policy-approved':
                continue
            if (approval.get('source_sha256') != prior.get('source_sha256')
                    or approval.get('reference_sha256') != prior.get('reference_sha256')
                    or policy_sha256 not in (approval.get('record') or '')):
                continue
            ref = Path(prior.get('reference_path', ''))
            if not ref.is_file() or hashlib.sha256(ref.read_bytes()).hexdigest() != prior.get('reference_sha256'):
                continue
            approvals[prior['schema_id']] = {
                'source_sha256': prior['source_sha256'],
                'reference_sha256': prior['reference_sha256'],
                'categories': approval.get('categories', []),
                'record': approval.get('record'),
                'audit_path': str(Path(audit_path).resolve()),
                'audit_sha256': audit_file_sha256,
            }
    return approvals


def audit_reference(manifest, output, reference_dir=None, review_file=None, resume=False, approval_audits=None):
    spec, root, prepared = prepare_experiment(manifest)
    item = prepared[0]
    plan = build_experiment_plan(spec, root, prepared)
    v4_protocol_path = Path(manifest).resolve().parent / 'paper_protocol_v4.yaml'
    if not v4_protocol_path.is_file():
        v4_protocol_path = Path(__file__).resolve().parents[3] / 'config' / 'paper_protocol_v4.yaml'
    v4_protocol_sha256 = hashlib.sha256(v4_protocol_path.read_bytes()).hexdigest() if v4_protocol_path.is_file() else None
    v4_policy_active = bool(v4_protocol_sha256 and plan.get('protocol_sha256') == v4_protocol_sha256)
    inherited_approvals = _load_policy_approvals(approval_audits, v4_protocol_sha256) if approval_audits else {}
    reference_policy = ({'path':str(v4_protocol_path.resolve()), 'sha256':v4_protocol_sha256}
                        if approval_audits and v4_protocol_sha256 else None)
    # One oracle per unique ID is sufficient only with byte-identical SQL inputs.
    hashes = {}
    for model in plan['models']:
        for inputs in model['input_sha256'].values():
            for sid, fingerprint in inputs.items():
                if sid in hashes and hashes[sid] != fingerprint['sql']:
                    raise ValueError(f'Reference SQL differs between model/tier inputs for {sid}')
                hashes[sid] = fingerprint['sql']
    if not item.config.database:
        raise ValueError("Reference audit requires a configured PostgreSQL database")
    tier = item.tiers[0]
    paths = item.config.tiers[tier]
    records = {r.schema_id: r for r in discover_tier_dataset(paths.diagrams_dir, paths.sql_dir, tier).records}
    selected = sorted(item.selected_ids[tier])
    if set(selected) != set(hashes):
        raise ValueError('Reference audit requires identical schema IDs in all selected tiers')
    reviews = read_json(review_file) if review_file else {}
    candidate_manifest = Path(reference_dir) / 'normalization_manifest.json' if reference_dir else None
    candidates = {}
    candidate_manifest_sha256 = None
    if candidate_manifest and candidate_manifest.exists():
        candidate_manifest_sha256 = hashlib.sha256(candidate_manifest.read_bytes()).hexdigest()
        candidate_payload = read_json(candidate_manifest)
        candidates = {r['schema_id']: r for r in candidate_payload['rows']}
        if len(candidates) != len(candidate_payload['rows']) or not set(selected).issubset(candidates):
            raise ValueError('Candidate manifest must contain every selected schema ID, without duplicates')
        candidates = {sid:candidates[sid] for sid in selected}
    previous = read_json(output) if resume and Path(output).exists() else {}
    cached = {r['schema_id']: r for r in previous.get('rows', [])} if previous.get('plan_sha256') == plan['plan_sha256'] and previous.get('audit_version') == 2 else {}
    conn = build_connection(item.config.database)
    database_runtime = {'engine':'PostgreSQL', 'server_version':conn.get_parameter_status('server_version'),
                        'client_encoding':conn.encoding, 'statement_timeout_ms':item.config.database.statement_timeout_ms}
    # Do not reuse evidence from a different timeout/server/encoding policy.
    if (previous.get('database_runtime') != database_runtime
            or previous.get('reference_execution_policy') != REFERENCE_EXECUTION_POLICY):
        cached = {}
    rows = []
    try:
        for index, sid in enumerate(selected, 1):
            row = {'schema_id': sid, 'source_sha256': hashes[sid], 'passed': False}
            try:
                original = Path(records[sid].sql_path).read_text(encoding="utf-8", errors="strict")
                reference = (Path(reference_dir) / f"{sid}.sql" if reference_dir else Path(records[sid].sql_path)).resolve()
                raw = reference.read_bytes()
                row.update(reference_path=str(reference), reference_sha256=hashlib.sha256(raw).hexdigest(), review=reviews.get(sid),
                           candidate_manifest_sha256=candidate_manifest_sha256)
                candidate = candidates.get(sid)
                if candidate:
                    if any(candidate.get(k) != row[k] for k in ('source_sha256', 'reference_sha256')):
                        raise ValueError('Candidate manifest source/reference hashes do not match the audited bytes')
                    row['normalization'] = {'policy':candidate_payload['policy'], 'changes':candidate['changes'],
                                            'blockers':candidate['blockers']}
                old = cached.get(sid, {})
                if old and not old.get('audit_error') and 'technical_passed' in old and all(old.get(k) == row.get(k) for k in ('source_sha256', 'reference_sha256', 'reference_path', 'review', 'candidate_manifest_sha256')):
                    row = old
                else:
                    # When a reviewed/candidate reference is supplied, it is
                    # the resolved PostgreSQL rendering of the source's final
                    # state; use it to derive the shared planned suite.
                    gold_sql = raw.decode('utf-8-sig') if reference_dir else original
                    parsed = parse_ground_truth_sql(gold_sql, schema_id=sid)
                    suite = generate_constraint_tests(parsed.ir, schema_id=sid, constraint_source="ground_truth_sql")
                    result, diagnostic = _verify_reference_with_diagnostic(
                        conn, raw.decode('utf-8-sig'), suite, sid, item.config.database)
                    row['timeout_recheck'] = diagnostic
                    warnings = parsed.warnings + suite.generation_warnings
                    if result['ddl_execution']['success']:
                        # PostgreSQL itself resolves these valid constructs;
                        # retain them as audit provenance but do not let a
                        # static-parser blind spot veto the reference gate.
                        execution_resolved = [w for w in warnings if w.startswith(
                            'Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).')]
                        warnings = [w for w in warnings if w not in execution_resolved]
                        row['execution_resolved_warnings'] = execution_resolved
                    if _has_query_cancellation(result):
                        warnings.append('Reference timeout/query cancellation: diagnostic recheck cannot clear the original failure; resolve execution stability before freezing.')
                    if candidate:
                        warnings += ['Normalization blocker: ' + b for b in candidate['blockers']]
                    execution_passed = bool(suite.tests) and result['ddl_execution']['success'] and result['tests_passed'] == len(suite.tests)
                    technical_passed = execution_passed and not warnings
                    review_required = False
                    policy_approval = None
                    if row['reference_sha256'] != row['source_sha256']:
                        review = row.get('review') or {}
                        individual_review_valid = bool(
                            review.get('reviewer') and review.get('notes')
                            and review.get('source_sha256') == row['source_sha256']
                            and review.get('reference_sha256') == row['reference_sha256'])
                        candidate_policy_eligible = bool(candidate and candidate.get('policy_eligible')
                                                         and candidate.get('policy_approval_categories'))
                        prior = inherited_approvals.get(sid)
                        inherited_policy_eligible = bool(
                            prior and candidate_policy_eligible
                            and prior.get('source_sha256') == row['source_sha256']
                            and prior.get('reference_sha256') == row['reference_sha256']
                            and sorted(prior.get('categories') or []) == sorted(candidate.get('policy_approval_categories') or []))
                        if (candidate_policy_eligible and technical_passed
                                and (v4_policy_active or inherited_policy_eligible)):
                            policy_approval = {
                                'status':'policy-approved',
                                'categories':candidate['policy_approval_categories'],
                                'record':(f'protocol v4 decision log ({v4_protocol_sha256})'
                                          if v4_policy_active else
                                          f"inherited protocol v4 approval ({v4_protocol_sha256}); prior audit sha256 {prior['audit_sha256']}"),
                                'source_sha256':row['source_sha256'],
                                'reference_sha256':row['reference_sha256'],
                            }
                        elif not individual_review_valid:
                            review_required = True
                            warnings.append('Changed reference lacks a passing policy-category approval or a matching named semantic review.')
                    row.update(planned_tests=len(suite.tests), warnings=warnings,
                               execution_checks_passed=execution_passed, technical_passed=technical_passed,
                               review_required=review_required,
                               policy_approval=policy_approval,
                               passed=bool(suite.tests) and not warnings and result['ddl_execution']['success'] and result['tests_passed'] == len(suite.tests),
                               failure_categories=dict(Counter(t.get('failure_category') for t in result['test_results'] if not t['passed'])),
                               verification=result)
            except Exception as exc:
                conn.rollback()
                row.update(audit_error=f'{type(exc).__name__}: {exc}', passed=False)
            rows.append(row)
            if index % 10 == 0:
                _publish_audit(output, plan['plan_sha256'], rows, len(selected), False, database_runtime, plan, reference_policy)
                print(f'Local reference audit: {index}/{len(selected)}; passing {sum(r["passed"] for r in rows)}', flush=True)
    finally:
        conn.close()
    return _publish_audit(output, plan['plan_sha256'], rows, len(selected), True, database_runtime, plan, reference_policy)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest')
    parser.add_argument('--results', help='Reverify existing model SQL into a separate audit file')
    parser.add_argument('--config', default='config/config.yaml')
    parser.add_argument('--output', required=True)
    parser.add_argument('--reference-dir')
    parser.add_argument('--review-file', help='JSON semantic-review records for converted references')
    parser.add_argument('--approval-audit', action='append', help='Prior complete audit containing hash-matched policy approvals; repeatable')
    parser.add_argument('--resume', action='store_true', help='Reuse unchanged local audit records for the exact same plan')
    parser.add_argument('--quiet', action='store_true', help='Suppress repetitive SQL errors; full errors remain in the audit')
    args = parser.parse_args()
    if args.quiet:
        logging.disable(logging.CRITICAL)
    if args.results:
        config = load_config(args.config)
        conn = build_connection(config.database)
        rows = []
        try:
            for path in sorted(Path(args.results).glob('*/schema_*.json')):
                artifact = read_json(path)
                generation = artifact.get('module3_generation') or artifact.get('module6_direct_baseline') or {}
                if not generation.get('sql_ddl'):
                    continue
                sid, tier = artifact['schema_id'], artifact['tier']
                parsed = parse_ground_truth_sql(artifact['ground_truth_sql'], schema_id=sid)
                suite = generate_constraint_tests(parsed.ir, schema_id=sid, constraint_source='ground_truth_sql')
                new = verify_schema(conn, generation['sql_ddl'], suite, tier, sid,
                                    config.database.schema_prefix, config.database.statement_timeout_ms,
                                    'ground_truth_sql').as_dict()
                rows.append({'schema_id':sid, 'tier':tier, 'original_tests_passed':(artifact.get('module5_verification') or {}).get('tests_passed'),
                             'verification':new, 'source_artifact':str(path),
                             'failure_categories':dict(Counter(t.get('failure_category') for t in new['test_results'] if not t['passed']))})
        finally:
            conn.close()
        write_json(args.output, {'model_calls':0, 'original_artifacts_modified':False, 'rows':rows})
        print(f'Reverified {len(rows)} saved artifacts; model calls: 0; originals preserved')
        return 0
    if not args.manifest:
        parser.error('--manifest or --results is required')
    result = audit_reference(args.manifest, args.output, args.reference_dir, args.review_file, args.resume,
                             args.approval_audit)
    print(f"Reference schemas: {len(result['rows'])}; gate passed: {result['all_passed']}; LLM calls: 0")
    return 0 if result['all_passed'] else 2


if __name__ == '__main__':
    raise SystemExit(main())
