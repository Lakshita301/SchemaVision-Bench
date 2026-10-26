# PostgreSQL setup for paper runs

Paper model profiles connect to a dedicated database, `er2sql_paper_verify`,
as the non-superuser role `er2sql_runner`. Generated DDL is evaluated in a
per-artifact schema inside that otherwise empty database. Module 5 runs each
artifact in a transaction and rolls it back. Do not use the cluster's
`postgres` superuser as the model-run connection.

## One-time administrator setup

The one-time provisioner reads `POSTGRES_PASSWORD` and
`ER2SQL_VERIFY_DB_PASSWORD` from the ignored local `.env`. It creates a
non-login owner role, isolated database, and login role with no
superuser/database/role-creation privileges. It does not drop or overwrite
existing objects; it intentionally stops without changes if a target role or
database already exists. Run from the repository root:

```powershell
python scripts/postgres/provision_paper_verification.py
```

The script verifies the runtime role, confirms it is not a superuser and cannot
create roles/databases, and performs a create/insert/rollback smoke test. It
prints no passwords.

Put that password in the local, ignored `.env` file as:

```dotenv
ER2SQL_VERIFY_DB_PASSWORD=<strong unique secret>
```

The v3 manifests' model profiles now use this environment variable and
database. The regular application config was updated to the same target.

## Validation gate before paid runs

After provisioning and setting the password, verify using the same profile the
experiment will use:

1. Confirm `er2sql_runner` is not a superuser and can connect only to the
   dedicated verification database.
2. Run the PostgreSQL integration and evaluator mutation suites using that
   role. Confirm schema creation, DDL execution, rollback, PK/FK/NOT NULL/
   UNIQUE/CHECK tests, and failure attribution still pass.
3. Confirm no application schema/object was created outside the
   `er2sql_verify_*` namespaces, then save the test output with the run record.

The privilege change is represented in config and this setup recipe; it is not
considered validated until those local checks pass under `er2sql_runner`.

## Local validation record — 6 October 2026

The isolated database and role were provisioned and smoke-tested successfully.
The role is non-superuser, cannot create databases or roles, and can create
verification schemas in the dedicated database. A temporary schema/table
transaction rolled back with no residue.

Using the configured `er2sql_runner` profile against PostgreSQL 18.6:

- PostgreSQL integration and evaluator validation: **14 passed**, including 17
  subtests; no model calls.
- Mutation evidence: **9/9 deliberate schema mutations**, **15/15 independent
  controls**, and the wrong-constraint/same-SQLSTATE false-positive control all
  passed; no model calls.
- Machine-readable record: [`evaluator_mutations_v3.json`](audits/evaluator_mutations_v3.json)
  and [human-readable report](audits/evaluator_mutations_v3.md).

This validates the bounded implemented cases, not all possible SQL or schema
semantics. Re-run these checks if the verifier, database profiles, or evaluator
protocol changes before the paid run.
