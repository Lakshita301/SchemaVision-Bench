# Evaluator mutation validation

Local PostgreSQL; zero LLM calls.

Reference passed: True. Wrong-constraint false-positive control passed: True.

| Deliberate defect | Expected detector | Detected |
|---|---|---|
| missing_pk | primary_key_duplicate_rejected | True |
| missing_not_null | not_null_reject_null | True |
| missing_unique | unique_reject_duplicate | True |
| missing_composite_unique | unique_reject_duplicate | True |
| missing_check | check_constraint_reject_invalid | True |
| missing_fk | foreign_key_reject_invalid_parent | True |
| wrong_fk_target | foreign_key_accept_valid_parent | True |
| wrong_delete_action | cascade_behavior | True |
| overrestrictive_check | check_constraint_accept_valid | True |

## Independent hand-authored controls

These bypass the gold parser and test generator, avoiding a shared-parser-only acceptance check.

| Control | Expected outcome verified |
|---|---|
| composite_pk | True |
| composite_pk_missing | True |
| composite_fk | True |
| composite_fk_swapped | True |
| deferred_fk | True |
| deferred_setup_failure | True |
| delete_restrict | True |
| wrong_fk_delete_rejection | True |
| composite_set_null | True |
| partial_set_null_mutant | True |
| wrong_not_null_column | True |
| wrong_check_column | True |
| missing_target_metadata | True |
| null_semantics | True |
| savepoint_isolation | True |

These finite controls test sensitivity and acceptance, not complete semantic equivalence.
