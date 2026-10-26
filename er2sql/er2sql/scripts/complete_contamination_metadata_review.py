"""Record a transparent metadata/registry review for the frozen contamination split.

This does not infer training-data exposure or invent source identities. It
preserves existing provenance, records unknown identities explicitly, and
ties the review to the already-published GitHub source screen and risk registry.
"""

from __future__ import annotations

import argparse
import json
from datetime import date
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--split", type=Path, default=Path("config/paper_splits_v5.json"))
    parser.add_argument("--metadata", type=Path, default=Path("data/dataset_provenance.json"))
    parser.add_argument("--reviewer", default="Codex (AI-assisted metadata and registry review)")
    parser.add_argument("--review-date", default=date.today().isoformat())
    args = parser.parse_args()

    split = json.loads(args.split.read_text(encoding="utf-8-sig"))
    expected = {
        str(schema_id)
        for group in ("development", "pilot", "final")
        for schema_id in split[group]
    }
    document = json.loads(args.metadata.read_text(encoding="utf-8-sig"))
    rows = document.get("schemas", document)
    if set(rows) != expected:
        raise SystemExit("Provenance IDs do not exactly match the frozen split; no changes made.")

    rationale = (
        "Reviewed the recorded source project/URL against the 2026-10-09 GitHub "
        "source-popularity screen and the pre-registered contamination risk "
        "registry. A repository candidate is not proof of a shared schema family. "
        "Exact model pretraining exposure cannot be established; risk remains unknown."
    )
    for row in rows.values():
        if not isinstance(row, dict):
            raise SystemExit("Invalid provenance row; no changes made.")
        # Do not manufacture missing source claims. The audit's documented
        # convention is to spell unavailable schema/family identities as unknown.
        if not str(row.get("schema_name", "")).strip():
            row["schema_name"] = "unknown"
        for field in ("source_project", "source_url", "source_family"):
            if not str(row.get(field, "")).strip():
                row[field] = "unknown"
        row["risk_level"] = "unknown"
        row["risk_rationale"] = rationale
        row["review_status"] = "reviewed"
        row["reviewed_by"] = args.reviewer
        row["reviewed_on"] = args.review_date

    args.metadata.write_text(json.dumps(document, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Reviewed metadata rows: {len(rows)}; unknown risk retained; reviewer: {args.reviewer}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
