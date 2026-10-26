"""
Shared data structures for Module 5 (SQL Verification / Database
Execution).

Module 5 is the ONLY module in this project that opens a database
connection. It consumes:
  - the raw SQL DDL text produced by Module 3
  - the TestSuite produced by Module 4 (module4_constraint_tests.models.TestSuite)

and produces a VerificationResult: whether the DDL executed at all,
and for every TestCase in the suite, whether the database's actual
behavior matched what the TestCase expected.

Every verification run is fully non-persistent: everything happens
inside one Postgres transaction (a dedicated throwaway schema +
per-test SAVEPOINTs), and that transaction is always rolled back at
the end, win or lose. Nothing this module does ever leaves a
permanent trace in the target database.
"""

from __future__ import annotations

from dataclasses import asdict, dataclass, field
from typing import Any, Optional

VERIFICATION_PROTOCOL = "target_attribution_v7"

# Test types that check structural fidelity (does the object exist at
# all) rather than constraint-enforcement behavior. Kept separate from
# "constraint" tests so a per-schema Constraint Enforcement Rate can be
# computed over the behavioral tests only, matching the plan's CER
# metric definition (Module 7 will aggregate this across schemas; this
# module just tags each result so that aggregation is possible later).
STRUCTURAL_TEST_TYPES = frozenset({"table_exists", "column_exists"})


@dataclass
class DDLExecutionResult:
    success: bool
    error_message: Optional[str] = None
    error_detail: Optional[str] = None
    error_sqlstate: Optional[str] = None
    failure_category: Optional[str] = None

    def as_dict(self) -> dict:
        return asdict(self)


@dataclass
class TestCaseResult:
    test_id: str
    test_type: str
    table: str
    description: str
    expect: str  # "success" | "failure", copied from the TestCase
    category: str  # "structural" | "constraint"
    action_succeeded: Optional[bool]  # None if never attempted (e.g. setup itself failed)
    passed: bool
    error_message: Optional[str] = None
    error_sqlstate: Optional[str] = None
    expected_sqlstates: list[str] = field(default_factory=list)
    post_check_passed: Optional[bool] = None
    post_check_detail: Optional[str] = None
    failure_phase: Optional[str] = None
    failure_category: Optional[str] = None
    rejection_target_matched: Optional[bool] = None
    error_constraint: Optional[str] = None
    pre_check_passed: Optional[bool] = None
    pre_check_detail: Optional[str] = None

    def as_dict(self) -> dict:
        return asdict(self)


@dataclass
class VerificationResult:
    schema_id: str
    tier: str
    ddl_execution: DDLExecutionResult
    constraint_source: str = "predicted_ir"
    test_results: list[TestCaseResult] = field(default_factory=list)
    tests_total: int = 0
    tests_passed: int = 0
    tests_failed: int = 0
    constraint_tests_total: int = 0
    constraint_tests_passed: int = 0
    constraint_enforcement_rate: Optional[float] = None
    generation_warnings: list[str] = field(default_factory=list)
    skipped_reason: Optional[str] = None  # set if DDL failed, so no tests ran at all
    salvage_diagnostic: dict[str, Any] = field(default_factory=dict)
    infrastructure_error: bool = False
    infrastructure_sqlstates: list[str] = field(default_factory=list)
    normalized_sql_ablation: dict[str, Any] = field(default_factory=dict)

    def as_dict(self) -> dict:
        return {
            "verification_protocol": VERIFICATION_PROTOCOL,
            "schema_id": self.schema_id,
            "tier": self.tier,
            "constraint_source": self.constraint_source,
            "ddl_execution": self.ddl_execution.as_dict(),
            "test_results": [t.as_dict() for t in self.test_results],
            "tests_total": self.tests_total,
            "tests_passed": self.tests_passed,
            "tests_failed": self.tests_failed,
            "constraint_tests_total": self.constraint_tests_total,
            "constraint_tests_passed": self.constraint_tests_passed,
            "constraint_enforcement_rate": self.constraint_enforcement_rate,
            "generation_warnings": self.generation_warnings,
            "skipped_reason": self.skipped_reason,
            "salvage_diagnostic": self.salvage_diagnostic,
            "infrastructure_error": self.infrastructure_error,
            "infrastructure_sqlstates": self.infrastructure_sqlstates,
            "normalized_sql_ablation": self.normalized_sql_ablation,
        }
