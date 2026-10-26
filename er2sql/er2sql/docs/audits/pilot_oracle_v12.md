# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 11/11.

DDL compiles: 11; all finite execution checks pass: 11; technical checks without warnings/blockers pass: 11; conversion review missing: 0.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0456 | True | 246/246 | 0 | True |
| schema_0463 | True | 22/22 | 0 | True |
| schema_0546 | True | 39/39 | 0 | True |
| schema_0609 | True | 158/158 | 0 | True |
| schema_0682 | True | 33/33 | 0 | True |
| schema_0704 | True | 129/129 | 0 | True |
| schema_0793 | True | 188/188 | 0 | True |
| schema_1106_148168 | True | 123/123 | 0 | True |
| schema_1167_099625 | True | 471/471 | 0 | True |
| schema_1206_432694 | True | 228/228 | 0 | True |
| schema_1244_213519 | True | 25/25 | 0 | True |

## Blocker details

