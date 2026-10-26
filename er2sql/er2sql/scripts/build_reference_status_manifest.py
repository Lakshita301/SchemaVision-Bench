"""Build the frozen, schema-level reference-status manifest.

This is a source audit only: it does not call models, alter SQL, or execute DDL.
Run from the repository root after installing the `reference-audit` extra.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import logging
import json
import re
from collections import defaultdict
from pathlib import Path

import sqlglot
from sqlglot import exp
import yaml

logging.getLogger("sqlglot").setLevel(logging.ERROR)


ROOT = Path(__file__).resolve().parents[1]
POPULATION_SPLIT = ROOT / "config/paper_splits_v5.json"
ELIGIBLE_SPLIT = ROOT / "config/paper_splits_v5_eligible.json"
COMPAT_AUDIT = ROOT / "outputs/experiments/backend-compatibility-714-20261007/backend_compatibility.json"
ELIGIBILITY_AUDIT = ROOT / "docs/audits/reference_eligibility_v4.json"
OUTPUT = ROOT / "data/reference_status_manifest_v1.csv"

DEFECT_CATEGORIES = {
    "source_foreign_key_targets_non_unique_column",
    "malformed_or_unparseable_source_ddl",
    "unresolved_source_alter_operation",
    "conflicting_duplicate_source_table_definitions",
    "sqlite_internal_metadata_not_application_schema",
    "generated_reference_checks_failed",
    "other_reference_gate_failure",
}

KNOWN_TYPES = {
    "array", "bigint", "bigserial", "binary", "bit", "blob", "bool", "boolean",
    "bytea", "char", "character", "clob", "date", "datetime", "decimal", "dec",
    "double", "enum", "float", "int", "integer", "interval", "json", "jsonb",
    "long", "longblob", "longtext", "mediumblob", "mediumint", "mediumtext", "money",
    "nchar", "ntext", "numeric", "number", "nvarchar", "nvarchar2", "real", "serial",
    "set", "short", "smallint", "smallserial", "text", "time", "timestamp", "tinyblob",
    "tinyint", "tinytext", "timestamptz", "uint", "ubigint", "utinyint", "umediumint",
    "usmallint", "udecimal", "udouble", "varbinary", "varchar", "varchar2", "year", "uuid",
    "geometry", "image", "inet",
}


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def infer_dialects(sql: str) -> list[str]:
    sample = sql[:200_000].lower()
    if re.search(r"\b(varchar2|nvarchar2)\b|\bnumber\s*\(\s*\d", sample):
        first = "oracle"
    elif re.search(r"\bidentity\s*\(\s*\d|\bnvarchar\s*\(\s*max\s*\)|\bgo\s*(?:\r?\n|$)", sample):
        first = "tsql"
    elif "sqlite_stat1" in sample or "sqlite_sequence" in sample or "autoincrement" in sample:
        first = "sqlite"
    elif any(x in sample for x in ("`", "engine=", "auto_increment", "character set", "unsigned")):
        first = "mysql"
    elif re.search(r"\b(serial|bytea|jsonb|timestamptz)\b|::", sample):
        first = "postgres"
    else:
        first = "mysql"
    return list(dict.fromkeys([first, "mysql", "postgres", "oracle", "sqlite", "tsql"]))


def table_name(node: exp.Expression) -> str:
    return node.name.lower()


def create_table_info(statements: list[exp.Expression]) -> tuple[dict[str, dict], list[str]]:
    tables: dict[str, dict] = {}
    issues: list[str] = []
    for statement in statements:
        if not isinstance(statement, exp.Create) or statement.args.get("kind", "").upper() != "TABLE":
            continue
        schema = statement.this if isinstance(statement.this, exp.Schema) else None
        table = schema.this if schema is not None else statement.this
        if not isinstance(table, exp.Table):
            continue
        name = table_name(table)
        if not name:
            continue
        columns: set[str] = set()
        unique_sets: list[set[str]] = []
        foreign_keys: list[tuple[set[str], str, set[str]]] = []
        for item in (schema.expressions if schema is not None else []):
            if isinstance(item, exp.ColumnDef):
                columns.add(item.name.lower())
                for unique in item.find_all(exp.UniqueColumnConstraint):
                    unique_sets.append({item.name.lower()})
                for primary in item.find_all(exp.PrimaryKeyColumnConstraint):
                    unique_sets.append({item.name.lower()})
            elif isinstance(item, exp.PrimaryKey):
                unique_sets.append({col.name.lower() for col in item.expressions if isinstance(col, exp.Identifier)})
            elif isinstance(item, exp.UniqueColumnConstraint):
                unique_sets.append({col.name.lower() for col in item.find_all(exp.Column) if col.name})
        for item in (schema.expressions if schema is not None else []):
            for foreign_key in item.find_all(exp.ForeignKey):
                if isinstance(item, exp.ForeignKey):
                    foreign_key = item
                ref = foreign_key.args.get("reference")
                target_schema = ref.this if isinstance(ref, exp.Reference) else None
                target_table = target_schema.this if isinstance(target_schema, exp.Schema) else None
                target_columns = target_schema.expressions if isinstance(target_schema, exp.Schema) else []
                foreign_keys.append((
                    {col.name.lower() for col in foreign_key.expressions if isinstance(col, exp.Identifier)},
                    table_name(target_table) if isinstance(target_table, exp.Table) else "",
                    {col.name.lower() for col in target_columns if isinstance(col, exp.Identifier)},
                ))
        if name in tables:
            issues.append("conflicting_duplicate_source_table_definitions")
        tables[name] = {"columns": columns, "unique": unique_sets, "foreign_keys": foreign_keys}
    return tables, issues


def semantic_issues(statements: list[exp.Expression], tables: dict[str, dict]) -> list[str]:
    issues: list[str] = []
    declared_types = {
        stmt.this.name.lower()
        for stmt in statements
        if isinstance(stmt, exp.Create) and str(stmt.args.get("kind", "")).upper() == "TYPE"
        and isinstance(stmt.this, exp.Table)
    }
    for table, info in tables.items():
        for source_cols, target, target_cols in info["foreign_keys"]:
            if not target or target not in tables:
                issues.append("source_foreign_key_target_missing")
                continue
            target_info = tables[target]
            if not target_cols or not any(key == target_cols for key in target_info["unique"]):
                issues.append("source_foreign_key_targets_non_unique_column")
            if not source_cols.issubset(info["columns"]):
                issues.append("malformed_or_unparseable_source_ddl")
        # sqlglot preserves custom SQL type names as user-defined DType values.
        for column in (stmt for stmt in statements if isinstance(stmt, exp.Create)):
            schema = column.this if isinstance(column.this, exp.Schema) else None
            table_node = schema.this if schema is not None else None
            if not isinstance(table_node, exp.Table) or table_node.name.lower() != table:
                continue
            for col in schema.find_all(exp.ColumnDef):
                kind = col.args.get("kind")
                if not isinstance(kind, exp.DataType):
                    continue
                dtype = str(getattr(kind.this, "value", kind.this)).lower()
                custom_name = kind.args.get("kind")
                custom_name = custom_name.name.lower() if isinstance(custom_name, exp.Identifier) else ""
                if dtype == "user-defined":
                    if not custom_name or custom_name not in declared_types:
                        issues.append("source_custom_type_missing")
                elif dtype not in KNOWN_TYPES and dtype not in declared_types:
                    issues.append("source_custom_type_missing")
    # Account for alternate keys declared by ALTER TABLE before checking any
    # FK. The source may add the key before or after the child FK statement.
    for statement in statements:
        if not isinstance(statement, exp.Alter) or not isinstance(statement.this, exp.Table):
            continue
        info = tables.get(table_name(statement.this))
        if info is None:
            continue
        for action in statement.args.get("actions", []):
            for primary in action.find_all(exp.PrimaryKey):
                info["unique"].append({col.name.lower() for col in primary.expressions if isinstance(col, exp.Identifier)})
            for unique in action.find_all(exp.UniqueColumnConstraint):
                info["unique"].append({col.name.lower() for col in unique.find_all(exp.Column) if col.name})
    for statement in statements:
        if not isinstance(statement, exp.Alter):
            continue
        target = statement.this
        if isinstance(target, exp.Table) and table_name(target) not in tables:
            issues.append("unresolved_source_alter_operation")
        for foreign_key in statement.find_all(exp.ForeignKey):
            ref = foreign_key.args.get("reference")
            target_schema = ref.this if isinstance(ref, exp.Reference) else None
            target_table = target_schema.this if isinstance(target_schema, exp.Schema) else None
            target_columns = target_schema.expressions if isinstance(target_schema, exp.Schema) else []
            target_name = table_name(target_table) if isinstance(target_table, exp.Table) else ""
            columns = {col.name.lower() for col in target_columns if isinstance(col, exp.Identifier)}
            target_info = tables.get(target_name)
            if target_info is None:
                issues.append("source_foreign_key_target_missing")
            elif not columns or not any(key == columns for key in target_info["unique"]):
                issues.append("source_foreign_key_targets_non_unique_column")
    return issues


def parse_source(sql: str) -> tuple[str | None, list[exp.Expression], str | None]:
    failures = []
    for dialect in infer_dialects(sql):
        try:
            statements = [item for item in sqlglot.parse(sql, read=dialect) if item is not None]
            if any(isinstance(item, exp.Command) for item in statements):
                failures.append(f"{dialect}: procedural_or_unrecognized_statement")
                continue
            if not any(isinstance(item, exp.Create) and str(item.args.get("kind", "")).upper() == "TABLE" for item in statements):
                failures.append(f"{dialect}: no_create_table")
                continue
            return dialect, statements, None
        except sqlglot.errors.ParseError as exc:
            failures.append(f"{dialect}: {str(exc).splitlines()[0]}")
    return None, [], "; ".join(failures[:3]) or "no source dialect parsed"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-dir", type=Path, help="Override the tier-1 SQL path in config/config.yaml")
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()

    if args.source_dir is None:
        config = yaml.safe_load((ROOT / "config/config.yaml").read_text(encoding="utf-8"))
        args.source_dir = Path(config["dataset"]["tiers"]["tier1"]["sql_dir"])
    population = load_json(POPULATION_SPLIT)
    eligible = load_json(ELIGIBLE_SPLIT)
    compat = load_json(COMPAT_AUDIT)
    eligibility = load_json(ELIGIBILITY_AUDIT)
    expected_ids = set(population["development"] + population["pilot"] + population["final"])
    verified_ids = set(eligible["pilot"] + eligible["final"])
    audited_eligible_ids = {
        schema_id
        for phase in eligibility["phases"].values()
        for schema_id in phase.get("eligible_ids", [])
    }
    if verified_ids != audited_eligible_ids:
        raise SystemExit("v5 eligible pilot/final IDs do not match the audited v4 eligible population")
    compat_rows = {row["schema_id"]: row for row in compat["rows"]}
    eligibility_rows: dict[str, set[str]] = defaultdict(set)
    for phase in eligibility["phases"].values():
        for row in phase.get("excluded", []):
            eligibility_rows[row["schema_id"]].update(row.get("categories", []))

    output_rows = []
    for schema_id in sorted(expected_ids):
        source_path = args.source_dir / f"{schema_id}.sql"
        if not source_path.is_file():
            output_rows.append({"schema_id": schema_id, "reference_status": "defective", "reason_code": "malformed_or_unparseable_source_ddl", "detail": "source SQL file not found", "source_dialect": "", "source_sha256": ""})
            continue
        source_bytes = source_path.read_bytes()
        sql = source_bytes.decode("utf-8", errors="replace")
        source_hash = sha256_bytes(source_bytes)
        compatibility = compat_rows.get(schema_id, {})
        if compatibility and compatibility.get("source_sha256") != source_hash:
            raise SystemExit(f"source hash mismatch for {schema_id}; do not classify a different file than the frozen audit")
        audit_categories = eligibility_rows.get(schema_id, set())

        if schema_id in verified_ids:
            # This is the frozen v5 eligible evaluation population, which was
            # checked against the PostgreSQL reference test suite.
            if compatibility.get("postgres_status") != "loaded":
                raise SystemExit(f"eligible evaluation schema {schema_id} did not load in the all-714 PostgreSQL audit")
            output_rows.append({"schema_id": schema_id, "reference_status": "executable_verified", "reason_code": "", "detail": "frozen v5 eligible pilot/final reference; PostgreSQL load and reference gate passed", "source_dialect": "", "source_sha256": source_hash})
            continue

        dialect, statements, parse_error = parse_source(sql)
        issues = list(audit_categories & DEFECT_CATEGORIES)
        tables, duplicate_issues = create_table_info(statements) if statements else ({}, [])
        issues.extend(duplicate_issues)
        issues.extend(semantic_issues(statements, tables) if statements else [])
        if "sqlite_stat1" in sql.lower() or "sqlite_sequence" in sql.lower():
            issues.append("sqlite_internal_metadata_not_application_schema")
        if parse_error:
            issues.append("malformed_or_unparseable_source_ddl")
        # Type/sequence failures in PostgreSQL conversion are only attributed
        # to the source when the source itself declares an unresolved object.
        pg_error = (compatibility.get("postgres_error") or "").lower()
        if "relation \"" in pg_error and "does not exist" in pg_error and "nextval" in sql.lower():
            issues.append("source_sequence_missing")
        if "type \"" in pg_error and "does not exist" in pg_error:
            issues.append("source_custom_type_missing")

        reason_codes = sorted(set(issues))
        if reason_codes:
            status = "defective"
            detail = parse_error or "; ".join(reason_codes)
        else:
            status = "structural_only"
            pg_status = compatibility.get("postgres_status", "not_audited")
            detail = f"source parsed as {dialect}; no unresolved semantic defect detected; PostgreSQL audit status={pg_status}"
            reason_codes = ["postgresql_ddl_execution_failure"] if pg_status != "loaded" else ["reference_test_generation_or_evaluator_limit"]
        output_rows.append({
            "schema_id": schema_id,
            "reference_status": status,
            "reason_code": ";".join(reason_codes),
            "detail": detail,
            "source_dialect": dialect or "",
            "source_sha256": source_hash,
        })

    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=["schema_id", "reference_status", "reason_code", "detail", "source_dialect", "source_sha256"])
        writer.writeheader()
        writer.writerows(output_rows)

    counts: dict[str, int] = defaultdict(int)
    for row in output_rows:
        counts[row["reference_status"]] += 1
    print(f"Wrote {len(output_rows)} rows to {args.output}")
    print("Status counts: " + ", ".join(f"{key}={counts[key]}" for key in sorted(counts)))
    reason_counts: dict[str, int] = defaultdict(int)
    for row in output_rows:
        for reason in row["reason_code"].split(";"):
            if reason:
                reason_counts[reason] += 1
    print("Reason counts: " + ", ".join(f"{key}={reason_counts[key]}" for key in sorted(reason_counts)))
    if set(row["schema_id"] for row in output_rows) != expected_ids:
        raise SystemExit("manifest IDs do not match the frozen 714-schema population")


if __name__ == "__main__":
    main()
