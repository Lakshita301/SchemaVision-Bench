# Reproducing ER2SQL results offline

This package snapshots an experiment; it does not certify its scientific conclusions.
Preparation archives contain inputs and implementation but may contain **no model results**.
Their `replay_index.json` lists every missing selected artifact. No credentials are included
intentionally; raw responses, local paths, and data licenses still require review before release.

## Freeze and verify (no model calls)

```powershell
python -m er2sql.module7_evaluation.reproducibility --manifest config/experiment.paper-pilot-v2.yaml --output outputs/reproducibility/pilot-NEW-VERSION.zip --include-inputs --include-results
python -m er2sql.module7_evaluation.reproducibility --verify outputs/reproducibility/pilot-NEW-VERSION.zip
```

Use new filenames. Existing ZIPs are never overwritten. The inventory includes source,
prompts, tests, selected SQL/images, redacted model configurations, split, environment
versions, actual manifest-referenced evidence, and available result JSON/JSONL/CSV/Markdown.
Results include failed outcomes and attempt history, not only successful generations.
Checks validate inventory hashes **and** source/prompt/split/input agreement with the plan.
Missing or stale evidence is recorded, not silently relabeled as passing.

## Restore on another machine

1. Verify the ZIP and compare its SHA-256 with the separately recorded checksum.
   Checksums detect changes; they are not a signature establishing publisher identity.
2. Extract into a new directory. Use a compatible Python version from `environment.json`.
3. Create a virtual environment. Install the versions from `requirements.snapshot.txt`
   where compatible; this is the original environment inventory, **not** a portable
   platform-independent lock. `pyproject.toml` lists the project dependencies.
4. Point `PYTHONPATH` at the extracted `src` so historical metrics use historical code.

Example, after extraction (paths are placeholders):

```powershell
$env:PYTHONPATH = 'C:\reproduction\snapshot\src'
python -m er2sql.module7_evaluation.replay --snapshot C:\reproduction\snapshot --output C:\reproduction\replayed-reports
```

Replay requires a complete saved schema/tier/arm matrix. It refuses preparation-only
archives, tampered files, code mismatch, unexpected/duplicate/missing schema outcomes,
and existing output directories. It neither loads API credentials nor calls providers
or PostgreSQL. Reports are reconstructed from stored outputs/verification outcomes.
The receipt records the inventory fingerprint. Timestamps and filesystem locations
may differ; scientific metric values should agree with replay using the same version.

## Database reruns and limits

Re-executing saved SQL is a separate local PostgreSQL validation, not offline aggregation.
Use a disposable least-privilege test database; generated SQL is untrusted. Transaction
rollback is test isolation, **not a security sandbox**. Never use a production database
or privileged account for model-generated DDL. Match the PostgreSQL version recorded
in evaluator evidence. Configure local database credentials separately, not in archives.

Tier 2/3 omissions are intentional. Reproduction preserves the exact selected dataset
bytes without restoring hidden information, rebuilding Module 1, or changing eligibility.
Freeze a new archive after final edits and another after each completed experiment.
