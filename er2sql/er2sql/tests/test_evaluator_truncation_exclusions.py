"""Regression tests for protocol-v3, confirmed-truncation exclusions."""

import json
import tempfile
import unittest
from pathlib import Path

from er2sql.module4_constraint_tests.generator import generate_constraint_tests
from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module7_evaluation.evaluator import (
    EvaluationReport,
    _schema_metrics,
    compare_reports,
    detect_truncation_exclusions,
)


class ConfirmedTruncationExclusionTests(unittest.TestCase):
    def _write_result(self, root: Path, arm: str, tier: str, schema_id: str, result: dict) -> None:
        if arm == "structured":
            directory = root / arm / tier
        else:
            directory = root / arm / "module6_direct_baseline" / tier
        directory.mkdir(parents=True, exist_ok=True)
        (directory / f"{schema_id}.json").write_text(
            json.dumps(result), encoding="utf-8"
        )

    def test_valid_structured_output_at_cap_is_not_excluded(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            self._write_result(root, "structured", "tier2", "schema_valid", {
                "schema_id": "schema_valid",
                "tier": "tier2",
                "module2_parsing": {
                    "success": True,
                    "validation": {"is_valid": True},
                    "ir": {"tables": []},
                    "finish_reasons": ["length"],
                },
                "module3_generation": {"success": True, "finish_reason": "stop"},
            })
            result = json.loads(
                (root / "structured" / "tier2" / "schema_valid.json").read_text(
                    encoding="utf-8"
                )
            )
            self.assertEqual(detect_truncation_exclusions([root / "structured"]), {})
            metrics = _schema_metrics(result, "structured")
            self.assertTrue(metrics["output_limit_finish"])
            self.assertFalse(metrics["output_truncated"])

    def test_confirmed_truncated_cell_is_excluded_for_both_arms(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            self._write_result(root, "structured", "tier2", "schema_pair", {
                "schema_id": "schema_pair",
                "tier": "tier2",
                "module2_parsing": {
                    "success": True,
                    "validation": {"is_valid": True},
                    "ir": {"tables": []},
                    "finish_reasons": ["length"],
                },
                "module3_generation": {"success": True, "finish_reason": "stop"},
            })
            self._write_result(root, "direct", "tier2", "schema_pair", {
                "schema_id": "schema_pair",
                "tier": "tier2",
                "module6_direct_baseline": {
                    "success": True,
                    "sql_ddl": "CREATE TABLE t (id INT PRIMARY KEY",
                    "finish_reason": "length",
                },
                "module5_verification": {
                    "ddl_execution": {
                        "success": False,
                        "error_message": "syntax error at end of input",
                    }
                },
            })
            self.assertEqual(
                detect_truncation_exclusions([
                    root / "structured",
                    root / "direct" / "module6_direct_baseline",
                ]),
                {"schema_pair": {"tier2": ["direct:module6:output_limit_unusable"]}},
            )

    def test_non_eof_sql_error_does_not_become_truncation_exclusion(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            self._write_result(root, "direct", "tier3", "schema_invalid_sql", {
                "schema_id": "schema_invalid_sql",
                "tier": "tier3",
                "module6_direct_baseline": {
                    "success": True,
                    "sql_ddl": "CREATE TABLE t (id INT)",
                    "finish_reason": "length",
                },
                "module5_verification": {
                    "ddl_execution": {
                        "success": False,
                        "error_message": "type does not exist",
                    }
                },
            })
            self.assertEqual(
                detect_truncation_exclusions([
                    root / "direct" / "module6_direct_baseline"
                ]),
                {},
            )

    def test_planned_denominator_uses_gold_sql_for_both_arms(self):
        gold_sql = "CREATE TABLE account (id INT PRIMARY KEY, name TEXT NOT NULL);"
        wrong_predicted_suite = generate_constraint_tests(
            {"tables": []}, "s", constraint_source="predicted_ir"
        ).as_dict()
        result = {
            "schema_id": "s",
            "tier": "tier1",
            "ground_truth_sql": gold_sql,
            "module4_gold_test_suite": wrong_predicted_suite,
            "module2_parsing": {"success": True, "ir": {"tables": []}},
            "module3_generation": {"success": True, "sql_ddl": ""},
            "module6_direct_baseline": {"success": True, "sql_ddl": ""},
            "module5_verification": {"test_results": [], "ddl_execution": {"success": False}},
        }
        structured = _schema_metrics(result, "structured")
        direct = _schema_metrics(result, "direct")
        gold_count = len(generate_constraint_tests(
            parse_ground_truth_sql(gold_sql, "s").ir,
            "s",
            constraint_source="ground_truth_sql",
        ).tests)
        self.assertGreater(gold_count, 0)
        self.assertEqual(structured["planned_tests_total"], gold_count)
        self.assertEqual(direct["planned_tests_total"], gold_count)
        self.assertEqual(structured["planned_constraint_tests_total"], direct["planned_constraint_tests_total"])
        self.assertEqual(structured["planned_test_reference"], "module1_ground_truth_sql")
        self.assertEqual(direct["planned_test_reference"], "module1_ground_truth_sql")

    def test_paired_comparison_rejects_mismatched_gold_reference(self):
        base = {
            "schema_id": "s",
            "tier": "tier1",
            "planned_tests_total": 2,
            "planned_constraint_tests_total": 1,
        }
        structured = EvaluationReport(
            arm="structured", model_name="m", results_dir="s", generated_at="now",
            overall={}, by_tier={}, tier_drop_off={}, by_complexity={},
            structural_metrics={}, final_sql_structural_metrics={}, test_type_metrics={},
            schema_metrics=[{**base, "planned_reference_sha256": "gold-a"}],
        )
        direct = EvaluationReport(
            arm="direct", model_name="m", results_dir="d", generated_at="now",
            overall={}, by_tier={}, tier_drop_off={}, by_complexity={},
            structural_metrics={}, final_sql_structural_metrics={}, test_type_metrics={},
            schema_metrics=[{**base, "planned_reference_sha256": "gold-b"}],
        )
        with self.assertRaisesRegex(ValueError, "gold reference or planned denominator differs"):
            compare_reports(structured, direct)


if __name__ == "__main__":
    unittest.main()
