"""Pin pre-specified experimental rules without invoking providers."""
import hashlib
from pathlib import Path
import yaml

from .statistics import SEED, REPLICATES


def validate_protocol(path, expected_sha256):
    if not path or not expected_sha256:
        raise ValueError('Paper experiments require protocol_file and protocol_sha256')
    raw = Path(path).read_bytes()
    actual = hashlib.sha256(raw).hexdigest()
    if actual != expected_sha256:
        raise ValueError('Frozen protocol changed: version and re-pin an explicit amendment')
    rules = yaml.safe_load(raw)
    if not isinstance(rules, dict) or rules.get('protocol_version') not in {1, 2, 3, 4, 5, 6}:
        raise ValueError('Unsupported paper protocol version')
    stats = rules.get('statistics') or {}
    if stats.get('bootstrap_seed') != SEED or stats.get('bootstrap_replicates') != REPLICATES:
        raise ValueError('Protocol bootstrap settings differ from evaluator implementation')
    endpoint = rules.get('primary', {}).get('endpoint')
    selection = rules.get('selection') or {}
    allowed_endpoint = {
        1: 'macro_cer_all',
        2: 'macro_cer_all_on_behaviorally_eligible_subset',
        3: 'planned_constraint_pass_rate',
        4: 'planned_constraint_pass_rate',
        5: 'planned_constraint_pass_rate',
        6: None,
    }[rules['protocol_version']]
    exclusions_valid = (selection.get('automatic_exclusions') is False if rules.get('protocol_version') < 3
                        else selection.get('truncation_policy', '').startswith('exclude_paired_schema_tier_cell_from_both_arms'))
    v6_valid = True
    if rules.get('protocol_version') == 6:
        primary = rules.get('primary') or {}
        infra = rules.get('infrastructure') or {}
        sql_handling = rules.get('sql_handling') or {}
        ablation = sql_handling.get('normalized_ablation') or {}
        inclusion = rules.get('model_inclusion') or {}
        salvage = rules.get('salvage_diagnostic') or {}
        import sqlparse
        v6_valid = (
            primary.get('endpoints') == ['strict_planned_constraint_enforcement_rate', 'paired_compile_success']
            and
            primary.get('strict_planned_cer', {}).get('denominator') == 'frozen_gold_suite_for_each_schema_tier_cell'
            and primary.get('compile_success', {}).get('uncertainty') == 'schema_clustered_paired_bootstrap_with_all_tiers_resampled_per_schema'
            and infra.get('retry_count') == 1
            and infra.get('sqlstate_exact') == [57014, '57P01']
            and infra.get('sqlstate_classes') == ['08', '53']
            and sql_handling.get('statement_timeout_ms') == 5000
            and ablation.get('normalizer') == 'sqlparse.format'
            and ablation.get('version') == sqlparse.__version__
            and ablation.get('scope', '').startswith('secondary_rollback_only_execution')
            and sql_handling.get('output_extraction') == 'strip_code_fences_only'
            and inclusion.get('readiness_pilot_compile_rate_threshold') == 0.20
            and salvage.get('enabled') is True
        )
    if rules.get('repair') is not False or (rules.get('protocol_version') < 6 and endpoint != allowed_endpoint) or not exclusions_valid or not v6_valid:
        raise ValueError('Protocol scope differs from the implemented no-repair evaluation policy')
    return rules
