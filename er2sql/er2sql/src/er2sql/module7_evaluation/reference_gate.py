"""Verify independent reference evidence before creating any provider client."""
import hashlib
from pathlib import Path


def validate_reference_evidence(audit, plan):
    same_reference_plan = (
        audit.get('reference_plan_sha256') == plan.get('reference_plan_sha256')
        if audit.get('reference_plan_sha256') and plan.get('reference_plan_sha256')
        else audit.get('plan_sha256') == plan['plan_sha256']
    )
    if not audit.get('all_passed') or not same_reference_plan:
        raise ValueError('Reference oracle audit failed or is stale; rerun the local readiness audit')
    if audit.get('audit_version') != 2 or not audit.get('complete'):
        raise ValueError('A complete version-2 reference audit is required')
    reference_policy = audit.get('reference_policy') or {}
    if reference_policy:
        policy_path = Path(reference_policy.get('path', ''))
        if (not policy_path.is_file()
                or hashlib.sha256(policy_path.read_bytes()).hexdigest() != reference_policy.get('sha256')):
            raise ValueError('Reference conversion policy file is missing or has changed')
    expected = {}
    for model in plan['models']:
        for tier, inputs in model['input_sha256'].items():
            for sid, hashes in inputs.items():
                if sid in expected and expected[sid] != hashes['sql']:
                    raise ValueError(f'Reference SQL differs across model/tier inputs for {sid}')
                expected[sid] = hashes['sql']
    rows = audit.get('rows', [])
    if len(rows) != len(expected) or {r['schema_id'] for r in rows} != set(expected):
        raise ValueError('Reference audit does not cover exactly the selected schema IDs')
    for row in rows:
        sid = row['schema_id']
        verification = row.get('verification') or {}
        if (row.get('timeout_recheck') is not None
                or verification.get('ddl_execution', {}).get('error_sqlstate') == '57014'
                or any(t.get('error_sqlstate') == '57014' for t in verification.get('test_results', []))):
            raise ValueError(f'Unresolved reference timeout/cancellation for {sid}; a diagnostic retry is not approval')
        if (not row.get('passed') or row.get('warnings') or row.get('planned_tests', 0) <= 0
                or not verification.get('ddl_execution', {}).get('success')
                or verification.get('tests_passed') != row.get('planned_tests')):
            raise ValueError(f'Reference audit has incomplete or failed tests for {sid}')
        if row.get('source_sha256') != expected[sid]:
            raise ValueError(f'Reference source hash changed for {sid}')
        reference = Path(row['reference_path'])
        if not reference.is_file() or hashlib.sha256(reference.read_bytes()).hexdigest() != row['reference_sha256']:
            raise ValueError(f'Audited reference file changed or is missing for {sid}')
        if row['reference_sha256'] != row['source_sha256']:
            review = row.get('review') or {}
            policy = row.get('policy_approval') or {}
            named_review_valid = bool(
                review.get('reviewer') and review.get('notes')
                and review.get('reference_sha256') == row['reference_sha256']
                and review.get('source_sha256') == row['source_sha256'])
            policy_approval_valid = bool(
                policy.get('status') == 'policy-approved'
                and policy.get('categories')
                and policy.get('source_sha256') == row['source_sha256']
                and policy.get('reference_sha256') == row['reference_sha256']
                and ((audit.get('protocol_sha256')
                      and audit['protocol_sha256'] in (policy.get('record') or ''))
                     or (reference_policy.get('sha256')
                         and reference_policy['sha256'] in (policy.get('record') or ''))))
            if not (named_review_valid or policy_approval_valid):
                raise ValueError(f'Changed reference requires hash-matched policy-category approval or named semantic review for {sid}')
