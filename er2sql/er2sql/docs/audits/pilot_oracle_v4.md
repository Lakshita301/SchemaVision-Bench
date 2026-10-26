# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 8/20.

DDL compiles: 8; all finite execution checks pass: 8; technical checks without warnings/blockers pass: 8; conversion review missing: 11.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

Cancellation/timeout: one diagnostic recheck at the same limit; the original result remains authoritative and blocks launch.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0213 | False | 0/181 | 1 | False |
| schema_0412 | False | 0/219 | 1 | False |
| schema_0463 | True | 22/22 | 0 | True |
| schema_0517 | False | 0/22 | 0 | False |
| schema_0546 | True | 39/39 | 0 | True |
| schema_0574 | False | 0/128 | 1 | False |
| schema_0582 | False | 0/161 | 1 | False |
| schema_0609 | True | 158/158 | 0 | True |
| schema_0682 | True | 33/33 | 0 | True |
| schema_0997_686478 | False | 0/180 | 1 | False |
| schema_1052_673818 | False | 0/156 | 8 | False |
| schema_1106_148168 | True | 123/123 | 0 | True |
| schema_1167_099625 | True | 471/471 | 0 | True |
| schema_1206_432694 | True | 228/228 | 0 | True |
| schema_1211_489168 | False | 0/23 | 10 | False |
| schema_1212_302296 | False | 0/530 | 1 | False |
| schema_1244_213519 | True | 25/25 | 0 | True |
| schema_1277_676595 | False | 0/247 | 1 | False |
| schema_1281_497780 | False | 0/378 | 1 | False |
| schema_1316_174202 | False | 0/124 | 4 | False |

## Blocker details

### schema_0213

```text
there is no unique constraint matching given keys for referenced table "userdata"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0412

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0517

```text
type "status_type" does not exist
LINE 8: ...id SERIAL PRIMARY KEY, project_id INTEGER, status status_typ...
                                                             ^
```


### schema_0574

```text
syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0582

```text
syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COL...
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_0997_686478

```text
syntax error at or near "engine"
LINE 12: )engine=innodb;
          ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1052_673818

```text
syntax error at or near "precision"
LINE 92:     n_dprecission DOUBLE PRECISION precision     null,
                                            ^
```

- Could not determine data type for 'empty_types.et_id'.
- Could not determine data type for 'empty_types.data1'.
- Could not determine data type for 'empty_types.data2'.
- Normalization blocker: Ambiguous integer precision/scale: no type inferred.
- Normalization blocker: Could not determine data type for 'empty_types.et_id'.
- Normalization blocker: Could not determine data type for 'empty_types.data1'.
- Normalization blocker: Could not determine data type for 'empty_types.data2'.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1211_489168

```text
syntax error at or near "ENGINE"
LINE 6: ENGINE = $engine_type;
        ^
```

- Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Conflicting duplicate CREATE TABLE definitions for 't2'; authoritative definition is ambiguous.
- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- No isolated invalid-parent witness for FK t2.['f_id'] -> t1: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK t2.['f_id'] -> t1: no target-private columns or independent sibling parent.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't2'; authoritative definition is ambiguous.
- Normalization blocker: Unresolved engine template token; left unchanged.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1212_302296

```text
there is no unique constraint matching given keys for referenced table "partitions"
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1277_676595

```text
syntax error at or near "ENGINE"
LINE 76: ) ENGINE=innodb DEFAULT CHARACTER SET utf8 ;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1281_497780

```text
syntax error at or near "ENGINE"
LINE 71: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
           ^
```

- Changed reference lacks a passing policy-category approval or a matching named semantic review.

### schema_1316_174202

```text
syntax error at or near "FOREIGN"
LINE 95:  FOREIGN KEY (PaymentTypeId) REFERENCES PaymentType(Id),
          ^
```

- Unsupported CHECK expression on 'Administrator': 'len(password) >= 6' (unsupported CHECK operator)
- No isolated invalid-parent witness for FK Payment.['MemberId'] -> PaymentType: no target-private columns or independent sibling parent.
- No isolated invalid-parent witness for FK Payment.['MemberId'] -> Member: no target-private columns or independent sibling parent.
- Changed reference lacks a passing policy-category approval or a matching named semantic review.

