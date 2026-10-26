# Item 2: evaluator validation

Later 4 October minimal update: `target_attribution_v6`; 76 tests pass with real
PostgreSQL integration, plus the existing nine mutation variants and fifteen
independent controls. New regressions cover missing-child cascade preconditions,
NULL-safe locators against a missing-FK mutant, timeout/cancellation classification,
connection recovery, bounded diagnostic attempts and refusal to promote a
successful diagnostic into reference approval. No whole-corpus rerun or LLM
calls; older v5 corpus evidence remains stale until refreshed.

4 October update: `target_attribution_v5`; 72 local tests, nine mutation variants
and fifteen independent controls pass. Added PostgreSQL-tested source-derived
reference conversions, numeric NUMBER fixtures, and implicit FK column lists
resolved only against the parent table's **declared** primary key. Candidate
audit reports separate execution success, technical coverage and semantic review.
BIT fixtures use valid bit strings; identifier binding is scoped to the fixture's
actual table, preventing another table's column spelling from changing resolution.
The current [conversion report](REFERENCE_COMPATIBILITY_20261004.md) supersedes
earlier corpus-readiness counts. No LLM calls; earlier model artifacts unchanged.

3 October update: compatibility-driven fixes now use `target_attribution_v4`.
59 local tests pass, including sixteen generated-schema fixture subcases. Added
forced-value preservation in composite FKs, consistent overlapping-parent keys,
isolated invalid-parent witnesses where a target-private column exists, nullable
cycle breaking, numeric CHECK bounds, LENGTH/CHAR_LENGTH predicates, redundant
gold PK/UNIQUE attribution and SET NULL/NOT NULL interaction. Fully overlapping
FKs without an isolated witness are explicitly warned, not silently credited.
Fresh corpus results are linked from [the compatibility report](PREPAID_COMPATIBILITY_20261003.md).
The 2 October account below is retained as implementation history.

Updated 2 October 2026. Local PostgreSQL validation only; no LLM calls.
The dataset, split, tier transformations and original Groq artifacts are unchanged.

## Implemented and validated

- Rejections require both an expected SQLSTATE and attribution to the target
  table/columns/constraint kind. FK attribution additionally checks the referenced
  table and **ordered** column mapping. Missing attribution metadata fails closed.
- Setup errors cannot earn CER credit, including deferred FK violations.
  Deferred constraints are forced immediate after setup, inside each savepoint;
  this tests enforcement, not the application's deferred-transaction workflow.
- Explicit DELETE RESTRICT accepts PostgreSQL's `23001` and `23503`, only with
  target-FK attribution. NO ACTION and wrong-FK controls are included.
- Composite SET NULL checks every FK column and requires the child row to survive.
  CASCADE checks child removal even when the child has no separate key.
- Every test rolls back to its savepoint; verification rolls back the outer
  transaction. Repeated identical inserts and namespace cleanup are tested.
- Gold parsing preserves literals containing comment/DDL keywords, multiple inline
  CHECKs, multi-clause ALTER ADD constraints, ordinary UNIQUE indexes, and
  unambiguous constraint-identifier spelling. Partial/expression UNIQUE indexes
  are flagged instead of silently treated as ordinary uniqueness.
- Fixtures support identity columns through OVERRIDING SYSTEM VALUE, narrow
  NUMERIC(p,s), default CHAR(1), distinct date/time samples, and pruned bounded
  CHECK search across multiple columns. Sequences/defaults are not scored by this
  fixture strategy. Finite-domain values are not guaranteed globally unique.
- `target_attribution_v3` marks saved verification. Older records require a
  verification-only backfill, retaining generated SQL and avoiding LLM calls.
  Offline aggregation labels older saved verification as historical.

## Evidence

The local suite has **52 passing tests**, with PostgreSQL integration enabled.
Subtests additionally cover nine generated-schema fixture scenarios.

[Machine-readable mutation evidence](audits/evaluator_mutations.json) and
[human-readable controls](audits/evaluator_mutations.md) include:

- A passing reference and nine deliberately defective schema variants.
- A same-SQLSTATE/wrong-UNIQUE-constraint false-positive control.
- Fifteen independently hand-authored controls, bypassing the gold parser and
  generator: composite PK/FK, swapped FK mapping, deferred rejection and setup
  failure, delete restriction attribution, complete versus partial SET NULL,
  wrong NOT NULL/CHECK columns, absent target metadata, SQL NULL behavior, and
  savepoint isolation.
- Exact implementation hashes and PostgreSQL runtime information.

The paper launch gate requires the current version of this mutation evidence.
Changing source invalidates the evidence; it must be regenerated locally.

```powershell
$env:ER2SQL_RUN_POSTGRES_INTEGRATION = '1'
python -m unittest discover -s tests -q
python -m er2sql.module7_evaluation.mutation_validation
```

Retry unit tests emit simulated provider errors; those calls are mocked.

## Scientific boundary — do not overclaim

This completes the implemented regression-validation package for the supported
constraint behavior. It is **not** proof of arbitrary SQL equivalence or a claim
that every corpus reference is executable/testable. Unsupported functions and
CHECK expressions, non-null cyclic fixture dependencies, custom type/domain
semantics, qualified namespaces, complex indexes, and other dialect features
can still require support/review. Warnings and failed reference gates remain
visible; no schemas are automatically excluded and no approvals are fabricated.

CHECK attribution uses the affected column set and constraint kind, not a proof
that two predicate expressions are equivalent. The paired positive/negative
probes detect sampled behavioral differences only. Do not describe CER as full
behavioral equivalence, nor report unsupported tests as successful.

Historical corpus-audit counts are from the older implementation. They were not
re-certified or waived by this task. User-confirmed completion of dataset creation
does not by itself establish current PostgreSQL evaluator compatibility. The
intentional information omissions in Tier 2/3 are not defects.

Use only a disposable, least-privilege PostgreSQL database for model-generated
SQL. Transaction rollback is isolation, not a hostile-SQL security sandbox.
