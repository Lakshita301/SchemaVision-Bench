"""Dataset runner for Module 6's controlled direct image-to-SQL baseline."""

from __future__ import annotations

import logging
import time
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Optional

from ..config import ConfigError, PipelineConfig
from ..dataset import SchemaRecord, discover_tier_dataset, filter_records_by_ids
from ..llm_client import build_llm_client
from ..module5_verification.db import build_connection, test_connection
from ..pipeline.runner import attach_verification
from ..utils.io_utils import ensure_dir, read_json, read_text_file, write_json, write_text
from .agent import generate_sql_directly_from_image

logger = logging.getLogger("er2sql.module6_direct_baseline")


@dataclass
class DirectBaselineRunSummary:
    tier: str
    total_records: int = 0
    generation_success: int = 0
    generation_failed: int = 0
    skipped_already_done: int = 0
    verification_enabled: bool = False
    verification_backfilled: int = 0
    ddl_execution_success: int = 0
    ddl_execution_failed: int = 0
    total_constraint_tests: int = 0
    total_constraint_tests_passed: int = 0
    aggregate_constraint_enforcement_rate: Optional[float] = None
    unmatched_images: list[str] = field(default_factory=list)
    unmatched_sql: list[str] = field(default_factory=list)
    started_at: Optional[str] = None
    finished_at: Optional[str] = None

    def as_dict(self) -> dict:
        return asdict(self)


def _output_path(base_dir: Path, tier: str, schema_id: str) -> Path:
    return base_dir / tier / f"{schema_id}.json"


def _load_existing(base_dir: Path, tier: str, schema_id: str) -> Optional[dict]:
    path = _output_path(base_dir, tier, schema_id)
    if not path.exists():
        return None
    try:
        return read_json(path)
    except Exception:  # noqa: BLE001
        return None


def _gold_verified(result: dict) -> bool:
    from ..module5_verification.models import VERIFICATION_PROTOCOL
    verification = result.get("module5_verification") or {}
    if verification.get('verification_protocol') != VERIFICATION_PROTOCOL:
        return False
    if not isinstance(verification.get('ddl_execution'), dict) or verification.get('error'):
        return False
    if verification.get("constraint_source") != "ground_truth_sql":
        return False
    return all(
        bool(test.get("expected_sqlstates")) and "error_sqlstate" in test and "rejection_target_matched" in test
        for test in verification.get("test_results") or []
        if test.get("expect") == "failure"
    )


def _generation_ok(result: dict) -> bool:
    return bool((result.get("module6_direct_baseline") or {}).get("success"))


def _attach_or_backfill_verification(
    result: dict,
    record: SchemaRecord,
    db_conn,
    config: PipelineConfig,
) -> None:
    direct = result["module6_direct_baseline"]
    ground_truth_sql = result.get("ground_truth_sql") or read_text_file(record.sql_path)
    result["ground_truth_sql"] = ground_truth_sql
    attach_verification(
        combined_result=result,
        ir=None,  # A direct baseline intentionally has no predicted IR diagnostic suite.
        sql_ddl=direct["sql_ddl"],
        tier=record.tier,
        schema_id=record.schema_id,
        db_conn=db_conn,
        db_config=config.database,
        ground_truth_sql=ground_truth_sql,
    )


def run_direct_baseline_tier(
    config: PipelineConfig,
    tier: str,
    limit: Optional[int] = None,
    output_dir_override: Optional[str] = None,
    restrict_to_ids: Optional[set[str]] = None,
    resume: bool = False,
    verify: Optional[bool] = None,
) -> DirectBaselineRunSummary:
    """Run the Module 6 one-call baseline over one tier.

    Gold Module 4/5 verification is enabled by the same optional database
    configuration as the structured pipeline, which keeps final CER directly
    comparable. No Module 2 or Module 3 function is called here.
    """
    if tier not in config.tiers:
        raise KeyError(f"Tier '{tier}' is not defined in config.yaml.")
    if config.module6_direct_baseline is None:
        raise ConfigError(
            "config.yaml must define llm.module6_direct_baseline before running Module 6."
        )

    verify_requested = config.database is not None if verify is None else verify
    verify_enabled = False
    db_conn = None
    if verify_requested:
        if config.database is None:
            logger.warning("[%s] Module 6 verification requested without a database config.", tier)
        else:
            ok, message = test_connection(config.database)
            if not ok:
                logger.error("[%s] Module 6 database unavailable; skipping verification: %s", tier, message)
            else:
                db_conn = build_connection(config.database)
                verify_enabled = True

    try:
        tier_paths = config.tiers[tier]
        report = discover_tier_dataset(tier_paths.diagrams_dir, tier_paths.sql_dir, tier)
        output_base = Path(output_dir_override or config.output.base_dir) / "module6_direct_baseline"
        ensure_dir(output_base / tier)
        records = report.records
        if restrict_to_ids is not None:
            records = filter_records_by_ids(report, restrict_to_ids)

        skipped = 0
        backfill_ids: set[str] = set()
        if resume:
            remaining = []
            for record in records:
                existing = _load_existing(output_base, tier, record.schema_id)
                if existing and existing.get("terminal_model_failure"):
                    skipped += 1
                elif existing is None or not _generation_ok(existing):
                    remaining.append(record)
                elif not verify_enabled or _gold_verified(existing):
                    skipped += 1
                else:
                    backfill_ids.add(record.schema_id)
                    remaining.append(record)
            records = remaining
        if limit is not None:
            records = records[:limit]

        summary = DirectBaselineRunSummary(
            tier=tier,
            total_records=len(records),
            skipped_already_done=skipped,
            verification_enabled=verify_enabled,
            unmatched_images=report.unmatched_images,
            unmatched_sql=report.unmatched_sql,
            started_at=time.strftime("%Y-%m-%dT%H:%M:%S"),
        )
        logger.info("[%s] Module 6 dataset discovery: %s", tier, report.summary())

        client = None
        for record in records:
            existing = _load_existing(output_base, tier, record.schema_id)
            if record.schema_id in backfill_ids and existing is not None:
                result = dict(existing)
                _attach_or_backfill_verification(result, record, db_conn, config)
                summary.verification_backfilled += 1
            else:
                if client is None:
                    client = build_llm_client(config.module6_direct_baseline)
                client.audit_path = output_base / "api_attempts.jsonl"
                client.audit_context = {"tier": record.tier, "schema_id": record.schema_id, "role": "module6"}
                direct_result = generate_sql_directly_from_image(
                    image_path=record.image_path,
                    schema_id=record.schema_id,
                    tier=record.tier,
                    client=client,
                    dialect=config.sql_dialect,
                )
                result = {
                    "outcome_policy": "fixed_attempts_v2",
                    "terminal_model_failure": direct_result.failure_terminal,
                    "schema_id": record.schema_id,
                    "tier": record.tier,
                    "image_path": record.image_path,
                    "sql_path": record.sql_path,
                    "ground_truth_sql": read_text_file(record.sql_path),
                    "module6_direct_baseline": direct_result.as_dict(),
                    "module4_test_suite": None,
                    "module4_gold_test_suite": None,
                    "module5_verification": None,
                    "module5_predicted_ir_diagnostic": None,
                }
                if direct_result.success and verify_enabled:
                    _attach_or_backfill_verification(result, record, db_conn, config)

            direct = result["module6_direct_baseline"]
            if direct["success"]:
                summary.generation_success += 1
                sql_path = output_base / tier / "generated_sql" / f"{record.schema_id}.sql"
                write_text(sql_path, direct["sql_ddl"] or "")
            else:
                summary.generation_failed += 1

            verification = result.get("module5_verification") or {}
            ddl_execution = verification.get("ddl_execution")
            if ddl_execution:
                if ddl_execution.get("success"):
                    summary.ddl_execution_success += 1
                else:
                    summary.ddl_execution_failed += 1
                summary.total_constraint_tests += verification.get("constraint_tests_total", 0)
                summary.total_constraint_tests_passed += verification.get("constraint_tests_passed", 0)
            write_json(_output_path(output_base, tier, record.schema_id), result)

        if summary.total_constraint_tests:
            summary.aggregate_constraint_enforcement_rate = (
                summary.total_constraint_tests_passed / summary.total_constraint_tests
            )
        summary.finished_at = time.strftime("%Y-%m-%dT%H:%M:%S")
        write_json(output_base / tier / "summary.json", summary.as_dict())
        return summary
    finally:
        if db_conn is not None:
            db_conn.close()
