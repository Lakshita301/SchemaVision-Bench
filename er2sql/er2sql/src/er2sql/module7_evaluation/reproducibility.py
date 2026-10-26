"""Explicit-allowlist, local reproducibility bundle and offline integrity check.

No credentials or .env files; no provider calls. This is an internal bundle,
not automatic authorization to publish dataset images or provider responses.
"""
import argparse
import hashlib
import importlib.metadata
import json
import platform
import sys
import zipfile
from pathlib import Path, PurePosixPath, PureWindowsPath

from .orchestrator import prepare_experiment, build_experiment_plan, _redact_secrets
from ..dataset import discover_tier_dataset


def _json(value):
    return json.dumps(value, sort_keys=True, indent=2, ensure_ascii=False).encode('utf-8')


def safe_entry(name):
    if (not isinstance(name, str) or not name or '\\' in name or ':' in name
            or PurePosixPath(name).is_absolute() or PureWindowsPath(name).drive
            or any(p in {'', '.', '..'} for p in name.split('/'))):
        raise ValueError('Unsafe bundle entry')
    return name


def _validate_provenance(read, inventory):
    """Ensure archived source/input bytes agree with the frozen plan, not just ZIP checksums."""
    if inventory.get('format_version', 1) < 2:
        return
    plan = json.loads(read('resolved_plan.json'))
    fingerprint = plan.pop('plan_sha256')
    actual = hashlib.sha256(json.dumps(plan, sort_keys=True, separators=(',', ':'), ensure_ascii=False).encode()).hexdigest()
    if actual != fingerprint or fingerprint != inventory['plan_sha256']:
        raise ValueError('Resolved plan fingerprint mismatch')
    for path, sha in plan['source_sha256'].items():
        name = 'src/er2sql/' + path.replace('\\', '/')
        if inventory['files'].get(name) != sha:
            raise ValueError(f'Source differs from frozen plan: {name}')
    for role, sha in plan['prompt_sha256'].items():
        package = {'module2':'module2_parsing', 'module3':'module3_generation', 'module6':'module6_direct_baseline'}[role]
        if inventory['files'].get(f'src/er2sql/{package}/prompts.py') != sha:
            raise ValueError('Prompt differs from frozen plan')
    if plan.get('split_sha256') and inventory['files'].get('selection/splits.json') != plan['split_sha256']:
        raise ValueError('Split differs from frozen plan')
    if plan.get('protocol_sha256') and inventory['files'].get('protocol/paper_protocol.yaml') != plan['protocol_sha256']:
        raise ValueError('Protocol differs from frozen plan')
    if inventory['includes_input_bytes']:
        for model in plan['models']:
            for tier, ids in model['selected_schema_ids'].items():
                if set(ids) != set(model['input_sha256'][tier]):
                    raise ValueError('Frozen selection has missing input hashes')
                for sid in ids:
                    stem = f"inputs/{model['name']}/{tier}/{sid}"
                    expected = model['input_sha256'][tier][sid]
                    images = [p for p in inventory['files'] if p.rsplit('.', 1)[0] == stem and not p.endswith('.sql')]
                    if len(images) != 1 or inventory['files'][images[0]] != expected['image'] or inventory['files'].get(stem+'.sql') != expected['sql']:
                        raise ValueError(f'Input differs from frozen plan: {stem}')


def verify_bundle(path):
    with zipfile.ZipFile(path) as bundle:
        names = bundle.namelist()
        if len(names) != len(set(names)):
            raise ValueError('Duplicate bundle entries')
        inventory = json.loads(bundle.read('bundle_manifest.json'))
        expected = inventory['files']
        if set(names) != set(expected) | {'bundle_manifest.json'}:
            raise ValueError('Bundle inventory differs from archive')
        for name, sha in expected.items():
            safe_entry(name)
            if hashlib.sha256(bundle.read(name)).hexdigest() != sha:
                raise ValueError(f'Bundle checksum failed: {name}')
        _validate_provenance(bundle.read, inventory)
    return inventory


def freeze_bundle(manifest_path, destination, include_inputs=False, include_results=False, reference_candidates=None):
    destination = Path(destination)
    if destination.exists():
        raise ValueError('Refusing to overwrite a frozen bundle')
    spec, root, prepared = prepare_experiment(manifest_path, load_environment=False)
    plan = build_experiment_plan(spec, root, prepared)
    package = Path(__file__).resolve().parents[1]
    project = package.parents[1]
    entries = {}
    def add(name, data):
        safe_entry(name)
        if name in entries and entries[name] != data:
            raise ValueError(f'Conflicting bundle entry: {name}')
        entries[name] = data
    add('resolved_plan.json', _json(plan))
    import yaml
    add('experiment.json', _json(_redact_secrets(yaml.safe_load(Path(manifest_path).read_text(encoding='utf-8')))))
    for path in package.rglob('*.py'):
        add('src/er2sql/' + path.relative_to(package).as_posix(), path.read_bytes())
    for path in (project / 'tests').rglob('*.py'):
        add('tests/' + path.relative_to(project/'tests').as_posix(), path.read_bytes())
    for name in ('pyproject.toml', 'requirements.txt'):
        path = project / name
        if path.is_file():
            add(name, path.read_bytes())
    versions = {d.metadata['Name']:d.version for d in importlib.metadata.distributions() if d.metadata['Name']}
    add('environment.json', _json({'python':sys.version, 'platform':platform.platform(),
                                  'packages':dict(sorted(versions.items())),
                                  'note':'Version inventory, not a cross-platform dependency lock. No environment variables collected.'}))
    add('requirements.snapshot.txt', ('\n'.join(f'{name}=={version}' for name,version in sorted(versions.items()))+'\n').encode())
    if spec.split_file:
        add('selection/splits.json', Path(spec.split_file).read_bytes())
    if spec.protocol_file:
        add('protocol/paper_protocol.yaml', Path(spec.protocol_file).read_bytes())
    if reference_candidates:
        candidates = Path(reference_candidates).resolve()
        if not candidates.is_dir():
            raise ValueError('Reference candidate directory does not exist')
        for path in candidates.rglob('*'):
            if path.is_file() and not path.is_symlink() and path.suffix in {'.sql','.json','.md'}:
                add('reference_candidates/'+path.relative_to(candidates).as_posix(), path.read_bytes())
    for item in prepared:
        add(f'configs/{item.spec.name}.json', _json(_redact_secrets(item.config.raw_yaml)))
        if include_inputs:
            for tier, ids in item.selected_ids.items():
                paths = item.config.tiers[tier]
                for record in discover_tier_dataset(paths.diagrams_dir, paths.sql_dir, tier).records:
                    if record.schema_id in ids:
                        image, sql = Path(record.image_path), Path(record.sql_path)
                        add(f'inputs/{item.spec.name}/{tier}/{record.schema_id}{image.suffix.lower()}', image.read_bytes())
                        add(f'inputs/{item.spec.name}/{tier}/{record.schema_id}.sql', sql.read_bytes())
    evidence_status = {}
    for label, value in (('oracle', spec.oracle_audit), ('pilot', spec.pilot_validation),
                         ('evaluator', spec.evaluator_validation)):
        path = Path(value) if value else None
        evidence_status[label] = {'present':bool(path and path.is_file()), 'source_current':False}
        if path and path.is_file():
            data = path.read_bytes()
            add('evidence/' + label + '/' + path.name, data)
            evidence = json.loads(data)
            evidence_status[label]['source_current'] = (evidence.get('source_sha256') == plan['source_sha256']
                                                       or evidence.get('plan_sha256') == plan['plan_sha256'])
            evidence_status[label]['reported_pass'] = bool(evidence.get('all_passed', evidence.get('all_automated_gates_passed', False)))
            if path.with_suffix('.md').is_file():
                add('evidence/' + label + '/' + path.with_suffix('.md').name, path.with_suffix('.md').read_bytes())
    for name in ('PAID_RUN_READINESS.md', 'REFERENCE_REVIEW_POLICY.md', 'IMPLEMENTATION_1_2_4.md',
                 'PAPER_METRICS_STATUS.md', 'EVALUATOR_VALIDATION.md', 'REPRODUCIBILITY.md', 'PAPER_EXPERIMENT_PROTOCOL.md'):
        path = project/'docs'/name
        if path.is_file():
            add('docs/'+name, path.read_bytes())
    if include_results and root.is_dir():
        # Preserve checkpoints/history/attempt ledgers, not only final successes.
        for subdir in ('results', 'reports', 'provenance'):
            for path in (root/subdir).rglob('*'):
                if path.is_file() and not path.is_symlink() and path.suffix.lower() in {'.json','.jsonl','.md','.sql','.py','.csv'}:
                    add('run/'+path.relative_to(root).as_posix(), path.read_bytes())
        for name in ('resolved_manifest.json','run_status.json'):
            if (root/name).is_file():
                add('run/'+name, (root/name).read_bytes())
    replay = []
    for model in plan['models']:
        for arm in model['arms']:
            relative = Path(arm['results_dir']).relative_to(root).as_posix()
            base = 'run/' + relative
            missing = [f'{tier}/{sid}.json' for tier, ids in model['selected_schema_ids'].items()
                       for sid in ids if f'{base}/{tier}/{sid}.json' not in entries]
            replay.append({'model':model['name'], 'arm':arm['arm'], 'results_dir':base,
                           'selected_schema_ids':model['selected_schema_ids'], 'missing_artifacts':missing})
    add('replay_index.json', _json(replay))
    add('REPRODUCE.md', (project/'docs'/'REPRODUCIBILITY.md').read_bytes())
    inventory = {'format_version':2, 'model_calls':0, 'plan_sha256':plan['plan_sha256'],
                 'evidence_status':evidence_status,
                 'all_selected_artifacts_present':bool(replay) and all(not r['missing_artifacts'] for r in replay),
                 'snapshot_kind':'preparation_or_results_not_publication_certification',
                 'includes_reference_candidates':bool(reference_candidates),
                 'includes_input_bytes':include_inputs, 'includes_run_artifacts':include_results,
                 'publication_review_required':True,
                 'files':{name:hashlib.sha256(data).hexdigest() for name,data in sorted(entries.items())}}
    _validate_provenance(entries.__getitem__, inventory)
    destination.parent.mkdir(parents=True, exist_ok=True)
    # x prevents a race from overwriting another freeze.
    with zipfile.ZipFile(destination, 'x', compression=zipfile.ZIP_DEFLATED) as bundle:
        for name, data in sorted({**entries, 'bundle_manifest.json':_json(inventory)}.items()):
            entry = zipfile.ZipInfo(name, (1980,1,1,0,0,0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            bundle.writestr(entry, data)
    verify_bundle(destination)
    return inventory


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest')
    parser.add_argument('--output')
    parser.add_argument('--include-inputs', action='store_true')
    parser.add_argument('--include-results', action='store_true')
    parser.add_argument('--reference-candidates', help='Include a local reviewed/unreviewed reference snapshot without approving it')
    parser.add_argument('--verify', help='Verify an existing ZIP without extraction or execution')
    args = parser.parse_args()
    if args.verify:
        result = verify_bundle(args.verify)
    else:
        if not args.manifest or not args.output:
            parser.error('--manifest and --output are required to freeze')
        result = freeze_bundle(args.manifest, args.output, args.include_inputs, args.include_results, args.reference_candidates)
    print(f"Verified {len(result['files'])} files; LLM calls: 0")


if __name__ == '__main__':
    main()
