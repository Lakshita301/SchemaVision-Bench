# Reference DDL timeout recheck

Diagnostic-only PostgreSQL recheck of the two reference schemas that had timed out at the original 5,000 ms statement limit. One attempt per schema at 30,000 ms; no LLM/API calls; the prior audit and launch gate were not changed.

| Schema | Previous result at 5,000 ms | Recheck at 30,000 ms | Verification tests |
|---|---|---|---:|
| `schema_0333` | SQLSTATE `57014` | DDL succeeded | 94/94 passed |
| `schema_0478` | SQLSTATE `57014` | DDL succeeded | 76/76 passed |

Both completed within the extended statement timeout, so the earlier failures were transient timeout instability rather than persistent DDL incompatibility. The recheck is retained as separate diagnostic evidence and does not rewrite the original audit.

The final evaluator version was rerun at 30,000 ms after the 15-schema edge-case fix and produced the same results. Machine-readable details: [`final_reference_timeout_30000ms_20261005_v4.json`](final_reference_timeout_30000ms_20261005_v4.json).
