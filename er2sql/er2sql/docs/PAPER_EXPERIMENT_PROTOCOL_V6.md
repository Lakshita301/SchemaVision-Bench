# ER2SQL paper protocol v6

This is a prospective amendment for final model runs. The machine-readable
protocol is [`config/paper_protocol_v6.yaml`](../config/paper_protocol_v6.yaml);
the final Mistral manifest pins its SHA-256. Earlier protocol and results files
remain unchanged.

## Outcomes

The primary quality measure is strict planned-denominator constraint
enforcement rate (CER): passed behavioral checks divided by every check planned
from the fixed gold schema. A model output that fails to parse or load counts
as zero successes, not as a removed example. Compile success is also a primary
paired comparison between structured and direct generation, with a
schema-clustered paired bootstrap that keeps all tiers for a schema together.

Report compile rate and strict CER together. CER among cells where both arms
compile is secondary, since it conditions on successful outputs and can hide
compile failures. Also report a salvage diagnostic: for each output, run its
statements separately inside savepoints, roll everything back, and count the
fraction of gold tables that could be created. Salvage never changes primary
compile or CER scoring.

## SQL handling and infrastructure

Execute raw model SQL for the primary result. Output extraction removes code
fences only. A secondary normalized-text comparison uses the pinned
`sqlparse.format` options in the YAML for every arm and model. Execute this
formatted output in a separate rollback-only pass against the same gold tests;
it does not replace or rewrite the SQL used for primary scoring. Use one 5,000
ms statement timeout for every model and arm.

Retry the same verification once for PostgreSQL SQLSTATE `57014`, `57P01`, or
classes `08` and `53`. If a listed infrastructure error persists, flag it and
exclude that schema-tier cell symmetrically from both arms' denominators for
that model comparison. All other errors—including SQL syntax, type, constraint,
and non-SQL output failures—are model failures. Emit a per-schema error
taxonomy keyed by SQLSTATE, with `not_sql` for output that is not SQL.

## Model inclusion

A model enters the final comparison if it compiles at least 20% of its assigned
readiness-pilot cells in at least one arm, after symmetric infrastructure
exclusions. This is a model-level inclusion rule, not a reason to drop
individual difficult schemas. Below this threshold, quality measures can have
floor effects; report compile success alongside strict planned CER and do not
hide non-compiling outputs.

## Reference tracks and fixed exclusions

Every schema has one status in the frozen
[`reference status manifest`](../data/reference_status_manifest_v1.csv),
shared by all three tiers. The manifest covers all 714 schemas and is built
from original SQL plus the pre-existing PostgreSQL/reference audits; no model
output is used to assign status. Its reproducible classifier is
[`build_reference_status_manifest.py`](../scripts/build_reference_status_manifest.py)
and its parser version is pinned in the YAML protocol.

Only `executable_verified` schemas (the frozen eligible pilot/final set) enter
headline compile-rate and CER results. `structural_only` schemas have parseable
source SQL but no PostgreSQL executable-reference approval. They may appear
only in a separate structural table: compare table, column, PK, and FK
precision/recall/F1 for Module 2 IR and final SQL, parsing source in its
detected dialect and generated SQL as PostgreSQL, without database loading.
A generated-SQL parse failure earns no structural credit. Do not combine these
metrics with execution-based CER or compile rate. This structural run is
optional after the primary run and only if the remaining budget permits.

`defective` schemas have a source/evidence blocker such as unparseable or
procedural content, unresolved ALTERs, duplicate definitions, missing types or
sequences, missing FK targets, or FK targets without a unique key. They remain
in the released dataset with their reason code but are excluded from every
evaluation track. The 49 `structural_only` schemas in the frozen development
split may be used for Module 2 prompt development; do not use any final-split
schema for prompt tuning.

Status is decided without model results, is identical across tiers, and cannot
change after scoring starts. Never pool the tracks or promote a schema because
a model performed well. No MySQL verifier or MySQL model-evaluation track is
part of this protocol.
