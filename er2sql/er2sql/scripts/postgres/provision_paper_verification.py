"""Provision and smoke-test the isolated, least-privilege paper DB.

Run from the repository root after setting POSTGRES_PASSWORD and
ER2SQL_VERIFY_DB_PASSWORD in the ignored local .env file. This is deliberately
fail-closed: it refuses to alter any target role/database that already exists.
"""
from __future__ import annotations

import sys
import uuid
from pathlib import Path

import psycopg2
from dotenv import dotenv_values
from psycopg2 import sql


ROOT = Path(__file__).resolve().parents[2]
DB_NAME = "er2sql_paper_verify"
OWNER_ROLE = "er2sql_verify_owner"
RUNNER_ROLE = "er2sql_runner"


def main() -> int:
    env = dotenv_values(ROOT / ".env")
    admin_password = env.get("POSTGRES_PASSWORD")
    runner_password = env.get("ER2SQL_VERIFY_DB_PASSWORD")
    if not admin_password or not runner_password:
        print("ERROR: set POSTGRES_PASSWORD and ER2SQL_VERIFY_DB_PASSWORD in .env", file=sys.stderr)
        return 2

    admin = psycopg2.connect(
        host="localhost", port=5432, dbname="postgres", user="postgres",
        password=admin_password, connect_timeout=5,
    )
    admin.autocommit = True
    try:
        with admin.cursor() as cur:
            cur.execute("SELECT rolsuper FROM pg_roles WHERE rolname = current_user")
            row = cur.fetchone()
            if not row or not row[0]:
                print("ERROR: the provisioning connection is not a PostgreSQL superuser", file=sys.stderr)
                return 3

            cur.execute(
                "SELECT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = %s), "
                "EXISTS (SELECT 1 FROM pg_roles WHERE rolname = %s), "
                "EXISTS (SELECT 1 FROM pg_database WHERE datname = %s)",
                (OWNER_ROLE, RUNNER_ROLE, DB_NAME),
            )
            if any(cur.fetchone()):
                print(
                    "ERROR: at least one target role/database already exists; "
                    "nothing was changed. Inspect it manually before proceeding.",
                    file=sys.stderr,
                )
                return 4

            cur.execute(sql.SQL(
                "CREATE ROLE {} NOLOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE "
                "NOINHERIT NOREPLICATION NOBYPASSRLS"
            ).format(sql.Identifier(OWNER_ROLE)))
            cur.execute(sql.SQL(
                "CREATE ROLE {} LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE "
                "NOINHERIT NOREPLICATION NOBYPASSRLS PASSWORD {}"
            ).format(sql.Identifier(RUNNER_ROLE), sql.Literal(runner_password)))
            cur.execute(sql.SQL("CREATE DATABASE {} OWNER {}").format(
                sql.Identifier(DB_NAME), sql.Identifier(OWNER_ROLE)
            ))
            cur.execute(sql.SQL("REVOKE ALL ON DATABASE {} FROM PUBLIC").format(
                sql.Identifier(DB_NAME)
            ))
            cur.execute(sql.SQL(
                "GRANT CONNECT, CREATE, TEMPORARY ON DATABASE {} TO {}"
            ).format(sql.Identifier(DB_NAME), sql.Identifier(RUNNER_ROLE)))
    finally:
        admin.close()

    # Prevent accidental generated DDL from writing into the shared public schema.
    admin_db = psycopg2.connect(
        host="localhost", port=5432, dbname=DB_NAME, user="postgres",
        password=admin_password, connect_timeout=5,
    )
    admin_db.autocommit = True
    try:
        with admin_db.cursor() as cur:
            cur.execute("REVOKE ALL ON SCHEMA public FROM PUBLIC")
    finally:
        admin_db.close()

    # Verify the actual runtime identity/privileges and that verification DDL rolls back.
    runner = psycopg2.connect(
        host="localhost", port=5432, dbname=DB_NAME, user=RUNNER_ROLE,
        password=runner_password, connect_timeout=5,
    )
    try:
        with runner.cursor() as cur:
            cur.execute(
                "SELECT r.rolsuper, r.rolcreatedb, r.rolcreaterole, "
                "has_database_privilege(current_user, current_database(), 'CREATE') "
                "FROM pg_roles r WHERE r.rolname = current_user"
            )
            flags = cur.fetchone()
            if flags != (False, False, False, True):
                raise RuntimeError(f"unexpected runner role privileges: {flags}")

            smoke_schema = "er2sql_smoke_" + uuid.uuid4().hex[:12]
            cur.execute(sql.SQL("CREATE SCHEMA {}").format(sql.Identifier(smoke_schema)))
            cur.execute(sql.SQL("CREATE TABLE {}.probe (id integer PRIMARY KEY)").format(
                sql.Identifier(smoke_schema)
            ))
            cur.execute(sql.SQL("INSERT INTO {}.probe VALUES (1)").format(
                sql.Identifier(smoke_schema)
            ))
        runner.rollback()
        with runner.cursor() as cur:
            cur.execute("SELECT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = %s)", (smoke_schema,))
            if cur.fetchone()[0]:
                raise RuntimeError("rollback smoke test left a schema behind")
    finally:
        runner.rollback()
        runner.close()

    print(f"Provisioned and verified {DB_NAME} using non-superuser {RUNNER_ROLE}.")
    print("Role cannot create databases or roles; schema/table DDL rollback smoke test passed.")
    print("Next run PostgreSQL integration and evaluator mutation tests with this profile.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
