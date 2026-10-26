"""
Pipeline runner: Module 2 -> validate -> Module 3 -> Module 4 -> Module 5.

For each (image, ground_truth_sql) pair in a tier:

    1. Module 2 parses the image into a canonical JSON IR (with
       built-in schema-validation-aware retries).
    2. If the IR is valid, Module 3 generates SQL DDL from the IR
       ONLY (never the image).
    3. If Module 3 succeeded AND a `database:` section is configured,
       Module 4 creates a diagnostic suite from the predicted IR and
       a final-evaluation suite from Module 1 ground-truth SQL. Module
       5 executes the generated DDL against both suites in isolated,
       rollback-only Postgres schemas; CER is reported from the gold
       suite.
    4. Everything is written to a per-schema JSON result file plus a
       per-tier summary.json.

If config.yaml has no `database:` section, Modules 4/5 are skipped
entirely and the pipeline behaves exactly as it did before they
existed (Module 2 + Module 3 only) -- no code path requires Postgres
to be configured.

This runner does NOT run a direct baseline (Module 6) and does NOT compute
paper-level aggregate metrics (Module 7).
"""

from __future__ import annotations

import logging
import time
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Optional

from ..config import DatabaseConfig, PipelineConfig
from ..dataset import (
    SchemaRecord,
    compute_common_schema_ids,
    discover_tier_dataset,
    filter_records_by_ids,
)
from ..llm_client import LLMClient, build_llm_client
from ..module2_parsing.agent import parse_er_diagram
from ..module3_generation.agent import generate_sql_from_ir
from ..module4_constraint_tests.generator import generate_constraint_tests
from ..module4_constraint_tests.gold_schema import parse_ground_truth_sql
from ..module5_verification.db import build_connection, test_connection
from ..module5_verification.executor import verify_schema_with_infra_retry
from ..utils.io_utils import (
    ensure_dir,
    read_json,
    read_text_file,
    write_json,
    write_text,
)

logger = logging.getLogger("er2sql.pipeline")


@dataclass
class TierRunSummary:
    tier: str
    total_records: int = 0
    parsing_success: int = 0
    parsing_failed: int = 0
    generation_success: int = 0
    generation_failed: int = 0
    skipped_generation_due_to_invalid_ir: int = 0
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


def attach_verification(
    combined_result: dict,
    ir: Optional[dict],
    sql_ddl: str,
    tier: str,
    schema_id: str,
    db_conn,
    db_config: DatabaseConfig,
    ground_truth_sql: str,
) -> None:
    """
    Build two Module 4 suites, then execute each through Module 5:

    - The *gold* suite is derived from Module 1 ground-truth SQL and
      is the authoritative evaluation suite for CER and summaries.
    - The predicted-IR suite remains a separately labelled diagnostic.

    Module 2 still sees only the image and Module 3 still sees only
    the predicted IR; the reference SQL is used solely after generation
    as an evaluation oracle.
    """
    predicted_suite = None
    if ir is None:
        combined_result["module4_test_suite"] = None
    else:
        try:
            predicted_suite = generate_constraint_tests(
                ir, schema_id=schema_id, constraint_source="predicted_ir"
            )
            combined_result["module4_test_suite"] = predicted_suite.as_dict()
        except Exception as exc:  # noqa: BLE001
            logger.error("[%s/%s] Module 4 test generation raised: %s", tier, schema_id, exc)
            combined_result["module4_test_suite"] = None

    try:
        gold_parse = parse_ground_truth_sql(ground_truth_sql, schema_id=schema_id)
        if not gold_parse.ir["tables"]:
            raise ValueError("ground-truth SQL contained no parseable CREATE TABLE definitions")
        gold_suite = generate_constraint_tests(
            gold_parse.ir, schema_id=schema_id, constraint_source="ground_truth_sql"
        )
        gold_suite.generation_warnings = gold_parse.warnings + gold_suite.generation_warnings
        combined_result["module4_gold_test_suite"] = gold_suite.as_dict()
    except Exception as exc:  # noqa: BLE001
        logger.error("[%s/%s] Gold Module 4 test generation raised: %s", tier, schema_id, exc)
        combined_result["module4_gold_test_suite"] = None
        combined_result["module5_verification"] = {
            "schema_id": schema_id,
            "tier": tier,
            "constraint_source": "ground_truth_sql",
            "error": f"Gold Module 4 test generation raised an exception: {exc}",
        }
    else:
        try:
            logger.info(
                "[%s/%s] Module 5: verifying generated SQL against gold constraints",
                tier,
                schema_id,
            )
            verification_result = verify_schema_with_infra_retry(
                conn=db_conn,
                sql_ddl=sql_ddl,
                test_suite=gold_suite,
                tier=tier,
                schema_id=schema_id,
                schema_prefix=db_config.schema_prefix,
                statement_timeout_ms=db_config.statement_timeout_ms,
                constraint_source="ground_truth_sql",
            )
            combined_result["module5_verification"] = verification_result.as_dict()
        except Exception as exc:  # noqa: BLE001
            logger.error("[%s/%s] Gold Module 5 verification raised: %s", tier, schema_id, exc)
            combined_result["module5_verification"] = {
                "schema_id": schema_id,
                "tier": tier,
                "constraint_source": "ground_truth_sql",
                "error": f"Gold Module 5 verification raised an exception: {exc}",
            }
            try:
                db_conn.rollback()
            except Exception:  # noqa: BLE001
                pass

    if predicted_suite is None:
        combined_result["module5_predicted_ir_diagnostic"] = None
        return

    try:
        logger.info(
            "[%s/%s] Module 5: running predicted-IR diagnostic verification",
            tier,
            schema_id,
        )
        diagnostic_result = verify_schema_with_infra_retry(
            conn=db_conn,
            sql_ddl=sql_ddl,
            test_suite=predicted_suite,
            tier=tier,
            schema_id=schema_id,
            schema_prefix=db_config.schema_prefix,
            statement_timeout_ms=db_config.statement_timeout_ms,
            constraint_source="predicted_ir",
        )
        combined_result["module5_predicted_ir_diagnostic"] = diagnostic_result.as_dict()
    except Exception as exc:  # noqa: BLE001
        logger.error("[%s/%s] Diagnostic Module 5 verification raised: %s", tier, schema_id, exc)
        combined_result["module5_predicted_ir_diagnostic"] = {
            "schema_id": schema_id,
            "tier": tier,
            "constraint_source": "predicted_ir",
            "error": f"Predicted-IR diagnostic verification raised an exception: {exc}",
        }
        try:
            db_conn.rollback()
        except Exception:  # noqa: BLE001
            pass


def run_single_schema(
    record: SchemaRecord,
    module2_client: LLMClient,
    module3_client: LLMClient,
    sql_dialect: str,
    output_dir: Path,
    db_conn=None,
    db_config: Optional[DatabaseConfig] = None,
) -> dict:
    """Run Module 2 -> Module 3 -> (optionally) Module 4/5 for one schema, and persist the result."""
    logger.info("[%s/%s] Module 2: parsing ER diagram", record.tier, record.schema_id)
    for client, role in ((module2_client, "module2"), (module3_client, "module3")):
        client.audit_path = output_dir / "api_attempts.jsonl"
        client.audit_context = {"tier": record.tier, "schema_id": record.schema_id, "role": role}
    from types import SimpleNamespace
    prior = _load_existing_result(output_dir, record.tier, record.schema_id) or {}
    saved_parsing = prior.get("module2_parsing") or {}
    if prior.get("outcome_policy") == "fixed_attempts_v2" and saved_parsing.get("success"):
        parsing_result = SimpleNamespace(**saved_parsing)
        parsing_result.failure_terminal = False
        parsing_result.as_dict = lambda: saved_parsing
    else:
        parsing_result = parse_er_diagram(
            image_path=record.image_path,
            schema_id=record.schema_id,
            tier=record.tier,
            client=module2_client,
            max_validation_retries=getattr(getattr(module2_client, "config", None), "validation_retries", 0),
        )
    # Preserve completed parsing before the next provider request can be interrupted.
    write_json(output_dir / record.tier / f"{record.schema_id}.json", {
        "schema_id": record.schema_id, "tier": record.tier, "outcome_policy": "fixed_attempts_v2",
        "terminal_model_failure": parsing_result.failure_terminal,
        "ground_truth_sql": read_text_file(record.sql_path),
        "module2_parsing": parsing_result.as_dict(), "module3_generation": None,
    })

    generation_result_dict: Optional[dict] = None

    if parsing_result.success and parsing_result.ir is not None:
        logger.info(
            "[%s/%s] Module 3: generating SQL from IR", record.tier, record.schema_id
        )
        generation_result = generate_sql_from_ir(
            ir=parsing_result.ir,
            schema_id=record.schema_id,
            tier=record.tier,
            client=module3_client,
            dialect=sql_dialect,
        )
        generation_result_dict = generation_result.as_dict()
    else:
        logger.warning(
            "[%s/%s] skipping Module 3: IR did not pass validation",
            record.tier,
            record.schema_id,
        )

    ground_truth_sql = read_text_file(record.sql_path)

    combined_result = {
        "outcome_policy": "fixed_attempts_v2",
        "terminal_model_failure": parsing_result.failure_terminal or bool(
            generation_result_dict and generation_result_dict.get("failure_terminal")),
        "schema_id": record.schema_id,
        "tier": record.tier,
        "image_path": record.image_path,
        "sql_path": record.sql_path,
        "ground_truth_sql": ground_truth_sql,
        "module2_parsing": parsing_result.as_dict(),
        "module3_generation": generation_result_dict,
        "module4_test_suite": None,
        "module4_gold_test_suite": None,
        "module5_verification": None,
        "module5_predicted_ir_diagnostic": None,
    }

    if (
        generation_result_dict
        and generation_result_dict.get("success")
        and db_conn is not None
        and db_config is not None
    ):
        attach_verification(
            combined_result,
            ir=parsing_result.ir,
            sql_ddl=generation_result_dict["sql_ddl"],
            tier=record.tier,
            schema_id=record.schema_id,
            db_conn=db_conn,
            db_config=db_config,
            ground_truth_sql=ground_truth_sql,
        )

    out_path = output_dir / record.tier / f"{record.schema_id}.json"
    write_json(out_path, combined_result)

    if generation_result_dict and generation_result_dict.get("success"):
        sql_out_path = output_dir / record.tier / "generated_sql" / f"{record.schema_id}.sql"
        write_text(sql_out_path, generation_result_dict["sql_ddl"] or "")
    return combined_result


def _run_verification_backfill_only(
    record: SchemaRecord,
    existing: dict,
    output_dir: Path,
    db_conn,
    db_config: DatabaseConfig,
) -> dict:
    """
    Module 2 + Module 3 already succeeded in a PRIOR run (loaded from
    `existing`). The stored IR and SQL are reused while Modules 4/5 are
    re-run without making another LLM call.
    """
    logger.info(
        "[%s/%s] --resume: reusing stored Module 2/3 output, running verification only",
        record.tier,
        record.schema_id,
    )
    combined_result = dict(existing)
    ir = existing["module2_parsing"]["ir"]
    sql_ddl = existing["module3_generation"]["sql_ddl"]
    ground_truth_sql = existing.get("ground_truth_sql") or read_text_file(record.sql_path)

    attach_verification(
        combined_result,
        ir=ir,
        sql_ddl=sql_ddl,
        tier=record.tier,
        schema_id=record.schema_id,
        db_conn=db_conn,
        db_config=db_config,
        ground_truth_sql=ground_truth_sql,
    )

    out_path = output_dir / record.tier / f"{record.schema_id}.json"
    write_json(out_path, combined_result)
    return combined_result


def _load_existing_result(output_dir: Path, tier: str, schema_id: str) -> Optional[dict]:
    """Load a previously-written per-schema result JSON, if one exists."""
    path = output_dir / tier / f"{schema_id}.json"
    if not path.exists():
        return None
    try:
        return read_json(path)
    except Exception:  # noqa: BLE001 - a corrupt/partial file should just be re-run
        return None

def _generation_ok(result: dict) -> bool:
    module2 = result.get("module2_parsing") or {}
    module3 = result.get("module3_generation") or {}
    return bool(module2.get("success")) and bool(module3.get("success"))


def _has_verification(result: dict) -> bool:
    from ..module5_verification.models import VERIFICATION_PROTOCOL
    verification = result.get("module5_verification") or {}
    if verification.get('verification_protocol') != VERIFICATION_PROTOCOL:
        return False
    if not isinstance(verification.get("ddl_execution"), dict) or verification.get("error"):
        return False
    if verification.get("constraint_source") != "ground_truth_sql":
        return False
    # Results produced before rejection attribution was introduced can contain
    # inflated CER values.  Treat them as needing a verification-only backfill;
    # Module 2/3 output is retained and no generation call is repeated.
    return all(
        bool(test.get("expected_sqlstates")) and "error_sqlstate" in test and "rejection_target_matched" in test
        for test in verification.get("test_results") or []
        if test.get("expect") == "failure"
    )


def _is_fully_done(result: dict, verify_enabled: bool) -> bool:
    """
    A schema needs NO further action at all this run if Module 2/3
    already succeeded, AND (verification is off, OR verification is
    on and already present from a prior run).
    """
    if result.get("terminal_model_failure"):
        return True
    if not _generation_ok(result):
        return False
    if verify_enabled:
        return _has_verification(result)
    return True


def _needs_verification_backfill_only(result: dict, verify_enabled: bool) -> bool:
    """
    Module 2/3 already succeeded, verification is enabled this run,
    but this result predates Modules 4/5 (or verification errored out
    in a way that left it unset). Re-running the LLM stages would be
    wasteful; only Module 4/5 need to run.
    """
    if not verify_enabled:
        return False
    return _generation_ok(result) and not _has_verification(result)


def compute_common_ids_across_tiers(
    config: PipelineConfig, tiers: Optional[list[str]] = None
) -> set[str]:
    """
    Discover each requested tier's dataset (default: all tiers in
    config.yaml) and return the schema_ids present in every one of
    them. Pass the result to `run_tier(..., restrict_to_ids=...)` to
    ensure every tier processes the exact same paired-triplet set,
    even if individual tier folders contain a few extra stray files.
    """
    tier_names = tiers if tiers is not None else list(config.tiers)
    reports = {}
    for tier in tier_names:
        if tier not in config.tiers:
            raise KeyError(
                f"Tier '{tier}' is not defined in config.yaml under dataset.tiers. "
                f"Known tiers: {list(config.tiers)}"
            )
        tier_paths = config.tiers[tier]
        reports[tier] = discover_tier_dataset(
            tier_paths.diagrams_dir, tier_paths.sql_dir, tier
        )
    return compute_common_schema_ids(reports)


def run_tier(
    config: PipelineConfig,
    tier: str,
    limit: Optional[int] = None,
    output_dir_override: Optional[str] = None,
    restrict_to_ids: Optional[set[str]] = None,
    resume: bool = False,
    verify: Optional[bool] = None,
) -> TierRunSummary:
    """
    `verify`: None (default) means "auto" -- run Module 4/5 if and
    only if config.yaml has a `database:` section. Pass True/False to
    force verification on/off regardless of config (e.g. a --no-verify
    CLI flag even when a database IS configured).
    """
    if tier not in config.tiers:
        raise KeyError(
            f"Tier '{tier}' is not defined in config.yaml under dataset.tiers. "
            f"Known tiers: {list(config.tiers)}"
        )

    verify_requested = config.database is not None if verify is None else verify
    verify_enabled = False
    db_conn = None

    if verify_requested:
        if config.database is None:
            logger.warning(
                "[%s] verification was requested but config.yaml has no 'database' "
                "section; skipping Module 4/5 for this run.",
                tier,
            )
        else:
            ok, message = test_connection(config.database)
            if not ok:
                logger.error(
                    "[%s] could not connect to the verification database (%s); "
                    "skipping Module 4/5 for this ENTIRE run. Module 2/3 will "
                    "still run normally. Error: %s",
                    tier,
                    config.database.dbname,
                    message,
                )
            else:
                db_conn = build_connection(config.database)
                verify_enabled = True
                logger.info(
                    "[%s] connected to verification database '%s' at %s:%s",
                    tier,
                    config.database.dbname,
                    config.database.host,
                    config.database.port,
                )

    try:
        tier_paths = config.tiers[tier]
        report = discover_tier_dataset(tier_paths.diagrams_dir, tier_paths.sql_dir, tier)

        output_dir = Path(output_dir_override or config.output.base_dir)
        ensure_dir(output_dir / tier)

        records = report.records
        if restrict_to_ids is not None:
            pre_filter_count = len(records)
            records = filter_records_by_ids(report, restrict_to_ids)
            logger.info(
                "[%s] restrict_to_ids applied: %d -> %d records",
                tier,
                pre_filter_count,
                len(records),
            )

        skipped_already_done = 0
        backfill_ids: set[str] = set()

        if resume:
            pre_resume_count = len(records)
            remaining = []
            for rec in records:
                existing = _load_existing_result(output_dir, tier, rec.schema_id)
                if existing is None:
                    remaining.append(rec)
                    continue
                if _is_fully_done(existing, verify_enabled):
                    skipped_already_done += 1
                elif _needs_verification_backfill_only(existing, verify_enabled):
                    backfill_ids.add(rec.schema_id)
                    remaining.append(rec)
                else:
                    remaining.append(rec)
            records = remaining
            logger.info(
                "[%s] --resume applied: %d fully-done schema(s) skipped, %d "
                "verification-only backfill, %d -> %d records remaining",
                tier,
                skipped_already_done,
                len(backfill_ids),
                pre_resume_count,
                len(records),
            )

        if limit is not None:
            records = records[:limit]

        module2_client = build_llm_client(config.module2_parsing)
        module3_client = build_llm_client(config.module3_generation)
        summary = TierRunSummary(
            tier=tier,
            total_records=len(records),
            skipped_already_done=skipped_already_done,
            verification_enabled=verify_enabled,
            unmatched_images=report.unmatched_images,
            unmatched_sql=report.unmatched_sql,
            started_at=time.strftime("%Y-%m-%dT%H:%M:%S"),
        )

        logger.info("[%s] dataset discovery: %s", tier, report.summary())

        for record in records:
            if record.schema_id in backfill_ids:
                existing = _load_existing_result(output_dir, tier, record.schema_id)
                result = _run_verification_backfill_only(
                    record=record,
                    existing=existing,
                    output_dir=output_dir,
                    db_conn=db_conn,
                    db_config=config.database,
                )
                summary.verification_backfilled += 1
            else:
                result = run_single_schema(
                    record=record,
                    module2_client=module2_client,
                    module3_client=module3_client,
                    sql_dialect=config.sql_dialect,
                    output_dir=output_dir,
                    db_conn=db_conn,
                    db_config=config.database if verify_enabled else None,
                )

            if result["module2_parsing"]["success"]:
                summary.parsing_success += 1
            else:
                summary.parsing_failed += 1
                summary.skipped_generation_due_to_invalid_ir += 1
                continue

            gen = result["module3_generation"]
            if gen and gen.get("success"):
                summary.generation_success += 1
            else:
                summary.generation_failed += 1
                continue

            verification = result.get("module5_verification")
            if verification and "ddl_execution" in verification:
                if verification["ddl_execution"]["success"]:
                    summary.ddl_execution_success += 1
                else:
                    summary.ddl_execution_failed += 1
                summary.total_constraint_tests += verification.get("constraint_tests_total", 0)
                summary.total_constraint_tests_passed += verification.get(
                    "constraint_tests_passed", 0
                )

        if summary.total_constraint_tests > 0:
            summary.aggregate_constraint_enforcement_rate = (
                summary.total_constraint_tests_passed / summary.total_constraint_tests
            )

        summary.finished_at = time.strftime("%Y-%m-%dT%H:%M:%S")
        write_json(output_dir / tier / "summary.json", summary.as_dict())
        logger.info("[%s] run complete: %s", tier, summary.as_dict())
        return summary
    finally:
        if db_conn is not None:
            db_conn.close()
