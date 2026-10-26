# Reference recovery: confirmed extraction and diagram-alignment blocker

Inspected 1 October 2026. No LLM calls. The active source SQL, diagrams, selection and model configuration remain unchanged. Recovered fragments are evidence, not approved executable references.

**Scope correction, 3 October:** this is historical upstream-comparison evidence,
not proof that the current benchmark must reconstruct upstream semantics. The
user confirmed the existing dataset is authoritative. Differences alone do not
justify adding keys, altering diagrams or rerunning Module 1. Current launch
requirements concern evaluator/reference compatibility under the
[frozen protocol](PAPER_EXPERIMENT_PROTOCOL.md). Any upstream reconstruction would
require a separate approved dataset amendment.

## Confirmed recoveries

### schema_0517 — missing type definition

The [pinned upstream SQL](https://github.com/clockmakerbrett/the-bug-files/blob/385ecadab89f655f8ef8b0e7b1da7f0d9a73f884/database.sql) explicitly defines `status_type` with three values: `To Do`, `Doing`, `Done`. The extracted dataset retained the `bugs.status status_type` column but omitted its type declaration.

Recovered fragment: [schema_0517.missing_type.sql](../data/reference_recovery/schema_0517.missing_type.sql). This recovers the domain from source; it does not infer it. Do not run the full upstream script, which also contains an application-specific CREATE DATABASE placeholder. Supporting enum-aware fixtures is a separate evaluator task. No reference approval has been recorded yet.

### schema_0213 — primary keys lost during extraction

The [pinned upstream dump](https://github.com/Brampaap/polytech_BD_project/blob/c008783dabf8546398edafbff45371f5406834dd/backup/std_1257_18.05.20.sql) adds 17 primary keys using separate ALTER TABLE statements. The local extracted SQL retains CREATE TABLE statements and FK ALTER statements but omits those PK declarations. It also omits upstream index/auto-increment alterations.

Recovered PK evidence: [schema_0213.missing_primary_keys.sql](../data/reference_recovery/schema_0213.missing_primary_keys.sql). This is not a full reconstruction of every upstream feature.

The actual local Tier 1 image `dataset/erd_tier1/schema_0213.png` was visually inspected. Its 17 tables have no PK annotations; e.g. `userdata.id`, `users.id_user` and `contacts.id` appear without PK markers. Merely adding upstream keys to the evaluation reference would therefore introduce information not explicitly present in the current Tier 1 diagram. The image has only a subset of the source FK relationships drawn; the renderer/extraction handling of multi-clause ALTER statements should be audited too.

## Why this blocks completion of item 1

This is not solved by adding UNIQUE to satisfy PostgreSQL, nor by arbitrarily dropping FKs. Both would change intended semantics. Reference recovery must be paired with an audit/rebuild of the corresponding diagram assets and their tier transformations.

The original raw audit's 518 PostgreSQL compilation failures are not all confirmed extraction defects: many are dialect incompatibilities. The two concrete recoveries above demonstrate that at least part of the corpus also needs source recovery and paired-data correction. Do not generalize their cause to every failure without checking it.

## Decision required before promotion

Recommended: create a **new versioned dataset** from recovered source semantics, fixing Module 1 extraction and regenerating affected diagrams consistently across all tiers. Keep original files and historical Groq results intact; new images/SQL require new input hashes, reviewed references and a new experiment version. Module 1 is outside this repository, so its extraction/rendering implementation is needed to do this faithfully.

Alternatively, an explicitly approved pre-model eligibility policy could exclude irrecoverable/ambiguous pairs, with documented counts and a new split. No such exclusions have been made.

Do not mark item 1 complete until recovered references and their paired images are aligned, the normalization policy is reviewed, and unresolved cases have an approved disposition. No automatic review approvals or changes to the frozen experiment have been made.
