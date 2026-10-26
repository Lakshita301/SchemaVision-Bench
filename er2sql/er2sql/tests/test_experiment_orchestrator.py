"""Offline tests for the manifest-driven experiment orchestrator."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.module7_evaluation.orchestrator import (
    ExperimentManifestError,
    load_experiment_manifest,
    run_experiment,
)


class ExperimentOrchestratorTests(unittest.TestCase):
    def test_structural_track_manifest_uses_only_frozen_final_structural_ids(self) -> None:
        manifest_path = Path(__file__).resolve().parents[1] / "config" / "experiment.paper-structural-v6.yaml"
        spec = load_experiment_manifest(manifest_path)
        self.assertEqual(spec.phase, "structural")
        self.assertFalse(spec.verify)
        self.assertEqual(len(spec.schema_ids or ()), 167)
        self.assertEqual(spec.tiers, ("tier1", "tier2", "tier3"))

    def test_dry_run_freezes_common_schema_selection_without_calls(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            tiers = {}
            for tier in ("tier1", "tier2", "tier3"):
                diagrams = root / tier / "diagrams"
                sql = root / tier / "sql"
                diagrams.mkdir(parents=True)
                sql.mkdir(parents=True)
                for schema_id in ("schema_0001", "schema_0002"):
                    (diagrams / f"{schema_id}.png").write_bytes(b"not-read-by-dry-run")
                    (sql / f"{schema_id}.sql").write_text(
                        "CREATE TABLE demo (id INTEGER PRIMARY KEY);", encoding="utf-8"
                    )
                tiers[tier] = {
                    "diagrams_dir": str(diagrams),
                    "sql_dir": str(sql),
                }

            config_path = root / "model.yaml"
            config_path.write_text(
                yaml.safe_dump(
                    {
                        "llm": {
                            "module2_parsing": {"model": "vision", "api_key_env": "TEST_KEY"},
                            "module3_generation": {"model": "text", "api_key_env": "TEST_KEY"},
                            "module6_direct_baseline": {
                                "model": "vision", "api_key_env": "TEST_KEY"
                            },
                        },
                        "database": {
                            "host": "localhost",
                            "port": 5432,
                            "dbname": "test",
                            "user": "test",
                            "password_env": "TEST_DB_PASSWORD",
                        },
                        "dataset": {"tiers": tiers},
                    }
                ),
                encoding="utf-8",
            )
            output_root = root / "outputs"
            manifest_path = root / "experiment.yaml"
            manifest_path.write_text(
                yaml.safe_dump(
                    {
                        "version": 1,
                        "experiment": {
                            "name": "offline-test",
                            "output_root": str(output_root),
                            "tiers": ["tier1", "tier2", "tier3"],
                            "common_only": True,
                            "limit": 1,
                            "verify": True,
                        },
                        "models": [
                            {
                                "name": "demo-model",
                                "config": str(config_path),
                                "arms": ["structured", "direct"],
                                "prompt_version": "test-v1",
                            }
                        ],
                    }
                ),
                encoding="utf-8",
            )

            result = run_experiment(manifest_path, dry_run=True)

            plan = result["plan"]
            self.assertTrue(result["dry_run"])
            self.assertEqual(plan["models"][0]["selected_schema_counts"], {
                "tier1": 1, "tier2": 1, "tier3": 1
            })
            self.assertEqual(plan["totals"]["schema_tier_arm_tasks"], 6)
            # Structured tasks need one call if Module 2 fails before SQL
            # generation, or two if every parse reaches Module 3. Direct
            # tasks always need one call.
            self.assertEqual(plan["totals"]["nominal_llm_calls_min"], 6)
            self.assertEqual(plan["totals"]["nominal_llm_calls_max"], 9)
            self.assertFalse(output_root.exists())

    def test_manifest_rejects_unsupported_full_arm(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            manifest_path = Path(temp_dir) / "experiment.yaml"
            manifest_path.write_text(
                yaml.safe_dump(
                    {
                        "version": 1,
                        "experiment": {"name": "invalid"},
                        "models": [
                            {"name": "demo", "config": "config.yaml", "arms": ["full"]}
                        ],
                    }
                ),
                encoding="utf-8",
            )
            with self.assertRaises(ExperimentManifestError):
                load_experiment_manifest(manifest_path)


if __name__ == "__main__":
    unittest.main()
