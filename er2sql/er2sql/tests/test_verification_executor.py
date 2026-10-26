"""Regression tests for attribution of expected PostgreSQL failures."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

import psycopg2
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.module4_constraint_tests.models import TestCase
from er2sql.module5_verification.executor import _run_test_case


class _DatabaseError(psycopg2.Error):
    def __init__(self, message: str, sqlstate: str):
        super().__init__(message)
        self._sqlstate = sqlstate

    @property
    def pgcode(self) -> str:
        return self._sqlstate

    @property
    def diag(self):
        return SimpleNamespace(table_name='child', column_name=None, constraint_name='fk')


class _Cursor:
    def __init__(self, failures: dict[str, _DatabaseError]):
        self.failures = failures
        self.executed: list[str] = []

    def execute(self, sql: str) -> None:
        self.executed.append(sql)
        failure = self.failures.get(sql)
        if failure is not None:
            raise failure


class VerificationExecutorTests(unittest.TestCase):
    def _rejection_test(self) -> TestCase:
        return TestCase(
            test_id="fk_reject_001",
            test_type="foreign_key_reject_invalid_parent",
            table="child",
            columns=['parent_id'], ref_table='parent', ref_columns=['id'],
            description="reject missing parent",
            setup_sql=["SETUP"],
            action_sql="ACTION",
            expect="failure",
            expected_sqlstates=["23503"],
        )

    def test_setup_failure_never_counts_as_expected_rejection(self) -> None:
        cursor = _Cursor({"SETUP": _DatabaseError("setup FK failure", "23503")})

        result = _run_test_case(cursor, self._rejection_test(), 0)

        self.assertFalse(result.passed)
        self.assertIsNone(result.action_succeeded)
        self.assertNotIn("ACTION", cursor.executed)

    def test_wrong_action_error_does_not_count_as_fk_enforcement(self) -> None:
        cursor = _Cursor({"ACTION": _DatabaseError("not-null failure", "23502")})

        result = _run_test_case(cursor, self._rejection_test(), 0)

        self.assertFalse(result.passed)
        self.assertFalse(result.action_succeeded)
        self.assertEqual(result.error_sqlstate, "23502")

    def test_matching_action_error_counts_as_expected_rejection(self) -> None:
        cursor = _Cursor({"ACTION": _DatabaseError("foreign-key failure", "23503")})

        result = _run_test_case(cursor, self._rejection_test(), 0,
                                {('child', 'fk'): ('f', ['parent_id'], 'parent', ['id'])})

        self.assertTrue(result.passed)
        self.assertFalse(result.action_succeeded)
        self.assertEqual(result.error_sqlstate, "23503")

    def test_unattributed_rejection_is_not_credited(self):
        cursor = _Cursor({'ACTION': _DatabaseError('foreign-key failure', '23503')})
        result = _run_test_case(cursor, self._rejection_test(), 0)
        self.assertFalse(result.passed)


if __name__ == "__main__":
    unittest.main()
