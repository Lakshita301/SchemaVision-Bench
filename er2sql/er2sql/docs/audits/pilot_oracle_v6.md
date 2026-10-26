# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 6/11.

DDL compiles: 6; all finite execution checks pass: 6; technical checks without warnings/blockers pass: 6; conversion review missing: 0.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0456 | False | 0/246 | 0 | False |
| schema_0463 | True | 22/22 | 0 | True |
| schema_0546 | True | 39/39 | 0 | True |
| schema_0609 | True | 158/158 | 0 | True |
| schema_0682 | True | 33/33 | 0 | True |
| schema_0704 | True | 129/129 | 0 | True |
| schema_0793 | True | 188/188 | 0 | True |
| schema_1106_148168 | False | 0/123 | 0 | False |
| schema_1167_099625 | False | 0/471 | 0 | False |
| schema_1206_432694 | False | 0/228 | 0 | False |
| schema_1244_213519 | False | 0/25 | 0 | False |

## Blocker details

### schema_0456

```text
syntax error at or near "("
LINE 36:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_1106_148168

```text
syntax error at or near "("
LINE 36:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_1167_099625

```text
type "varbinary" does not exist
LINE 14:     PERMISSIONS VARBINARY(2),
                         ^
```


### schema_1206_432694

```text
syntax error at or near "user"
LINE 124: create table user (
                       ^
```


### schema_1244_213519

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INT NOT NULL AUTO_INCREMENT,
                            ^
```


