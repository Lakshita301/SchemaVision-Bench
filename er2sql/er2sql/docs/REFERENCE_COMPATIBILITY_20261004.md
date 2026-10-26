# Item 1: PostgreSQL reference compatibility — 4 October 2026

## Later update: minimal safeguards only

At the user's request, the subsequent implementation was limited to scoring
correctness and bounded reference diagnostics:

- Cascade tests require the child row to exist before the delete. Failed
  preconditions are setup failures, the action is not executed, and no CER
  credit is awarded. Parent/child locators use NULL-safe comparisons, preventing
  a missing match from masquerading as a successfully deleted child.
- PostgreSQL SQLSTATE 57014 is explicitly classified as timeout/query
  cancellation, including errors during setup, action and post-checks.
- A reference audit retains one primary attempt and, on cancellation, at most
  one unscored diagnostic recheck with the same SQL, tests and timeout. Neither
  a successful recheck nor a diagnostic error replaces the primary result or
  clears the launch gate. Model execution is not automatically retried by this
  reference-only mechanism. Audit resume also checks server/encoding/timeout
  metadata and the diagnostic policy before reusing cached evidence.

Verification protocol is now `target_attribution_v6`. **76 local tests pass**
with PostgreSQL integration enabled; nine mutation variants and fifteen
independent controls pass. No LLM calls, dataset edits, exclusions, new dialect
conversions or semantic-review approvals were performed in this minimal update.

The v5 corpus counts and candidate reports below remain historical and were
**not** regenerated under v6. Their source hashes no longer match the current
implementation, so the paper launch gate correctly rejects them as stale.
This completes the narrow safeguard implementation, **not whole-corpus item 1**.
Unsupported/ambiguous references and conversion review remain unresolved. A
current complete audit is required after those decisions, before a final freeze.

## Earlier v5 compatibility run

**Status: conversion implementation and local validation performed; whole-corpus
readiness is still blocked. No LLM calls, no automatic exclusions and no automatic
semantic approvals.** Both refreshed audits are complete. Counts below come from
their completed JSON, not partial progress or model outputs.

This is evaluator/reference validation, **not model performance**. It does not
undo the intentional Tier 2/3 information removal or require rebuilding Module 1.
The original dataset remains authoritative. Tables without a declared primary
key are not automatically defects, and upstream keys were not added.

## What was completed

- Created separate SQL candidates for all 20 pilot and 618 final IDs in
  `data/reference_candidates/v4/{pilot,final}`. There are 478 changed candidate
  files and 160 byte-identical copies. All 638 original SQL hashes match both
  their current source files and the 3 October baseline. Original diagrams,
  splits and historical Groq results were not edited.
- Expanded the source-based converter: identity syntax with explicit seed/step;
  common numeric/text/binary type spellings; integer display widths; named and
  unnamed whole-column UNIQUE indexes; ordinary indexes; metadata comments;
  reserved table-name quoting; trailing commas; and forward/cyclic FK creation
  order in additive DDL batches. FK columns, referenced targets and actions are
  retained. No missing type, key or domain is guessed.
- Protected string literals, comments, escaped quoted names and PostgreSQL array
  brackets. Conversion is not a global text replacement and does not regenerate
  the oracle from the model's predicted JSON.
- Fixed gold extraction for `REFERENCES parent` without a column list: it uses
  only that parent's source-declared PK, including composite keys. No suitable
  declared key means a warning, not an invented key.
- Added type-valid NUMBER and BIT fixtures. Scoped identifier-spelling binding
  to the queried table instead of names pooled across the whole database schema.
- Made candidate audits import conversion blockers and verify candidate-manifest
  source/reference hashes. Reports separate DDL success, finite-test success,
  technical coverage and semantic approval. A matching review note cannot erase
  an unresolved normalization blocker.
- Refreshed local mutation evidence and pointed both paper manifests to the new
  candidate audits. Their failing gates continue to prevent a paid launch.

Verifier protocol: `target_attribution_v5`. Older generated SQL can be locally
reverified without a new LLM call; older scores must not be presented as v5
results until that happens. No old model artifacts were backfilled in this task.

## Completed audit results

| Check | Pilot | Final |
|---|---:|---:|
| Selected IDs audited | 20 | 618 |
| Raw source DDL compiled in the 3 October baseline | 4 | 100 |
| Candidate DDL accepted in the refreshed full pass | 7 | 258 |
| All finite execution checks pass | 6 | 247 |
| Technical checks pass with no coverage/conversion blockers | 6 | 244 |
| Full launch-gate pass | 4 | 95 |
| Changed candidates still requiring semantic review (overlaps failures) | 15 | 463 |

**Disjoint final-set outcomes:** 95 full-gate passes; 149 further technical
passes awaiting review; 14 compiled references with failed tests or unresolved
coverage; 358 other DDL failures; and 2 DDL timeouts. These sum to 618. Pilot:
4 gate passes, 2 further technical passes awaiting review, 1 compiled but failing
reference, and 13 DDL failures. These sum to 20.

The final pass timed out on `schema_0333` and `schema_0478` under the existing
5,000 ms statement limit. A separate one-attempt diagnostic recheck of **both**,
using identical bytes and the same limit, succeeded (94/94 and 76/76 tests).
See [retained timeout/recheck evidence](audits/reference_timeout_recheck_20261004.json).
Thus 260 candidates have demonstrated execution success across these runs, but
the full-pass table deliberately remains 258, not a silently merged best-of score.
The recheck neither overwrote the initial audit nor changed its launch gate.
This also explains the unchanged-reference gate count dropping from the previous
96 to 95: `schema_0478` timed out, not a changed schema or eligibility rule.
Timeout stability must be resolved before a final reference freeze.

Of the 14 compiled final references still lacking a technical pass, 11 have at
least one failed test and 3 have all executed tests passing but coverage warnings.
They are: `schema_0198`, `schema_0482`, `schema_0503`, `schema_0521`, `schema_0612`,
`schema_0871`, `schema_0899`, `schema_0933_155171`, `schema_0984_334739`,
`schema_1101_650753`, `schema_1112_007491`, `schema_1173_307431`,
`schema_1224_512880`, and `schema_1315_574283`. The corresponding pilot case is
`schema_1206_432694`. Their exact failing SQL, SQLSTATEs and warnings are in the
linked audits; none was scored as a model failure or silently discarded.

Definitions:

- **DDL compiles:** PostgreSQL accepted the candidate schema.
- **All finite execution checks pass:** every currently generated test passed;
  this does not imply complete coverage or no warnings.
- **Technical pass:** DDL and all nonempty planned tests pass, with no parser,
  fixture or normalization blockers. Missing semantic review is counted
  separately, so this is not permission to use a converted reference.
- **Launch-gate pass:** technical requirements plus any required actual,
  hash-matched conversion review. There are no fabricated reviewer records.

The source SQL, not the converted file or any model prediction, still defines the
gold constraints. These candidates are audit overrides only: dataset paths and
model inputs are unchanged. They have not been silently installed as new ground
truth or described as universally equivalent cross-dialect databases.

## Remaining work and decisions

### 1. Translation policy and individual source ambiguities

Common unresolved features include source collations/character sets, unsigned
integer ranges, ENUM/SET domains, binary padding/length, automatic timestamp
updates, identity/default interactions and source-specific numeric declarations.
Removing these clauses merely to obtain a passing result would change behavior.
Some remaining syntax forms need further converter support; not every DDL
failure requires a dataset change.

Concrete decision-sensitive cases:

| Schema | Why automatic rewriting is not justified |
|---|---|
| `schema_0517` | Local SQL uses `status_type` without defining it. An upstream enum fragment exists as evidence; adopting it and validating enum fixtures requires an explicit decision. It was not replaced with unrestricted TEXT. |
| `schema_0213` | PostgreSQL cannot install FKs against the currently undeclared referenced keys. Additional upstream PKs were **not** imported into this benchmark. |
| `schema_1052_673818` | Some columns have no declared types and others have ambiguous integer precision/scale. Choosing types would invent ground truth. |
| `schema_1211_489168` | Repeated table definitions have conflicting relationship actions. No variant was arbitrarily chosen or merged. |

A conversion may also compile while changing untested behavior. For example,
PostgreSQL identity columns and MySQL AUTO_INCREMENT differ for explicit NULL/0
and sequence advancement. The candidate records that limitation instead of
claiming equivalence. See the official [PostgreSQL identity documentation](https://www.postgresql.org/docs/current/ddl-identity-columns.html)
and [MySQL AUTO_INCREMENT documentation](https://dev.mysql.com/doc/refman/8.4/en/example-auto-increment.html).
Oracle-style NUMBER is a numeric candidate, not proof that all source-domain
bounds match [PostgreSQL NUMERIC](https://www.postgresql.org/docs/18/datatype-numeric.html).

### 2. Evaluator coverage on newly executable references

Compilation exposes additional fixture/coverage limits: interacting DELETE
actions, fully overlapping FKs without an isolated witness in the current
generator, non-nullable cycles, unsupported LIKE predicates, and CHECKs whose
negative witness conflicts with the declared type domain. These are harness or
reference-interpretation issues, **not evidence that an LLM got the schema wrong**.
They remain visible and block launch; setup or wrong-constraint errors do not
earn CER credit. Per-test failures are retained in the audit JSON.

### 3. Actual conversion review, then a final freeze

Even technically passing changed files need an actual semantic review of their
documented conversions under an agreed PostgreSQL evaluation policy. Hashes and
passing tests are necessary evidence, not a proof of arbitrary equivalence.
See [review-record requirements](REFERENCE_REVIEW_POLICY.md).

No eligibility policy was changed. If some sources cannot be represented under
the agreed policy, exclusions or dataset amendments need explicit approval,
paired-tier treatment, a versioned split/protocol amendment and a new freeze
**before** collecting paid results. The alternative is further supported
translation/evaluator work, not silently filtering to the passing subset.

## Evidence and reproduction

- [Pilot audit](audits/pilot_candidates_20261004_v5.md),
  [full JSON](audits/pilot_candidates_20261004_v5.json).
- [Final audit](audits/final_candidates_20261004_v5.md),
  [full JSON](audits/final_candidates_20261004_v5.json).
- [Pilot per-schema conversion log](../data/reference_candidates/v4/pilot/NORMALIZATION_REVIEW.md),
  [final per-schema conversion log](../data/reference_candidates/v4/final/NORMALIZATION_REVIEW.md).
  Adjacent `normalization_manifest.json` files contain original/candidate hashes,
  converter/parser hashes and every conversion/blocker. Directory v4 identifies
  this candidate snapshot; its converter policy is `postgres-reference-candidates-v3`.
- [Mutation validation](audits/evaluator_mutations.md).
- [One-attempt timeout diagnostic](audits/reference_timeout_recheck_20261004.json),
  produced by [the local recheck script](../scripts/recheck_reference_timeouts.py).
- [3 October raw-reference baseline](PREPAID_COMPATIBILITY_20261003.md).

Local validation: **72 tests pass**, plus nine mutation variants and fifteen
independent controls. Simulated HTTP failures printed by retry tests are mocked
responses, not external model requests. PostgreSQL integration is real.

The audit commands below are local-only and return a nonzero exit while the
reference gate is blocked. That is intentional, not an interrupted audit.

```powershell
$env:ER2SQL_RUN_POSTGRES_INTEGRATION='1'
python -m unittest discover -s tests -q
python -m er2sql.module7_evaluation.mutation_validation
python -m er2sql.module7_evaluation.readiness --manifest config/experiment.paper-pilot-v2.yaml --output docs/audits/pilot_candidates_20261004_v5.json --reference-dir data/reference_candidates/v4/pilot --quiet --resume
python -m er2sql.module7_evaluation.readiness --manifest config/experiment.paper-final-v2.yaml --output docs/audits/final_candidates_20261004_v5.json --reference-dir data/reference_candidates/v4/final --quiet --resume
```

The current candidates and audits supersede v3/draft and v4 intermediate audit
results, which are preserved as history. Preparation bundles from 2 October are
also historical; produce a fresh bundle after references and model profiles are
actually finalized. Existing PostgreSQL works, but its superuser account is a
separate unresolved safety issue before executing model-produced SQL. No roles
or database permissions were changed here.
