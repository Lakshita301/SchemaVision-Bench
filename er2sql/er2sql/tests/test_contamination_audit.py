"""Tests for the contamination-risk audit and cross-split safeguards."""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.module7_evaluation.contamination_audit import audit_contamination


class ContaminationAuditTests(unittest.TestCase):
    def _fixture(self, root: Path):
        split = {"development": ["s1"], "pilot": ["s2"], "final": ["s3"]}
        split_path = root / "split.json"
        split_path.write_text(json.dumps(split), encoding="utf-8")
        metadata_path = root / "metadata.json"
        metadata = {
            "schemas": {
                schema_id: {
                    "schema_name": schema_id,
                    "source_project": "private project " + schema_id,
                    "source_url": "https://example.invalid/" + schema_id,
                    "source_family": "family_" + schema_id,
                    "risk_level": "low",
                    "risk_rationale": "Reviewed source and name; no registered popular-schema match.",
                    "evidence_url": "",
                    "review_status": "reviewed",
                    "reviewed_by": "reviewer",
                    "reviewed_on": "2026-10-08",
                }
                for schema_id in ("s1", "s2", "s3")
            }
        }
        metadata_path.write_text(json.dumps(metadata), encoding="utf-8")
        registry_path = root / "registry.json"
        registry_path.write_text(json.dumps({"candidates": [{
            "catalog_id": "northwind", "aliases": ["Northwind"],
            "risk_level": "high", "basis": "test registry",
        }]}), encoding="utf-8")
        sql_root = root / "sql"
        sql_root.mkdir()
        for schema_id in ("s1", "s2", "s3"):
            (sql_root / f"{schema_id}.sql").write_text(
                f"CREATE TABLE {schema_id} (id integer primary key);", encoding="utf-8"
            )
        return split_path, metadata_path, registry_path, sql_root, metadata

    def test_complete_review_and_sql_hash_coverage_is_ready(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            paths = self._fixture(Path(temp))
            report = audit_contamination(
                split_path=paths[0], metadata_path=paths[1],
                registry_path=paths[2], sql_root=paths[3],
            )
            self.assertEqual(report["audit_status"], "complete")
            self.assertTrue(report["ready_for_paid_run"])
            self.assertEqual(report["low_risk_sensitivity_schema_ids"], ["s1", "s2", "s3"])

    def test_registered_popular_schema_is_flagged_even_if_declared_low(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            split, metadata_path, registry, sql, metadata = self._fixture(Path(temp))
            metadata["schemas"]["s3"]["schema_name"] = "Northwind sample database"
            metadata_path.write_text(json.dumps(metadata), encoding="utf-8")
            report = audit_contamination(
                split_path=split, metadata_path=metadata_path,
                registry_path=registry, sql_root=sql,
            )
            self.assertIn("s3", report["high_risk_schema_ids"])
            self.assertNotIn("s3", report["low_risk_sensitivity_schema_ids"])

    def test_identical_sql_across_splits_blocks_paid_run(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            split, metadata, registry, sql, _ = self._fixture(Path(temp))
            (sql / "s3.sql").write_bytes((sql / "s1.sql").read_bytes())
            report = audit_contamination(
                split_path=split, metadata_path=metadata,
                registry_path=registry, sql_root=sql,
            )
            self.assertFalse(report["ready_for_paid_run"])
            self.assertIn("identical_source_sql_crosses_splits", report["blockers"])

    def test_source_family_crossing_splits_blocks_paid_run(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            split, metadata_path, registry, sql, metadata = self._fixture(Path(temp))
            metadata["schemas"]["s3"]["source_family"] = "family_s1"
            metadata_path.write_text(json.dumps(metadata), encoding="utf-8")
            report = audit_contamination(
                split_path=split, metadata_path=metadata_path,
                registry_path=registry, sql_root=sql,
            )
            self.assertFalse(report["ready_for_paid_run"])
            self.assertIn("source_family_crosses_splits", report["blockers"])

    def test_metadata_or_sql_coverage_gap_blocks_paid_run(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            split, metadata_path, registry, sql, metadata = self._fixture(Path(temp))
            metadata["schemas"]["s2"]["review_status"] = "pending"
            metadata_path.write_text(json.dumps(metadata), encoding="utf-8")
            (sql / "s2.sql").unlink()
            report = audit_contamination(
                split_path=split, metadata_path=metadata_path,
                registry_path=registry, sql_root=sql,
            )
            self.assertFalse(report["ready_for_paid_run"])
            self.assertIn("metadata_review_incomplete", report["blockers"])
            self.assertIn("source_sql_hash_coverage_incomplete", report["blockers"])


if __name__ == "__main__":
    unittest.main()
