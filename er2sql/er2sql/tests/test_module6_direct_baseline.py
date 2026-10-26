"""Offline contract tests for Module 6; no model or database calls."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.module6_direct_baseline.agent import generate_sql_directly_from_image


class _FakeVisionClient:
    def __init__(self) -> None:
        self.calls: list[dict] = []

    def complete_with_image(self, **kwargs):
        self.calls.append(kwargs)

        class Result:
            success = True
            text = "```sql\nCREATE TABLE demo (id INTEGER PRIMARY KEY);\n```"
            attempts_used = 1
            error_message = None
            input_tokens = 10
            output_tokens = 5
            total_tokens = 15
            latency_seconds = 0.1
            estimated_cost_usd = 0.001

        return Result()


class DirectBaselineTests(unittest.TestCase):
    def test_direct_baseline_uses_one_image_completion_and_strips_fences(self) -> None:
        client = _FakeVisionClient()
        result = generate_sql_directly_from_image(
            image_path="diagram.png",
            schema_id="demo",
            tier="tier1",
            client=client,
            dialect="postgres",
        )

        self.assertTrue(result.success)
        self.assertEqual(result.sql_ddl, "CREATE TABLE demo (id INTEGER PRIMARY KEY);")
        self.assertEqual(result.as_dict()["architecture"], "direct_image_to_sql_one_call")
        self.assertEqual(len(client.calls), 1)
        self.assertEqual(client.calls[0]["image_path"], "diagram.png")


if __name__ == "__main__":
    unittest.main()
