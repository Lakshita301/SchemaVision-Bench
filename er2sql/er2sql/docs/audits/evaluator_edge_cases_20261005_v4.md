# Module 4/5 evaluator edge-case revalidation

Local PostgreSQL verification of the fixed known edge-case references. No model/API calls were made. This diagnostic does not update the launch gate or rewrite candidate/original SQL.

- Protocol: `target_attribution_v6`
- PostgreSQL statement timeout: 5000 ms
- Schemas checked: 14; DDL compiled: 14/14; all generated tests passed: 12/14

| Schema | DDL | Tests passed | Warnings |
|---|---:|---:|---:|
| `schema_0198` | pass | 126/126 | 0 |
| `schema_0482` | pass | 94/94 | 0 |
| `schema_0503` | pass | 525/525 | 0 |
| `schema_0521` | pass | 54/54 | 1 |
| `schema_0612` | pass | 68/68 | 2 |
| `schema_0871` | pass | 514/514 | 0 |
| `schema_0899` | pass | 1375/1375 | 0 |
| `schema_0933_155171` | pass | 453/453 | 0 |
| `schema_0984_334739` | pass | 78/78 | 1 |
| `schema_1101_650753` | pass | 152/152 | 4 |
| `schema_1112_007491` | pass | 729/732 | 0 |
| `schema_1173_307431` | pass | 107/107 | 0 |
| `schema_1224_512880` | pass | 21/34 | 18 |
| `schema_1315_574283` | pass | 108/108 | 6 |

## Remaining failed tests and warnings

### schema_0521
- Warning: Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).

### schema_0612
- Warning: No isolated invalid-parent witness for FK salaries.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.
- Warning: No isolated invalid-parent witness for FK titles.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.

### schema_0984_334739
- Warning: No isolated invalid-parent witness for FK plot_checks.['lab_id'] -> labs: a sibling relationship already guarantees the target parent.

### schema_1101_650753
- Warning: No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.
- Warning: No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- Warning: No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- Warning: No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.

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

