"""Freeze disjoint splits from common tiers, excluding all previously observed IDs."""
import argparse
import hashlib
import json
from pathlib import Path
import yaml
from ..config import load_config
from ..pipeline.runner import compute_common_ids_across_tiers
from ..utils.io_utils import write_json, write_text


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', default='config/models/mistral-small-4.yaml')
    parser.add_argument('--output', default='config/paper_splits_v3.json')
    args = parser.parse_args()
    if Path(args.output).exists():
        raise ValueError('Split already frozen; use a new versioned output path')
    common = compute_common_ids_across_tiers(load_config(args.config))
    exposed = {p.stem for p in Path('outputs').rglob('schema_*.json')} & common
    registry = json.loads(Path('config/development_schemas.json').read_text(encoding='utf-8'))
    exposed |= set(registry.get('development_schemas', [])) & common
    # Previously proposed pilot IDs are development data once inspected/discussed.
    prior = yaml.safe_load(Path('config/experiment.paid-pilot.yaml').read_text(encoding='utf-8'))
    exposed |= set(prior['experiment'].get('schema_ids', [])) & common
    registry['development_schemas'] = sorted(exposed)
    registry['description'] = 'Cumulative development exposure registry, including prior development IDs and every schema observed in saved run artifacts.'
    write_json('config/development_schemas.json', registry)
    remaining = sorted(common - exposed, key=lambda sid: hashlib.sha256(('paper-v3:'+sid).encode()).hexdigest())
    if len(remaining) < 21:
        raise ValueError('Insufficient unseen common schemas')
    write_json(args.output, {'version': 3, 'selection': 'sha256 paper-v3:ID; cumulative development IDs and observed IDs excluded',
                            'development': sorted(exposed), 'pilot': remaining[:20], 'final': remaining[20:]})
    protocol_path = Path('config/paper_protocol_v3.yaml')
    protocol_sha256 = hashlib.sha256(protocol_path.read_bytes()).hexdigest()
    for phase in ('pilot', 'final'):
        manifest = {'version': 1, 'experiment': {'name': f'paper-{phase}-v3',
            'output_root': f'outputs/experiments/paper-{phase}-v3', 'phase': phase,
            'split_file': args.output, 'oracle_audit': f'docs/audits/{phase}_v3_oracle.json',
            'evaluator_validation': 'docs/audits/evaluator_mutations_v3.json',
            'protocol_file': str(protocol_path), 'protocol_sha256': protocol_sha256,
            'tiers': ['tier1','tier2','tier3'], 'common_only': True, 'resume': True,
            'verify': True, 'evaluate': True, 'stop_on_error': True,
            'require_complete_model_metadata': True, 'prompts_frozen': True},
            'models': [{'name': 'mistral-small-4-v26.03', 'config': args.config,
                        'arms': ['structured','direct'], 'prompt_version': 'paper-v3',
                        'expected_cost_usd': 2.0 if phase == 'pilot' else None,
                        'minimum_success_rate': .9, 'max_rate_limit_events': 5}]}
        if phase == 'final':
            manifest['experiment']['pilot_validation'] = 'outputs/experiments/paper-pilot-v3/reports/pilot_validation.json'
        write_text(f'config/experiment.paper-{phase}-v3.yaml', yaml.safe_dump(manifest, sort_keys=False))
    print(f'Frozen {len(exposed)} development, 20 pilot, {len(remaining)-20} final IDs; two arms, no model calls.')


if __name__ == '__main__':
    main()
