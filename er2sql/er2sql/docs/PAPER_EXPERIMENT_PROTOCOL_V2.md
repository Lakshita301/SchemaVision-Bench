# Frozen pre-paid experiment rules — version 2

Frozen 5 October 2026 before any paid Mistral pilot output. The authoritative
machine-readable rules are in `config/paper_protocol_v2.yaml`. This amendment
supersedes protocol v1 for future paid paper runs; v1 and its manifests remain
historical evidence and must not be reused as the paid-run plan.

Frozen SHA-256:
`ccc9b88dd3896d606936568c36d0ae8efe67ccfff380a2879895353ef7bbbeaf`.

## Authoritative dataset and tiers

The existing dataset SQL and diagrams are authoritative. Tier 2 and Tier 3
omissions are intentional experimental conditions. Module 1 is not rerun, and
upstream keys, types or domains absent from the dataset are not imported.
Neither arm can see the ground-truth SQL during generation.

## Two prospectively fixed evaluation populations

The complete frozen final split is used for structural IR/SQL metrics, model
failure and compile rates, cost/latency, and paired tier drop-off. Behavioral
CER uses a separately frozen subset of schema IDs with reviewed, executable
PostgreSQL references. Eligibility is established from references before paid
model outputs and is identical across models, arms and all three tiers.

Eligibility is schema-level. A primary-CER schema must compile, pass every
planned gold test, have no parser/generator/fixture/attribution warning, and—if
converted—have hash-matched semantic approval by a primary reviewer and an
independent verifier. Individual unsupported constraints are not silently
removed from the primary denominator. Ineligible schemas remain in the complete
structural evaluation and are not model failures.

The primary behavioral endpoint is macro all-artifact CER on this complete
paired eligible matrix; generation or compilation failure by a model scores
zero. Reports must also show eligibility coverage and exclusions by reason,
full-population compile and structural results, conditional CER, unconditional
constraint coverage, end-to-end success, valid acceptance, invalid rejection,
per-constraint rates, tier contrasts, and cost/latency/failure breakdowns.

## Reference translation and ambiguity policy

Reviewed PostgreSQL references may apply semantics-preserving syntax/type
translation, including identifier quoting, equivalent domain-preserving types,
identity/enum/unsigned conversions, FK creation reordering, and removal of
non-semantic storage clauses. They may not invent missing types or keys, drop
constraints to compile, import absent upstream facts, merge contradictory
definitions, replace constrained domains with unrestricted text, or use model
predictions as an oracle.

The following IDs are prospectively ineligible for primary CER and remain in
the structural population:

- `schema_0517`: undefined local `status_type`; upstream enum is not imported.
- `schema_0213`: upstream PKs are absent from the dataset SQL and diagram.
- `schema_1052_673818`: missing or ambiguous column types.
- `schema_1211_489168`: contradictory duplicate table definitions/actions.
- `schema_1224_512880`: ambiguous bracket-style `LIKE` semantics.

Any additional ineligibility must be determined from reference evidence—not
model output—recorded by reason, applied across all tiers, and frozen before the
paid run. The target is 20 eligible non-final pilot IDs and at least 200 reviewed
eligible final IDs. Below 200 final IDs, CER is demoted from the primary claim.

## Claims and freeze

The allowed claim is behavioral constraint enforcement on a prospectively
defined, independently reviewed PostgreSQL-executable subset, with structural
fidelity on the complete benchmark. Full cross-dialect behavioral equivalence
must not be claimed. Model responses are single-attempt, without repair; bounded
transport retries remain separately logged. Statistics retain schema-clustered
5,000-replicate percentile bootstrap intervals with seed 20260930.

The next runnable manifest must pin the v2 protocol hash, a versioned behavioral
eligibility file, matching reviewed-reference audit, current evaluator controls,
and a new output root. Until those artifacts exist, the old v2 pilot manifest is
not authorized for a paid run.
