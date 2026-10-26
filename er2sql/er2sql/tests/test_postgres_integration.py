"""Opt-in integration checks against the configured local PostgreSQL server.

Run with ER2SQL_RUN_POSTGRES_INTEGRATION=1. No LLM calls are made.
"""

from __future__ import annotations

import os
import sys
import tempfile
import unittest
import uuid
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.config import load_config
from er2sql.dataset import SchemaRecord
from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module4_constraint_tests.models import TestCase, TestSuite
from er2sql.module5_verification.db import build_connection, make_namespace
from er2sql.module5_verification.executor import verify_schema
from er2sql.pipeline.runner import _run_verification_backfill_only


DDL = """
CREATE TABLE parent (
    part_a INTEGER,
    part_b INTEGER,
    PRIMARY KEY (part_a, part_b)
);
CREATE TABLE child (
    id INTEGER PRIMARY KEY,
    parent_a INTEGER,
    parent_b INTEGER,
    required_text TEXT NOT NULL,
    unique_code TEXT UNIQUE,
    score INTEGER CHECK (score > 0),
    FOREIGN KEY (parent_a, parent_b) REFERENCES parent(part_a, part_b)
);
"""


@unittest.skipUnless(
    os.environ.get("ER2SQL_RUN_POSTGRES_INTEGRATION") == "1",
    "set ER2SQL_RUN_POSTGRES_INTEGRATION=1 to use local PostgreSQL",
)
class PostgreSQLIntegrationTests(unittest.TestCase):
    def test_unique_index_is_valid_behavioral_enforcement(self):
        from er2sql.module4_constraint_tests.generator import generate_constraint_tests
        gold = 'CREATE TABLE t(id INTEGER PRIMARY KEY, label TEXT UNIQUE);'
        suite = generate_constraint_tests(parse_ground_truth_sql(gold, 'unique_index').ir, 'unique_index')
        generated = 'CREATE TABLE t(id INTEGER PRIMARY KEY, label TEXT); CREATE UNIQUE INDEX uq ON t(label);'
        result = verify_schema(self.conn, generated, suite, 'integration', self._schema_id('index'), self.config.database.schema_prefix)
        self.assertEqual(result.tests_passed, result.tests_total, result.as_dict())

    def test_generated_oracle_and_identifier_binding(self):
        from er2sql.module4_constraint_tests.generator import generate_constraint_tests
        ddl = 'CREATE TABLE MixedCase (Id INTEGER PRIMARY KEY, Label TEXT NOT NULL UNIQUE);'
        parsed = parse_ground_truth_sql(ddl, schema_id='identifier_oracle')
        suite = generate_constraint_tests(parsed.ir, schema_id='identifier_oracle')
        result = verify_schema(self.conn, ddl, suite, 'integration', self._schema_id('names'), self.config.database.schema_prefix)
        self.assertTrue(result.ddl_execution.success)
        self.assertGreater(result.tests_total, 0)
        self.assertEqual(result.tests_passed, result.tests_total, result.as_dict())

    @classmethod
    def setUpClass(cls) -> None:
        cls.config = load_config("config/config.yaml")
        if cls.config.database is None:
            raise unittest.SkipTest("config/config.yaml has no database section")
        cls.conn = build_connection(cls.config.database)

    @classmethod
    def tearDownClass(cls) -> None:
        cls.conn.close()

    def _schema_id(self, prefix: str) -> str:
        return f"{prefix}_{uuid.uuid4().hex[:10]}"

    def test_constraint_sqlstates_composite_keys_and_rollback(self) -> None:
        tests = [
            TestCase(
                test_id="pk",
                columns=['part_a', 'part_b'],
                test_type="primary_key_duplicate_rejected",
                table="parent",
                description="duplicate composite primary key is rejected",
                setup_sql=["INSERT INTO parent VALUES (1, 1)"],
                action_sql="INSERT INTO parent VALUES (1, 1)",
                expect="failure",
                expected_sqlstates=["23505"],
            ),
            TestCase(
                test_id="fk-invalid",
                columns=['parent_a', 'parent_b'], ref_table='parent', ref_columns=['part_a', 'part_b'],
                test_type="foreign_key_reject_invalid_parent",
                table="child",
                description="invalid composite foreign key is rejected",
                action_sql="INSERT INTO child VALUES (1, 99, 99, 'x', 'a', 1)",
                expect="failure",
                expected_sqlstates=["23503"],
            ),
            TestCase(
                test_id="fk-valid",
                test_type="foreign_key_accept_valid_parent",
                table="child",
                description="valid composite foreign key is accepted",
                setup_sql=["INSERT INTO parent VALUES (2, 3)"],
                action_sql="INSERT INTO child VALUES (2, 2, 3, 'x', 'b', 1)",
                expect="success",
            ),
            TestCase(
                test_id="not-null",
                column='required_text',
                test_type="not_null_reject_null",
                table="child",
                description="null in required column is rejected",
                setup_sql=["INSERT INTO parent VALUES (3, 3)"],
                action_sql="INSERT INTO child VALUES (3, 3, 3, NULL, 'c', 1)",
                expect="failure",
                expected_sqlstates=["23502"],
            ),
            TestCase(
                test_id="unique",
                column='unique_code',
                test_type="unique_reject_duplicate",
                table="child",
                description="duplicate unique value is rejected",
                setup_sql=[
                    "INSERT INTO parent VALUES (4, 4)",
                    "INSERT INTO child VALUES (4, 4, 4, 'x', 'dup', 1)",
                ],
                action_sql="INSERT INTO child VALUES (5, 4, 4, 'y', 'dup', 1)",
                expect="failure",
                expected_sqlstates=["23505"],
            ),
            TestCase(
                test_id="check",
                column='score',
                test_type="check_constraint_reject_invalid",
                table="child",
                description="invalid check value is rejected",
                setup_sql=["INSERT INTO parent VALUES (5, 5)"],
                action_sql="INSERT INTO child VALUES (6, 5, 5, 'x', 'd', -1)",
                expect="failure",
                expected_sqlstates=["23514"],
            ),
        ]
        schema_id = self._schema_id("constraints")
        result = verify_schema(
            self.conn,
            DDL,
            TestSuite(schema_id=schema_id, tests=tests),
            tier="integration",
            schema_id=schema_id,
            schema_prefix=self.config.database.schema_prefix,
        )

        self.assertTrue(result.ddl_execution.success)
        self.assertEqual(result.tests_passed, len(tests))
        self.assertEqual(
            [row.error_sqlstate for row in result.test_results if row.expect == "failure"],
            ["23505", "23503", "23502", "23505", "23514"],
        )
        namespace = make_namespace(
            self.config.database.schema_prefix, "integration", schema_id
        )
        with self.conn.cursor() as cursor:
            cursor.execute("SELECT to_regnamespace(%s)", (namespace,))
            self.assertIsNone(cursor.fetchone()[0])
        self.conn.rollback()

    def test_setup_failure_never_receives_cer_credit(self) -> None:
        schema_id = self._schema_id("setup_failure")
        test = TestCase(
            test_id="bad-setup",
            test_type="foreign_key_reject_invalid_parent",
            table="child",
            description="fixture setup failure cannot pass a rejection test",
            setup_sql=["INSERT INTO table_that_does_not_exist VALUES (1)"],
            action_sql="INSERT INTO child VALUES (1, 9, 9, 'x', 'a', 1)",
            expect="failure",
            expected_sqlstates=["23503"],
        )
        result = verify_schema(
            self.conn,
            DDL,
            TestSuite(schema_id=schema_id, tests=[test]),
            tier="integration",
            schema_id=schema_id,
            schema_prefix=self.config.database.schema_prefix,
        )

        row = result.test_results[0]
        self.assertIsNone(row.action_succeeded)
        self.assertFalse(row.passed)
        self.assertEqual(result.constraint_enforcement_rate, 0.0)

    def test_existing_generation_can_be_backfilled_without_llm(self) -> None:
        schema_id = self._schema_id("backfill")
        parsed = parse_ground_truth_sql(DDL, schema_id=schema_id)
        existing = {
            "schema_id": schema_id,
            "tier": "integration",
            "ground_truth_sql": DDL,
            "module2_parsing": {"success": True, "ir": parsed.ir},
            "module3_generation": {"success": True, "sql_ddl": DDL},
        }
        with tempfile.TemporaryDirectory() as temp_dir:
            sql_path = Path(temp_dir) / f"{schema_id}.sql"
            sql_path.write_text(DDL, encoding="utf-8")
            record = SchemaRecord(
                schema_id=schema_id,
                tier="integration",
                image_path=str(Path(temp_dir) / "unused.png"),
                sql_path=str(sql_path),
            )
            result = _run_verification_backfill_only(
                record,
                existing,
                Path(temp_dir),
                self.conn,
                self.config.database,
            )

        self.assertTrue(result["module5_verification"]["ddl_execution"]["success"])
        self.assertNotIn("raw_responses", result["module2_parsing"])


if __name__ == "__main__":
    unittest.main()
