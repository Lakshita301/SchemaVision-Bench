# Paid-run readiness

## 10 October v6 analysis-protocol freeze

The prospective run protocol is now [v6](PAPER_EXPERIMENT_PROTOCOL_V6.md),
machine-pinned in [`paper_protocol_v6.yaml`](../config/paper_protocol_v6.yaml).
Raw generated SQL remains the primary execution input. Primary reporting includes
strict planned-denominator CER and paired compile success; the report also gives
CER on the shared cells where both arms compile, savepoint-based table salvage,
and a normalized-SQL ablation using one fixed `sqlparse` formatter in a separate
rollback-only execution pass. A
model's readiness-pilot compile rate must reach 20% in at least one arm to enter
the final comparison; low compile rates can create floor effects, so compile
rate and strict CER are shown together.

PostgreSQL verification retries once for SQLSTATE `57014`, `57P01`, class `08`,
or class `53`. If the retry still fails for one of those infrastructure reasons,
the schema-tier cell is excluded symmetrically from both arms. Other SQL errors,
including generated SQL that does not compile, remain model failures. One 5-second
statement timeout applies uniformly. Output extraction removes code fences only.
Per-schema reports include an SQLSTATE taxonomy and `not_sql` class.

The Mistral pilot and final manifests are
[`experiment.paper-pilot-v6.yaml`](../config/experiment.paper-pilot-v6.yaml)
and [`experiment.paper-final-v6.yaml`](../config/experiment.paper-final-v6.yaml).

### 11 October v6 local checks — no provider calls

The v6 evaluator mutation controls passed: all nine deliberate defects and all
15 independent controls were detected as expected. Evidence:
[`evaluator_mutations_v6.md`](audits/evaluator_mutations_v6.md) and its JSON.

The exact 11-schema pilot reference audit was run against the original source
SQL in PostgreSQL 18.6. Only 6/11 passed the DDL and generated-test checks.
The five failures are `schema_0456`, `schema_1106_148168`,
`schema_1167_099625`, `schema_1206_432694`, and `schema_1244_213519`; their
PostgreSQL errors include MySQL integer-width, `VARBINARY`, reserved-name, and
`AUTO_INCREMENT` syntax. See [`pilot_oracle_v6.md`](audits/pilot_oracle_v6.md).
This local-only audit made zero model calls and does not clear the paid-run
gate. The raw-reference failures need valid, reviewed PostgreSQL references
and a successful rerun. The contamination audit is also still incomplete:
source-provenance review is pending for the frozen corpus. Do not start the
paid pilot until both gates, the fresh readiness pilot, and its cost estimate
are complete and pinned.

The exact reference audit used
[`experiment.paper-pilot-v6-local-audit.yaml`](../config/experiment.paper-pilot-v6-local-audit.yaml),
which is explicitly local-only and cannot execute provider calls.

The 714-schema reference-status manifest is now frozen in
[`reference_status_manifest_v1.csv`](../data/reference_status_manifest_v1.csv):
275 executable-verified, 223 structural-only, and 216 defective. The primary
run uses only the 275 fixed pilot/final references; 49 structural-only schemas
in the disjoint development split are allowed for Module 2 prompt development.
The optional structural-only metric track stays separate and is run only if
budget remains after the primary run. See the
[classification and reason counts](audits/reference_status_v1.md). This does
not complete the other launch gates listed above.

## 9 October v5 contamination safeguard

Protocol v5 now requires a complete provenance/popularity audit before any
paid pilot or final run. The original split is preserved; a versioned update
keeps all 714 schemas but places likely related families together. The audit
flags likely popular schemas, blocks cross-split source-family or exact-SQL
leakage, and requires a predeclared low-risk sensitivity report alongside the
all-eligible primary results. It cannot establish membership in private model
pretraining data.
The audit implementation and workflow are documented in
[Dataset contamination-risk audit](DATASET_CONTAMINATION_AUDIT.md).

Using the tier and SQL paths in `config/config.yaml`, a local source-coverage
pass has now hashed the original SQL for all **714/714** frozen split schemas.
It found **zero exact-SQL duplicate groups**. Comparing the SQL table sets and
shared definitions narrowed the initial six same-repository overlaps to **five
likely related schema families**, which the prospective split amendment now
keeps together. The remaining pair is from the
same Activiti repository but has disjoint table sets and appears to be separate
modules. These are local-data findings, not independent human review. The
source headers contain URLs for all 714 files (685 distinct GitHub
repositories). See the current
[current contamination audit](audits/dataset_contamination_v4.md), the prior
[v3 audit snapshot](audits/dataset_contamination_v3.md), the preserved
[pre-amendment audit](audits/dataset_contamination_pre_amendment_20261008.md),
the [split amendment record](audits/split_contamination_amendment_20261009.md),
and their JSON reports.

A follow-up read-only GitHub popularity screen checked 681 of the 685 source
repositories. It identified two TPC-C schema variants and three Quartz schema
variants for risk review, and found no local matches for Sakila, Chinook, or
Northwind. Four source repositories could not be looked up. See the separate
[GitHub source-popularity screen](audits/github_source_popularity_20261009.md)
and its JSON snapshot. The follow-up candidates are in the versioned
`config/contamination_risk_registry_v2.json`; the v3 audit and original
registry remain preserved.

The amended full population is 78 development / 24 pilot / 612 final. The
unchanged v4 reference-eligible IDs have been re-partitioned as 76 / 11 / 264;
three eligible final schemas moved to pilot. Reference files and test results
were not altered. New paid manifests must use the eligible split for scoring
and separately pin the full split for the contamination audit.

Project decision (9 October): do not spend time trying to infer an exact
popularity/risk rating when the available source evidence cannot support one.
Record `unknown` with a short reason instead of guessing. This is not a claim
of zero contamination risk. Keep the source URLs/repository candidates,
original-SQL hashes, exact-duplicate scan, and cross-split family check as the
available safeguards; disclose that some source identities and pretraining
exposure remain unknown. The low-risk sensitivity analysis must say when its
subset is empty or too small to interpret.

The current audit output remains marked **incomplete** because the metadata
draft still has pending review fields; this decision does not retroactively
complete that report. Paid-run orchestration still requires a hash-pinned,
complete Protocol v5 audit. The Mistral-only final manifest is prepared at
[`config/experiment.paper-final-v5.yaml`](../config/experiment.paper-final-v5.yaml),
but is intentionally not runnable yet: its v5 audit hash, exact final reference
audit, current evaluator-control report, fresh-pilot validation, and pilot-based
cost estimate must be filled in first. Historical v1-v4 manifests and results
remain unchanged.

## 7 October v4 reference-policy gate — refreshed, no provider calls

The locked rulings are recorded in [protocol v4](PAPER_EXPERIMENT_PROTOCOL_V4.md)
and [reference policy](REFERENCE_REVIEW_POLICY.md). Original scraped SQL remains
unchanged. The converter now resolves supported source `ALTER TABLE ADD/DROP`
operations in order, handles `#` comments, and implements the approved
translation categories. A change is approved by policy only when its hashes
match and it compiles and passes the generated reference suite on PostgreSQL.

Fresh candidate SQL, manifests, and full per-schema records are in
[`v11/pilot`](../data/reference_candidates/v11/pilot/NORMALIZATION_REVIEW.md)
and [`v11/final`](../data/reference_candidates/v11/final/NORMALIZATION_REVIEW.md).
Current PostgreSQL evidence is in the [pilot audit](audits/pilot_oracle_v4.md),
[final audit](audits/final_oracle_v4.md), and [eligibility/exclusions report](audits/reference_eligibility_v4.md).
The machine-readable eligible populations are in
[`paper_splits_v4.json`](../config/paper_splits_v4.json) and the audit-linked
[eligibility JSON](audits/reference_eligibility_v4.json).

| Frozen population | Eligible after v4 gate | Excluded before model evaluation |
|---|---:|---:|
| Pilot | 8/20 | 12 |
| Final | 267/618 | 351 |

For the final split, 274 candidates compiled and ran the generated suite; 267
also had no remaining technical warnings and passed the policy/review gate.
There are 209 matching policy-category approvals; 58 unchanged references also
pass. Exclusion reason counts overlap: the report lists every applicable reason
per schema. It includes the required exclusion of `schema_0924_372982` as
SQLite's internal `sqlite_stat1` metadata, plus non-unique FK targets, duplicate
definitions, unresolved source operations, malformed sources, and unsupported
generated-reference checks. No hard examples were silently replaced.

The reference audit work is refreshed, but **paid-run readiness is still
blocked**: the preplanned 20-schema pilot population now has only 8 eligible
references, and the final population is 267 rather than 618. The v4 manifests
used for this audit are explicitly `local_audit_only`; they cannot make provider
calls. Do not start a paid pilot until the eligible pilot size/model configs
and the new paid manifests are deliberately settled. The 9 skipped tests in
the offline test run are PostgreSQL/provider-dependent tests, not additional
LLM calls.

## 6 October v3 readiness update — manifest and PostgreSQL role

The v3 pilot and final manifests now pin the current
`config/paper_protocol_v3.yaml` SHA-256 (`4b6f7652683decb3e1d43309a78a5a4b875bf9a238520f43d8a11d4328c807cb`).
Both manifests and all provided database profiles target the dedicated
`er2sql_paper_verify` database as non-superuser `er2sql_runner`, using
`ER2SQL_VERIFY_DB_PASSWORD`. The isolated role/database were provisioned and
validated on PostgreSQL 18.6. Integration/evaluator tests passed (14 tests,
17 subtests), and all 9 deliberate mutations, 15 independent controls, and the
wrong-constraint control passed under that role. See the [validation record](POSTGRES_PAPER_RUN_SETUP.md)
and [v3 mutation evidence](audits/evaluator_mutations_v3.md). No model calls
were made. The earlier status text below that mentions `postgres` describes
the inspected pre-change configuration.

The exact v3 original-SQL oracle audits have now also been regenerated against
the same PostgreSQL 18.6 verifier and frozen manifests: pilot **5/20** pass;
final **95/608** pass. The final audit has 99 references that compile and pass
their generated checks, but 4 carry warnings; 509 original SQL files fail DDL
execution. The audits are complete, but this is **not a passed launch gate**.
No converted references were treated as approved without actual human review.
See [reference review status](REFERENCE_REVIEW_POLICY.md) and the [pilot](audits/pilot_oracle.md)
and [final](audits/final_oracle.md) reports. All audits/checks used zero LLM
calls.

The deterministic v3-split conversion candidates and their local audits are
also prepared, without changing source SQL or the split. Pilot candidate audit:
9/20 compile/pass checks; 13 changed references need human review and 7 have
conversion blockers. Final candidate audit: 257/608 compile/pass checks, 251
without technical warnings; 455 changed references need human review and 172
have conversion blockers. Only 95/608 currently pass the full gate without
review approval. Candidate detail and hash manifests are linked from the
[review policy](REFERENCE_REVIEW_POLICY.md). This is prepared work, not approval
of translated ground truth; item 1 remains blocked on actual semantic review
and unresolved candidates.

## 5 October methodology amendment

The structural-versus-behavioral population decision is now prospectively
frozen in [`PAPER_EXPERIMENT_PROTOCOL_V2.md`](PAPER_EXPERIMENT_PROTOCOL_V2.md)
and `config/paper_protocol_v2.yaml` (SHA-256
`ccc9b88dd3896d606936568c36d0ae8efe67ccfff380a2879895353ef7bbbeaf`).
The complete split remains the structural population; primary CER uses a
schema-level, independently reviewed PostgreSQL-executable subset fixed before
paid outputs. Five named ambiguous schemas are prospectively excluded from
primary CER, not from structural evaluation.

The former `experiment.paper-*-v2.yaml` files are historical protocol-v1
manifests and are not authorized for a paid run. A runnable v3 pilot manifest
must wait for the 20-ID eligible pilot split, review records, matching oracle
audit, current evaluator-control evidence and dual-population reporting support.
No model/API calls were made while freezing this amendment.

Latest minimal update: verification `target_attribution_v6`; 76 passing local
tests and passing mutation controls. Cascade tests now validate their initial
child row and use NULL-safe locators. Reference timeouts/cancellations receive
one retained diagnostic recheck, never best-attempt scoring or automatic gate
approval. See [details](REFERENCE_COMPATIBILITY_20261004.md). No LLM calls or
dataset edits. The referenced v5 full-corpus audits below are intentionally
historical/stale under the new source hash; paid launch remains blocked.

## Current status — 4 October 2026

See [reference compatibility and conversion results](REFERENCE_COMPATIBILITY_20261004.md).
Separate candidates for all 638 pilot/final IDs were generated and tested locally;
originals, tier images and split membership remain unchanged. The paper manifests
point to the current candidate audits, which still fail closed. No conversion
was automatically approved, no schema was excluded and no LLM was called.
72 local tests, nine mutation variants and fifteen independent controls pass.
Verifier protocol is now `target_attribution_v5` (source-declared implicit FK
targets and NUMBER fixtures supported); historical verifications need local
backfill before current-protocol reporting. The updates below are history, not
additional current checklists. Model profiles and database-role setup remain
separate deferred work.

Updated 1 October 2026. No LLM calls were made during this implementation. Per user instruction, paid pilots and all other model calls remain deferred until explicitly requested; other model profiles will be supplied later.

2 October update: [item 2 evaluator validation](EVALUATOR_VALIDATION.md) and
[item 4 reproducibility/replay](REPRODUCIBILITY.md) have been strengthened and
locally tested. Current suite: 52 passing tests, nine mutation variants and fifteen
independent controls. The old reference-audit counts below are historical;
source changes make their launch evidence stale. No failed reference gate was
waived, no dataset/tier changes were made, and no model calls were performed.

## Status: software safeguards in place; reference-data gate blocked

**Current 3 October status:** [fresh compatibility report](PREPAID_COMPATIBILITY_20261003.md).
Pilot: 4/20 pass; final: 96/618 pass (100 compile; 518 raw-DDL failures;
4 compiled but unresolved). 59 local tests and all mutation controls pass.
The [prospective experiment protocol](PAPER_EXPERIMENT_PROTOCOL.md) is now pinned
in both manifests. All earlier counts/proposals below are historical. Existing
dataset SQL is authoritative; upstream differences do not automatically justify
adding keys or rerunning Module 1. No dataset/eligibility changes were made.
The configured database role was inspected and is the `postgres` superuser;
least-privilege setup remains a separate approval-required task before model SQL.

Historical reference recovery found upstream keys absent from both the current
SQL and diagram for `schema_0213`. The existing dataset remains authoritative;
these keys must not be silently added. See [source recovery](REFERENCE_SOURCE_RECOVERY.md)
and the current [review policy](REFERENCE_REVIEW_POLICY.md). An upstream enum
declaration for `schema_0517` was also recovered but was not promoted into the
active benchmark without a decision.

Latest implementation details: [items 1, 2 and 4](IMPLEMENTATION_1_2_4.md). Reference candidates for all 638 selected IDs are in `data/reference_candidates/v2`; they are not automatically approved. Nine deliberate evaluator mutations and the same-SQLSTATE/wrong-constraint control pass. The local suite now passes **41 tests**. No paid or free model calls were made.

The local test suite passes with real PostgreSQL integration enabled. The frozen pilot reference audit passes **4/20 schemas**. The other **16 reference SQL files fail PostgreSQL DDL execution**, independently of any model output. Examples include MySQL backticks/ENGINE/AUTO_INCREMENT, SQL Server identifier/identity syntax, Oracle VARCHAR2 and missing custom types. Several also produce parser/generator warnings.

The full **618-schema final reference audit is now complete**: 100 compile, **82 pass the complete gate**, 518 fail DDL compilation, and 18 compiled references have failed tests or unresolved warnings. Of those 18, 16 have behavioral/structural test failures and two have warnings without test failures. Warning counts overlap with compilation failures; these categories should not be summed indiscriminately. This means corpus-wide oracle support is not complete, despite passing regression tests. See [full audit](audits/final_oracle.md) and [required reference-policy decision](REFERENCE_REVIEW_POLICY.md).

Additional local fixes: repeated FKs to an already created parent no longer produce false cycle warnings; irregular whitespace in PK/FK declarations is accepted; ordinary indexes are not parsed as columns, while real columns named `key`, `unique_code` and `checkin_interval` are retained; duplicate CREATE TABLE variants are flagged; money fixtures use numeric strings. Composite UNIQUE and bounded compound CHECK tests are supported. Rejection attribution checks the actual constraint target, not just SQLSTATE.

Local audits now checkpoint and can resume unchanged records, continue past per-schema exceptions, and verify exact selected-ID coverage. Converted reference evidence requires matching source/reference hashes and an actual semantic-review record; altered/missing files invalidate it. Local final-set audits work without an invented cost estimate, while actual final paid execution still requires one.

See [reference audit](audits/pilot_oracle.md) and its adjacent JSON for exact errors and every test result. Passing an oracle audit means the implemented tests are valid on that reference; it does not prove complete constraint coverage or semantic equivalence.

Do not spend money on this pilot yet. Provide independently reviewed PostgreSQL equivalents, preserving keys, types, nullability and relationship semantics, or explicitly revise the benchmark's supported-dialect policy. Do not silently remove constraints, discard inconvenient schemas after observing model scores, or use model-generated SQL as ground truth. The readiness command supports `--reference-dir` with one `SCHEMA_ID.sql` per selected schema. Parser/generator warnings must also be resolved. Original dataset files have not been changed.

## Implemented protocol

| Area | Implemented behavior |
|---|---|
| Incomplete output | Length-limited, filtered and empty completions fail; raw responses and finish reasons remain available. No truncated JSON/SQL is accepted as successful. |
| Fixed model attempts | Paper profiles use zero JSON validation retries. A completed but invalid model response is a scored terminal outcome, not regenerated on resume. No repair arm is included. |
| Infrastructure retry | Provider-aware backoff/Retry-After and permanent/retryable classification; SDK automatic retries disabled. Configured retry-cost protection remains an estimate, not a billing guarantee. |
| Interruption/resume | Save Module 2 before generation. Reuse completed parsing and journaled completed HTTP responses. Archive replaced schema artifacts atomically. An interrupted request without a recorded response remains an unresolved attempt and blocks the pilot gate. |
| Attempt accounting | Append-only `api_attempts.jsonl`: request fingerprints, role/schema/tier, attempt starts/outcomes, raw completions, response model/ID, known tokens/cost, API timing and scheduled backoff. No API keys are serialized. |
| Oracle validation | Execute generated tests against an independent reference before permitting paid pilot/final runs. Setup failures and unexpected SQLSTATEs receive no CER credit. |
| Fixture correctness | Type-fitting FK sentinels, distinct short strings, PostgreSQL bytea/boolean literals, and unambiguous catalog-based case matching for generated test identifiers. SQL string literals are not rewritten. |
| Provenance | Hash source files, prompts, model configs, split file and selected input images/SQL. Changed plans cannot resume into an existing experiment root. |
| Pilot/final gate | Require oracle success for the exact plan. Final additionally requires a passing pilot with the same configs, prompts, source and split, including resume evidence. |

Case matching is a declared evaluation policy: an exact catalog identifier wins; a missing spelling may map only to a unique case-insensitive match. Ambiguous names remain unmatched. This is not arbitrary identifier renaming.

## Metric definitions and statistics

- **Compile rate:** compiled artifacts / assigned schema-tier artifacts. Completed model failures remain in the denominator. Missing artifacts fail completeness checks; a partial report is not a final benchmark.
- **Conditional CER:** passed behavioral constraint tests / executed behavioral constraint tests. Report alongside the following unconditional scores, never alone.
- **Unconditional constraint coverage:** passed behavioral tests / planned gold behavioral tests across all recorded assigned artifacts, including generation/DDL failures. Unknown planned denominators are flagged.
- **Macro CER across all artifacts:** average per-artifact CER, assigning zero to failures or absent CER. Keep this distinct from conditional micro CER.
- Keep existing final-SQL and IR structural precision/recall/F1, valid acceptance, invalid rejection, end-to-end and tier metrics. Empty positive categories have undefined F1, not 100% performance.
- Schema-cluster percentile bootstrap: 5,000 replicates, seed 20260930. Resample unique schema IDs with their tiers together. Paired arm intervals use the same matched schema-tier observations. The built-in clustered endpoints are compile rate, macro all-artifact CER and end-to-end success; paired tier differences also have bootstrap intervals.
- Small-sample intervals are exploratory. An all-zero sample can give a degenerate bootstrap interval; that is not proof of zero population error/success. No pooled tier-level McNemar inference is used. Intervals are pointwise, not simultaneous across all models/metrics. Confirmatory significance claims still require predeclared comparisons and a multiplicity policy.
- Known-token cost is not billed cost. Failed/unresolved requests can have unknown charges. Reconcile the ledger against provider billing before reporting final total spend. Lifetime ledgers cover the full arm directory, even when a report filters a subset of artifacts. Scheduled backoff is not guaranteed actual elapsed sleep if interrupted.

## Frozen selection and model configuration

`config/paper_splits.json` contains 714 common schema IDs: **76 development, 20 pilot, 618 final**. Previously recorded output IDs and previously proposed pilot IDs are excluded from the final split. This excludes known local exposure, not undiscoverable manual work or model pretraining contamination.

New manifests:

- `config/experiment.paper-pilot-v2.yaml`: 20 IDs × 3 tiers × 2 arms = 120 artifacts; nominal 180 LLM calls.
- `config/experiment.paper-final-v2.yaml`: 618 IDs × 3 tiers × 2 arms = 3,708 artifacts; nominal 5,562 LLM calls.

Those call counts assume every structured parse reaches generation and exclude infrastructure retries. Both manifests currently contain the existing Mistral candidate only. Add a separately verified exact profile for each other selected model before freezing a multi-model experiment. This work does not certify live provider availability/pricing.

The Mistral candidate output budget is now 16,384 tokens. Its retry estimate was increased accordingly. The pilot must validate this budget and provider behavior; a larger budget is not proof that truncation is eliminated. The pilot's $2 expected cost is a comparison threshold, not a hard spending cap.

## Validation and next execution steps

Local validation completed with PostgreSQL enabled:

```powershell
$env:ER2SQL_RUN_POSTGRES_INTEGRATION='1'
python -m unittest discover -s tests -q
```

Tests cover SQLSTATE attribution, setup failure rejection, PK/FK/NOT NULL/UNIQUE/CHECK, composite keys, rollback, verification-only backfill, fixed failed outcomes, truncation, response replay, retry accounting, atomic history and failed/stale oracle gates. They make no real provider calls.

After independently reviewing/fixing reference compatibility, rerun the local oracle audit:

```powershell
python -m er2sql.module7_evaluation.readiness --manifest config/experiment.paper-pilot-v2.yaml --output docs/audits/pilot_oracle.json --reference-dir <reviewed-reference-directory> --review-file <review-records.json> --quiet
```

Omit `--reference-dir` only if the dataset SQL itself is a valid reviewed PostgreSQL reference. Audit source/config changes invalidate the plan hash; rerun after freezing the final implementation.

Then preview the pilot with `er2sql experiment --manifest config/experiment.paper-pilot-v2.yaml --dry-run`. Only after the audit passes, funding/configuration are confirmed and the paid run is authorized, execute that manifest without `--dry-run`. Resume the identical manifest once to verify skipped artifacts and no duplicate provider requests. Inspect its `reports/pilot_validation.json` before proceeding.

Audit all final references using the final manifest as well. The 20-schema pilot audit is not sufficient for 618 final schemas. Human reference review, paper claims, dataset licensing/release and human evaluation remain research work; automated checks cannot guarantee publication or long-term citability.

## Historical Groq recheck

Saved SQL was reverified without generation and without modifying original artifacts:

| Arm | Saved artifacts | Compiled | Original passing tests | Reverified passing tests |
|---|---:|---:|---:|---:|
| Structured | 16 | 8 | 62 | 103 |
| Direct | 16 | 7 | 159 | 306 |

These are all-test counts, not CER numerators, and are not a new protocol-v2 model evaluation: historical truncated responses and incomplete attempt accounting remain. Full per-test evidence: [structured](audits/groq_structured_reverification.json), [direct](audits/groq_direct_reverification.json). The old Groq Markdown is explicitly labelled historical.

## Prospective protocol v3 (2026-10-06)

Protocol v3 is the active plan for future runs; v1/v2 manifests and pilot artifacts remain unchanged historical evidence. It uses the shared PostgreSQL-specific Module 3 prompt, a common requested 16,384 completion-token cap, no chunking/repair, and planned-denominator constraint pass rate as the primary behavioral endpoint. If either arm truncates on a `(schema_id, tier)` cell, that paired cell is excluded from both arms; unaffected tiers remain included. IDs, tiers, and truncating arm/stage reasons are logged. Conditional CER is secondary.

The cumulative development set is 86 schemas: the previous 76 plus Mistral's 10-schema provider pilot; Qwen's eight pilot IDs were already among those 76 and are explicitly listed in `config/development_schemas.json`. The new split in `config/paper_splits_v3.json` contains 20 fresh pilot schemas and 608 final schemas. No source data or historic split was overwritten.

For the planned 608-schema, three-tier final run:

- Structured: 1,824 schema-tier artifacts, up to 1,824 Module 2 calls plus 1,824 Module 3 calls.
- Direct: 1,824 schema-tier artifacts and 1,824 Module 6 calls.
- Total: 3,648 artifacts and at most 5,472 model calls before bounded transport retries. There is no repair arm.
- A rough Mistral-only token-derived projection using the observed 10-schema/three-tier pilot usage rate is about **$17.09** for the same planned volume. This is not a quote or invoice prediction; model outputs, prompt changes, provider billing, retries, and the chosen model roster can change it. Recompute per model from its own measured pilot before the full run.

New manifests: `config/experiment.paper-pilot-v3.yaml` and `config/experiment.paper-final-v3.yaml`. They are prepared for the currently configured Mistral candidate; other model profiles and pilot validation must be added later. No provider was called while creating this amendment or split.
