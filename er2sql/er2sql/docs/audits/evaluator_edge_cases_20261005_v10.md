# Module 4/5 evaluator edge-case revalidation

Local PostgreSQL verification of the fixed known edge-case references. No model/API calls were made. This diagnostic does not update the launch gate or rewrite candidate/original SQL.

- Protocol: `target_attribution_v6`
- PostgreSQL statement timeout: 5000 ms
- Schemas checked: 15; DDL compiled: 15/15; all generated tests passed: 15/15; schemas with parser/generator warnings: 6/15.
- A passing test count applies only to tests that could be generated. Warnings identify omitted/non-isolatable checks; they are not treated as passed.

## Interpretation notes

- `schema_1224_512880` contains `LIKE` bracket patterns on `CHAR(11)`/`CHAR(3)` columns that are not satisfiable under PostgreSQL `LIKE` semantics. The constrained fixtures are therefore omitted, not credited; this source/reference dialect issue needs review before using the schema in a paper run.
- `schema_1206_432694` is the additional pilot-split case. Its interacting delete actions are accepted only when the rejection is attributable to the intended relationship.
- Overlapping-FK negative tests are omitted when another required relationship guarantees the target parent or no independent sibling parent can be synthesized. Those cases are warnings, not passes.
- More generally, any parser/generator warning means the schema has incomplete generated-test coverage and must not be described as fully validated.

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
| `schema_1112_007491` | pass | 732/732 | 0 |
| `schema_1173_307431` | pass | 107/107 | 0 |
| `schema_1224_512880` | pass | 20/20 | 31 |
| `schema_1315_574283` | pass | 114/114 | 6 |
| `schema_1206_432694` | pass | 228/228 | 0 |

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

### schema_1224_512880
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
- Warning: table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; no fixture was generated.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: Could not synthesize a parent row in 'Departments' for the FK-accept test on 'WorksFor'.
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: No isolated valid CHECK witness for WorksFor: 'percentage > 0'
- Warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Warning: table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; no fixture was generated.
- Warning: No isolated invalid CHECK witness for WorksFor: 'percentage > 0'
- Warning: No isolated valid CHECK witness for WorksFor: 'percentage <= 100'
- Warning: No isolated invalid CHECK witness for WorksFor: 'percentage <= 100'

### schema_1315_574283
- Warning: No isolated invalid CHECK witness for series: 'pays is not null'
- Warning: No isolated invalid CHECK witness for series: 'dateS is not null'
- Warning: No isolated invalid CHECK witness for utilisateur: 'dateI is not null'
- Warning: No isolated invalid CHECK witness for episode: 'datedif is not null'
- Warning: No isolated invalid CHECK witness for staff: 'nom is not null'
- Warning: No isolated invalid CHECK witness for staff: 'prenom is not null'

