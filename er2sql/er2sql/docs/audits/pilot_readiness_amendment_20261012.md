# Pilot readiness amendment — 2026-10-12

## Decision

The readiness report's quality checks for at least 90% generation/valid-IR success
and zero truncations are diagnostic outcomes, not go/no-go gates for the final
comparison. The preregistered model-inclusion rule remains unchanged: include a
model when at least one arm reaches a 20% compile rate on the frozen readiness
pilot. Invalid IR and other model-produced failures remain visible in the
end-to-end metrics; they are not repaired or silently dropped.

Confirmed unusable provider truncation continues to follow the existing v6
selection policy: exclude that schema-tier cell from both arms only when the
truncation is confirmed, report the exclusion, and retain unaffected tiers.
This amendment removes the blanket pilot-level "no truncation" gate; it does
not change the cell-level policy.

Operational checks retained as launch gates are complete artifact accounting,
provider-usage capture for returned artifacts, manageable rate limits, and a
cost estimate. Resume observations and unresolved API attempts remain visible
in the report, but are not launch gates: the final run uses resume support, and
provider/API failures are recorded rather than mistaken for SQL-quality
failures.

## Scope and transparency

This is a prospective amendment made before the final run, after the readiness
report exposed that model-quality outcomes were being used as launch blockers
despite the protocol's model-inclusion rule and `no_quality_based_exclusions`
policy. The pilot results, prompt text, model outputs, scoring metrics, frozen
split, references, and 20% inclusion threshold are unchanged. No model call is
authorized or implied by this amendment. The pilot's JSON validity, compile,
truncation, retry, and cost results remain reported as observed.
