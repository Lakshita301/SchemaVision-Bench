"""Pre-registered dataset contamination-risk and split-leakage audit.

This audit cannot inspect model pretraining data. It flags known public-schema
risk candidates, checks source-family and exact-SQL leakage across frozen
splits, and fails closed when provenance review or SQL coverage is incomplete.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from collections import defaultdict
from datetime import date
from pathlib import Path
from typing import Any

FORMAT_VERSION = 1
RISK_LEVELS = {"low", "medium", "high", "unknown", "unreviewed"}


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _normalize(value: Any) -> str:
    return " ".join(re.findall(r"[a-z0-9]+", str(value or "").casefold()))


def _load_json(path: Path) -> dict:
    with path.open("r", encoding="utf-8-sig") as handle:
        value = json.load(handle)
    if not isinstance(value, dict):
        raise ValueError(f"Expected a JSON object in {path}")
    return value


def _split_groups(split: dict) -> dict[str, set[str]]:
    groups = {}
    for name in ("development", "pilot", "final"):
        values = split.get(name)
        if not isinstance(values, list) or any(not str(item).strip() for item in values):
            raise ValueError(f"Split must contain a non-empty '{name}' list")
        groups[name] = {str(item).strip() for item in values}
        if len(groups[name]) != len(values):
            raise ValueError(f"Split '{name}' contains duplicate schema IDs")
    for left, right in (("development", "pilot"), ("development", "final"), ("pilot", "final")):
        overlap = groups[left] & groups[right]
        if overlap:
            raise ValueError(f"Frozen split overlaps between {left} and {right}: {sorted(overlap)[:10]}")
    return groups


def write_metadata_template(split_path: Path, output_path: Path) -> int:
    split = _load_json(split_path)
    groups = _split_groups(split)
    rows = {}
    for group, ids in groups.items():
        for schema_id in sorted(ids):
            rows[schema_id] = {
                "split": group,
                "schema_name": "",
                "source_project": "",
                "source_url": "",
                "source_family": "",
                "risk_level": "unreviewed",
                "risk_rationale": "",
                "evidence_url": "",
                "review_status": "pending",
                "reviewed_by": "",
                "reviewed_on": "",
            }
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps({"schemas": rows}, indent=2) + "\n", encoding="utf-8")
    return len(rows)


def _catalog_matches(metadata: dict, registry: dict) -> list[dict[str, str]]:
    haystack = _normalize(" ".join(str(metadata.get(key, "")) for key in (
        "schema_name", "source_project", "source_url", "source_family"
    )))
    matches = []
    for entry in registry.get("candidates", []):
        for alias in entry.get("aliases", []):
            normalized_alias = _normalize(alias)
            if normalized_alias and re.search(rf"(?<![a-z0-9]){re.escape(normalized_alias)}(?![a-z0-9])", haystack):
                matches.append({
                    "catalog_id": str(entry.get("catalog_id", alias)),
                    "matched_alias": alias,
                    "risk_level": str(entry.get("risk_level", "high")),
                    "basis": str(entry.get("basis", "Pre-registered popular-schema risk candidate")),
                })
                break
    return matches


def audit_contamination(
    *,
    split_path: Path,
    metadata_path: Path,
    registry_path: Path,
    sql_root: Path | None,
) -> dict:
    split = _load_json(split_path)
    groups = _split_groups(split)
    all_ids = set().union(*groups.values())
    split_of = {schema_id: group for group, ids in groups.items() for schema_id in ids}
    metadata_doc = _load_json(metadata_path)
    metadata = metadata_doc.get("schemas", metadata_doc)
    registry = _load_json(registry_path)
    if not isinstance(metadata, dict):
        raise ValueError("Metadata JSON must contain a 'schemas' object keyed by schema ID")

    missing_metadata = sorted(all_ids - set(metadata))
    extra_metadata = sorted(set(metadata) - all_ids)
    incomplete_metadata = []
    cross_split_families: dict[str, set[str]] = defaultdict(set)
    risk_rows = []
    high_risk_ids: set[str] = set()
    low_risk_ids: set[str] = set()
    risk_counts = {level: 0 for level in RISK_LEVELS}
    for schema_id in sorted(all_ids & set(metadata)):
        row = metadata[schema_id]
        if not isinstance(row, dict):
            incomplete_metadata.append({"schema_id": schema_id, "missing_fields": ["metadata object"]})
            continue
        missing = []
        if row.get("review_status") != "reviewed":
            missing.append("review_status=reviewed")
        if not str(row.get("reviewed_by", "")).strip():
            missing.append("reviewed_by")
        reviewed_on = str(row.get("reviewed_on", "")).strip()
        try:
            date.fromisoformat(reviewed_on)
        except ValueError:
            missing.append("reviewed_on (YYYY-MM-DD)")
        level = str(row.get("risk_level", "unreviewed")).casefold()
        if level not in RISK_LEVELS - {"unreviewed"}:
            missing.append("risk_level (low/medium/high/unknown)")
            level = "unreviewed"
        for field in ("schema_name", "source_project", "source_url", "source_family"):
            if not str(row.get(field, "")).strip():
                missing.append(field)
        if level in {"high", "medium", "unknown"} and not str(row.get("risk_rationale", "")).strip():
            missing.append("risk_rationale")
        if level == "high" and not str(row.get("evidence_url", "")).strip():
            missing.append("evidence_url for manually assigned high risk")
        if level == "low" and all(
            _normalize(row.get(field)) in {"", "unknown"}
            for field in ("schema_name", "source_project")
        ):
            missing.append("known schema_name or source_project before assigning low risk")
        if missing:
            incomplete_metadata.append({"schema_id": schema_id, "missing_fields": missing})

        family = _normalize(row.get("source_family"))
        if family and family != "unknown":
            cross_split_families[family].add(split_of[schema_id])

        matches = _catalog_matches(row, registry)
        effective = "high" if matches else level
        risk_counts[effective] = risk_counts.get(effective, 0) + 1
        if effective == "high":
            high_risk_ids.add(schema_id)
        elif effective == "low":
            low_risk_ids.add(schema_id)
        if matches or effective in {"high", "medium", "unknown", "unreviewed"}:
            risk_rows.append({
                "schema_id": schema_id,
                "split": split_of[schema_id],
                "declared_risk_level": level,
                "effective_risk_level": effective,
                "catalog_matches": matches,
                "risk_rationale": str(row.get("risk_rationale", "")),
                "evidence_url": str(row.get("evidence_url", "")),
            })

    family_leaks = [
        {"source_family": family, "splits": sorted(split_names)}
        for family, split_names in sorted(cross_split_families.items())
        if len(split_names) > 1
    ]

    sql_hashes: dict[str, list[str]] = defaultdict(list)
    missing_sql = []
    if sql_root is not None:
        for schema_id in sorted(all_ids):
            sql_path = sql_root / f"{schema_id}.sql"
            if not sql_path.is_file():
                # Accept the other common source DDL suffixes without guessing
                alternatives = [sql_root / f"{schema_id}{suffix}" for suffix in (".ddl", ".txt")]
                sql_path = next((candidate for candidate in alternatives if candidate.is_file()), sql_path)
            if not sql_path.is_file():
                missing_sql.append(schema_id)
                continue
            sql_hashes[sha256_file(sql_path)].append(schema_id)
    duplicate_sql = []
    cross_split_sql_leaks = []
    for digest, ids in sorted(sql_hashes.items()):
        if len(ids) < 2:
            continue
        row = {"sha256": digest, "schema_ids": sorted(ids), "splits": sorted({split_of[sid] for sid in ids})}
        duplicate_sql.append(row)
        if len(row["splits"]) > 1:
            cross_split_sql_leaks.append(row)

    audit_complete = (
        not missing_metadata and not extra_metadata and not incomplete_metadata
        and sql_root is not None and not missing_sql
    )
    ready = audit_complete and not family_leaks and not cross_split_sql_leaks
    low_risk = sorted(low_risk_ids)
    return {
        "format_version": FORMAT_VERSION,
        "audit_policy": "er2sql_contamination_risk_v1",
        "audit_status": "complete" if audit_complete else "incomplete",
        "ready_for_paid_run": ready,
        "pretraining_claim": "This audit cannot establish whether any model saw these schemas during training.",
        "split_path": str(split_path),
        "split_sha256": sha256_file(split_path),
        "metadata_sha256": sha256_file(metadata_path),
        "registry_sha256": sha256_file(registry_path),
        "split_counts": {key: len(value) for key, value in groups.items()},
        "schema_count": len(all_ids),
        "metadata_coverage": {
            "present": len(all_ids) - len(missing_metadata),
            "missing_schema_ids": missing_metadata,
            "extra_schema_ids": extra_metadata,
            "incomplete_reviews": incomplete_metadata,
        },
        "source_sql_coverage": {
            "root": str(sql_root) if sql_root else None,
            "hashed": len(all_ids) - len(missing_sql) if sql_root else 0,
            "missing_schema_ids": missing_sql,
        },
        "risk_counts": risk_counts,
        "high_risk_schema_ids": sorted(high_risk_ids),
        "low_risk_sensitivity_schema_ids": low_risk,
        "risk_flags": risk_rows,
        "exact_duplicate_sql_groups": duplicate_sql,
        "cross_split_source_family_leaks": family_leaks,
        "cross_split_exact_sql_leaks": cross_split_sql_leaks,
        "primary_policy": "Keep the frozen eligible evaluation cohort unchanged; report all cases as primary and a predeclared low-risk-only sensitivity analysis. Never tune prompts on final results.",
        "blockers": [
            *( ["metadata_review_incomplete"] if missing_metadata or extra_metadata or incomplete_metadata else [] ),
            *( ["source_sql_hash_coverage_incomplete"] if sql_root is None or missing_sql else [] ),
            *( ["source_family_crosses_splits"] if family_leaks else [] ),
            *( ["identical_source_sql_crosses_splits"] if cross_split_sql_leaks else [] ),
        ],
    }


def _markdown(report: dict) -> str:
    counts = report["risk_counts"]
    lines = [
        "# Dataset contamination-risk audit",
        "",
        f"- Status: **{report['audit_status']}**",
        f"- Paid-run gate: **{'ready' if report['ready_for_paid_run'] else 'blocked'}**",
        f"- Frozen split SHA-256: `{report['split_sha256']}`",
        f"- Schemas: {report['schema_count']}",
        f"- Risk labels: high {counts.get('high', 0)}, medium {counts.get('medium', 0)}, low {counts.get('low', 0)}, unknown {counts.get('unknown', 0)}, unreviewed {counts.get('unreviewed', 0)}",
        "",
        f"> {report['pretraining_claim']}",
        "",
        "## Required reporting safeguard",
        "",
        report["primary_policy"],
        "",
        "## Blockers",
        "",
    ]
    lines.extend([f"- {item}" for item in report["blockers"]] or ["- None"])
    lines += ["", "## Split leakage checks", "", f"- Cross-split source-family leaks: {len(report['cross_split_source_family_leaks'])}", f"- Cross-split exact-SQL duplicate groups: {len(report['cross_split_exact_sql_leaks'])}", f"- All exact-SQL duplicate groups: {len(report['exact_duplicate_sql_groups'])}", "", "## Risk flags", ""]
    lines.extend(
        f"- `{row['schema_id']}` ({row['split']}): {row['effective_risk_level']} risk; {', '.join(m['matched_alias'] for m in row['catalog_matches']) or row['risk_rationale'] or 'review required'}"
        for row in report["risk_flags"]
    )
    if not report["risk_flags"]:
        lines.append("- No flags recorded (this is not proof of no training-data exposure).")
    return "\n".join(lines) + "\n"


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--split", type=Path, default=Path("config/paper_splits.json"))
    parser.add_argument("--metadata", type=Path, default=Path("data/dataset_provenance.json"))
    parser.add_argument("--registry", type=Path, default=Path("config/contamination_risk_registry.json"))
    parser.add_argument("--sql-root", type=Path, help="Directory containing original <schema_id>.sql files")
    parser.add_argument("--output", type=Path, default=Path("docs/audits/dataset_contamination_v1.json"))
    parser.add_argument("--write-template", type=Path, help="Write an unreviewed metadata template and exit")
    args = parser.parse_args(argv)
    try:
        if args.write_template:
            count = write_metadata_template(args.split, args.write_template)
            print(f"Wrote {count} unreviewed schema metadata records to {args.write_template}")
            return 0
        report = audit_contamination(
            split_path=args.split,
            metadata_path=args.metadata,
            registry_path=args.registry,
            sql_root=args.sql_root,
        )
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
        args.output.with_suffix(".md").write_text(_markdown(report), encoding="utf-8")
        print(f"Audit {report['audit_status']}; paid-run gate {'ready' if report['ready_for_paid_run'] else 'blocked'}; report: {args.output}")
        return 0 if report["ready_for_paid_run"] else 2
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        print(f"Contamination audit failed: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
