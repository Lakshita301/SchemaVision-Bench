# Reference oracle audit

Local PostgreSQL only; no LLM calls. Complete: True. Passed: 4/20.

| Schema | DDL | Passed/planned | Warnings | Gate |
|---|---|---:|---:|---|
| schema_0213 | False | 0/163 | 1 | False |
| schema_0412 | False | 0/219 | 1 | False |
| schema_0463 | True | 22/22 | 0 | True |
| schema_0517 | False | 0/22 | 0 | False |
| schema_0546 | True | 39/39 | 0 | True |
| schema_0574 | False | 0/128 | 1 | False |
| schema_0582 | False | 0/161 | 1 | False |
| schema_0609 | True | 158/158 | 0 | True |
| schema_0682 | True | 33/33 | 0 | True |
| schema_0997_686478 | False | 0/180 | 1 | False |
| schema_1052_673818 | False | 0/156 | 4 | False |
| schema_1106_148168 | True | 121/123 | 1 | False |
| schema_1167_099625 | False | 0/471 | 1 | False |
| schema_1206_432694 | False | 0/228 | 0 | False |
| schema_1211_489168 | False | 0/25 | 1 | False |
| schema_1212_302296 | False | 0/530 | 1 | False |
| schema_1244_213519 | False | 0/23 | 1 | False |
| schema_1277_676595 | False | 0/247 | 1 | False |
| schema_1281_497780 | False | 0/378 | 1 | False |
| schema_1316_174202 | False | 0/126 | 2 | False |

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

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0517

```text
type "status_type" does not exist
LINE 8: ...id SERIAL PRIMARY KEY, project_id INTEGER, status status_typ...
                                                             ^
```


### schema_0574

```text
syntax error at or near "AUTO_INCREMENT"
LINE 4:     "id" int NOT NULL AUTO_INCREMENT,
                              ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0582

```text
syntax error at or near "unsigned"
LINE 4:     "id" int unsigned NOT NULL AUTO_INCREMENT,
                     ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_0997_686478

```text
syntax error at or near "auto_increment"
LINE 5:     SUPPLIER_ID int not null auto_increment,
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
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1106_148168

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.
- Failed test categories: {'expected_rejection_missing': 2}

### schema_1167_099625

```text
type "varbinary" does not exist
LINE 13:     PERMISSIONS VARBINARY(2),
                         ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1206_432694

```text
syntax error at or near "user"
LINE 124: create table user (
                       ^
```


### schema_1211_489168

```text
syntax error at or near "ENGINE"
LINE 5: ENGINE = $engine_type;
        ^
```

- Duplicate CREATE TABLE names: source contains multiple schema variants; review required.

### schema_1212_302296

```text
type "number" does not exist
LINE 7:     NEXT_VAL NUMBER NOT NULL
                     ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1244_213519

```text
syntax error at or near "AUTO_INCREMENT"
LINE 5:     id INT NOT NULL AUTO_INCREMENT,
                            ^
```

- Could not parse inline ground-truth foreign key: 'manager_id INT references employee'

### schema_1277_676595

```text
syntax error at or near "AUTO_INCREMENT"
LINE 4:     "menu_id" bigint NOT NULL AUTO_INCREMENT,
                                      ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1281_497780

```text
syntax error at or near "AUTO_INCREMENT"
LINE 4:     "id" bigint NOT NULL AUTO_INCREMENT,
                                 ^
```

- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

### schema_1316_174202

```text
syntax error at or near "Identity"
LINE 13:     Id int Identity(1,1) Primary Key Not Null,
                    ^
```

- Unsupported CHECK expression on 'Administrator': 'len([PassWord]) >= 6' (unsupported CHECK operator)
- Converted reference requires semantic review with matching source/reference hashes, reviewer and notes.

