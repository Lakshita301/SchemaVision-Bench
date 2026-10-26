# Dataset contamination-risk audit

Before any paid pilot or final run, review the provenance of every schema in
the frozen split, check for exact source-SQL and source-family overlap across
splits, and create a hash-pinned audit report. This detects known leakage and
flags likely memorization risks; it cannot reveal a model's private
pretraining data or prove that exposure never occurred.

## Prepare and complete provenance

An initial metadata draft now exists at `data/dataset_provenance.json`. It has
the source URL and GitHub repository copied from each original SQL header;
`source_family` values are marked as repository candidates, not confirmed
schema-family assignments. Do not overwrite this draft with the template
command below. Use the command only to create a separate fresh template if
needed:

```powershell
python -m er2sql.module7_evaluation.contamination_audit --write-template data/dataset_provenance.template.new.json
```

For every schema, preserve `source_project` and `source_url` when available.
Use the literal `unknown` for unavailable `schema_name` or `source_family`
values; do not guess a relationship. Repository-based family IDs may be used
as conservative candidates when there is no stronger evidence. Set
`review_status` to `reviewed`, record the reviewer/date, and explain what was
checked and what remains unknown. `risk_level: unknown` is an acceptable
result: do not spend time assigning a speculative low/medium/high rating.
Unknown provenance is recorded as uncertainty, not treated as clean. A
registry match remains a risk flag, not proof of model exposure.

The repository's checked-in `data/tier1` through `data/tier3` directories are
placeholders. Pass the path to the actual original source SQL directory; for
the current local setup this is the configured `extracted_ddl_filtered`
directory. Do not point the audit at translated PostgreSQL candidates.

A separate read-only popularity screen of the source repositories is recorded
in `docs/audits/github_source_popularity_20261009.md`. It found no local
Sakila, Chinook, or Northwind match, but identified two TPC-C schemas and
three Quartz scheduler schemas for risk review. The screen is
incomplete for four inaccessible repositories and does not prove training-data
exposure. Record those cases as unknown rather than guessing. The audit still
requires reviewer/date fields and source-hash and cross-split checks; this
decision only removes the expectation that every source receive a confident
popularity rating.

```powershell
python -m er2sql.module7_evaluation.contamination_audit `
  --split config/paper_splits_v5.json `
  --metadata data/dataset_provenance.json `
  --registry config/contamination_risk_registry_v2.json `
  --sql-root C:/Users/anika/OneDrive/Desktop/dataset/extracted_ddl_filtered `
  --output docs/audits/dataset_contamination_v4.json
```

The current source-coverage pass hashes 714/714 SQL files and finds no exact
duplicates. Comparing table sets and shared table definitions narrowed six
same-repository overlaps to five likely related schema families across splits;
one pair appears to be separate Activiti modules with disjoint tables. The
five family assignments remain candidates for reviewer confirmation. The
current report remains incomplete until metadata review fields are completed
and the audit is regenerated. Unknown identities/families and risk levels are
allowed when accompanied by a brief rationale; do not invent missing
provenance. A repository match alone is not proof of leakage.

The audit split contains all 714 IDs. Paid manifests must use the separate
reference-eligible split (`config/paper_splits_v5_eligible.json`) for scoring
and set `contamination_split_file` to `config/paper_splits_v5.json` so the gate
checks every schema.

The command writes paired JSON and Markdown reports. It exits nonzero and marks
the paid-run gate blocked if any split schema is unreviewed, an original SQL
hash is missing, or an identical SQL definition/source family crosses split
boundaries. Resolve such leakage before scoring; never silently move or drop
schemas after seeing model results.

## How results must be reported

The versioned registry flags likely public tutorial/sample schemas such
as Sakila, Chinook, and Northwind, plus the TPC-C and Quartz risks found in the
2026-10-09 source review. A registry match is a risk flag, not proof of
training-data exposure. Keep these schemas in the frozen, reference-eligible
primary cohort, and report a second sensitivity analysis on only reviewed
low-risk schemas. Prompts and model settings must not be tuned using final-set
results. Report risk counts, evidence, audit hash, and the sensitivity subset
size; do not claim zero pretraining contamination.

Paid pilot/final manifests must pin Protocol v5, the frozen split, and the
completed audit JSON SHA-256. The experiment orchestrator verifies the audit
hash and split hash before any provider call and automatically writes the
low-risk sensitivity evaluation under each model/arm report directory.
