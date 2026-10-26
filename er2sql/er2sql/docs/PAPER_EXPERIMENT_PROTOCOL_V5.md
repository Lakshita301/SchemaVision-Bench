# ER2SQL paper protocol v5 contamination safeguard

Prospective amendment dated 8 October 2026, before paid final-model outputs.
Protocol v4 and its audit records remain immutable historical evidence. This
amendment adds a pre-run contamination-risk and split-leakage gate; it does not
change the architecture, arms, or gold references. A follow-up family
consolidation preserves all 714 schema IDs while moving likely related schemas
into the same split. The original split remains unchanged at
`config/paper_splits.json`; the new source-population split is
`config/paper_splits_v5.json` (78 development, 24 pilot, 612 final). The v4
reference-eligible IDs are re-partitioned separately in
`config/paper_splits_v5_eligible.json` (76 development, 11 pilot, 264 final).
Paid manifests use the eligible split for scoring and separately pin the full
714-ID contamination split and its completed audit report.

## What the check can and cannot establish

The audit checks reviewed source provenance and schema names against a
pre-registered list of common public sample schemas. It also checks exact
original-SQL duplicates and declared source-family IDs across development,
pilot, and final splits. A flag means possible memorization risk, not proof that
a particular model saw the schema. Model pretraining corpora are not available
for a definitive membership test, so the paper must not claim zero
pretraining contamination.

## Frozen evaluation safeguard

The audit must cover every schema in `config/paper_splits_v5.json`, with reviewed provenance
metadata and a SHA-256 for each original SQL file. A source family or identical
source SQL spanning multiple splits blocks paid execution until the split issue
is resolved before any model outputs. Do not silently move or remove examples;
record any necessary prospective split amendment and preserve the previous
split and audit.

Popular-schema flags do not change eligibility or remove examples from the
primary analysis. Report the pre-registered full eligible cohort as primary and
also report a low-risk-only sensitivity analysis, using the same paired tiers
and both experimental arms. Do not tune prompts, model settings, or claims on
the final results or choose a risk threshold after seeing model scores.

## Reproducibility

The audit JSON records hashes of the full contamination split, provenance metadata, risk registry,
and original SQL inputs; it also records risk labels, source-family and exact
duplicate checks, and the low-risk sensitivity IDs. Paid manifests pin the
audit report hash and `contamination_split_file` independently from the
eligible run's `split_file`. This lets the audit cover all 714 schemas while
paid evaluation uses only schemas with approved references. The original SQL
and diagram files are not changed by the split amendment. The current audit
remains incomplete until provenance and risk metadata are reviewed.

Before any paid model outputs, the v5 risk registry was prospectively expanded
to include two TPC-C schema variants and three standard Quartz scheduler
schema variants identified by the source-popularity screen. The earlier
registry and v3 audit remain preserved; new paid manifests must use registry v2 and the
matching complete audit report. These flags do not prove model exposure or
remove cases from the primary population.
