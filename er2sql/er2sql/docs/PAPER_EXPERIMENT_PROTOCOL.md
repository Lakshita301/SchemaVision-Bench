# Frozen pre-paid experiment rules — version 1

> **Superseded:** Future paid runs use
> [`PAPER_EXPERIMENT_PROTOCOL_V2.md`](PAPER_EXPERIMENT_PROTOCOL_V2.md) and
> `config/paper_protocol_v2.yaml`. Version 1 is retained as historical evidence.

Frozen 3 October 2026, before paid pilot/final outputs. This is an internal
prospective protocol, not a claim of external preregistration or publication acceptance.
Authoritative machine-readable rules: `config/paper_protocol_v1.yaml`.
Model purchases, keys and the final model roster remain deferred as requested.

## Question, architecture and tiers

The primary question is whether **image -> JSON -> SQL** improves executable
schema correctness over **image -> SQL**, within the same selected model.
Module 2 sees the image. Module 3 sees only the JSON, never the image or gold SQL.
Module 6 is the direct image-to-SQL baseline. Both arms receive the same external
gold-derived execution evaluation. There is no repair or LLM-check arm.

Verification does not modify generated SQL. Therefore this experiment can assess
verification's detection capability, but cannot claim that verification alone
improved the generated SQL. The two-arm contrast combines structured mediation
with an additional inference stage; it is not a token-matched causal isolation
of JSON alone. Report the cost/latency difference alongside quality.

- Tier 1: full keys and cardinality.
- Tier 2: PK/FK badges hidden, relationship lines retained.
- Tier 3: cardinality hidden, key badges retained.

Tier 3 is not necessarily a cumulative degradation of Tier 2. Compare each with
Tier 1 separately. Hidden information is intentional, not a dataset defect.
Missing PKs in the dataset SQL are valid ground truth, not automatically errors.
Upstream source differences alone do not authorize reconstructing this dataset.

## Selection and unresolved references

Keep the existing split: 76 development, 20 pilot and 618 final IDs, 714 common
IDs total. All three tiers of an ID remain together. All models and both arms
use the same fixed IDs. Do not replace failed or hard examples to improve scores.
The older plan's 715 figure is historical; the checked-in split is authoritative.
This is schema-ID grouping, not a demonstrated repository/source-family split.
Do not claim absence of near-duplicate or pretraining contamination without evidence.

No automatic exclusions are authorized. The default for unsupported dialects,
unresolved reference semantics or invalid fixtures is to **block launch**, not
count them as model errors or silently remove tests from CER. Independently
reviewed PostgreSQL references can be used only with recorded source/reference
hashes, semantics review and matching diagram meaning. Changing eligibility,
ground truth or split requires an explicit versioned amendment before model runs.

The compatibility check validates the evaluator against the existing reference,
not against a more complete upstream database. Module 1 is not rerun here.

## Attempts, failures and comparison fairness

One completed model response per stage. Zero JSON-validation retries and no
repair. Transport retries use the exact frozen profile and are logged separately.
Invalid JSON, truncated responses, empty completions and invalid generated SQL
are failures, not opportunities to regenerate until correct. A lost response or
unresolved transport charge is an incomplete infrastructure outcome to reconcile.
Do not publish an incomplete matrix as the final benchmark.

Finalize each model profile before its pilot: model ID, endpoint, image handling,
temperature, output/reasoning budget, JSON-mode capability, retries and pricing.
Use the same model family/profile across its two arms except documented endpoint
capability differences. Pilot changes require a new profile/prompt version; the
final set cannot be used for prompt tuning. Report model-selection reasons and
unavailable models; never select models by which support the desired conclusion.

## Endpoints and denominators

Primary endpoint: **macro all-artifact CER** (`macro_cer_all`), compared as
structured minus direct within each model on the complete paired matrix. Each
schema-tier outcome has equal weight; with three complete tiers each schema ID
has equal weight. Compilation/generation failures score zero. The current
implementation also assigns zero when there are no behavioral tests; report that
count explicitly, rather than interpreting zero as demonstrated constraint failure.

Mandatory companions: compile rate, conditional micro CER, unconditional gold-test
coverage, end-to-end success, valid-operation acceptance and invalid-operation
rejection. Conditional CER alone can hide compilation failures. Report structural
precision/recall/F1 for tables, columns, PK/FK and the supported other components,
per-constraint rates, parsing/generation failures, and latency/token/cost breakdowns.
IR metrics apply only to the structured arm; final-SQL metrics apply to both.
Empty structural categories are undefined, not automatically perfect.

Secondary robustness contrasts: Tier 1 minus Tier 2 and Tier 1 minus Tier 3,
paired by schema ID and reported separately by model/arm. A positive drop means
lower performance when information is hidden. Available text-similarity metrics
are descriptive; no claim that textual equality is semantic equality. CER is a
finite sampled-behavior measure, not a proof of complete relational equivalence.

## Statistics and permissible claims

Use 5,000 percentile-bootstrap replicates, seed 20260930, resampling schema IDs
with their matched tiers/arms together. Report paired effect sizes and pointwise
95% intervals for implemented endpoints. Fewer than 30 unique IDs is exploratory.
Degenerate intervals from all-zero/small samples are not proof of population certainty.

This protocol is **estimation-focused**: no hypothesis-test p-values or familywise
significance claims are planned. Multiple pointwise intervals must not be presented
as multiplicity-corrected tests. Adding confirmatory tests requires a prospective
amendment defining the comparison family and correction before final results.
Do not manufacture a single pooled cross-model "winner" endpoint; models are
replications of the architecture comparison, not independent schema observations.

## Freeze and reproduction

Both paper manifests pin this protocol's SHA-256. The orchestrator includes it
in the experiment fingerprint and refuses a changed/missing protocol for paper
runs. Snapshots include the protocol bytes and documentation. Changes require
a new pinned hash and cannot resume into an old incompatible experiment root.

Local compatibility checks and mutation evidence must be current for the final
implementation. Paid pilot quality/cost/resume validation happens only when
authorized. External domain review and a licensed public release remain research
deliverables, not things unit tests can certify.
