# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 5/20.

DDL compiles: 5; all finite execution checks pass: 5; technical checks without warnings/blockers pass: 5; conversion review missing: 0.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0300 | True | 25/25 | 0 | True |
| schema_0310 | False | 0/46 | 0 | False |
| schema_0335 | False | 0/23 | 0 | False |
| schema_0499 | True | 42/42 | 0 | True |
| schema_0546 | True | 39/39 | 0 | True |
| schema_0635 | True | 65/65 | 0 | True |
| schema_0661 | False | 0/828 | 0 | False |
| schema_0778 | False | 0/37 | 0 | False |
| schema_0836 | False | 0/57 | 0 | False |
| schema_0909_091015 | False | 0/54 | 0 | False |
| schema_0921_180722 | False | 0/289 | 0 | False |
| schema_0937_462804 | True | 218/218 | 0 | True |
| schema_0973_254233 | False | 0/21 | 0 | False |
| schema_1008_176453 | False | 0/135 | 0 | False |
| schema_1010_080239 | False | 0/618 | 0 | False |
| schema_1061_295385 | False | 0/258 | 0 | False |
| schema_1116_107207 | False | 0/385 | 0 | False |
| schema_1152_259631 | False | 0/97 | 4 | False |
| schema_1175_025608 | False | 0/70 | 0 | False |
| schema_1264_630818 | False | 0/304 | 0 | False |

## Blocker details

### schema_0310

```text
syntax error at or near "user"
LINE 8:     user TEXT,
            ^
```


### schema_0335

```text
syntax error at or near "ENGINE"
LINE 18: ) ENGINE = MEMORY;
           ^
```


### schema_0661

```text
type "longvarbinary" does not exist
LINE 16:     BYTES_ longvarbinary,
                    ^
```


### schema_0778

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `role` (
                     ^
```


### schema_0836

```text
syntax error at or near "AUTOINCREMENT"
LINE 5:     id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                                            ^
```


### schema_0909_091015

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `groups` (
                     ^
```


### schema_0921_180722

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `broker` (
                     ^
```


### schema_0973_254233

```text
type "varchar2" does not exist
LINE 6: Cli_lname varchar2(10),
                  ^
```


### schema_1008_176453

```text
syntax error at or near "("
LINE 27:     NEXT_FIRE_TIME BIGINT(13) NULL,
                                  ^
```


### schema_1010_080239

```text
there is no unique constraint matching given keys for referenced table "document_master"
```


### schema_1061_295385

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `admins` (
                     ^
```


### schema_1116_107207

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `ActionStrings` (
                     ^
```


### schema_1152_259631

```text
type "nvarchar2" does not exist
LINE 5:     ID_ NVARCHAR2(64) NOT NULL,
                ^
```

- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'

### schema_1175_025608

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```


### schema_1264_630818

```text
syntax error at or near "`"
LINE 4: CREATE TABLE `doctor` (
                     ^
```


