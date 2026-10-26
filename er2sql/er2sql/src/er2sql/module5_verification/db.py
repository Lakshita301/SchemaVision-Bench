"""
Database connection helpers for Module 5.

Every verification run gets its own dedicated, throwaway Postgres
schema (namespace) to execute in, even though the whole transaction
is always rolled back at the end (see executor.py). This is
defense-in-depth: if anything were ever committed unexpectedly (bug,
partial crash, future code change), the blast radius stays contained
to a schema named `<prefix>_<tier>_<schema_id>` rather than touching
the database's `public` schema, which may hold real, unrelated data.
"""

from __future__ import annotations

import re

import psycopg2

from ..config import DatabaseConfig

MAX_POSTGRES_IDENTIFIER_LENGTH = 63


def build_connection(db_config: DatabaseConfig):
    """Open a new psycopg2 connection. Caller owns its lifecycle (close it)."""
    conn = psycopg2.connect(
        host=db_config.host,
        port=db_config.port,
        dbname=db_config.dbname,
        user=db_config.user,
        password=db_config.resolve_password(),
    )
    conn.autocommit = False
    return conn


def make_namespace(schema_prefix: str, tier: str, schema_id: str) -> str:
    """
    Build a safe, unique-enough Postgres schema (namespace) name for
    one schema's verification run. Postgres identifiers are limited to
    63 bytes, so this sanitizes and truncates defensively.
    """
    raw = f"{schema_prefix}_{tier}_{schema_id}"
    safe = re.sub(r"[^a-zA-Z0-9_]", "_", raw).lower()
    return safe[:MAX_POSTGRES_IDENTIFIER_LENGTH]


def test_connection(db_config: DatabaseConfig) -> tuple[bool, str]:
    """
    Quick connectivity check, meant to be called ONCE at the start of
    a tier run so a misconfigured/unreachable database fails fast with
    one clear message instead of failing identically on every schema.
    """
    try:
        conn = build_connection(db_config)
        conn.close()
        return True, "ok"
    except Exception as exc:  # noqa: BLE001
        return False, str(exc)