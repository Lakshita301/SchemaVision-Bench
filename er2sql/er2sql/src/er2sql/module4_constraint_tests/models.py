"""
Shared data structures for Module 4 (Constraint Test Generator) and
Module 5 (SQL Verification / Database Execution).

Module 4 produces a TestSuite: a fully self-contained, DB-agnostic
specification of what to check and what SQL to run to check it.
Module 4 itself NEVER touches a database -- every literal value and
every SQL string in a TestCase is computed deterministically from the
canonical IR alone, with no LLM call and no DB connection involved.

Module 5 is the only module that actually opens a database connection
and executes these statements. This split mirrors the locked plan's
architecture diagram (Constraint Test Generator -> SQL Verification /
Database Execution as two distinct stages) and keeps Module 4 fully
unit-testable without any external dependency.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Optional

# "at minimum" test types required by the locked plan, plus
# cascade_behavior (one of the "where supported" bonus items, made
# tractable here because on_delete is already first-class IR metadata).
TEST_TYPES = (
    "table_exists",
    "column_exists",
    "primary_key_duplicate_rejected",
    "foreign_key_reject_invalid_parent",
    "foreign_key_accept_valid_parent",
    "not_null_reject_null",
    "unique_reject_duplicate",
    "check_constraint_accept_valid",
    "check_constraint_reject_invalid",
    "cascade_behavior",
)


@dataclass
class PostCheck:
    """
    An optional follow-up SELECT run after a test's action_sql. Used
    by cascade_behavior tests to confirm the child row ended up in the
    expected post-action state (deleted / FK column nulled).

    Exactly one of expected_row_count or expected_column should be
    set for a given PostCheck.
    """

    sql: str
    expected_row_count: Optional[int] = None
    expected_column: Optional[str] = None
    expected_value: Any = None  # only checked when expected_column is set

    def as_dict(self) -> dict:
        return {
            "sql": self.sql,
            "expected_row_count": self.expected_row_count,
            "expected_column": self.expected_column,
            "expected_value": self.expected_value,
        }


@dataclass
class TestCase:
    test_id: str
    test_type: str
    table: str
    description: str
    setup_sql: list[str] = field(default_factory=list)
    action_sql: str = ""
    expect: str = "success"  # "success" | "failure"
    # For rejection tests, the action only passes when PostgreSQL returns one
    # of these SQLSTATE codes.  This prevents (for example) an FK test from
    # receiving credit because the row happened to violate NOT NULL instead.
    expected_sqlstates: list[str] = field(default_factory=list)
    column: Optional[str] = None
    columns: Optional[list[str]] = None
    post_check: Optional[PostCheck] = None
    ref_table: Optional[str] = None
    ref_columns: Optional[list[str]] = None
    rejection_kind: Optional[str] = None
    equivalent_primary_key: Optional[list[str]] = None
    # A SELECT assertion after setup, before action; failed fixtures earn no credit.
    pre_check: Optional[PostCheck] = None

    def as_dict(self) -> dict:
        return {
            "test_id": self.test_id,
            "test_type": self.test_type,
            "table": self.table,
            "description": self.description,
            "setup_sql": self.setup_sql,
            "action_sql": self.action_sql,
            "expect": self.expect,
            "expected_sqlstates": self.expected_sqlstates,
            "column": self.column,
            "columns": self.columns,
            "post_check": self.post_check.as_dict() if self.post_check else None,
            "ref_table": self.ref_table,
            "ref_columns": self.ref_columns,
            "rejection_kind": self.rejection_kind,
            "equivalent_primary_key": self.equivalent_primary_key,
            "pre_check": self.pre_check.as_dict() if self.pre_check else None,
        }


@dataclass
class TestSuite:
    schema_id: str
    constraint_source: str = "predicted_ir"
    tests: list[TestCase] = field(default_factory=list)
    generation_warnings: list[str] = field(default_factory=list)

    def as_dict(self) -> dict:
        return {
            "schema_id": self.schema_id,
            "constraint_source": self.constraint_source,
            "tests": [t.as_dict() for t in self.tests],
            "generation_warnings": self.generation_warnings,
        }
