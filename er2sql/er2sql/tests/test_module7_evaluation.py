"""Offline tests for paired tier drop-off metrics."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.module7_evaluation.evaluator import (
    EvaluationReport,
    _aggregate_rows,
    _markdown_report,
    _paired_tier_drop_off,
    _schema_metrics,
)


def _row(
    schema_id: str,
    tier: str,
    *,
    compiled: bool,
    table_recall: float,
    cer: float,
    test_rate: float,
) -> dict:
    return {
        "schema_id": schema_id,
        "tier": tier,
        "ddl_execution_success": compiled,
        "constraint_enforcement_rate": cer,
        "test_pass_rate": test_rate,
        "final_sql_structural_metrics": {
            "tables": {"recall": table_recall},
            "foreign_keys": {"f1": table_recall},
        },
    }


class TierDropOffTests(unittest.TestCase):
    def test_drop_off_uses_only_schema_ids_shared_with_tier1(self) -> None:
        rows = [
            _row("a", "tier1", compiled=True, table_recall=1.0, cer=1.0, test_rate=1.0),
            _row("b", "tier1", compiled=True, table_recall=0.8, cer=0.8, test_rate=0.9),
            _row("a", "tier2", compiled=False, table_recall=0.5, cer=0.5, test_rate=0.4),
            _row("b", "tier2", compiled=True, table_recall=0.7, cer=0.6, test_rate=0.8),
            _row("tier2_only", "tier2", compiled=True, table_recall=1.0, cer=1.0, test_rate=1.0),
        ]

        comparison = _paired_tier_drop_off(rows)["tier1_to_tier2"]

        self.assertEqual(comparison["matched_schema_count"], 2)
        self.assertAlmostEqual(comparison["metrics"]["compile_rate"]["mean_drop"], 0.5)
        self.assertAlmostEqual(comparison["metrics"]["table_recall"]["mean_drop"], 0.3)
        self.assertAlmostEqual(
            comparison["metrics"]["constraint_enforcement_rate"]["mean_drop"], 0.35
        )

    def test_markdown_keeps_arm_comparison_after_rendering_tier_dropoff(self) -> None:
        report = EvaluationReport(
            generated_at="now",
            results_dir="results",
            arm="structured",
            model_name="model",
            overall={},
            by_tier={},
            by_complexity={},
            structural_metrics={},
            final_sql_structural_metrics={},
            test_type_metrics={},
            tier_drop_off={
                "tier1_to_tier2": {
                    "reference_tier": "tier1",
                    "comparison_tier": "tier2",
                    "matched_schema_count": 1,
                    "metrics": {
                        "compile_rate": {
                            "paired_schema_count": 1,
                            "reference_mean": 1.0,
                            "comparison_mean": 0.0,
                            "mean_drop": 1.0,
                        }
                    },
                }
            },
            schema_metrics=[],
            warnings=[],
        )
        markdown = _markdown_report(
            report,
            {"delta_primary_minus_reference": {"ddl_execution_rate": 0.25}},
        )
        self.assertIn("| ddl_execution_rate | 0.25 |", markdown)


class PublishableMetricTests(unittest.TestCase):
    def test_final_sql_and_behavioral_metrics_are_recorded(self) -> None:
        sql = """
        CREATE TABLE parent (id INTEGER PRIMARY KEY);
        CREATE TABLE child (
            parent_id INTEGER NOT NULL,
            code TEXT UNIQUE,
            PRIMARY KEY (parent_id, code),
            FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE CASCADE,
            CHECK (parent_id > 0)
        );
        """
        result = {
            "schema_id": "schema_1",
            "tier": "tier1",
            "ground_truth_sql": sql,
            "module2_parsing": {
                "success": True,
                "ir": {"tables": [], "relationships": []},
                "validation": {"schema_errors": [], "semantic_errors": []},
            },
            "module3_generation": {"success": True, "sql_ddl": sql},
            "module5_verification": {
                "ddl_execution": {"success": True},
                "test_results": [
                    {
                        "test_type": "foreign_key_accept_valid_parent",
                        "category": "constraint",
                        "expect": "success",
                        "passed": True,
                    },
                    {
                        "test_type": "foreign_key_reject_invalid_parent",
                        "category": "constraint",
                        "expect": "failure",
                        "passed": True,
                    },
                ],
            },
        }

        row = _schema_metrics(result, "structured")
        aggregate = _aggregate_rows([row])

        self.assertEqual(row["final_sql_structural_metrics"]["tables"]["f1"], 1.0)
        self.assertEqual(row["final_sql_structural_metrics"]["foreign_keys"]["f1"], 1.0)
        self.assertEqual(row["final_sql_structural_metrics"]["data_types"]["f1"], 1.0)
        self.assertTrue(row["fully_correct_schema"])
        self.assertTrue(row["end_to_end_success"])
        self.assertEqual(aggregate["valid_operation_acceptance_rate"], 1.0)
        self.assertEqual(aggregate["invalid_operation_rejection_rate"], 1.0)
        self.assertEqual(aggregate["fully_correct_schema_rate"], 1.0)
        self.assertEqual(aggregate["end_to_end_success_rate"], 1.0)


if __name__ == "__main__":
    unittest.main()
