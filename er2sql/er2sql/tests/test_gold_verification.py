"""Offline tests for gold-reference Module 4 test generation."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.module4_constraint_tests.generator import generate_constraint_tests
from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql


class GoldVerificationTests(unittest.TestCase):
    def test_ground_truth_ddl_generates_gold_check_pairs(self) -> None:
        ddl = """
        CREATE TABLE parents (id INTEGER PRIMARY KEY);
        CREATE TABLE orders (
            id INTEGER PRIMARY KEY,
            parent_id INTEGER NOT NULL REFERENCES parents(id),
            age INTEGER NOT NULL CHECK (age >= 0),
            status VARCHAR(10) CHECK (status IN ('new', 'paid'))
        );
        """
        parsed = parse_ground_truth_sql(ddl, schema_id="demo")
        suite = generate_constraint_tests(
            parsed.ir, schema_id="demo", constraint_source="ground_truth_sql"
        )

        self.assertEqual([table["name"] for table in parsed.ir["tables"]], ["parents", "orders"])
        self.assertEqual(suite.constraint_source, "ground_truth_sql")
        self.assertEqual(
            sum(test.test_type == "check_constraint_accept_valid" for test in suite.tests), 2
        )
        self.assertEqual(
            sum(test.test_type == "check_constraint_reject_invalid" for test in suite.tests), 2
        )
        expected_states = {
            test.test_type: test.expected_sqlstates
            for test in suite.tests
            if test.expect == "failure"
        }
        self.assertEqual(expected_states["primary_key_duplicate_rejected"], ["23505"])
        self.assertEqual(expected_states["foreign_key_reject_invalid_parent"], ["23503"])
        self.assertEqual(expected_states["not_null_reject_null"], ["23502"])
        self.assertEqual(expected_states["check_constraint_reject_invalid"], ["23514"])

    def test_unsupported_check_is_reported_not_silently_ignored(self) -> None:
        ddl = "CREATE TABLE users (name TEXT CHECK (custom_function(name) > 0));"
        parsed = parse_ground_truth_sql(ddl, schema_id="unsupported")
        suite = generate_constraint_tests(parsed.ir, schema_id="unsupported")

        self.assertFalse([test for test in suite.tests if test.test_type.startswith("check_")])
        self.assertTrue(any("Unsupported CHECK expression" in warning for warning in suite.generation_warnings))


if __name__ == "__main__":
    unittest.main()
