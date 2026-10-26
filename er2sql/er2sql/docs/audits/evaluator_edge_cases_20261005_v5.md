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
| `schema_1112_007491` | pass | 730/732 | 0 |
| `schema_1173_307431` | pass | 107/107 | 0 |
| `schema_1224_512880` | pass | 23/25 | 27 |
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

### schema_1224_512880
- **check_constraint_accept_valid / WorksFor**: wrong_constraint_rejection; target matched=None. insert or update on table "worksfor" violates foreign key constraint "worksfor_department_fkey"
DETAIL:  Key (department)=(l_6) is not present in table "departments".
- **check_constraint_accept_valid / WorksFor**: wrong_constraint_rejection; target matched=None. insert or update on table "worksfor" violates foreign key constraint "worksfor_department_fkey"
DETAIL:  Key (department)=(l_6) is not present in table "departments".
- Warning: Could not synthesize a base row for the PK test on 'Employees'.
- Warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Warning: No isolated valid CHECK witness for Employees: 'hoursPweek <=168'
- Warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Warning: No isolated invalid CHECK witness for Employees: 'hoursPweek <=168'
- Warning: No isolated valid CHECK witness for Employees: 'hoursPweek > 0'
- Warning: No isolated invalid CHECK witness for Employees: 'hoursPweek > 0'
- Warning: No isolated valid CHECK witness for Employees: "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'"
- Warning: No isolated invalid CHECK witness for Employees: "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'"
- Warning: Could not synthesize a base row for the PK test on 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No isolated valid CHECK witness for Departments: "id LIKE '[0-9][0-9][0-9]'"
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No isolated invalid CHECK witness for Departments: "id LIKE '[0-9][0-9][0-9]'"
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: Could not synthesize a parent row in 'Departments' for the FK-accept test on 'DeptMissions'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; using a best-effort dummy value.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: Could not synthesize a parent row in 'Departments' for the FK-accept test on 'WorksFor'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; using a best-effort dummy value.

### schema_1315_574283
- Warning: Unsupported CHECK expression on 'series': 'pays is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'series': 'dateS is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'utilisateur': 'dateI is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'episode': 'datedif is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'staff': 'nom is not null' (unsupported CHECK operator)
- Warning: Unsupported CHECK expression on 'staff': 'prenom is not null' (unsupported CHECK operator)

