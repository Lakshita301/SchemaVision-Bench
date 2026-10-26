# Module 4/5 evaluator edge-case revalidation

Local PostgreSQL verification of the fixed known edge-case references. No model/API calls were made. This diagnostic does not update the launch gate or rewrite candidate/original SQL.

- Protocol: `target_attribution_v6`
- PostgreSQL statement timeout: 5000 ms
- Schemas checked: 14; DDL compiled: 14/14; all generated tests passed: 7/14

| Schema | DDL | Tests passed | Warnings |
|---|---:|---:|---:|
| `schema_0198` | pass | 126/126 | 0 |
| `schema_0482` | pass | 95/95 | 1 |
| `schema_0503` | pass | 525/525 | 0 |
| `schema_0521` | pass | 0/54 | 1 |
| `schema_0612` | pass | 68/70 | 0 |
| `schema_0871` | pass | 510/514 | 0 |
| `schema_0899` | pass | 1373/1375 | 0 |
| `schema_0933_155171` | pass | 453/453 | 0 |
| `schema_0984_334739` | pass | 78/79 | 0 |
| `schema_1101_650753` | pass | 152/152 | 4 |
| `schema_1112_007491` | pass | 729/732 | 0 |
| `schema_1173_307431` | pass | 107/107 | 0 |
| `schema_1224_512880` | pass | 21/34 | 18 |
| `schema_1315_574283` | pass | 108/108 | 6 |

## Remaining failed tests and warnings

### schema_0482
- Warning: No isolated invalid CHECK witness for shopping_list_item: 'length(id) = 36'

### schema_0521
- **table_exists / regimen**: missing_table; target matched=None. relation "regimen" does not exist
LINE 1: SELECT * FROM "regimen" LIMIT 0;
                      ^
- **column_exists / regimen**: missing_table; target matched=None. relation "regimen" does not exist
LINE 1: SELECT "id_regimen" FROM "regimen" LIMIT 0;
                                 ^
- **column_exists / regimen**: missing_table; target matched=None. relation "regimen" does not exist
LINE 1: SELECT "regimen" FROM "regimen" LIMIT 0;
                              ^
- **column_exists / regimen**: missing_table; target matched=None. relation "regimen" does not exist
LINE 1: SELECT "id_area_area" FROM "regimen" LIMIT 0;
                                   ^
- **table_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT * FROM "lugar_de_parto" LIMIT 0;
                      ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "id_lugar" FROM "lugar_de_parto" LIMIT 0;
                               ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "inst_salud" FROM "lugar_de_parto" LIMIT 0;
                                 ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "domicilio" FROM "lugar_de_parto" LIMIT 0;
                                ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "otro" FROM "lugar_de_parto" LIMIT 0;
                           ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "sin_informacion" FROM "lugar_de_parto" LIMIT 0;
                                      ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "total" FROM "lugar_de_parto" LIMIT 0;
                            ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "ano" FROM "lugar_de_parto" LIMIT 0;
                          ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "id_regimen_regimen" FROM "lugar_de_parto" LIMIT 0;
                                         ^
- **column_exists / lugar_de_parto**: missing_table; target matched=None. relation "lugar_de_parto" does not exist
LINE 1: SELECT "id_area_area_regimen" FROM "lugar_de_parto" LIMIT 0;
                                           ^
- **table_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT * FROM "tipo_de_parto" LIMIT 0;
                      ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "id_tipo" FROM "tipo_de_parto" LIMIT 0;
                              ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "cesarea" FROM "tipo_de_parto" LIMIT 0;
                              ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "espontaneo" FROM "tipo_de_parto" LIMIT 0;
                                 ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "instrumentado" FROM "tipo_de_parto" LIMIT 0;
                                    ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "sin_informacion" FROM "tipo_de_parto" LIMIT 0;
                                      ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "total" FROM "tipo_de_parto" LIMIT 0;
                            ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "ano" FROM "tipo_de_parto" LIMIT 0;
                          ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "id_regimen_regimen" FROM "tipo_de_parto" LIMIT 0;
                                         ^
- **column_exists / tipo_de_parto**: missing_table; target matched=None. relation "tipo_de_parto" does not exist
LINE 1: SELECT "id_area_area_regimen" FROM "tipo_de_parto" LIMIT 0;
                                           ^
- **table_exists / area**: missing_table; target matched=None. relation "area" does not exist
LINE 1: SELECT * FROM "area" LIMIT 0;
                      ^
- **column_exists / area**: missing_table; target matched=None. relation "area" does not exist
LINE 1: SELECT "id_area" FROM "area" LIMIT 0;
                              ^
- **column_exists / area**: missing_table; target matched=None. relation "area" does not exist
LINE 1: SELECT "nombre" FROM "area" LIMIT 0;
                             ^
- **primary_key_duplicate_rejected / regimen**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **not_null_reject_null / regimen**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **foreign_key_reject_invalid_parent / regimen**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **foreign_key_accept_valid_parent / regimen**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **cascade_behavior / regimen**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **primary_key_duplicate_rejected / lugar_de_parto**: missing_table; target matched=None. setup failed: relation "lugar_de_parto" does not exist
LINE 1: INSERT INTO "lugar_de_parto" ("id_lugar", "inst_salud", "dom...
                    ^
- **not_null_reject_null / lugar_de_parto**: missing_table; target matched=False. relation "lugar_de_parto" does not exist
LINE 1: INSERT INTO "lugar_de_parto" ("inst_salud", "id_lugar", "dom...
                    ^
- **not_null_reject_null / lugar_de_parto**: missing_table; target matched=False. relation "lugar_de_parto" does not exist
LINE 1: INSERT INTO "lugar_de_parto" ("domicilio", "id_lugar", "inst...
                    ^
- **not_null_reject_null / lugar_de_parto**: missing_table; target matched=False. relation "lugar_de_parto" does not exist
LINE 1: INSERT INTO "lugar_de_parto" ("otro", "id_lugar", "inst_salu...
                    ^
- **not_null_reject_null / lugar_de_parto**: missing_table; target matched=False. relation "lugar_de_parto" does not exist
LINE 1: INSERT INTO "lugar_de_parto" ("sin_informacion", "id_lugar",...
                    ^
- **not_null_reject_null / lugar_de_parto**: missing_table; target matched=False. relation "lugar_de_parto" does not exist
LINE 1: INSERT INTO "lugar_de_parto" ("total", "id_lugar", "inst_sal...
                    ^
- **not_null_reject_null / lugar_de_parto**: missing_table; target matched=False. relation "lugar_de_parto" does not exist
LINE 1: INSERT INTO "lugar_de_parto" ("ano", "id_lugar", "inst_salud...
                    ^
- **foreign_key_reject_invalid_parent / lugar_de_parto**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **foreign_key_accept_valid_parent / lugar_de_parto**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **cascade_behavior / lugar_de_parto**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **primary_key_duplicate_rejected / tipo_de_parto**: missing_table; target matched=None. setup failed: relation "tipo_de_parto" does not exist
LINE 1: INSERT INTO "tipo_de_parto" ("id_tipo", "cesarea", "espontan...
                    ^
- **not_null_reject_null / tipo_de_parto**: missing_table; target matched=False. relation "tipo_de_parto" does not exist
LINE 1: INSERT INTO "tipo_de_parto" ("cesarea", "id_tipo", "espontan...
                    ^
- **not_null_reject_null / tipo_de_parto**: missing_table; target matched=False. relation "tipo_de_parto" does not exist
LINE 1: INSERT INTO "tipo_de_parto" ("espontaneo", "id_tipo", "cesar...
                    ^
- **not_null_reject_null / tipo_de_parto**: missing_table; target matched=False. relation "tipo_de_parto" does not exist
LINE 1: INSERT INTO "tipo_de_parto" ("instrumentado", "id_tipo", "ce...
                    ^
- **not_null_reject_null / tipo_de_parto**: missing_table; target matched=False. relation "tipo_de_parto" does not exist
LINE 1: INSERT INTO "tipo_de_parto" ("sin_informacion", "id_tipo", "...
                    ^
- **not_null_reject_null / tipo_de_parto**: missing_table; target matched=False. relation "tipo_de_parto" does not exist
LINE 1: INSERT INTO "tipo_de_parto" ("total", "id_tipo", "cesarea", ...
                    ^
- **not_null_reject_null / tipo_de_parto**: missing_table; target matched=False. relation "tipo_de_parto" does not exist
LINE 1: INSERT INTO "tipo_de_parto" ("ano", "id_tipo", "cesarea", "e...
                    ^
- **foreign_key_reject_invalid_parent / tipo_de_parto**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **foreign_key_accept_valid_parent / tipo_de_parto**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **cascade_behavior / tipo_de_parto**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **primary_key_duplicate_rejected / area**: missing_table; target matched=None. setup failed: relation "area" does not exist
LINE 1: INSERT INTO "area" ("id_area", "nombre") OVERRIDING SYSTEM V...
                    ^
- **not_null_reject_null / area**: missing_table; target matched=False. relation "area" does not exist
LINE 1: INSERT INTO "area" ("nombre", "id_area") OVERRIDING SYSTEM V...
                    ^
- Warning: Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).

### schema_0612
- **foreign_key_reject_invalid_parent / salaries**: expected_rejection_missing; target matched=None. Inserting a row into 'salaries' with ['emp_no'] pointing to a non-existent row in 'employees' should be rejected.
- **foreign_key_reject_invalid_parent / titles**: expected_rejection_missing; target matched=None. Inserting a row into 'titles' with ['emp_no'] pointing to a non-existent row in 'employees' should be rejected.

### schema_0871
- **cascade_behavior / Connections**: wrong_constraint_rejection; target matched=False. update or delete on table "Instances" violates foreign key constraint "fk_Connections_Instances" on table "Connections"
DETAIL:  Key (InstanceID)=(1001) is still referenced from table "Connections".
- **cascade_behavior / Connections**: wrong_constraint_rejection; target matched=False. update or delete on table "Instances" violates foreign key constraint "fk_Connections_Instances" on table "Connections"
DETAIL:  Key (InstanceID)=(1001) is still referenced from table "Connections".
- **cascade_behavior / Mappings**: wrong_constraint_rejection; target matched=False. update or delete on table "Sources" violates foreign key constraint "fk_Datasets_Sources" on table "Datasets"
DETAIL:  Key (SourceID)=(1001) is still referenced from table "Datasets".
- **cascade_behavior / MultiAttributeSeries**: wrong_constraint_rejection; target matched=False. update or delete on table "DataValuesMapper" violates foreign key constraint "fk_MultiAttributeSeries_DataValuesMapper" on table "MultiAttributeSeries"
DETAIL:  Key (DataValuesMapperID)=(1001) is still referenced from table "MultiAttributeSeries".

### schema_0899
- **check_constraint_reject_invalid / sec_security**: unexpected_database_error; target matched=False. invalid input syntax for type timestamp: ""
LINE 1: ...SYSTEM VALUE VALUES (1001, '2024-01-01 00:00:02', '', '2024-...
                                                             ^
- **check_constraint_reject_invalid / sec_security**: unexpected_database_error; target matched=False. invalid input syntax for type timestamp: ""
LINE 1: ...2', '2024-01-01 00:00:03', '2024-01-01 00:00:04', '', 'val_6...
                                                             ^

### schema_0984_334739
- **foreign_key_reject_invalid_parent / plot_checks**: expected_rejection_missing; target matched=None. Inserting a row into 'plot_checks' with ['lab_id'] pointing to a non-existent row in 'labs' should be rejected.

### schema_1101_650753
- Warning: No isolated invalid-parent witness for overlapping FK Earned.['BadgeID']; no target-private columns.
- Warning: No isolated invalid-parent witness for overlapping FK Earned.['UserID']; no target-private columns.
- Warning: No isolated invalid-parent witness for overlapping FK Earned.['UserID']; no target-private columns.
- Warning: No isolated invalid-parent witness for overlapping FK Earned.['BadgeID']; no target-private columns.

### schema_1112_007491
- **unique_reject_duplicate / inputs**: expected_rejection_missing; target matched=None. Composite UNIQUE ['src_unit', 'src_message_index', 'src_output_index', 'is_unique'] rejects duplicate tuple.
- **unique_reject_duplicate / inputs**: expected_rejection_missing; target matched=None. Composite UNIQUE ['asset', 'denomination', 'serial_number', 'address', 'is_unique'] rejects duplicate tuple.
- **unique_reject_duplicate / asset_metadata**: setup_failure; target matched=None. setup failed: duplicate key value violates unique constraint "assets_pkey"
DETAIL:  Key (unit)=(val_17                                      ) already exists.

### schema_1224_512880
- **primary_key_duplicate_rejected / Employees**: setup_failure; target matched=None. setup failed: new row for relation "employees" violates check constraint "employees_tfn_check"
DETAIL:  Failing row contains (val_1      , val_2, val_3, 5).
- **primary_key_duplicate_rejected / Departments**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_1, val_2, val_3      ).
- **unique_reject_duplicate / Departments**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_1, val_2, val_3      ).
- **unique_reject_duplicate / Departments**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_1, val_2, val_3      ).
- **foreign_key_reject_invalid_parent / DeptMissions**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_1, val_2, val_3      ).
- **foreign_key_accept_valid_parent / DeptMissions**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_1, val_2, val_3      ).
- **not_null_reject_null / WorksFor**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_2, val_3, val_4      ).
- **foreign_key_reject_invalid_parent / WorksFor**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_1, val_2, val_3      ).
- **foreign_key_accept_valid_parent / WorksFor**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_1, val_2, val_3      ).
- **check_constraint_accept_valid / WorksFor**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_3, val_4, val_5      ).
- **check_constraint_reject_invalid / WorksFor**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_3, val_4, val_5      ).
- **check_constraint_accept_valid / WorksFor**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_3, val_4, val_5      ).
- **check_constraint_reject_invalid / WorksFor**: setup_failure; target matched=None. setup failed: new row for relation "departments" violates check constraint "departments_id_check"
DETAIL:  Failing row contains (l_3, val_4, val_5      ).
- Warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Warning: No isolated valid CHECK witness for Employees: 'hoursPweek <=168'
- Warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Warning: No isolated invalid CHECK witness for Employees: 'hoursPweek <=168'
- Warning: No isolated valid CHECK witness for Employees: 'hoursPweek > 0'
- Warning: No isolated invalid CHECK witness for Employees: 'hoursPweek > 0'
- Warning: No isolated valid CHECK witness for Employees: "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'"
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No isolated valid CHECK witness for Departments: "id LIKE '[0-9][0-9][0-9]'"
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.

### schema_1315_574283
- Warning: Unsupported CHECK expression on 'series': 'pays is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'series': 'dateS is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'utilisateur': 'dateI is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'episode': 'datedif is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'staff': 'nom is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'staff': 'prenom is not null' (unsupported CHECK operator)

