# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 5/20.

DDL compiles: 9; all finite execution checks pass: 9; technical checks without warnings/blockers pass: 9; conversion review missing: 13.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0300 | True | 25/25 | 0 | True |
| schema_0310 | False | 0/46 | 0 | False |
| schema_0335 | True | 23/23 | 1 | False |
| schema_0499 | True | 42/42 | 0 | True |
| schema_0546 | True | 39/39 | 0 | True |
| schema_0635 | True | 65/65 | 0 | True |
| schema_0661 | False | 0/828 | 1 | False |
| schema_0778 | False | 0/37 | 1 | False |
| schema_0836 | True | 57/57 | 1 | False |
| schema_0909_091015 | False | 0/54 | 2 | False |
| schema_0921_180722 | False | 0/289 | 2 | False |
| schema_0937_462804 | True | 218/218 | 0 | True |
| schema_0973_254233 | True | 21/21 | 1 | False |
| schema_1008_176453 | True | 135/135 | 1 | False |
| schema_1010_080239 | False | 0/618 | 0 | False |
| schema_1061_295385 | False | 0/258 | 5 | False |
| schema_1116_107207 | False | 0/385 | 2 | False |
| schema_1152_259631 | False | 0/97 | 9 | False |
| schema_1175_025608 | False | 0/70 | 2 | False |
| schema_1264_630818 | False | 0/304 | 5 | False |

## Blocker details

### schema_0310

```text
syntax error at or near "user"
LINE 8:     user TEXT,
            ^
```


### schema_0335

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0661

```text
type "long" does not exist
LINE 238:     VALUE_ long,
                     ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0778

```text
syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0836

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0909_091015

```text
syntax error at or near "ON"
LINE 7: ..._at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE ...
                                                             ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0921_180722

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
           ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0973_254233

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1008_176453

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1010_080239

```text
there is no unique constraint matching given keys for referenced table "document_master"
```


### schema_1061_295385

```text
syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
```

- Normalization blocker: DOUBLE precision/scale has dialect-dependent rounding semantics; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1116_107207

```text
syntax error at or near "USING"
LINE 8:     KEY "st_idx" ("st") USING HASH
                                ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1152_259631

```text
relation "act_ru_variable" does not exist
```

- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1175_025608

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1264_630818

```text
syntax error at or near "ENGINE"
LINE 29: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
```

- Normalization blocker: ENUM/SET domain needs reviewed PostgreSQL representation; left unchanged.
- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

