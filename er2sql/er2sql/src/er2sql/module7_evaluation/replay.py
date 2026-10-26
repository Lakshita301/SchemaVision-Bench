"""Recalculate reports from a verified extracted snapshot: no LLM or database."""
import argparse
import hashlib
import json
from pathlib import Path

from .reproducibility import safe_entry, _validate_provenance
from .evaluator import evaluate_results_dir, write_evaluation_artifacts, compare_reports, write_model_comparison_artifacts
from ..utils.io_utils import write_json


def verify_directory(snapshot):
    snapshot = Path(snapshot).resolve()
    inventory = json.loads((snapshot/'bundle_manifest.json').read_text(encoding='utf-8'))
    for name, sha in inventory['files'].items():
        path = snapshot / safe_entry(name)
        if not path.resolve().is_relative_to(snapshot) or path.is_symlink():
            raise ValueError('Snapshot entry escapes extraction directory')
        if hashlib.sha256(path.read_bytes()).hexdigest() != sha:
            raise ValueError(f'Snapshot checksum failed: {name}')
    _validate_provenance(lambda n: (snapshot/n).read_bytes(), inventory)
    # Do not silently replay using a newer installed evaluator.
    package = Path(__file__).resolve().parents[1]
    current = {'src/er2sql/'+p.relative_to(package).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()
               for p in package.rglob('*.py')}
    frozen = {n:sha for n,sha in inventory['files'].items() if n.startswith('src/er2sql/') and n.endswith('.py')}
    if current != frozen:
        raise ValueError('Running code differs from snapshot; use the archived src via PYTHONPATH')
    return inventory


def replay_snapshot(snapshot, output):
    snapshot, output = Path(snapshot).resolve(), Path(output).resolve()
    verify_directory(snapshot)
    if output.exists() or output.is_relative_to(snapshot):
        raise ValueError('Replay output must be a new directory outside the snapshot')
    index = json.loads((snapshot/'replay_index.json').read_text(encoding='utf-8'))
    if not index or any(row['missing_artifacts'] for row in index):
        raise ValueError('Snapshot is incomplete/preparation-only; no complete result matrix to replay')
    for row in index:
        safe_entry(row['model'])
        if row['arm'] not in {'structured', 'direct'}:
            raise ValueError('Invalid replay arm')
        results = snapshot/safe_entry(row['results_dir'])
        expected = {(tier, sid) for tier, ids in row['selected_schema_ids'].items() for sid in ids}
        from .evaluator import discover_result_files
        found = set()
        for path in discover_result_files(results):
            artifact = json.loads(path.read_text(encoding='utf-8'))
            key = (artifact['tier'], artifact['schema_id'])
            if key in found:
                raise ValueError('Duplicate schema/tier result in snapshot')
            found.add(key)
        if found != expected:
            raise ValueError('Saved results do not match frozen schema/tier selection')
    reports, products = {}, {}
    for row in index:
        model, arm = row['model'], row['arm']
        report = evaluate_results_dir(snapshot/row['results_dir'], arm=arm, model_name=model)
        reports[(model, arm)] = report
        products[f'{model}/{arm}'] = write_evaluation_artifacts(report, output/model/arm)
    for model in sorted({m for m, _ in reports}):
        if (model, 'structured') in reports and (model, 'direct') in reports:
            write_json(output/model/'arm_comparison.json', compare_reports(reports[(model, 'structured')], reports[(model, 'direct')]))
    for arm in ('structured', 'direct'):
        subset = {model: report for (model, a), report in reports.items() if a == arm}
        if subset:
            write_model_comparison_artifacts(subset, output/'comparison'/arm)
    write_json(output/'replay_receipt.json', {'model_calls':0, 'database_calls':0,
               'bundle_manifest_sha256':hashlib.sha256((snapshot/'bundle_manifest.json').read_bytes()).hexdigest(),
               'reports':products, 'note':'Reaggregates saved verification; does not rerun SQL or prove semantic equivalence.'})
    return products


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--snapshot', required=True)
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    products = replay_snapshot(args.snapshot, args.output)
    print(f'Replayed {len(products)} model/arm reports; LLM calls: 0; DB calls: 0')


if __name__ == '__main__':
    main()
