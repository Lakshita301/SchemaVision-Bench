# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 4/20.

DDL compiles: 7; all finite execution checks pass: 6; technical checks without warnings/blockers pass: 6; conversion review missing: 15.

Execution/technical checks are NOT proof of cross-dialect equivalence or conversion approval.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0213 | False | 0/181 | 1 | False |
| schema_0412 | False | 0/219 | 2 | False |
| schema_0463 | True | 22/22 | 0 | True |
| schema_0517 | False | 0/22 | 0 | False |
| schema_0546 | True | 39/39 | 0 | True |
| schema_0574 | False | 0/128 | 2 | False |
| schema_0582 | False | 0/161 | 4 | False |
| schema_0609 | True | 158/158 | 0 | True |
| schema_0682 | True | 33/33 | 0 | True |
| schema_0997_686478 | False | 0/180 | 1 | False |
| schema_1052_673818 | False | 0/156 | 9 | False |
| schema_1106_148168 | True | 123/123 | 1 | False |
| schema_1167_099625 | False | 0/471 | 2 | False |
| schema_1206_432694 | True | 225/228 | 1 | False |
| schema_1211_489168 | False | 0/25 | 4 | False |
| schema_1212_302296 | False | 0/530 | 1 | False |
| schema_1244_213519 | True | 25/25 | 1 | False |
| schema_1277_676595 | False | 0/247 | 1 | False |
| schema_1281_497780 | False | 0/378 | 1 | False |
| schema_1316_174202 | False | 0/124 | 4 | False |

## Blocker details

### schema_0213

```text
there is no unique constraint matching given keys for referenced table "userdata"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0412

```text
syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
          ^
```

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

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

- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0582

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Normalization blocker: Identity combined with a default/unsigned domain needs review; left unchanged.
- Normalization blocker: Unsigned/range semantics need explicit conversion; left unchanged.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0997_686478

```text
syntax error at or near "engine"
LINE 12: )engine=innodb;
          ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1052_673818

```text
syntax error at or near "NOT"
LINE 168:     et_id NOT NULL,
                    ^
```

- Could not determine data type for 'empty_types.et_id'.
- Could not determine data type for 'empty_types.data1'.
- Could not determine data type for 'empty_types.data2'.
- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Normalization blocker: Ambiguous integer precision/scale: no type inferred.
- Normalization blocker: Could not determine data type for 'empty_types.et_id'.
- Normalization blocker: Could not determine data type for 'empty_types.data1'.
- Normalization blocker: Could not determine data type for 'empty_types.data2'.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1106_148168

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1167_099625

```text
type "varbinary" does not exist
LINE 13:     PERMISSIONS VARBINARY(2),
                         ^
```

- Normalization blocker: Binary length/padding semantics need review; left unchanged.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1206_432694

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'wrong_constraint_rejection': 3}

### schema_1211_489168

```text
syntax error at or near "ENGINE"
LINE 6: ENGINE = $engine_type;
        ^
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Normalization blocker: Collation/template/automatic timestamp semantics require explicit review.
- Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1212_302296

```text
there is no unique constraint matching given keys for referenced table "skewed_string_list"
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1244_213519

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1277_676595

```text
syntax error at or near "ENGINE"
LINE 76: ) ENGINE="InnoDB" DEFAULT CHARACTER SET utf8 ;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1281_497780

```text
syntax error at or near "ENGINE"
LINE 71: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
           ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1316_174202

```text
syntax error at or near "FOREIGN"
LINE 95:  FOREIGN KEY (PaymentTypeId) REFERENCES PaymentType(Id),
          ^
```

- Unsupported CHECK expression on 'Administrator': 'len([PassWord]) >= 6' (unsupported CHECK operator)
- No isolated invalid-parent witness for overlapping FK Payment.['MemberId']; no target-private columns.
- No isolated invalid-parent witness for overlapping FK Payment.['MemberId']; no target-private columns.
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

