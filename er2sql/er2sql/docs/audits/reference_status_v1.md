# Reference-status manifest v1

This audit assigns each of the 714 frozen schemas one status before the final
model run. The original SQL files are unchanged. Status was determined from
original-source parsing and existing reference/loadability audits only; no
model outputs or quality scores were consulted.

The machine-readable dataset manifest is
[`reference_status_manifest_v1.csv`](../../data/reference_status_manifest_v1.csv).
It includes a `reference_status`, `reason_code`, source dialect, and source SQL
SHA-256 for every schema. Rebuild it from the SQL directory in
`config/config.yaml` with:

```powershell
.venv/Scripts/python.exe -m pip install -e ".[reference-audit]"
.venv/Scripts/python.exe scripts/build_reference_status_manifest.py
```

The audit parses source SQL with sqlglot 30.22.0 and checks for duplicate table
definitions, unresolved custom types/sequences, missing FK targets, and FK
targets without a declared unique/primary key. Existing v4 reason categories
for malformed SQL, unresolved ALTERs, duplicate definitions, non-unique FK
targets, SQLite metadata, and failed reference checks are retained. Additional
specific codes are used for missing FK targets, custom types, and sequences.

| Status | Count | Permitted use |
|---|---:|---|
| `executable_verified` | 275 | Headline PostgreSQL compile rate and CER |
| `structural_only` | 223 | Separate, optional structural-metrics table only |
| `defective` | 216 | No evaluation; released with reason code |
| Total | 714 | Full released corpus |

The frozen eligible evaluation population consists of 264 final and 11 pilot
schemas; all 275 loaded on PostgreSQL and passed the reference gate. The v5
development split contains 49 structural-only and 29 defective schemas; the
49 structural-only development schemas may be used for Module 2 prompt
development because this split is disjoint from pilot and final. The pilot
split contains 11 executable-verified, 7 structural-only, and 6 defective
schemas; the final split contains 264 executable-verified, 167
structural-only, and 181 defective schemas.

Each schema has one status and one or more reason codes. Defective reason
counts can overlap, so they do not sum to the defective-schema count:

| Status | Reason code | Count |
|---|---|---:|
| `structural_only` | `postgresql_ddl_execution_failure` | 195 |
| `structural_only` | `reference_test_generation_or_evaluator_limit` | 28 |
| `defective` | `source_foreign_key_targets_non_unique_column` | 160 |
| `defective` | `source_custom_type_missing` | 37 |
| `defective` | `malformed_or_unparseable_source_ddl` | 18 |
| `defective` | `source_sequence_missing` | 7 |
| `defective` | `unresolved_source_alter_operation` | 6 |
| `defective` | `conflicting_duplicate_source_table_definitions` | 5 |
| `defective` | `source_foreign_key_target_missing` | 7 |
| `defective` | `generated_reference_checks_failed` | 1 |
| `defective` | `sqlite_internal_metadata_not_application_schema` | 1 |
| `defective` | `other_reference_gate_failure` | 1 |

Track rules are pinned in protocol v6: no pooling, no after-results movement,
and no MySQL verifier. Structural-only evaluation is optional and occurs only
after the primary run if budget permits. A source that sqlglot cannot parse in
the tested dialect set is conservatively marked defective; this may reflect a
parser-coverage limit, not necessarily invalid SQL as written by its author.
