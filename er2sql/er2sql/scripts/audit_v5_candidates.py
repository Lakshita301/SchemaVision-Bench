"""Audit the exact v5 pilot/final roster against generated v5.2 references.

No model calls are made. MySQL executes original source DDL in the isolated
audit database. PostgreSQL executes the actual candidate files in isolated,
rolled-back schemas. Existing v5 review files are read-only inputs.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

import psycopg2
import pymysql
import yaml
from dotenv import load_dotenv

PROJECT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PROJECT / "src"))
from er2sql.module7_evaluation.reference_normalization import (  # noqa: E402
    CONVERTER_VERSION,
    PROTECTED,
    _policy_category,
    _resolved_source_state,
    normalize_source,
)
from er2sql.module4_constraint_tests.gold_schema import _identifier, _matching_paren, _split_definitions  # noqa: E402
from audit_backend_compatibility import (  # noqa: E402
    MYSQL_ALLOWED,
    POSTGRES_ALLOWED,
    SAFE_MYSQL_DATABASE,
    _connect_mysql,
    _connect_postgres,
    _load_mysql,
    _load_postgres,
    _mysql_cleanup,
    _mysql_objects,
    first_words,
    split_statements,
    unsafe_reason,
)

EXPECTED_POSTGRES_MAJOR_MINOR = "18.6"
MYSQL_ENV = "ER2SQL_MYSQL_AUDIT_DATABASE"


def _sql_root(config: dict) -> Path:
    roots = {Path(t["sql_dir"]).resolve() for t in config["dataset"]["tiers"].values()}
    if len(roots) != 1:
        raise RuntimeError("Configured tiers do not share one source SQL directory")
    return roots.pop()


def _read_manifest(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def _read_roster(v5_root: Path, candidate_root: Path):
    roster = {}
    phase_counts = {}
    for phase in ("final", "pilot"):
        old_path = v5_root / phase / "normalization_manifest.json"
        new_path = candidate_root / phase / "normalization_manifest.json"
        old, new = _read_manifest(old_path), _read_manifest(new_path)
        old_ids = [r["schema_id"] for r in old["rows"]]
        new_rows = {r["schema_id"]: r for r in new["rows"]}
        if len(old_ids) != len(set(old_ids)) or set(old_ids) != set(new_rows):
            raise RuntimeError(f"{phase} v5.1 candidate roster differs from exact v5 manifest")
        if new.get("cohort_label") != f"v5-{phase}-exact-roster":
            raise RuntimeError(f"{phase} candidate manifest has unexpected roster provenance")
        for sid in old_ids:
            row = new_rows[sid]
            file = candidate_root / phase / f"{sid}.sql"
            if not file.is_file():
                raise RuntimeError(f"Missing candidate SQL: {file}")
            digest = hashlib.sha256(file.read_bytes()).hexdigest()
            if digest != row["reference_sha256"]:
                raise RuntimeError(f"Candidate hash mismatch for {sid}")
            if sid in roster:
                raise RuntimeError(f"Schema occurs in both v5 cohorts: {sid}")
            roster[sid] = {**row, "phase": phase, "candidate_path": file}
        phase_counts[phase] = len(old_ids)
    return roster, phase_counts


def _strip_sql_comments(text: str) -> str:
    return PROTECTED.sub(
        lambda m: ("\n" if m.group().startswith(("--", "#")) else " " * len(m.group()))
        if m.group().startswith(("--", "#", "/*")) else m.group(), text)


def _add_clause_counts(source_root: Path, ids: list[str]) -> dict:
    patterns = {
        "ADD PRIMARY KEY": re.compile(r"\bADD\s+(?:CONSTRAINT\s+[\w$]+\s+)?PRIMARY\s+KEY\b", re.I),
        "ADD KEY/INDEX": re.compile(r"\bADD\s+(?:KEY|INDEX)\b", re.I),
        "ADD UNIQUE": re.compile(r"\bADD\s+UNIQUE\b", re.I),
    }
    result = {}
    for label, pattern in patterns.items():
        matched = []
        occurrences = 0
        for sid in ids:
            path = source_root / f"{sid}.sql"
            text = _strip_sql_comments(path.read_text(encoding="utf-8-sig", errors="replace"))
            count = len(pattern.findall(text))
            if count:
                matched.append(sid)
                occurrences += count
        result[label] = {"files": len(matched), "occurrences": occurrences, "schema_ids": matched}
    return result


def _error_class(sqlstate: str | None, message: str | None):
    msg = (message or "").lower()
    if "date/time field value out of range" in msg or "zero date" in msg:
        return "zero_date_default", False, "Cannot retain a zero date in PostgreSQL; default was dropped by declared policy."
    if "syntax error" in msg and "precision" in msg:
        return "double_precision_or_float_syntax", True, "Explicit type normalization class."
    if "syntax error" in msg and ("character" in msg or "charset" in msg):
        return "column_charset_syntax", True, "Explicit column encoding normalization class."
    if "syntax error" in msg and ("using" in msg or "index" in msg or "unique" in msg):
        return "index_declaration_syntax", True, "Explicit unnamed index / access-method normalization class."
    if "current_timestamp" in msg:
        return "timestamp_default_syntax", True, "Explicit duplicate-call normalization class."
    if "there is no unique constraint matching given keys" in msg:
        return "foreign_key_target_not_unique", False, "Would require inventing a UNIQUE/PRIMARY KEY not declared by source."
    if sqlstate == "3F000" or "schema" in msg and "does not exist" in msg:
        return "source_schema_prefix_or_namespace", True, "Source namespace flattening is an explicit converter rule."
    if "relation" in msg and "already exists" in msg:
        return "duplicate_relation_definition", False, "Conflicting repeated table/index definitions need source-level adjudication."
    if "column" in msg and "already exists" in msg:
        return "duplicate_column_definition", False, "Conflicting duplicate source definitions are ambiguous."
    if "does not exist" in msg and ("type" in msg or "relation" in msg):
        return "undefined_custom_type_or_relation", False, "No safe inference from source syntax alone."
    if "type" in msg and ("incompatible" in msg or "of type" in msg):
        return "type_or_default_mismatch", False, "Requires case-specific semantic mapping beyond the approved conversions."
    if "syntax error" in msg:
        return "other_syntax_or_malformed_source", False, "Not one of the locked mechanical fixes; inspect source before changing semantics."
    return f"postgres_sqlstate_{sqlstate or 'unknown'}", False, "No approved mechanical repair identified."


def _eligibility(candidate: dict, pg_status: str):
    reasons = []
    blockers = candidate.get("blockers", [])
    changes = candidate.get("changes", [])
    recognized = [_policy_category(change) for change in changes]
    if blockers:
        reasons.extend("CONVERSION_BLOCKER" for _ in [0])
    if not blockers and changes and any(category is None for category in recognized):
        reasons.append("UNAPPROVED_CONVERSION_CHANGE")
    if pg_status == "load_failed":
        reasons.append("POSTGRES_DDL_REJECTED")
    elif pg_status != "loaded":
        reasons.append("POSTGRES_NOT_EXECUTED")
    eligible = not reasons
    if eligible:
        reasons.append("ELIGIBLE_POLICY_APPROVED_AND_POSTGRES_COMPILES")
    return eligible, reasons


def _change_tally(rows):
    by_category = defaultdict(set)
    for row in rows:
        for change in row.get("changes", []):
            category = _policy_category(change) or "requires_review"
            by_category[category].add(row["schema_id"])
    return {
        "schemas_by_category": {
            key: sorted(value) for key, value in sorted(by_category.items())
        },
        "schemas_by_category_count": {key: len(value) for key, value in sorted(by_category.items())},
        "zero_date_default_removed_schemas": len(by_category.get("zero_date_default_removed", set())),
    }


def _current_split_coverage(rows, split_path: Path):
    """Crosswalk the historical v5 candidate roster to today's frozen split."""
    split = json.loads(split_path.read_text(encoding="utf-8"))
    groups = {name: set(split[name]) for name in ("development", "pilot", "final")}
    by_id = {row["schema_id"]: row for row in rows}
    audited = set(by_id)
    crosswalk = {
        phase: {
            name: len({r["schema_id"] for r in rows if r["phase"] == phase} & ids)
            for name, ids in groups.items()
        }
        for phase in ("final", "pilot")
    }
    counts = {}
    for name, ids in groups.items():
        covered = ids & audited
        counts[name] = {
            "total": len(ids),
            "audited": len(covered),
            "not_audited": len(ids - audited),
            "eligible_among_audited": sum(by_id[sid]["eligible_for_reference"] for sid in covered),
            "not_audited_schema_ids": sorted(ids - audited),
        }
    return {
        "paper_splits_sha256": hashlib.sha256(split_path.read_bytes()).hexdigest(),
        "counts_by_current_paper_split": counts,
        "candidate_manifest_phase_by_current_paper_split": crosswalk,
        "current_final_eligibility_denominator": counts["final"]["total"],
        "current_final_eligible": counts["final"]["eligible_among_audited"],
    }


def run_audit(v5_root: Path, candidate_root: Path, output_dir: Path, config_path: Path):
    v5_root, candidate_root, output_dir = map(Path, (v5_root.resolve(), candidate_root.resolve(), output_dir.resolve()))
    if PROJECT not in output_dir.parents:
        raise RuntimeError("Output directory must remain inside the project")
    if output_dir.exists() and any(output_dir.iterdir()):
        raise RuntimeError(f"Refusing to overwrite existing audit output: {output_dir}")
    load_dotenv(PROJECT / ".env", override=False)
    config = yaml.safe_load(config_path.read_text(encoding="utf-8"))
    roster, phase_counts = _read_roster(v5_root, candidate_root)
    source_root = _sql_root(config)
    for sid in roster:
        if not (source_root / f"{sid}.sql").is_file():
            raise RuntimeError(f"Missing original source SQL for {sid}")

    mysql = _connect_mysql()
    mc = mysql.cursor()
    if _mysql_objects(mc):
        mc.close()
        mysql.close()
        raise RuntimeError("MySQL audit database is not empty; refusing to delete existing objects")
    postgres = _connect_postgres(config)
    mc.execute("SELECT VERSION(), DATABASE()")
    mysql_version, mysql_db = mc.fetchone()
    with postgres.cursor() as cur:
        cur.execute("SELECT version(), current_database(), current_setting('server_version')")
        pg_version, pg_db, pg_numeric = cur.fetchone()
    if mysql_db != SAFE_MYSQL_DATABASE or os.getenv(MYSQL_ENV) != SAFE_MYSQL_DATABASE:
        raise RuntimeError("MySQL connection does not point to the isolated compatibility database")
    if pg_db != config["database"]["dbname"]:
        raise RuntimeError("PostgreSQL connection selected an unexpected database")
    if not pg_numeric.startswith(EXPECTED_POSTGRES_MAJOR_MINOR):
        raise RuntimeError(f"Expected PostgreSQL {EXPECTED_POSTGRES_MAJOR_MINOR}; found {pg_numeric}")

    rows = []
    timeout_ms = 30000
    try:
        for index, (sid, candidate) in enumerate(roster.items(), start=1):
            source_path = source_root / f"{sid}.sql"
            source_bytes = source_path.read_bytes()
            source = source_bytes.decode("utf-8-sig", errors="strict")
            candidate_path: Path = candidate["candidate_path"]
            candidate_sql = candidate_path.read_text(encoding="utf-8")
            row = {
                "schema_id": sid,
                "phase": candidate["phase"],
                "source_sha256": hashlib.sha256(source_bytes).hexdigest(),
                "candidate_sha256": candidate["reference_sha256"],
                "changes": candidate.get("changes", []),
                "blockers": candidate.get("blockers", []),
                "policy_eligible": candidate.get("policy_eligible", False),
                "mysql_status": "not_run", "mysql_error_code": None, "mysql_error": None,
                "postgres_status": "not_run", "postgres_sqlstate": None, "postgres_error": None,
            }
            try:
                statements = split_statements(source)
                reason = unsafe_reason(statements, MYSQL_ALLOWED)
                if reason:
                    row["mysql_status"] = "not_run_unsafe_or_out_of_scope"
                    row["mysql_error"] = reason
                else:
                    try:
                        _load_mysql(mc, statements)
                        row["mysql_status"] = "loaded"
                    except Exception as exc:
                        row["mysql_status"] = "load_failed"
                        row["mysql_error_code"] = getattr(exc, "args", [None])[0]
                        row["mysql_error"] = str(exc).replace("\r", " ").replace("\n", " ")[:800]
            except Exception as exc:
                row["mysql_status"] = "not_run_unsafe_or_out_of_scope"
                row["mysql_error"] = f"{type(exc).__name__}: {exc}"
            _mysql_cleanup(mc)

            try:
                statements = split_statements(candidate_sql)
                reason = unsafe_reason(statements, POSTGRES_ALLOWED)
                if reason:
                    row["postgres_status"] = "not_run_unsafe_or_out_of_scope"
                    row["postgres_error"] = reason
                else:
                    try:
                        _load_postgres(postgres, candidate_sql, sid, timeout_ms)
                        postgres.rollback()
                        row["postgres_status"] = "loaded"
                    except Exception as exc:
                        postgres.rollback()
                        row["postgres_status"] = "load_failed"
                        row["postgres_sqlstate"] = getattr(exc, "pgcode", None)
                        row["postgres_error"] = str(exc).replace("\r", " ").replace("\n", " ")[:800]
            except Exception as exc:
                postgres.rollback()
                row["postgres_status"] = "not_run_unsafe_or_out_of_scope"
                row["postgres_error"] = f"{type(exc).__name__}: {exc}"
            row["eligible_for_reference"] , row["eligibility_reason_codes"] = _eligibility(candidate, row["postgres_status"])
            row["comparison"] = (
                "both_loaded" if row["mysql_status"] == row["postgres_status"] == "loaded" else
                "mysql_only" if row["mysql_status"] == "loaded" else
                "postgresql_only" if row["postgres_status"] == "loaded" else "neither_loaded")
            rows.append(row)
            if index % 25 == 0:
                print(f"v5 compatibility audit: {index}/{len(roster)}", flush=True)
    finally:
        postgres.rollback()
        postgres.close()
        _mysql_cleanup(mc)
        if _mysql_objects(mc):
            raise RuntimeError("MySQL audit cleanup failed; compatibility database is not empty")
        mc.close()
        mysql.close()

    all_split = _read_manifest(PROJECT / "config/paper_splits.json")
    all_ids = all_split["development"] + all_split["pilot"] + all_split["final"]
    add_clauses = _add_clause_counts(source_root, list(dict.fromkeys(all_ids)))
    errors = defaultdict(lambda: {"count": 0, "schema_ids": set(), "fixable": False, "rationale": ""})
    for row in rows:
        if row["postgres_status"] != "load_failed":
            continue
        cls, fixable, rationale = _error_class(row["postgres_sqlstate"], row["postgres_error"])
        errors[cls]["count"] += 1
        errors[cls]["schema_ids"].add(row["schema_id"])
        errors[cls]["fixable"] = fixable
        errors[cls]["rationale"] = rationale
    error_tally = [
        {"class": key, "count": len(value["schema_ids"]), "fixable": value["fixable"],
         "rationale": value["rationale"], "schema_ids": sorted(value["schema_ids"])}
        for key, value in sorted(errors.items(), key=lambda item: (-len(item[1]["schema_ids"]), item[0]))
    ]
    summary = {
        "audit_version": 2,
        "audit_scope": "exact v5 final/pilot roster; DDL loadability only; no LLM calls",
        "v5_rosters": phase_counts,
        "candidate_roster_total": len(roster),
        "development_roster_not_in_v5_candidates": len(set(all_split["development"]) - set(roster)),
        "converter_version": CONVERTER_VERSION,
        "converter_sha256": hashlib.sha256(Path(__file__).resolve().parents[1].joinpath("src/er2sql/module7_evaluation/reference_normalization.py").read_bytes()).hexdigest(),
        "v5_source_manifest_hashes": {
            phase: hashlib.sha256((v5_root / phase / "normalization_manifest.json").read_bytes()).hexdigest()
            for phase in ("final", "pilot")},
        "candidate_manifest_hashes": {
            phase: hashlib.sha256((candidate_root / phase / "normalization_manifest.json").read_bytes()).hexdigest()
            for phase in ("final", "pilot")},
        "mysql_version": mysql_version,
        "mysql_database": mysql_db,
        "postgres_version": pg_numeric,
        "postgres_version_lock": EXPECTED_POSTGRES_MAJOR_MINOR,
        "postgres_database": pg_db,
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
        "reference_eligible_total": sum(r["eligible_for_reference"] for r in rows),
        "reference_eligible_final": sum(r["eligible_for_reference"] and r["phase"] == "final" for r in rows),
        "reference_eligible_pilot": sum(r["eligible_for_reference"] and r["phase"] == "pilot" for r in rows),
        "source_alter_add_clause_counts_all_714": add_clauses,
        "postgresql_error_class_tally": error_tally,
        "no_fixable_error_class_at_or_above_10": not any(e["fixable"] and e["count"] >= 10 for e in error_tally),
        "converter_change_tally": _change_tally(rows),
        "rows": rows,
    }
    summary["current_paper_split_crosswalk"] = _current_split_coverage(
        rows, PROJECT / "config/paper_splits.json")
    output_dir.mkdir(parents=True, exist_ok=True)
    (output_dir / "v5_compatibility.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    _write_report(output_dir / "V5_COMPATIBILITY_AND_ELIGIBILITY.md", summary)
    return summary


def _write_report(path: Path, data: dict):
    lines = [
        "# v5 Candidate Compatibility and Eligibility Freeze", "",
        "This report audits the exact schema rosters in the pre-existing v5 manifests: 608 final candidates and 20 pilot candidates. The corrected candidates are in a separate versioned directory; original v5 files were not overwritten. MySQL loads original source DDL; PostgreSQL loads the exact candidate SQL files. Successful DDL compilation alone is not semantic-equivalence approval.", "",
        f"- Converter: `{data['converter_version']}`", f"- Converter SHA-256: `{data['converter_sha256']}`",
        f"- PostgreSQL: `{data['postgres_version']}` (required lock `{data['postgres_version_lock']}`)",
        f"- MySQL: `{data['mysql_version']}`", f"- Historical v5 roster: {data['v5_rosters']['final']} final + {data['v5_rosters']['pilot']} pilot = {data['candidate_roster_total']}.",
        f"- Current paper split file SHA-256: `{data['current_paper_split_crosswalk']['paper_splits_sha256']}`.",
        "- No LLM calls; original source SQL was not changed.", "",
        "## Loadability summary", "", "| Outcome | Schemas |", "|---|---:|",
        f"| Both engines loaded | {data['both_loaded']} |", f"| MySQL only | {data['mysql_only']} |",
        f"| PostgreSQL only | {data['postgresql_only']} |", f"| Neither | {data['neither_loaded']} |",
        f"| MySQL total | {data['mysql_loaded']} |", f"| PostgreSQL total | {data['postgresql_loaded']} |", "",
        "## Frozen reference eligibility", "",
        f"Eligible overall: **{data['reference_eligible_total']}/{data['candidate_roster_total']}**; final: **{data['reference_eligible_final']}/{data['v5_rosters']['final']}**; pilot: **{data['reference_eligible_pilot']}/{data['v5_rosters']['pilot']}**.",
        f"For the current `config/paper_splits.json` final cohort specifically: **{data['current_paper_split_crosswalk']['current_final_eligible']}/{data['current_paper_split_crosswalk']['current_final_eligibility_denominator']}** eligible. Historical v5 `final`/`pilot` labels differ from today's split labels; use this current-split count for the present final cohort.",
        "A candidate is eligible only when its conversion has no blocker or unapproved change and its exact SQL compiles on the pinned PostgreSQL server. Every other candidate receives one or more reason codes in the JSON row.", "",
        "Zero-date policy: PostgreSQL cannot represent MySQL-style `0000-00-00` dates. The converter drops only that column's zero-date DEFAULT, keeps its declared type and nullability, and records `zero_date_default_removed` for each affected schema. This default behavior is explicitly out of scope.", "",
        "## Converter changes applied", "", "| Conversion category | Schemas affected |", "|---|---:|"]
    for category, count in data.get("converter_change_tally", {}).get("schemas_by_category_count", {}).items():
        lines.append(f"| `{category}` | {count} |")
    lines += [
        "",
        "## Remaining PostgreSQL failure classes", "", "| Error class | Schemas | Fixable by approved converter work? | Why |", "|---|---:|---|---|",
    ]
    for error in data["postgresql_error_class_tally"]:
        lines.append(f"| `{error['class']}` | {error['count']} | {'Yes' if error['fixable'] else 'No'} | {error['rationale']} |")
    lines += ["", f"Stop rule met (no fixable class has 10+ schemas): **{data['no_fixable_error_class_at_or_above_10']}**.", "",
              "## Source ALTER ADD inventory (all 714 split IDs)", "", "| Source clause | Files | Occurrences |", "|---|---:|---:|"]
    for label, counts in data["source_alter_add_clause_counts_all_714"].items():
        lines.append(f"| `{label}` | {counts['files']} | {counts['occurrences']} |")
    lines += ["", "## Current paper-split coverage", "", "| Current split | Total | Audited | Eligible among audited | Not audited |", "|---|---:|---:|---:|---:|"]
    for split_name, counts in data["current_paper_split_crosswalk"]["counts_by_current_paper_split"].items():
        lines.append(f"| {split_name} | {counts['total']} | {counts['audited']} | {counts['eligible_among_audited']} | {counts['not_audited']} |")
    lines += ["", "Historical candidate-manifest phase by current split:", ""]
    for phase, counts in data["current_paper_split_crosswalk"]["candidate_manifest_phase_by_current_paper_split"].items():
        lines.append(f"- v5 `{phase}` candidates: " + ", ".join(f"{name}={count}" for name, count in counts.items()))
    for split_name, counts in data["current_paper_split_crosswalk"]["counts_by_current_paper_split"].items():
        if counts["not_audited_schema_ids"]:
            lines += ["", f"Not audited from current `{split_name}` split (reason: `NOT_IN_EXACT_V5_CANDIDATE_ROSTER`):", "", ", ".join(f"`{sid}`" for sid in counts["not_audited_schema_ids"])]
    lines += ["", "## Per-schema frozen status", "", "| Historical phase | Schema | MySQL | PostgreSQL | Eligible | Reason codes |", "|---|---|---|---|---:|---|"]
    for row in data["rows"]:
        codes = ", ".join(row["eligibility_reason_codes"])
        lines.append(f"| {row['phase']} | `{row['schema_id']}` | {row['mysql_status']} | {row['postgres_status']} | {'yes' if row['eligible_for_reference'] else 'no'} | {codes} |")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--v5-roster", type=Path, default=PROJECT / "data/reference_candidates/v5")
    parser.add_argument("--candidate-root", type=Path, default=PROJECT / "data/reference_candidates/v5_2")
    parser.add_argument("--output", type=Path, default=PROJECT / "outputs/experiments/v5-compatibility-20261008-v2")
    parser.add_argument("--config", type=Path, default=PROJECT / "config/config.yaml")
    parser.add_argument("--render-existing-json", type=Path,
                        help="Regenerate the Markdown/JSON summary from a completed audit JSON without connecting to databases")
    args = parser.parse_args()
    if args.render_existing_json:
        json_path = args.render_existing_json.resolve()
        saved = json.loads(json_path.read_text(encoding="utf-8"))
        saved["converter_change_tally"] = _change_tally(saved["rows"])
        saved["current_paper_split_crosswalk"] = _current_split_coverage(
            saved["rows"], PROJECT / "config/paper_splits.json")
        json_path.write_text(json.dumps(saved, indent=2), encoding="utf-8")
        _write_report(json_path.with_name("V5_COMPATIBILITY_AND_ELIGIBILITY.md"), saved)
        print(f"Updated report from saved audit rows; no databases or LLMs contacted.")
        return
    result = run_audit(args.v5_roster, args.candidate_root, args.output, args.config)
    print(f"Complete: PG {result['postgresql_loaded']}/{result['candidate_roster_total']} loaded; "
          f"eligible {result['reference_eligible_total']} ({result['reference_eligible_final']} final, "
          f"{result['reference_eligible_pilot']} pilot); no fixable 10+ class={result['no_fixable_error_class_at_or_above_10']}.")


if __name__ == "__main__":
    main()
