"""Paper-level aggregation for the ER2SQL experiment.

The pipeline runners intentionally write one JSON artifact per schema.  This
module turns those artifacts into reproducible paper metrics without making
additional model calls.  It supports both the structured Modules 2--5 arm and
the Module 6 direct image-to-SQL arm.

The evaluator is intentionally dependency-free (standard library only, apart
from the project's SQL parser).  It produces:

* per-schema metrics;
* overall, per-tier, and per-test-type aggregates;
* IR structural precision/recall/F1 where both predicted IR and gold SQL are
  available;
* schema-clustered bootstrap confidence intervals;
* optional structured-vs-direct deltas when a second result directory is
  supplied; and
* JSON, CSV, and Markdown artifacts suitable for a paper appendix.
"""

from __future__ import annotations

import csv
import hashlib
import math
import re
import statistics
from collections import defaultdict
from dataclasses import asdict, dataclass, field
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable, Optional

from ..module4_constraint_tests.gold_schema import parse_ground_truth_sql
from ..utils.io_utils import ensure_dir, read_json, write_json, write_text
from ..utils.sql_normalization import normalize_sql_for_ablation
from .statistics import clustered_estimates

ARMS = ("structured", "direct")
STRUCTURAL_CATEGORIES = ("tables", "columns", "primary_keys", "foreign_keys")
FINAL_SQL_STRUCTURAL_CATEGORIES = (
    "tables",
    "columns",
    "primary_keys",
    "foreign_keys",
    "foreign_key_directions",
    "referenced_tables",
    "referenced_columns",
    "data_types",
    "not_null_constraints",
    "unique_constraints",
    "check_constraints",
    "referential_actions",
)
TIER_DROP_METRICS = (
    "compile_rate",
    "table_recall",
    "foreign_key_f1",
    "constraint_enforcement_rate",
    "planned_constraint_pass_rate",
    "planned_valid_operation_acceptance_rate",
    "planned_invalid_operation_rejection_rate",
    "test_pass_rate",
    "planned_test_pass_rate",
)


def _rate(numerator: int | float, denominator: int | float) -> Optional[float]:
    return None if denominator == 0 else numerator / denominator


def _round(value: Any, digits: int = 6) -> Any:
    return round(value, digits) if isinstance(value, (int, float)) else value


def _wilson_interval(successes: int, total: int, z: float = 1.96) -> Optional[dict]:
    """Return a 95% Wilson interval for a binary proportion."""
    if total <= 0:
        return None
    p = successes / total
    denominator = 1.0 + (z * z / total)
    centre = (p + z * z / (2.0 * total)) / denominator
    margin = (
        z
        * math.sqrt((p * (1.0 - p) / total) + (z * z / (4.0 * total * total)))
        / denominator
    )
    return {"lower": max(0.0, centre - margin), "upper": min(1.0, centre + margin)}


def _safe_name(value: Any) -> str:
    return str(value).strip().casefold()


def _normalise_sql(sql: Any) -> Optional[str]:
    if not isinstance(sql, str) or not sql.strip():
        return None
    # Frozen, comparison-only canonicalization: keyword casing and layout only.
    # Quoted strings, identifiers, comments, and statement order are preserved.
    return normalize_sql_for_ablation(sql.strip()).strip().rstrip(";")


def _raw_sql(sql: Any) -> Optional[str]:
    return sql.strip() if isinstance(sql, str) and sql.strip() else None


def _looks_like_sql(sql: Any) -> bool:
    if not isinstance(sql, str) or not sql.strip():
        return False
    import sqlparse
    from sqlparse import tokens as T

    starts = {"CREATE", "ALTER", "DROP", "COMMENT", "SELECT", "INSERT", "UPDATE",
              "DELETE", "WITH", "BEGIN", "SET", "GRANT", "REVOKE", "TRUNCATE"}
    for statement in sqlparse.parse(sql):
        for token in statement.flatten():
            if token.is_whitespace or token.ttype in T.Comment:
                continue
            return token.ttype in T.Keyword or token.value.upper() in starts
    return False


def _error_taxonomy(result: dict, sql: Any) -> dict[str, int]:
    taxonomy: dict[str, int] = defaultdict(int)
    verification = result.get("module5_verification") or {}
    ddl = verification.get("ddl_execution") or {}
    if ddl.get("success") is False and ddl.get("error_sqlstate"):
        taxonomy[str(ddl["error_sqlstate"])] += 1
    for test in verification.get("test_results") or []:
        if test.get("passed") is False and test.get("error_sqlstate"):
            taxonomy[str(test["error_sqlstate"])] += 1
    salvage = verification.get("salvage_diagnostic") or {}
    for error in salvage.get("statement_errors") or []:
        if error.get("sqlstate"):
            taxonomy[str(error["sqlstate"])] += 1
    if not _looks_like_sql(sql):
        taxonomy["not_sql"] += 1
    return dict(sorted(taxonomy.items()))


def _sum_usage(nodes: Iterable[dict], field: str) -> Optional[float]:
    values = [node.get(field) for node in nodes if isinstance(node, dict)]
    numeric = [value for value in values if isinstance(value, (int, float)) and not isinstance(value, bool)]
    return float(sum(numeric)) if numeric else None


def _set_metrics(ir: Optional[dict]) -> dict[str, set[tuple]]:
    """Convert canonical IR into comparable structural fact sets."""
    empty = {
        "tables": set(),
        "columns": set(),
        "primary_keys": set(),
        "foreign_keys": set(),
        "relationships": set(),
    }
    if not isinstance(ir, dict):
        return empty

    result = {key: set(values) for key, values in empty.items()}
    tables = ir.get("tables") or []
    for table in tables:
        if not isinstance(table, dict) or not isinstance(table.get("name"), str):
            continue
        table_name = _safe_name(table["name"])
        result["tables"].add((table_name,))
        columns = table.get("columns") or []
        for column in columns:
            if isinstance(column, dict) and isinstance(column.get("name"), str):
                result["columns"].add((table_name, _safe_name(column["name"])))

        pk = tuple(_safe_name(col) for col in (table.get("primary_key") or []) if isinstance(col, str))
        if pk:
            result["primary_keys"].add((table_name, pk))

        for fk in table.get("foreign_keys") or []:
            if not isinstance(fk, dict) or not isinstance(fk.get("ref_table"), str):
                continue
            local = tuple(_safe_name(col) for col in (fk.get("columns") or []) if isinstance(col, str))
            remote = tuple(_safe_name(col) for col in (fk.get("ref_columns") or []) if isinstance(col, str))
            if local and remote:
                result["foreign_keys"].add(
                    (table_name, local, _safe_name(fk["ref_table"]), remote)
                )

    for relationship in ir.get("relationships") or []:
        if not isinstance(relationship, dict):
            continue
        left = relationship.get("left_table")
        right = relationship.get("right_table")
        if isinstance(left, str) and isinstance(right, str):
            result["relationships"].add(
                (
                    _safe_name(left),
                    _safe_name(right),
                    _safe_name(relationship.get("left_cardinality")),
                    _safe_name(relationship.get("right_cardinality")),
                    _safe_name(relationship.get("relationship_type")),
                )
            )
    return result


def _normalise_type(value: Any) -> str:
    text = " ".join(str(value or "").strip().casefold().split())
    text = re.sub(r"\s*\(\s*", "(", text)
    text = re.sub(r"\s*,\s*", ",", text)
    text = re.sub(r"\s*\)\s*", ")", text)
    aliases = {
        "int": "integer",
        "int4": "integer",
        "int8": "bigint",
        "bool": "boolean",
        "decimal": "numeric",
        "character varying": "varchar",
        "float8": "double precision",
        "float4": "real",
        "timestamp without time zone": "timestamp",
    }
    for source, target in aliases.items():
        if text == source:
            return target
        if text.startswith(source + "("):
            return target + text[len(source) :]
    return text


def _normalise_expression(value: Any) -> str:
    return "".join(str(value or "").casefold().split())


def _sql_fact_sets(ir: Optional[dict]) -> dict[str, set[tuple]]:
    """Convert SQL-derived IR into output-level structural fact sets."""
    result = {name: set() for name in FINAL_SQL_STRUCTURAL_CATEGORIES}
    if not isinstance(ir, dict):
        return result
    for table in ir.get("tables") or []:
        if not isinstance(table, dict) or not isinstance(table.get("name"), str):
            continue
        table_name = _safe_name(table["name"])
        result["tables"].add((table_name,))
        for column in table.get("columns") or []:
            if not isinstance(column, dict) or not isinstance(column.get("name"), str):
                continue
            column_name = _safe_name(column["name"])
            result["columns"].add((table_name, column_name))
            data_type = _normalise_type(column.get("data_type"))
            if data_type:
                result["data_types"].add((table_name, column_name, data_type))
            if column.get("nullable") is False:
                result["not_null_constraints"].add((table_name, column_name))
            if column.get("unique") is True:
                result["unique_constraints"].add((table_name, column_name))

        primary_key = tuple(
            _safe_name(column)
            for column in table.get("primary_key") or []
            if isinstance(column, str)
        )
        if primary_key:
            result["primary_keys"].add((table_name, primary_key))
        for columns in table.get('unique_constraints') or []:
            result['unique_constraints'].add((table_name, tuple(_safe_name(c) for c in columns)))

        for fk in table.get("foreign_keys") or []:
            if not isinstance(fk, dict) or not isinstance(fk.get("ref_table"), str):
                continue
            local = tuple(
                _safe_name(column)
                for column in fk.get("columns") or []
                if isinstance(column, str)
            )
            remote = tuple(
                _safe_name(column)
                for column in fk.get("ref_columns") or []
                if isinstance(column, str)
            )
            if not local or not remote:
                continue
            ref_table = _safe_name(fk["ref_table"])
            identity = (table_name, local, ref_table, remote)
            result["foreign_keys"].add(identity)
            result["foreign_key_directions"].add((table_name, ref_table))
            result["referenced_tables"].add((table_name, local, ref_table))
            result["referenced_columns"].add(identity)
            on_delete = _safe_name(fk.get("on_delete"))
            on_update = _safe_name(fk.get("on_update"))
            if on_delete or on_update:
                result["referential_actions"].add(identity + (on_delete, on_update))

        for expression in table.get("check_constraints") or []:
            normalized = _normalise_expression(expression)
            if normalized:
                result["check_constraints"].add((table_name, normalized))
    return result


def _parse_sql_structure(sql: Any, schema_id: str) -> tuple[Optional[dict], list[str]]:
    if not isinstance(sql, str) or not sql.strip():
        return None, ["SQL text was empty or unavailable."]
    try:
        parsed = parse_ground_truth_sql(sql, schema_id=schema_id)
        return parsed.ir, parsed.warnings
    except Exception as exc:  # pragma: no cover - defensive around external artifacts
        return None, [f"SQL structure parser failed: {exc}"]


def _prf(predicted: set[tuple], gold: set[tuple]) -> dict:
    true_positive = len(predicted & gold)
    false_positive = len(predicted - gold)
    false_negative = len(gold - predicted)
    precision = _rate(true_positive, true_positive + false_positive)
    recall = _rate(true_positive, true_positive + false_negative)
    if precision is None and recall is None:
        f1 = None  # No positive instances: not evidence of perfect prediction.
    elif precision is None or recall is None or precision + recall == 0:
        f1 = 0.0
    else:
        f1 = 2 * precision * recall / (precision + recall)
    return {
        "true_positive": true_positive,
        "false_positive": false_positive,
        "false_negative": false_negative,
        "precision": precision,
        "recall": recall,
        "f1": f1,
    }


def _gold_ir(result: dict) -> Optional[dict]:
    ground_truth = result.get("ground_truth_sql")
    if not isinstance(ground_truth, str) or not ground_truth.strip():
        return None
    try:
        return parse_ground_truth_sql(
            ground_truth, schema_id=str(result.get("schema_id", "unknown"))
        ).ir
    except Exception:  # pragma: no cover - malformed external artifact
        return None


def _verification_metrics(verification: dict) -> tuple[dict, dict[str, dict]]:
    ddl = verification.get("ddl_execution") or {}
    tests = verification.get("test_results") or []
    total = len(tests)
    passed = sum(1 for item in tests if item.get("passed") is True)
    constraint = [item for item in tests if item.get("category") == "constraint"]
    structural = [item for item in tests if item.get("category") == "structural"]
    constraint_passed = sum(1 for item in constraint if item.get("passed") is True)
    structural_passed = sum(1 for item in structural if item.get("passed") is True)
    valid_operations = [item for item in constraint if item.get("expect") == "success"]
    invalid_operations = [item for item in constraint if item.get("expect") == "failure"]
    valid_accepted = sum(1 for item in valid_operations if item.get("passed") is True)
    invalid_rejected = sum(1 for item in invalid_operations if item.get("passed") is True)
    ddl_success = bool(ddl.get("success"))
    fully_correct = ddl_success and total > 0 and passed == total

    by_type: dict[str, dict] = {}
    grouped: dict[str, list[dict]] = defaultdict(list)
    for item in tests:
        grouped[str(item.get("test_type", "unknown"))].append(item)
    for test_type, rows in sorted(grouped.items()):
        by_type[test_type] = {
            "total": len(rows),
            "passed": sum(1 for row in rows if row.get("passed") is True),
            "rate": _rate(sum(1 for row in rows if row.get("passed") is True), len(rows)),
        }
    metrics = {
        "ddl_execution_success": ddl_success,
        "tests_total": total,
        "tests_passed": passed,
        "tests_failed": total - passed,
        "test_pass_rate": _rate(passed, total),
        "constraint_tests_total": len(constraint),
        "constraint_tests_passed": constraint_passed,
        "constraint_enforcement_rate": _rate(constraint_passed, len(constraint)),
        "structural_tests_total": len(structural),
        "structural_tests_passed": structural_passed,
        "structural_test_pass_rate": _rate(structural_passed, len(structural)),
        "valid_operations_total": len(valid_operations),
        "valid_operations_accepted": valid_accepted,
        "valid_operation_acceptance_rate": _rate(valid_accepted, len(valid_operations)),
        "invalid_operations_total": len(invalid_operations),
        "invalid_operations_rejected": invalid_rejected,
        "invalid_operation_rejection_rate": _rate(invalid_rejected, len(invalid_operations)),
        "fully_correct_schema": fully_correct,
    }
    return metrics, by_type


def _output_limit_state(result: dict) -> tuple[bool, list[str]]:
    """Return cap-finish presence and stages with confirmed unusable output."""
    cap_finished = False
    unusable_stages: list[str] = []
    for key, stage in (
        ("module2_parsing", "module2"),
        ("module3_generation", "module3"),
        ("module6_direct_baseline", "module6"),
    ):
        node = result.get(key) or {}
        reasons = list(node.get("finish_reasons") or [])
        if node.get("finish_reason"):
            reasons.append(node["finish_reason"])
        hit_output_limit = any(
            str(reason).casefold() in {"length", "max_tokens"}
            for reason in reasons
        )
        if not hit_output_limit:
            continue
        cap_finished = True
        if key == "module2_parsing":
            validation = node.get("validation") or {}
            unusable = (
                node.get("success") is not True
                or validation.get("is_valid") is not True
                or not isinstance(node.get("ir"), dict)
            )
        else:
            sql = node.get("sql_ddl")
            unusable = (
                node.get("success") is not True
                or not isinstance(sql, str)
                or not sql.strip()
            )
            if not unusable:
                ddl = (result.get("module5_verification") or {}).get("ddl_execution") or {}
                error = str(ddl.get("error_detail") or ddl.get("error_message") or "")
                unusable = bool(
                    ddl.get("success") is False
                    and re.search(
                        r"syntax error at end of input|unexpected end of input|incomplete input|unexpected eof",
                        error,
                        flags=re.IGNORECASE,
                    )
                )
        if unusable:
            unusable_stages.append(stage)
    return cap_finished, unusable_stages


def _schema_metrics(result: dict, arm: str) -> dict:
    if arm not in ARMS:
        raise ValueError(f"Unknown Module 7 arm '{arm}'. Choose one of {ARMS}.")

    direct = arm == "direct" or "module6_direct_baseline" in result
    parsing = result.get("module2_parsing") or {}
    generation = (result.get("module6_direct_baseline") if direct else result.get("module3_generation")) or {}
    verification = result.get("module5_verification") or {}
    normalized_ablation = verification.get("normalized_sql_ablation") or {}
    verification_metrics, by_type = _verification_metrics(verification)
    predicted_ir = parsing.get("ir") if not direct else None
    gold_ir = _gold_ir(result)
    # Compute the denominator independently of whether generated SQL exists or compiles.
    from ..module4_constraint_tests.generator import generate_constraint_tests
    from ..module5_verification.models import STRUCTURAL_TEST_TYPES
    gold_suite = result.get("module4_gold_test_suite")
    # Never accept a predicted-IR or ambiguously labelled suite as the planned
    # denominator. Rebuild from the same Module 1 SQL reference instead.
    if (
        not isinstance(gold_suite, dict)
        or gold_suite.get("constraint_source") != "ground_truth_sql"
    ) and gold_ir:
        gold_suite = generate_constraint_tests(gold_ir, schema_id=str(result.get("schema_id")),
                                               constraint_source="ground_truth_sql").as_dict()
    planned = (gold_suite or {}).get("tests", [])
    planned_constraints = [t for t in planned if t.get("test_type") not in STRUCTURAL_TEST_TYPES]
    planned_valid_operations = [t for t in planned_constraints if t.get("expect") == "success"]
    planned_invalid_operations = [t for t in planned_constraints if t.get("expect") == "failure"]
    predicted_sets = _set_metrics(predicted_ir)
    gold_sets = _set_metrics(gold_ir)
    structural = (
        {
            name: _prf(predicted_sets[name], gold_sets[name])
            for name in STRUCTURAL_CATEGORIES
        }
        if not direct
        else {
            name: {
                "true_positive": None,
                "false_positive": None,
                "false_negative": None,
                "precision": None,
                "recall": None,
                "f1": None,
            }
            for name in STRUCTURAL_CATEGORIES
        }
    )

    sql_predicted = generation.get("sql_ddl")
    sql_gold = result.get("ground_truth_sql")
    schema_id = str(result.get("schema_id", "unknown"))
    predicted_sql_ir, predicted_sql_warnings = _parse_sql_structure(
        sql_predicted, schema_id=f"{schema_id}_predicted"
    )
    gold_sql_ir, gold_sql_warnings = _parse_sql_structure(
        sql_gold, schema_id=f"{schema_id}_gold"
    )
    predicted_sql_sets = _sql_fact_sets(predicted_sql_ir)
    gold_sql_sets = _sql_fact_sets(gold_sql_ir)
    final_sql_structural = {
        name: _prf(predicted_sql_sets[name], gold_sql_sets[name])
        for name in FINAL_SQL_STRUCTURAL_CATEGORIES
    }
    normalized_predicted = _normalise_sql(sql_predicted)
    normalized_gold = _normalise_sql(sql_gold)
    sql_exact_match = (
        None
        if normalized_predicted is None or normalized_gold is None
        else normalized_predicted == normalized_gold
    )

    validation = parsing.get("validation") or {}
    schema_errors = validation.get("schema_errors") or []
    semantic_errors = validation.get("semantic_errors") or []
    complexity = {
        "tables": len(gold_sets["tables"]),
        "columns": len(gold_sets["columns"]),
        "primary_keys": len(gold_sets["primary_keys"]),
        "foreign_keys": len(gold_sets["foreign_keys"]),
        "relationships": len(gold_sets["relationships"]),
    }
    usage_nodes = [generation] if direct else [parsing, generation]
    gold_sql_reference = result.get("ground_truth_sql")
    gold_reference_sha256 = (
        hashlib.sha256(gold_sql_reference.encode("utf-8")).hexdigest()
        if isinstance(gold_sql_reference, str)
        else None
    )
    finish_reasons = []
    if not direct:
        finish_reasons.extend(parsing.get("finish_reasons") or [])
    if generation.get("finish_reason"):
        finish_reasons.append(generation["finish_reason"])
    retry_events = []
    for node in usage_nodes:
        retry_events.extend(node.get("retry_events") or [])
    end_to_end_success = bool(generation.get("success")) and bool(
        verification_metrics["fully_correct_schema"]
    )
    if not direct:
        end_to_end_success = end_to_end_success and bool(parsing.get("success"))

    return {
        "schema_id": result.get("schema_id"),
        "tier": result.get("tier"),
        "arm": "direct" if direct else "structured",
        "parsing_success": None if direct else bool(parsing.get("success")),
        "generation_success": bool(generation.get("success")),
        "llm_attempts_used": generation.get("llm_attempts_used", 0)
        + (0 if direct else parsing.get("llm_attempts_used", 0)),
        "validation_attempts_used": None if direct else parsing.get("validation_attempts_used", 0),
        "validation_schema_error_count": None if direct else len(schema_errors),
        "validation_semantic_error_count": None if direct else len(semantic_errors),
        "raw_sql_exact_match": (
            None if _raw_sql(sql_predicted) is None or _raw_sql(sql_gold) is None
            else _raw_sql(sql_predicted) == _raw_sql(sql_gold)
        ),
        "normalized_sql_exact_match": sql_exact_match,
        "error_taxonomy": _error_taxonomy(result, sql_predicted),
        "infrastructure_error": bool(verification.get("infrastructure_error")),
        "infrastructure_sqlstates": list(verification.get("infrastructure_sqlstates") or []),
        "salvage_gold_tables_created": len((verification.get("salvage_diagnostic") or {}).get("gold_tables_created") or []),
        "salvage_gold_table_count": (verification.get("salvage_diagnostic") or {}).get("gold_table_count", 0),
        "salvage_gold_table_fraction": (verification.get("salvage_diagnostic") or {}).get("gold_table_fraction"),
        "normalized_ablation_compile_success": normalized_ablation.get("ddl_execution_success"),
        "normalized_ablation_constraint_tests_total": normalized_ablation.get("constraint_tests_total", 0),
        "normalized_ablation_constraint_tests_passed": normalized_ablation.get("constraint_tests_passed", 0),
        "normalized_ablation_cer": normalized_ablation.get("constraint_enforcement_rate"),
        "normalized_ablation_planned_cer": _rate(
            normalized_ablation.get("constraint_tests_passed", 0), len(planned_constraints)
        ) if gold_suite is not None else None,
        **verification_metrics,
        "planned_tests_total": len(planned),
        "planned_constraint_tests_total": len(planned_constraints),
        "planned_test_reference": "module1_ground_truth_sql" if gold_suite is not None else None,
        "planned_reference_sha256": gold_reference_sha256,
        "planned_denominator_known": gold_suite is not None,
        "planned_constraint_pass_rate": _rate(
            verification_metrics["constraint_tests_passed"], len(planned_constraints)
        ) if gold_suite is not None else None,
        "planned_test_pass_rate": _rate(
            verification_metrics["tests_passed"], len(planned)
        ) if gold_suite is not None else None,
        "planned_valid_operations_total": len(planned_valid_operations),
        "planned_valid_operation_acceptance_rate": _rate(
            verification_metrics["valid_operations_accepted"], len(planned_valid_operations)
        ) if gold_suite is not None else None,
        "planned_invalid_operations_total": len(planned_invalid_operations),
        "planned_invalid_operation_rejection_rate": _rate(
            verification_metrics["invalid_operations_rejected"], len(planned_invalid_operations)
        ) if gold_suite is not None else None,
        "gold_generation_warnings": (gold_suite or {}).get("generation_warnings", []),
        "setup_failure_count": sum(t.get("failure_phase") == "setup" or str(t.get("error_message") or "").startswith("setup failed:")
                                   for t in verification.get("test_results", [])),
        "api_latency_seconds": _sum_usage(usage_nodes, "api_latency_seconds"),
        "backoff_seconds": _sum_usage(usage_nodes, "backoff_seconds"),
        "end_to_end_success": end_to_end_success,
        "finish_reasons": finish_reasons,
        "output_limit_finish": _output_limit_state(result)[0],
        "output_truncated": bool(_output_limit_state(result)[1]),
        "retry_event_count": len(retry_events),
        "rate_limit_event_count": sum(
            1 for event in retry_events if str(event).casefold() in {"rate_limit", "http_429"}
        ),
        "test_type_metrics": by_type,
        "structural_metrics": structural,
        "final_sql_structural_metrics": final_sql_structural,
        "predicted_sql_parse_warnings": predicted_sql_warnings,
        "gold_sql_parse_warnings": gold_sql_warnings,
        "complexity": complexity,
        "predicted_sql_parse_warning_count": len(predicted_sql_warnings),
        "gold_parse_warning_count": len(gold_sql_warnings),
        "latency_seconds": _sum_usage(usage_nodes, "latency_seconds"),
        "input_tokens": _sum_usage(usage_nodes, "input_tokens"),
        "output_tokens": _sum_usage(usage_nodes, "output_tokens"),
        "estimated_cost_usd": _sum_usage(usage_nodes, "estimated_cost_usd"),
    }


def _aggregate_rows(rows: list[dict]) -> dict:
    def count_true(field: str) -> int:
        return sum(1 for row in rows if row.get(field) is True)

    def count_present(field: str) -> int:
        return sum(1 for row in rows if row.get(field) is not None)

    def sum_int(field: str) -> int:
        return sum(int(row.get(field) or 0) for row in rows)

    def mean(field: str) -> Optional[float]:
        values = [row[field] for row in rows if isinstance(row.get(field), (int, float))]
        return statistics.mean(values) if values else None

    tests_total = sum_int("tests_total")
    tests_passed = sum_int("tests_passed")
    constraints_total = sum_int("constraint_tests_total")
    constraints_passed = sum_int("constraint_tests_passed")
    structural_total = sum_int("structural_tests_total")
    structural_passed = sum_int("structural_tests_passed")
    valid_total = sum_int("valid_operations_total")
    valid_accepted = sum_int("valid_operations_accepted")
    invalid_total = sum_int("invalid_operations_total")
    invalid_rejected = sum_int("invalid_operations_rejected")

    aggregate = {
        "schema_count": len(rows),
        "parsing_success": count_true("parsing_success"),
        "parsing_attempted": count_present("parsing_success"),
        "parsing_success_rate": _rate(count_true("parsing_success"), count_present("parsing_success")),
        "generation_success": count_true("generation_success"),
        "generation_success_rate": _rate(count_true("generation_success"), len(rows)),
        "ddl_execution_success": count_true("ddl_execution_success"),
        "ddl_execution_rate": _rate(count_true("ddl_execution_success"), count_present("ddl_execution_success")),
        "compile_rate": _rate(count_true("ddl_execution_success"), count_present("ddl_execution_success")),
        "tests_total": tests_total,
        "tests_passed": tests_passed,
        "test_pass_rate": _rate(tests_passed, tests_total),
        "constraint_tests_total": constraints_total,
        "constraint_tests_passed": constraints_passed,
        "constraint_enforcement_rate": _rate(constraints_passed, constraints_total),
        "constraint_enforcement_ci95": None,  # Tests within a schema are not independent.
        "unconditional_constraint_coverage": _rate(constraints_passed, sum_int("planned_constraint_tests_total")),
        "planned_constraint_pass_rate": _rate(constraints_passed, sum_int("planned_constraint_tests_total")),
        "planned_constraint_tests_total": sum_int("planned_constraint_tests_total"),
        "planned_tests_total": sum_int("planned_tests_total"),
        "unconditional_test_coverage": _rate(tests_passed, sum_int("planned_tests_total")),
        "planned_test_pass_rate": _rate(tests_passed, sum_int("planned_tests_total")),
        "planned_valid_operations_total": sum_int("planned_valid_operations_total"),
        "planned_valid_operation_acceptance_rate": _rate(
            sum_int("valid_operations_accepted"), sum_int("planned_valid_operations_total")
        ),
        "planned_invalid_operations_total": sum_int("planned_invalid_operations_total"),
        "planned_invalid_operation_rejection_rate": _rate(
            sum_int("invalid_operations_rejected"), sum_int("planned_invalid_operations_total")
        ),
        "macro_cer_all": _rate(
            sum((r.get("planned_constraint_pass_rate") or 0)
                for r in rows if r.get("planned_denominator_known") and r.get("planned_constraint_tests_total", 0) > 0),
            sum(1 for r in rows if r.get("planned_denominator_known") and r.get("planned_constraint_tests_total", 0) > 0),
        ),
        "macro_cer_schema_count": sum(1 for r in rows if r.get("planned_denominator_known") and r.get("planned_constraint_tests_total", 0) > 0),
        "setup_failure_count": sum_int("setup_failure_count"),
        "unknown_denominator_count": sum(not r.get("planned_denominator_known") for r in rows),
        "zero_behavioral_test_artifact_count": sum(r.get('planned_denominator_known') is True and r.get('planned_constraint_tests_total') == 0 for r in rows),
        "zero_behavioral_test_schema_count": len({r['schema_id'] for r in rows if r.get('planned_denominator_known') is True and r.get('planned_constraint_tests_total') == 0}),
        "structural_tests_total": structural_total,
        "structural_tests_passed": structural_passed,
        "structural_test_pass_rate": _rate(structural_passed, structural_total),
        "valid_operations_total": valid_total,
        "valid_operations_accepted": valid_accepted,
        "valid_operation_acceptance_rate": _rate(valid_accepted, valid_total),
        "invalid_operations_total": invalid_total,
        "invalid_operations_rejected": invalid_rejected,
        "invalid_operation_rejection_rate": _rate(invalid_rejected, invalid_total),
        "fully_correct_schemas": count_true("fully_correct_schema"),
        "fully_correct_schema_rate": _rate(count_true("fully_correct_schema"), len(rows)),
        "end_to_end_successes": count_true("end_to_end_success"),
        "end_to_end_success_rate": _rate(count_true("end_to_end_success"), len(rows)),
        "output_limit_finish_count": count_true("output_limit_finish"),
        "output_limit_finish_rate": _rate(count_true("output_limit_finish"), len(rows)),
        "output_truncated_count": count_true("output_truncated"),
        "output_truncated_rate": _rate(count_true("output_truncated"), len(rows)),
        "retry_event_count": sum_int("retry_event_count"),
        "rate_limit_event_count": sum_int("rate_limit_event_count"),
        "normalized_sql_exact_match_count": count_true("normalized_sql_exact_match"),
        "normalized_sql_exact_match_rate": _rate(
            count_true("normalized_sql_exact_match"),
            count_present("normalized_sql_exact_match"),
        ),
        "normalized_ablation_compile_rate": _rate(count_true("normalized_ablation_compile_success"), count_present("normalized_ablation_compile_success")),
        "normalized_ablation_cer": _rate(sum_int("normalized_ablation_constraint_tests_passed"), sum_int("normalized_ablation_constraint_tests_total")),
        "normalized_ablation_planned_cer": _rate(sum_int("normalized_ablation_constraint_tests_passed"), sum_int("planned_constraint_tests_total")),
        "raw_sql_exact_match_rate": _rate(count_true("raw_sql_exact_match"), count_present("raw_sql_exact_match")),
        "salvage_gold_table_fraction": _rate(sum_int("salvage_gold_tables_created"), sum_int("salvage_gold_table_count")),
        "error_taxonomy": {
            key: sum(int((row.get("error_taxonomy") or {}).get(key, 0)) for row in rows)
            for key in sorted({key for row in rows for key in (row.get("error_taxonomy") or {})})
        },
        "infrastructure_error_count": count_true("infrastructure_error"),
        "mean_schema_cer": mean("constraint_enforcement_rate"),
        "mean_latency_seconds": mean("latency_seconds"),
        "mean_input_tokens": mean("input_tokens"),
        "mean_output_tokens": mean("output_tokens"),
        "total_input_tokens": (
            sum(row.get("input_tokens") or 0 for row in rows)
            if any(row.get("input_tokens") is not None for row in rows)
            else None
        ),
        "total_output_tokens": (
            sum(row.get("output_tokens") or 0 for row in rows)
            if any(row.get("output_tokens") is not None for row in rows)
            else None
        ),
        "total_estimated_cost_usd": (
            sum(row.get("estimated_cost_usd") or 0 for row in rows)
            if any(row.get("estimated_cost_usd") is not None for row in rows)
            else None
        ),
    }

    def aggregate_prf(metric_field: str, categories: Iterable[str]) -> dict[str, dict]:
        aggregated: dict[str, dict] = {}
        for category in categories:
            counts = {"true_positive": 0, "false_positive": 0, "false_negative": 0}
            observed = False
            for row in rows:
                category_metrics = (row.get(metric_field) or {}).get(category) or {}
                if not isinstance(category_metrics.get("true_positive"), int):
                    continue
                observed = True
                for key in counts:
                    counts[key] += int(category_metrics.get(key, 0))
            if not observed:
                aggregated[category] = {
                    "true_positive": None,
                    "false_positive": None,
                    "false_negative": None,
                    "precision": None,
                    "recall": None,
                    "f1": None,
                }
                continue
            tp, fp, fn = (
                counts["true_positive"],
                counts["false_positive"],
                counts["false_negative"],
            )
            precision = _rate(tp, tp + fp)
            recall = _rate(tp, tp + fn)
            f1 = (
                None
                if not (tp + fp + fn)
                else (
                    2 * precision * recall / (precision + recall)
                    if precision is not None
                    and recall is not None
                    and precision + recall
                    else 0.0
                )
            )
            aggregated[category] = {
                **counts,
                "precision": precision,
                "recall": recall,
                "f1": f1,
            }
        return aggregated

    structural_aggregate = aggregate_prf("structural_metrics", STRUCTURAL_CATEGORIES)
    aggregate["structural_metrics"] = structural_aggregate
    aggregate["final_sql_structural_metrics"] = aggregate_prf(
        "final_sql_structural_metrics", FINAL_SQL_STRUCTURAL_CATEGORIES
    )

    test_types: dict[str, dict] = {}
    grouped: dict[str, list[dict]] = defaultdict(list)
    for row in rows:
        for test_type, metrics in row["test_type_metrics"].items():
            grouped[test_type].append(metrics)
    for test_type, metrics_rows in sorted(grouped.items()):
        total = sum(int(item.get("total") or 0) for item in metrics_rows)
        passed = sum(int(item.get("passed") or 0) for item in metrics_rows)
        test_types[test_type] = {
            "total": total,
            "passed": passed,
            "pass_rate": _rate(passed, total),
        }
    aggregate["test_type_metrics"] = test_types
    aggregate["cluster_uncertainty"] = clustered_estimates(rows)
    return aggregate


def _tier_metric_value(row: dict, metric: str) -> Optional[float]:
    if metric == "compile_rate":
        value = row.get("ddl_execution_success")
    elif metric == "table_recall":
        value = ((row.get("final_sql_structural_metrics") or {}).get("tables") or {}).get(
            "recall"
        )
    elif metric == "foreign_key_f1":
        value = ((row.get("final_sql_structural_metrics") or {}).get("foreign_keys") or {}).get(
            "f1"
        )
    else:
        value = row.get(metric)
    if isinstance(value, bool):
        return float(value)
    if isinstance(value, (int, float)):
        return float(value)
    return None


def _paired_tier_drop_off(rows: list[dict], reference_tier: str = "tier1") -> dict[str, dict]:
    """Compare tiers on the same schema IDs; positive values mean a drop."""
    indexed: dict[str, dict[str, dict]] = defaultdict(dict)
    for row in rows:
        tier = str(row.get("tier", "unknown"))
        schema_id = str(row.get("schema_id", ""))
        if schema_id:
            indexed[tier][schema_id] = row

    reference = indexed.get(reference_tier)
    if not reference:
        return {}

    comparisons: dict[str, dict] = {}
    for comparison_tier in sorted(tier for tier in indexed if tier != reference_tier):
        shared_ids = sorted(set(reference) & set(indexed[comparison_tier]))
        metrics: dict[str, dict] = {}
        for metric in TIER_DROP_METRICS:
            pairs = []
            for schema_id in shared_ids:
                reference_value = _tier_metric_value(reference[schema_id], metric)
                comparison_value = _tier_metric_value(indexed[comparison_tier][schema_id], metric)
                if reference_value is not None and comparison_value is not None:
                    pairs.append((reference_value, comparison_value))
            metrics[metric] = {
                "paired_schema_count": len(pairs),
                "reference_mean": statistics.mean(value[0] for value in pairs) if pairs else None,
                "comparison_mean": statistics.mean(value[1] for value in pairs) if pairs else None,
                "mean_drop": statistics.mean(value[0] - value[1] for value in pairs) if pairs else None,
            }
            if pairs:
                import random
                from .statistics import interval, SEED, REPLICATES
                rng = random.Random(SEED)
                differences = [a-b for a,b in pairs]
                metrics[metric]['ci95'] = interval([statistics.mean(rng.choices(differences, k=len(differences))) for _ in range(REPLICATES)])
                metrics[metric]['uncertainty_unit'] = 'paired_schema_id'
        comparisons[f"{reference_tier}_to_{comparison_tier}"] = {
            "reference_tier": reference_tier,
            "comparison_tier": comparison_tier,
            "matched_schema_count": len(shared_ids),
            "metrics": metrics,
        }
    return comparisons


@dataclass
class EvaluationReport:
    arm: str
    model_name: Optional[str]
    results_dir: str
    generated_at: str
    overall: dict
    by_tier: dict[str, dict]
    tier_drop_off: dict[str, dict]
    by_complexity: dict[str, dict]
    structural_metrics: dict[str, dict]
    final_sql_structural_metrics: dict[str, dict]
    test_type_metrics: dict[str, dict]
    schema_metrics: list[dict] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)

    def as_dict(self) -> dict:
        return asdict(self)


def discover_result_files(results_dir: str | Path, tiers: Optional[Iterable[str]] = None) -> list[Path]:
    root = Path(results_dir)
    wanted = set(tiers) if tiers else None
    files: list[Path] = []
    if not root.exists():
        return files
    for tier_dir in sorted(path for path in root.iterdir() if path.is_dir()):
        if wanted is not None and tier_dir.name not in wanted:
            continue
        for path in sorted(tier_dir.glob("*.json")):
            if path.name == "summary.json":
                continue
            files.append(path)
    return files


def detect_truncation_exclusions(results_dirs: Iterable[str | Path]) -> dict[str, dict[str, list[str]]]:
    """Find paired cells with provider-capped, demonstrably unusable output.

    A ``length``/``max_tokens`` finish alone is not enough to exclude an
    artifact: some providers can return a complete, parseable structured
    response with that finish reason. Such outputs remain scored (including
    any omissions as model errors). An exclusion requires both a cap finish
    and evidence that the affected stage's output was unusable. The resulting
    (schema, tier) cell is then excluded from both arms by the caller.
    """
    excluded: dict[tuple[str, str], set[str]] = defaultdict(set)
    for results_dir in results_dirs:
        for path in discover_result_files(results_dir):
            try:
                result = read_json(path)
            except Exception:
                continue
            schema_id = str(result.get("schema_id", path.stem))
            tier = str(result.get("tier", "unknown"))
            arm = "direct" if result.get("module6_direct_baseline") else "structured"
            _, unusable_stages = _output_limit_state(result)
            for stage in unusable_stages:
                excluded[(schema_id, tier)].add(f"{arm}:{stage}:output_limit_unusable")
            verification = result.get("module5_verification") or {}
            if verification.get("infrastructure_error") is True:
                states = ",".join(verification.get("infrastructure_sqlstates") or []) or "unknown"
                excluded[(schema_id, tier)].add(f"{arm}:persistent_infrastructure_error:{states}")
    by_schema: dict[str, dict[str, list[str]]] = defaultdict(dict)
    for (schema_id, tier), reasons in sorted(excluded.items()):
        by_schema[schema_id][tier] = sorted(reasons)
    return dict(by_schema)


def evaluate_results_dir(
    results_dir: str | Path,
    *,
    arm: str = "structured",
    model_name: Optional[str] = None,
    tiers: Optional[Iterable[str]] = None,
    restrict_to_ids: Optional[set[str]] = None,
    limit: Optional[int] = None,
    excluded_schema_tiers: Optional[dict[str, dict[str, list[str]]]] = None,
) -> EvaluationReport:
    """Aggregate existing per-schema artifacts; never invokes an LLM/DB."""
    paths = discover_result_files(results_dir, tiers=tiers)
    rows: list[dict] = []
    warnings: list[str] = []
    stale_verifications = 0
    for path in paths:
        try:
            result = read_json(path)
        except Exception as exc:  # pragma: no cover - external artifact failure
            warnings.append(f"Could not read {path}: {exc}")
            continue
        schema_id = str(result.get("schema_id", path.stem))
        if restrict_to_ids is not None and schema_id not in restrict_to_ids:
            continue
        from ..module5_verification.models import VERIFICATION_PROTOCOL
        verification = result.get('module5_verification') or {}
        if verification and verification.get('verification_protocol') != VERIFICATION_PROTOCOL:
            stale_verifications += 1
        row = _schema_metrics(result, arm)
        reasons = (excluded_schema_tiers or {}).get(schema_id, {}).get(str(row.get("tier", "unknown")), [])
        row["excluded_from_metrics"] = bool(reasons)
        row["exclusion_reasons"] = list(reasons)
        rows.append(row)
        if limit is not None and len(rows) >= limit:
            break

    if stale_verifications:
        warnings.append(f'{stale_verifications} saved verification(s) predate {VERIFICATION_PROTOCOL}; historical scores only until local verification backfill. No LLM rerun is required.')
    metric_rows = [r for r in rows if not r.get("excluded_from_metrics")]
    by_tier: dict[str, dict] = {}
    tier_rows: dict[str, list[dict]] = defaultdict(list)
    for row in metric_rows:
        tier_rows[str(row.get("tier", "unknown"))].append(row)
    for tier, tier_data in sorted(tier_rows.items()):
        by_tier[tier] = _aggregate_rows(tier_data)

    complexity_rows: dict[str, list[dict]] = defaultdict(list)
    for row in metric_rows:
        table_count = row["complexity"].get("tables", 0)
        bucket = "small" if table_count <= 3 else "medium" if table_count <= 8 else "large"
        complexity_rows[bucket].append(row)
    by_complexity = {bucket: _aggregate_rows(data) for bucket, data in sorted(complexity_rows.items())}
    overall = _aggregate_rows(metric_rows)
    overall["assigned_artifact_count"] = len(rows)
    overall["scored_artifact_count"] = len(metric_rows)
    overall["assigned_schema_count"] = len({r["schema_id"] for r in rows})
    overall["excluded_artifact_count"] = len(rows) - len(metric_rows)
    overall["excluded_schema_ids"] = sorted({r["schema_id"] for r in rows if r.get("excluded_from_metrics")})
    overall["excluded_schema_count"] = len(overall["excluded_schema_ids"])
    overall["excluded_schema_tier_cells"] = sorted({
        f"{r['schema_id']}@{r.get('tier', 'unknown')}" for r in rows if r.get("excluded_from_metrics")
    })
    overall["excluded_cell_count"] = len(overall["excluded_schema_tier_cells"])
    # Keep provider cap finishes visible even when the corresponding paired
    # cell is excluded from scored metrics.
    overall["output_limit_finish_count"] = sum(bool(r.get("output_limit_finish")) for r in rows)
    overall["output_limit_finish_rate"] = _rate(overall["output_limit_finish_count"], len(rows))
    overall["output_truncated_count"] = sum(bool(r.get("output_truncated")) for r in rows)
    overall["output_truncated_rate"] = _rate(overall["output_truncated_count"], len(rows))
    overall["output_truncated_schema_ids"] = sorted({r["schema_id"] for r in rows if r.get("output_truncated")})
    ledger = Path(results_dir) / "api_attempts.jsonl"
    if ledger.exists():
        import json
        events = []
        for line in ledger.read_text(encoding="utf-8").splitlines():
            try:
                events.append(json.loads(line))
            except ValueError:
                warnings.append("Incomplete ledger line: usage accounting requires reconciliation")
        finished = [e for e in events if e.get("event") == "attempt_finished"]
        failed = [e for e in events if e.get("event") == "attempt_failed"]
        starts = {(e.get('call_id'), e.get('attempt')) for e in events if e.get('event') == 'attempt_started'}
        closed = {(e.get('call_id'), e.get('attempt')) for e in finished + failed}
        overall['lifetime_usage'] = {
            'http_attempts': len(starts), 'successful_http_responses': len(finished),
            'failed_http_attempts': len(failed), 'unresolved_attempts': len(starts - closed),
            'rate_limit_events': sum(e.get('failure_kind') in {'rate_limit','http_429'} for e in failed),
            'input_tokens_known': sum(e.get('input_tokens') or 0 for e in finished),
            'output_tokens_known': sum(e.get('output_tokens') or 0 for e in finished),
            'estimated_cost_usd_known': sum(e.get('estimated_cost_usd') or 0 for e in finished),
            'usage_unknown_attempts': len(failed) + len(starts - closed) + sum(e.get('input_tokens') is None or e.get('output_tokens') is None for e in finished),
            'api_latency_seconds': sum(e.get('api_latency_seconds') or 0 for e in finished + failed),
            'backoff_seconds_scheduled': sum(e.get('seconds') or 0 for e in events if e.get('event') == 'backoff'),
            'actual_billed_cost_usd': None,
        }
    tier_drop_off = _paired_tier_drop_off(metric_rows)

    if not rows:
        warnings.append(f"No per-schema result JSON files found under {Path(results_dir)}.")
    missing_verification = sum(1 for row in metric_rows if row.get("tests_total", 0) == 0)
    if missing_verification:
        warnings.append(f"{missing_verification} schema result(s) contain no verification tests.")
    if rows and not any(row.get("input_tokens") is not None for row in rows):
        warnings.append("Token and cost metrics are unavailable because run artifacts do not store provider usage.")
    if overall["excluded_schema_count"]:
        warnings.append(f"Excluded {overall['excluded_cell_count']} paired schema-tier cell(s) ({overall['excluded_artifact_count']} artifacts in this arm) symmetrically under pre-registered truncation/infrastructure rules; other tiers for those schema IDs remain scored. See exclusion_reasons in schema_metrics.")
    if arm == "structured" and rows:
        warnings.append(
            "Relationship/cardinality F1 is not reported: current SQL-derived gold artifacts "
            "do not preserve the original relationship/cardinality annotations."
        )

    return EvaluationReport(
        arm=arm,
        model_name=model_name,
        results_dir=str(Path(results_dir)),
        generated_at=datetime.now(timezone.utc).isoformat(),
        overall=overall,
        by_tier=by_tier,
        tier_drop_off=tier_drop_off,
        by_complexity=by_complexity,
        structural_metrics=overall.get("structural_metrics", {}),
        final_sql_structural_metrics=overall.get("final_sql_structural_metrics", {}),
        test_type_metrics=overall.get("test_type_metrics", {}),
        schema_metrics=rows,
        warnings=warnings,
    )


def _paired_reference_mismatches(
    primary: EvaluationReport, reference: EvaluationReport
) -> list[tuple]:
    primary_cells = {
        (row.get("schema_id"), row.get("tier")): row
        for row in primary.schema_metrics
    }
    reference_cells = {
        (row.get("schema_id"), row.get("tier")): row
        for row in reference.schema_metrics
    }
    mismatches = []
    for cell in sorted(set(primary_cells) & set(reference_cells)):
        left, right = primary_cells[cell], reference_cells[cell]
        fields = (
            "planned_tests_total",
            "planned_constraint_tests_total",
            "planned_reference_sha256",
        )
        if any(left.get(field) != right.get(field) for field in fields):
            mismatches.append(cell)
    return mismatches


def compare_reports(primary: EvaluationReport, reference: EvaluationReport) -> dict:
    """Return paired aggregate deltas for two reports (e.g. structured/direct)."""
    mismatches = _paired_reference_mismatches(primary, reference)
    if mismatches:
        raise ValueError(
            "Cannot compare paired arms/models because their Module 1 gold "
            f"reference or planned denominator differs for cells: {mismatches}"
        )
    fields = (
        "parsing_success_rate",
        "generation_success_rate",
        "ddl_execution_rate",
        "test_pass_rate",
        "constraint_enforcement_rate",
        "planned_constraint_pass_rate",
        "planned_test_pass_rate",
        "planned_valid_operation_acceptance_rate",
        "planned_invalid_operation_rejection_rate",
        "structural_test_pass_rate",
        "valid_operation_acceptance_rate",
        "invalid_operation_rejection_rate",
        "fully_correct_schema_rate",
        "end_to_end_success_rate",
        "normalized_sql_exact_match_rate",
    )
    delta = {}
    for field in fields:
        left = primary.overall.get(field)
        right = reference.overall.get(field)
        delta[field] = None if left is None or right is None else left - right
    primary_cells = {(r.get("schema_id"), r.get("tier")): r for r in primary.schema_metrics}
    reference_cells = {(r.get("schema_id"), r.get("tier")): r for r in reference.schema_metrics}
    common_cells = sorted(set(primary_cells) & set(reference_cells))
    both_compiled = [
        cell for cell in common_cells
        if not primary_cells[cell].get("excluded_from_metrics")
        and not reference_cells[cell].get("excluded_from_metrics")
        and primary_cells[cell].get("ddl_execution_success") is True
        and reference_cells[cell].get("ddl_execution_success") is True
        and primary_cells[cell].get("planned_constraint_tests_total", 0) > 0
        and reference_cells[cell].get("planned_constraint_tests_total", 0) > 0
    ]
    def conditional_cer(cells, rows):
        denominator = sum(int(rows[cell].get("planned_constraint_tests_total") or 0) for cell in cells)
        numerator = sum(int(rows[cell].get("constraint_tests_passed") or 0) for cell in cells)
        return {"rate": _rate(numerator, denominator), "passed": numerator,
                "planned": denominator, "cells": len(cells)}

    primary_scored = [row for row in primary.schema_metrics if not row.get("excluded_from_metrics")]
    reference_scored = [row for row in reference.schema_metrics if not row.get("excluded_from_metrics")]
    paired_compile_uncertainty = clustered_estimates(primary_scored, reference_scored)
    return {
        "paired_cluster_uncertainty": paired_compile_uncertainty,
        "primary_paired_comparison": {
            "compile_success": paired_compile_uncertainty.get("metrics", {}).get("compile_success"),
            "compile_success_label": "schema-tier DDL compile success; structured minus direct; schema-clustered bootstrap",
            "cer_given_compile_both_arms": {
                "cohort_rule": "same schema-tier cell must compile successfully in both arms",
                "primary_arm": conditional_cer(both_compiled, primary_cells),
                "reference_arm": conditional_cer(both_compiled, reference_cells),
                "delta_primary_minus_reference": (
                    conditional_cer(both_compiled, primary_cells)["rate"]
                    - conditional_cer(both_compiled, reference_cells)["rate"]
                    if both_compiled and conditional_cer(both_compiled, primary_cells)["rate"] is not None
                    and conditional_cer(both_compiled, reference_cells)["rate"] is not None else None
                ),
            },
        },
        "primary_arm": primary.arm,
        "reference_arm": reference.arm,
        "primary_model": primary.model_name,
        "reference_model": reference.model_name,
        "primary_overall": primary.overall,
        "reference_overall": reference.overall,
        "delta_primary_minus_reference": delta,
    }


def _markdown_report(report: EvaluationReport, comparison: Optional[dict] = None) -> str:
    overall = report.overall
    lines = [
        f"# ER2SQL Module 7 Evaluation Report ({report.arm})",
        "",
        f"- Generated: `{report.generated_at}`",
        f"- Results directory: `{report.results_dir}`",
        f"- Model: `{report.model_name or 'unspecified'}`",
        "",
        "## Overall metrics",
        "",
        "| Metric | Value |",
        "|---|---:|",
    ]
    for label, key in (
        ("Scored schema-tier artifacts", "schema_count"),
        ("Assigned schema-tier artifacts", "assigned_artifact_count"),
        ("Unique assigned schemas", "assigned_schema_count"),
        ("Schemas with at least one excluded tier cell", "excluded_schema_count"),
        ("Truncation-excluded schema-tier cells", "excluded_cell_count"),
        ("Truncation-excluded schema-tier artifacts", "excluded_artifact_count"),
        ("Parsing success rate", "parsing_success_rate"),
        ("Generation success rate", "generation_success_rate"),
        ("DDL execution rate", "ddl_execution_rate"),
        ("Compile rate", "compile_rate"),
        ("Primary: planned-denominator constraint pass rate", "planned_constraint_pass_rate"),
        ("Primary: macro planned-denominator CER", "macro_cer_all"),
        ("Planned-denominator all-test pass rate", "planned_test_pass_rate"),
        ("Planned-denominator valid-operation acceptance", "planned_valid_operation_acceptance_rate"),
        ("Planned-denominator invalid-operation rejection", "planned_invalid_operation_rejection_rate"),
        ("Secondary: execution-conditional test pass rate", "test_pass_rate"),
        ("Secondary: execution-conditional constraint enforcement rate", "constraint_enforcement_rate"),
        ("Secondary: execution-conditional valid-operation acceptance", "valid_operation_acceptance_rate"),
        ("Secondary: execution-conditional invalid-operation rejection", "invalid_operation_rejection_rate"),
        ("Macro CER schema count", "macro_cer_schema_count"),
        ("Schema IDs with no planned behavioral tests", "zero_behavioral_test_schema_count"),
        ("Planned gold constraint tests", "planned_constraint_tests_total"),
        ("Unknown gold denominators", "unknown_denominator_count"),
        ("Setup failures", "setup_failure_count"),
        ("Structural test pass rate", "structural_test_pass_rate"),
        ("Valid-operation acceptance rate", "valid_operation_acceptance_rate"),
        ("Invalid-operation rejection rate", "invalid_operation_rejection_rate"),
        ("Fully correct schema rate", "fully_correct_schema_rate"),
        ("End-to-end success rate", "end_to_end_success_rate"),
        ("Provider output-limit finish rate", "output_limit_finish_rate"),
        ("Confirmed unusable truncation rate", "output_truncated_rate"),
        ("Rate-limit events", "rate_limit_event_count"),
        ("Normalized SQL exact-match rate", "normalized_sql_exact_match_rate"),
        ("Secondary normalized-SQL ablation compile rate", "normalized_ablation_compile_rate"),
        ("Secondary normalized-SQL ablation CER", "normalized_ablation_cer"),
        ("Secondary normalized-SQL ablation strict planned CER", "normalized_ablation_planned_cer"),
        ("Raw SQL exact-match rate", "raw_sql_exact_match_rate"),
        ("Secondary savepoint salvage: fraction of gold tables created", "salvage_gold_table_fraction"),
        ("Persistent infrastructure-error cells", "infrastructure_error_count"),
        ("Mean latency (seconds)", "mean_latency_seconds"),
        ("Estimated cost (USD)", "total_estimated_cost_usd"),
    ):
        value = overall.get(key)
        lines.append(f"| {label} | {value if value is not None else 'N/A'} |")

    lines.extend(["", "## Schema-clustered uncertainty", "",
                  "Bootstrap unit is unique schema ID; tiers remain paired. Small samples are exploratory.", "",
                  "| Metric | Estimate | 95% interval |", "|---|---:|---|"])
    for name, estimate in overall.get('cluster_uncertainty', {}).get('metrics', {}).items():
        ci = estimate['ci95']
        lines.append(f"| {name} | {estimate['estimate']} | [{ci['lower']}, {ci['upper']}] |")
    if overall.get('lifetime_usage'):
        lines.extend(['', '## All-attempt usage ledger', '',
                      'Includes failed/interrupted attempts and archived generations. Actual billed cost requires provider reconciliation.', '',
                      '| Measure | Value |', '|---|---:|'])
        for key, val in overall['lifetime_usage'].items():
            lines.append(f'| {key} | {val} |')
    lines.extend(["", "## Results by tier", "", "| Tier | Schemas | DDL rate | Planned CER | Conditional CER | Planned test pass | Conditional test pass |", "|---|---:|---:|---:|---:|---:|---:|"])
    for tier, metrics in report.by_tier.items():
        lines.append(
            f"| {tier} | {metrics.get('schema_count', 0)} | {metrics.get('ddl_execution_rate', 'N/A')} | "
            f"{metrics.get('planned_constraint_pass_rate', 'N/A')} | {metrics.get('constraint_enforcement_rate', 'N/A')} | "
            f"{metrics.get('planned_test_pass_rate', 'N/A')} | {metrics.get('test_pass_rate', 'N/A')} |"
        )

    lines.extend([
        "",
        "## Paired tier drop-off",
        "",
        "Positive drop means the comparison tier scored below Tier 1. Only matching schema IDs are compared.",
        "",
        "| Comparison | Metric | Paired schemas | Tier 1 mean | Comparison mean | Mean drop |",
        "|---|---|---:|---:|---:|---:|",
    ])
    for comparison_name, tier_comparison in report.tier_drop_off.items():
        for metric, values in tier_comparison["metrics"].items():
            lines.append(
                f"| {comparison_name} | {metric} | {values['paired_schema_count']} | "
                f"{values['reference_mean'] if values['reference_mean'] is not None else 'N/A'} | "
                f"{values['comparison_mean'] if values['comparison_mean'] is not None else 'N/A'} | "
                f"{values['mean_drop'] if values['mean_drop'] is not None else 'N/A'} |"
            )

    lines.extend(["", "## IR parsing structural metrics", "", "| Component | Precision | Recall | F1 |", "|---|---:|---:|---:|"])
    for name, metrics in report.structural_metrics.items():
        lines.append(
            f"| {name} | {metrics.get('precision', 'N/A')} | {metrics.get('recall', 'N/A')} | {metrics.get('f1', 'N/A')} |"
        )

    lines.extend(["", "## Final-SQL structural metrics", "", "| Component | Precision | Recall | F1 |", "|---|---:|---:|---:|"])
    for name, metrics in report.final_sql_structural_metrics.items():
        lines.append(
            f"| {name} | {metrics.get('precision', 'N/A')} | {metrics.get('recall', 'N/A')} | {metrics.get('f1', 'N/A')} |"
        )

    lines.extend(["", "## Constraint-test categories", "", "| Test type | Total | Passed | Pass rate |", "|---|---:|---:|---:|"])
    for name, metrics in report.test_type_metrics.items():
        lines.append(f"| {name} | {metrics['total']} | {metrics['passed']} | {metrics['pass_rate']} |")

    if comparison:
        lines.extend(["", "## Arm comparison", "", "| Metric | Primary − reference |", "|---|---:|"])
        for key, value in comparison["delta_primary_minus_reference"].items():
            lines.append(f"| {key} | {value if value is not None else 'N/A'} |")
        paired_primary = comparison.get("primary_paired_comparison") or {}
        compile_effect = paired_primary.get("compile_success") or {}
        ci = compile_effect.get("ci95") or {}
        lines.extend(["", "Primary paired compile-success difference (schema-clustered bootstrap): "
            f"{compile_effect.get('estimate', 'N/A')} "
            f"(95% CI {ci.get('lower', 'N/A')} to {ci.get('upper', 'N/A')})."])
        both = paired_primary.get("cer_given_compile_both_arms") or {}
        a, b = both.get("primary_arm") or {}, both.get("reference_arm") or {}
        lines.append("Secondary CER among the shared cells where both arms compile: "
            f"{a.get('rate', 'N/A')} (primary, n={a.get('cells', 0)}) vs "
            f"{b.get('rate', 'N/A')} (reference, n={b.get('cells', 0)}).")

    if report.warnings:
        lines.extend(["", "## Warnings", ""])
        lines.extend(f"- {warning}" for warning in report.warnings)
    lines.append("")
    return "\n".join(lines)


def _write_csv(path: Path, rows: list[dict]) -> None:
    ensure_dir(path.parent)
    if not rows:
        write_text(path, "")
        return
    keys = sorted({key for row in rows for key in row.keys()})
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=keys, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)


def write_evaluation_artifacts(
    report: EvaluationReport,
    output_dir: str | Path,
    *,
    comparison: Optional[dict] = None,
    manifest: Optional[dict] = None,
) -> dict[str, str]:
    """Write Module 7 artifacts and return their paths.

    This function only writes reports.  It does not discover datasets, call
    models, or connect to PostgreSQL.
    """
    root = ensure_dir(output_dir)
    write_json(root / "evaluation_report.json", report.as_dict())
    write_text(root / "evaluation_report.md", _markdown_report(report, comparison))
    _write_csv(root / "schema_metrics.csv", report.schema_metrics)

    tier_rows = [{"tier": tier, **metrics} for tier, metrics in report.by_tier.items()]
    tier_drop_rows = []
    for comparison_name, tier_comparison in report.tier_drop_off.items():
        for metric, values in tier_comparison["metrics"].items():
            tier_drop_rows.append({
                "comparison": comparison_name,
                "reference_tier": tier_comparison["reference_tier"],
                "comparison_tier": tier_comparison["comparison_tier"],
                "matched_schema_count": tier_comparison["matched_schema_count"],
                "metric": metric,
                **values,
            })
    complexity_rows = [{"complexity": bucket, **metrics} for bucket, metrics in report.by_complexity.items()]
    structural_rows = [{"component": name, **metrics} for name, metrics in report.structural_metrics.items()]
    final_sql_structural_rows = [
        {"component": name, **metrics}
        for name, metrics in report.final_sql_structural_metrics.items()
    ]
    test_rows = [{"test_type": name, **metrics} for name, metrics in report.test_type_metrics.items()]
    _write_csv(root / "tier_metrics.csv", tier_rows)
    _write_csv(root / "tier_drop_off.csv", tier_drop_rows)
    _write_csv(root / "complexity_metrics.csv", complexity_rows)
    _write_csv(root / "structural_metrics.csv", structural_rows)
    _write_csv(root / "final_sql_structural_metrics.csv", final_sql_structural_rows)
    _write_csv(root / "test_type_metrics.csv", test_rows)

    if comparison is not None:
        write_json(root / "arm_comparison.json", comparison)
    if manifest is not None:
        write_json(root / "run_manifest.json", manifest)

    paths = {
        "json": str(root / "evaluation_report.json"),
        "markdown": str(root / "evaluation_report.md"),
        "schema_csv": str(root / "schema_metrics.csv"),
        "tier_csv": str(root / "tier_metrics.csv"),
        "tier_drop_off_csv": str(root / "tier_drop_off.csv"),
        "complexity_csv": str(root / "complexity_metrics.csv"),
        "structural_csv": str(root / "structural_metrics.csv"),
        "final_sql_structural_csv": str(root / "final_sql_structural_metrics.csv"),
        "test_type_csv": str(root / "test_type_metrics.csv"),
    }
    if comparison is not None:
        paths["comparison"] = str(root / "arm_comparison.json")
    if manifest is not None:
        paths["manifest"] = str(root / "run_manifest.json")
    return paths


def write_model_comparison_artifacts(
    reports: dict[str, EvaluationReport], output_dir: str | Path
) -> dict[str, str]:
    """Write a compact cross-model comparison table after per-model reports."""
    names = sorted(reports)
    for index, left_name in enumerate(names):
        for right_name in names[index + 1:]:
            mismatches = _paired_reference_mismatches(
                reports[left_name], reports[right_name]
            )
            if mismatches:
                raise ValueError(
                    "Cannot compare models because their Module 1 gold reference "
                    f"or planned denominator differs for cells: {mismatches} "
                    f"({left_name} vs {right_name})"
                )
    root = ensure_dir(output_dir)
    rows = []
    for model, report in sorted(reports.items()):
        metrics = report.overall
        rows.append(
            {
                "model": model,
                "arm": report.arm,
                "schema_count": metrics.get("schema_count"),
                "parsing_success_rate": metrics.get("parsing_success_rate"),
                "generation_success_rate": metrics.get("generation_success_rate"),
                "ddl_execution_rate": metrics.get("ddl_execution_rate"),
                "planned_constraint_pass_rate": metrics.get("planned_constraint_pass_rate"),
                "constraint_enforcement_rate": metrics.get("constraint_enforcement_rate"),
                "structural_test_pass_rate": metrics.get("structural_test_pass_rate"),
                "final_sql_table_f1": (
                    (metrics.get("final_sql_structural_metrics") or {}).get("tables") or {}
                ).get("f1"),
                "final_sql_foreign_key_f1": (
                    (metrics.get("final_sql_structural_metrics") or {}).get("foreign_keys") or {}
                ).get("f1"),
                "fully_correct_schema_rate": metrics.get("fully_correct_schema_rate"),
                "end_to_end_success_rate": metrics.get("end_to_end_success_rate"),
                "mean_latency_seconds": metrics.get("mean_latency_seconds"),
                "total_estimated_cost_usd": metrics.get("total_estimated_cost_usd"),
            }
        )
    write_json(root / "model_comparison.json", {"models": rows})
    _write_csv(root / "model_comparison.csv", rows)
    lines = [
        "# ER2SQL Cross-Model Comparison",
        "",
        "| Model | Scored artifacts | DDL rate | Planned CER (primary) | Conditional CER (secondary) | Final-SQL table F1 | Final-SQL FK F1 | Fully correct | E2E success |",
        "|---|---:|---:|---:|---:|---:|---:|---:|---:|",
    ]
    for row in rows:
        lines.append(
            f"| {row['model']} | {row['schema_count']} | {row['ddl_execution_rate']} | "
            f"{row['planned_constraint_pass_rate']} | {row['constraint_enforcement_rate']} | {row['final_sql_table_f1']} | "
            f"{row['final_sql_foreign_key_f1']} | {row['fully_correct_schema_rate']} | "
            f"{row['end_to_end_success_rate']} |"
        )
    write_text(root / "model_comparison.md", "\n".join(lines) + "\n")
    return {
        "json": str(root / "model_comparison.json"),
        "csv": str(root / "model_comparison.csv"),
        "markdown": str(root / "model_comparison.md"),
    }
