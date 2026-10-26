"""Compare source-DDL loadability in MySQL with v4-normalized PostgreSQL DDL.

This is a local, no-LLM diagnostic. MySQL DDL is non-transactional, so this
script requires the dedicated empty `er2sql_compat_audit` database and refuses
to start if it contains objects. It only accepts schema DDL statements and
cleans objects from that database after every schema. PostgreSQL work is done
inside a transaction that is always rolled back.

Run from the repository root:
  python scripts/audit_backend_compatibility.py
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
from collections import Counter
from pathlib import Path

import psycopg2
import pymysql
import sqlparse
import yaml
from dotenv import load_dotenv


PROJECT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PROJECT / "src"))

from er2sql.module7_evaluation.reference_normalization import normalize_source  # noqa: E402
from er2sql.module5_verification.executor import _rewrite_public_schema  # noqa: E402


SAFE_MYSQL_DATABASE = "er2sql_compat_audit"
MYSQL_ENV = {
    "host": "ER2SQL_MYSQL_AUDIT_HOST",
    "port": "ER2SQL_MYSQL_AUDIT_PORT",
    "database": "ER2SQL_MYSQL_AUDIT_DATABASE",
    "user": "ER2SQL_MYSQL_AUDIT_USER",
    "password": "ER2SQL_MYSQL_AUDIT_PASSWORD",
}


def split_statements(sql: str) -> list[str]:
    """Split conventional DDL while preserving quoted semicolons."""
    if "/*!" in sql:
        raise ValueError("executable MySQL version comment is outside audit scope")
    if re.search(r"(?im)^\s*DELIMITER\s+", sql):
        raise ValueError("DELIMITER routines are outside the schema-DDL audit scope")
    return [part.strip() for part in sqlparse.split(sql) if part.strip()]


def first_words(statement: str) -> tuple[str, ...]:
    """Return initial SQL keywords after comments and whitespace."""
    text = statement.lstrip("\ufeff \t\r\n")
    while text:
        if text.startswith("--"):
            _, sep, text = text.partition("\n")
            if not sep:
                return ()
            text = text.lstrip()
        elif text.startswith("#"):
            _, sep, text = text.partition("\n")
            if not sep:
                return ()
            text = text.lstrip()
        elif text.startswith("/*"):
            end = text.find("*/", 2)
            if end < 0:
                return ()
            text = text[end + 2 :].lstrip()
        else:
            break
    words = re.findall(r"[A-Za-z_]+", text[:100])
    return tuple(word.upper() for word in words[:3])


MYSQL_ALLOWED = {
    ("CREATE", "TABLE"),
    ("CREATE", "UNIQUE", "INDEX"),
    ("CREATE", "INDEX"),
    ("ALTER", "TABLE"),
    ("DROP", "TABLE"),
    ("DROP", "INDEX"),
    ("CREATE", "VIEW"),
    ("DROP", "VIEW"),
    ("SET", "NAMES"),
}

POSTGRES_ALLOWED = {
    ("CREATE", "TABLE"),
    ("CREATE", "UNIQUE", "INDEX"),
    ("CREATE", "INDEX"),
    ("CREATE", "SEQUENCE"),
    ("CREATE", "TYPE"),
    ("ALTER", "TABLE"),
    ("ALTER", "SEQUENCE"),
    ("DROP", "TABLE"),
    ("DROP", "INDEX"),
    ("DROP", "TYPE"),
    ("COMMENT", "ON"),
}


def unsafe_reason(statements: list[str], allowed: set[tuple[str, ...]]) -> str | None:
    """Fail closed for non-schema SQL and database-context changes."""
    for statement in statements:
        words = first_words(statement)
        if not words:
            continue
        if words[:2] in {("CREATE", "DATABASE"), ("CREATE", "SCHEMA"),
                         ("DROP", "DATABASE"), ("DROP", "SCHEMA"), ("USE",)}:
            return f"database context/administration statement not executed: {' '.join(words)}"
        if words[:2] == ("SET", "FOREIGN_KEY_CHECKS"):
            return "source attempts to alter MySQL foreign-key checking; not executed"
        if words not in allowed and words[:2] not in allowed:
            return f"non-allowlisted statement not executed: {' '.join(words)}"
    return None


def _mysql_objects(cursor) -> list[tuple[str, str]]:
    cursor.execute("SHOW FULL TABLES")
    return [(str(row[0]), str(row[1]).upper()) for row in cursor.fetchall()]


def _mysql_cleanup(cursor) -> None:
    """Drop only objects found in the configured isolated audit database."""
    objects = _mysql_objects(cursor)
    cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
    try:
        for name, kind in objects:
            quoted = "`" + name.replace("`", "``") + "`"
            command = "DROP VIEW IF EXISTS " if kind == "VIEW" else "DROP TABLE IF EXISTS "
            cursor.execute(command + quoted)
    finally:
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1")


def _pg_namespace(schema_id: str) -> str:
    suffix = re.sub(r"[^a-zA-Z0-9_]", "_", schema_id).lower()
    return ("compat_audit_" + suffix)[:63]


def _connect_mysql():
    settings = {key: os.getenv(env, "") for key, env in MYSQL_ENV.items()}
    missing = [env for key, env in MYSQL_ENV.items() if not settings[key]]
    if missing:
        raise RuntimeError("Missing local MySQL audit settings: " + ", ".join(missing))
    if settings["database"] != SAFE_MYSQL_DATABASE:
        raise RuntimeError(f"Refusing MySQL database other than {SAFE_MYSQL_DATABASE!r}")
    return pymysql.connect(
        host=settings["host"],
        port=int(settings["port"]),
        database=settings["database"],
        user=settings["user"],
        password=settings["password"],
        connect_timeout=10,
        autocommit=True,
        charset="utf8mb4",
    )


def _connect_postgres(config: dict):
    db = config["database"]
    password = os.getenv(db["password_env"], "")
    if not password:
        raise RuntimeError(f"Missing PostgreSQL password environment variable {db['password_env']}")
    return psycopg2.connect(
        host=db["host"], port=db["port"], dbname=db["dbname"],
        user=db["user"], password=password, connect_timeout=10,
        application_name="er2sql_backend_compat_audit",
    )


def _load_mysql(cursor, statements: list[str]) -> None:
    for statement in statements:
        if first_words(statement):
            cursor.execute(statement)


def _load_postgres(conn, sql: str, schema_id: str, timeout_ms: int) -> None:
    statements = split_statements(_rewrite_public_schema(sql))
    reason = unsafe_reason(statements, POSTGRES_ALLOWED)
    if reason:
        raise ValueError(reason)
    namespace = _pg_namespace(schema_id)
    with conn.cursor() as cursor:
        cursor.execute("SELECT set_config('statement_timeout', %s, true)", (str(timeout_ms),))
        cursor.execute(f'CREATE SCHEMA "{namespace}"')
        cursor.execute(f'SET LOCAL search_path TO "{namespace}", public')
        for statement in statements:
            if first_words(statement):
                cursor.execute(statement)


def _source_inventory(project: Path, config: dict, split_file: Path):
    splits = json.loads(split_file.read_text(encoding="utf-8"))
    ids = splits["development"] + splits["pilot"] + splits["final"]
    if len(ids) != 714 or len(ids) != len(set(ids)):
        raise RuntimeError(f"Expected 714 unique source IDs; found {len(ids)} entries and {len(set(ids))} unique")
    roots = {Path(v["sql_dir"]).resolve() for v in config["dataset"]["tiers"].values()}
    if len(roots) != 1:
        raise RuntimeError("All tiers must point to the same original SQL directory")
    source_root = roots.pop()
    tiers = config["dataset"]["tiers"]
    missing_images = {}
    for tier, paths in tiers.items():
        diagram_dir = Path(paths["diagrams_dir"]).resolve()
        missing = [sid for sid in ids if not any((diagram_dir / f"{sid}{ext}").exists()
                   for ext in (".png", ".jpg", ".jpeg", ".PNG", ".JPG", ".JPEG"))]
        if missing:
            missing_images[tier] = missing
    missing_sql = [sid for sid in ids if not any((source_root / f"{sid}{ext}").is_file()
                   for ext in (".sql", ".ddl", ".txt"))]
    if missing_images or missing_sql:
        raise RuntimeError(f"Split is not available in configured data folders: images={missing_images}, sql={missing_sql}")
    return ids, source_root


def run_audit(config_path: Path, split_file: Path, output_dir: Path) -> dict:
    project = PROJECT
    config_path = config_path.resolve()
    split_file = split_file.resolve()
    output_dir = output_dir.resolve()
    if project not in output_dir.parents:
        raise RuntimeError("Output must remain inside this project workspace")
    if output_dir.exists() and any(output_dir.iterdir()):
        raise RuntimeError(f"Refusing to overwrite non-empty output directory: {output_dir}")

    load_dotenv(project / ".env", override=False)
    config = yaml.safe_load(config_path.read_text(encoding="utf-8"))
    ids, source_root = _source_inventory(project, config, split_file)

    mysql = _connect_mysql()
    mysql_cursor = mysql.cursor()
    initial_objects = _mysql_objects(mysql_cursor)
    if initial_objects:
        mysql_cursor.close()
        mysql.close()
        raise RuntimeError("Audit database is not empty; refusing to delete pre-existing objects")

    postgres = _connect_postgres(config)
    mysql_version = None
    postgres_version = None
    with mysql.cursor() as cursor:
        cursor.execute("SELECT VERSION(), DATABASE()")
        mysql_version, selected_db = cursor.fetchone()
        if selected_db != SAFE_MYSQL_DATABASE:
            raise RuntimeError("Connected to an unexpected MySQL database")
    with postgres.cursor() as cursor:
        cursor.execute("SELECT version(), current_database()")
        postgres_version, selected_db = cursor.fetchone()
        if selected_db != config["database"]["dbname"]:
            raise RuntimeError("Connected to an unexpected PostgreSQL database")

    rows = []
    timeout_ms = int(config["database"].get("statement_timeout_ms", 5000))
    try:
        for index, schema_id in enumerate(ids, start=1):
            source_path = next(source_root / f"{schema_id}{ext}"
                               for ext in (".sql", ".ddl", ".txt")
                               if (source_root / f"{schema_id}{ext}").is_file())
            source_bytes = source_path.read_bytes()
            source = source_bytes.decode("utf-8-sig", errors="strict")
            row = {
                "schema_id": schema_id,
                "source_sha256": hashlib.sha256(source_bytes).hexdigest(),
                "mysql_status": "not_run",
                "mysql_error_code": None,
                "mysql_error": None,
                "postgres_status": "not_run",
                "postgres_sqlstate": None,
                "postgres_error": None,
                "normalization_changes": [],
                "normalization_blockers": [],
            }
            try:
                statements = split_statements(source)
                reason = unsafe_reason(statements, MYSQL_ALLOWED)
                if reason:
                    row["mysql_status"] = "not_run_unsafe_or_out_of_scope"
                    row["mysql_error"] = reason
                else:
                    try:
                        _load_mysql(mysql_cursor, statements)
                        row["mysql_status"] = "loaded"
                    except Exception as exc:  # database error; recorded per source
                        row["mysql_status"] = "load_failed"
                        row["mysql_error_code"] = getattr(exc, "args", [None])[0]
                        row["mysql_error"] = str(exc).replace("\r", " ").replace("\n", " ")[:800]
            except Exception as exc:
                row["mysql_status"] = "not_run_unsafe_or_out_of_scope"
                row["mysql_error"] = f"{type(exc).__name__}: {exc}"
            try:
                _mysql_cleanup(mysql_cursor)
            except Exception as exc:
                raise RuntimeError(
                    f"MySQL audit cleanup failed after {schema_id}; stopping to prevent cross-schema contamination"
                ) from exc

            try:
                converted = normalize_source(source)
                candidate = converted["sql"]
                row["normalization_changes"] = converted["changes"]
                row["normalization_blockers"] = converted["blockers"]
                row["postgres_reference_sha256"] = hashlib.sha256(candidate.encode("utf-8")).hexdigest()
                statements = split_statements(candidate)
                reason = unsafe_reason(statements, POSTGRES_ALLOWED)
                if reason:
                    row["postgres_status"] = "not_run_unsafe_or_out_of_scope"
                    row["postgres_error"] = reason
                else:
                    try:
                        _load_postgres(postgres, candidate, schema_id, timeout_ms)
                        postgres.rollback()
                        row["postgres_status"] = "loaded"
                    except Exception as exc:  # database error; recorded per source
                        postgres.rollback()
                        row["postgres_status"] = "load_failed"
                        row["postgres_sqlstate"] = getattr(exc, "pgcode", None)
                        row["postgres_error"] = str(exc).replace("\r", " ").replace("\n", " ")[:800]
            except Exception as exc:
                postgres.rollback()
                row["postgres_status"] = "not_run_unsafe_or_out_of_scope"
                row["postgres_error"] = f"{type(exc).__name__}: {exc}"

            row["comparison"] = (
                "both_loaded" if row["mysql_status"] == row["postgres_status"] == "loaded" else
                "mysql_only" if row["mysql_status"] == "loaded" else
                "postgresql_only" if row["postgres_status"] == "loaded" else "neither_loaded"
            )
            rows.append(row)
            if index % 25 == 0:
                print(f"Backend compatibility audit: {index}/714", flush=True)
    finally:
        postgres.rollback()
        postgres.close()
        _mysql_cleanup(mysql_cursor)
        if _mysql_objects(mysql_cursor):
            raise RuntimeError("Audit cleanup failed; MySQL audit database is not empty")
        mysql_cursor.close()
        mysql.close()

    summary = {
        "audit_version": 1,
        "scope": "DDL loadability only; not a semantic-equivalence or model evaluation",
        "source_split": str(split_file.relative_to(project)),
        "source_split_sha256": hashlib.sha256(split_file.read_bytes()).hexdigest(),
        "schema_count": len(ids),
        "mysql_database": SAFE_MYSQL_DATABASE,
        "mysql_version": mysql_version,
        "postgres_database": config["database"]["dbname"],
        "postgres_version": postgres_version,
        "postgres_statement_timeout_ms": timeout_ms,
        "source_sql_directory": str(source_root),
        "model_calls": 0,
        "original_source_modified": False,
        "mysql_loaded": sum(r["mysql_status"] == "loaded" for r in rows),
        "postgresql_loaded": sum(r["postgres_status"] == "loaded" for r in rows),
        "both_loaded": sum(r["comparison"] == "both_loaded" for r in rows),
        "mysql_only": sum(r["comparison"] == "mysql_only" for r in rows),
        "postgresql_only": sum(r["comparison"] == "postgresql_only" for r in rows),
        "neither_loaded": sum(r["comparison"] == "neither_loaded" for r in rows),
        "mysql_not_run_unsafe_or_out_of_scope": sum(r["mysql_status"] == "not_run_unsafe_or_out_of_scope" for r in rows),
        "postgresql_not_run_unsafe_or_out_of_scope": sum(r["postgres_status"] == "not_run_unsafe_or_out_of_scope" for r in rows),
        "postgresql_failure_sqlstates": dict(Counter(r["postgres_sqlstate"] for r in rows if r["postgres_sqlstate"])),
        "rows": rows,
    }
    output_dir.mkdir(parents=True, exist_ok=True)
    (output_dir / "backend_compatibility.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    _write_markdown(output_dir / "backend_compatibility.md", summary)
    return summary


def _write_markdown(path: Path, result: dict) -> None:
    lines = [
        "# MySQL vs PostgreSQL DDL compatibility — all 714 common schemas",
        "",
        "This is a local DDL-loadability diagnostic only. It makes no LLM calls and does not modify source SQL. MySQL executes each original scraped SQL file in the isolated audit database; PostgreSQL executes the deterministic Protocol v4 normalized candidate inside a transaction that is rolled back. A successful DDL load does not establish semantic equivalence, reference eligibility, or model-test validity.",
        "",
        f"- MySQL: {result['mysql_version']} (`{result['mysql_database']}`)",
        f"- PostgreSQL: {result['postgres_version']} (`{result['postgres_database']}`)",
        f"- Source split: `{result['source_split']}` ({result['source_split_sha256']})",
        f"- Schemas: {result['schema_count']}; model calls: 0; original SQL modified: no.",
        "",
        "## Summary",
        "",
        "| Outcome | Schemas |",
        "|---|---:|",
        f"| Loaded on both engines | {result['both_loaded']} |",
        f"| Loaded only on MySQL | {result['mysql_only']} |",
        f"| Loaded only on PostgreSQL | {result['postgresql_only']} |",
        f"| Loaded on neither | {result['neither_loaded']} |",
        f"| MySQL loaded (total) | {result['mysql_loaded']} |",
        f"| PostgreSQL loaded (total) | {result['postgresql_loaded']} |",
        "",
        "Unsafe/non-schema statements are marked `not_run_unsafe_or_out_of_scope`, not counted as database load failures. A schema marked loaded may still have normalization blockers; this audit does not award reference approval.",
        "",
        "## Per-schema results",
        "",
        "| Schema ID | MySQL | PostgreSQL | Comparison | Other/source blockers | MySQL error | PostgreSQL error |",
        "|---|---|---|---|---|---|---|",
    ]
    for row in result["rows"]:
        clean = lambda x: str(x or "").replace("|", "/").replace("\r", " ").replace("\n", " ")
        blockers = "; ".join(row["normalization_blockers"])
        lines.append(
            f"| `{row['schema_id']}` | {row['mysql_status']} | {row['postgres_status']} | {row['comparison']} | {clean(blockers)} | {clean(row['mysql_error'])} | {clean(row['postgres_error'])} |"
        )
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--config", type=Path, default=PROJECT / "config/config.yaml")
    parser.add_argument("--split-file", type=Path, default=PROJECT / "config/paper_splits.json")
    parser.add_argument("--output", type=Path, default=PROJECT / "outputs/experiments/backend-compatibility-714-20261007")
    args = parser.parse_args()
    result = run_audit(args.config, args.split_file, args.output)
    print(
        "Completed 714-schema DDL audit: "
        f"MySQL {result['mysql_loaded']}/714; PostgreSQL {result['postgresql_loaded']}/714; "
        f"both {result['both_loaded']}; neither {result['neither_loaded']}."
    )


if __name__ == "__main__":
    main()
