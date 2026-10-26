"""
Module 2: ER Diagram Parsing Agent.

    ER diagram image  --[vision LLM]-->  canonical JSON IR

This is the ONLY module that ever sees the original ER diagram image.
Its output (a Python dict, once parsed and validated) is the sole
input to Module 3.
"""

from __future__ import annotations

import json
import logging
from dataclasses import dataclass, field
from typing import Optional

from ..ir_validator import IRValidationResult, validate_ir
from ..ir_schema import CANONICAL_IR_SCHEMA_VERSION
from ..llm_client import LLMClient
from ..utils.io_utils import extract_first_json_object
from . import prompts

logger = logging.getLogger("er2sql.module2_parsing")


@dataclass
class ParsingResult:
    success: bool
    schema_id: str
    tier: str
    image_path: str
    ir: Optional[dict] = None
    validation: Optional[IRValidationResult] = None
    raw_responses: list[str] = field(default_factory=list)
    llm_attempts_used: int = 0
    validation_attempts_used: int = 0
    error_message: Optional[str] = None
    input_tokens: int = 0
    output_tokens: int = 0
    total_tokens: int = 0
    latency_seconds: float = 0.0
    estimated_cost_usd: float = 0.0
    finish_reasons: list[str] = field(default_factory=list)
    retry_events: list[str] = field(default_factory=list)
    retry_delays_seconds: list[float] = field(default_factory=list)
    failure_terminal: bool = False
    api_latency_seconds: float = 0.0
    backoff_seconds: float = 0.0

    def as_dict(self) -> dict:
        return {
            "success": self.success,
            "failure_terminal": self.failure_terminal,
            "api_latency_seconds": self.api_latency_seconds,
            "backoff_seconds": self.backoff_seconds,
            "schema_id": self.schema_id,
            "tier": self.tier,
            "image_path": self.image_path,
            "ir": self.ir,
            "validation": self.validation.as_dict() if self.validation else None,
            "raw_responses": self.raw_responses,
            "llm_attempts_used": self.llm_attempts_used,
            "validation_attempts_used": self.validation_attempts_used,
            "error_message": self.error_message,
            "input_tokens": self.input_tokens,
            "output_tokens": self.output_tokens,
            "total_tokens": self.total_tokens,
            "latency_seconds": self.latency_seconds,
            "estimated_cost_usd": self.estimated_cost_usd,
            "finish_reasons": self.finish_reasons,
            "retry_events": self.retry_events,
            "retry_delays_seconds": self.retry_delays_seconds,
        }


def _try_parse_json(text: str) -> tuple[Optional[dict], Optional[str]]:
    candidate = extract_first_json_object(text)
    try:
        obj = json.loads(candidate)
    except json.JSONDecodeError as exc:
        return None, f"JSON decode error: {exc}"
    return obj, None


def _apply_runtime_ir_defaults(
    ir: dict, *, schema_name: str, tier: str, source_image: str
) -> dict:
    """Supply only canonical fields whose values are known at runtime.

    Some OpenAI-compatible vision models return a well-formed table/FK
    extraction but omit the two required container fields below.  These
    defaults do not infer diagram content: an empty relationships list says
    no relationship-level detail was extracted, and metadata is supplied from
    the record currently being processed.  This keeps Module 3's input
    schema-shaped and avoids spending an additional LLM call merely to add
    bookkeeping fields.
    """
    normalized = dict(ir)
    normalized.setdefault("ir_schema_version", CANONICAL_IR_SCHEMA_VERSION)
    normalized.setdefault("schema_name", schema_name)
    normalized.setdefault("relationships", [])
    normalized["metadata"] = {
        "tier": tier,
        "source_image": source_image,
        **(
            normalized.get("metadata", {})
            if isinstance(normalized.get("metadata"), dict)
            else {}
        ),
    }
    # The record context is authoritative even if a model copied these fields
    # incorrectly from a different prompt/example.
    normalized["metadata"]["tier"] = tier
    normalized["metadata"]["source_image"] = source_image
    return normalized


def parse_er_diagram(
    image_path: str,
    schema_id: str,
    tier: str,
    client: LLMClient,
    max_llm_retries: Optional[int] = None,
    max_validation_retries: int = 0,
) -> ParsingResult:
    """
    Run the ER Diagram Parsing Agent on a single diagram.

    Two nested retry loops:
      - `max_llm_retries` (passed through to the LLM client): handles
        transport/API failures (timeouts, rate limits, etc.).
      - `max_validation_retries`: if the LLM *did* respond but the
        response fails JSON parsing or IR schema/semantic validation,
        we send it back with the concrete validation errors and ask
        for a corrected JSON object, up to this many extra rounds.
    """
    result = ParsingResult(
        success=False, schema_id=schema_id, tier=tier, image_path=image_path
    )

    user_prompt = prompts.build_user_prompt(
        schema_name=schema_id, tier=tier, source_image=image_path
    )

    last_ir: Optional[dict] = None
    last_validation: Optional[IRValidationResult] = None

    for validation_round in range(max_validation_retries + 1):
        call_result = client.complete_with_image(
            system_prompt=prompts.SYSTEM_PROMPT,
            user_prompt=user_prompt,
            image_path=image_path,
            max_retries=max_llm_retries,
        )
        result.llm_attempts_used += call_result.attempts_used
        result.input_tokens += call_result.input_tokens or 0
        result.output_tokens += call_result.output_tokens or 0
        result.total_tokens += call_result.total_tokens or 0
        result.latency_seconds += call_result.latency_seconds or 0.0
        result.estimated_cost_usd += call_result.estimated_cost_usd or 0.0
        if getattr(call_result, "finish_reason", None):
            result.finish_reasons.append(call_result.finish_reason)
        result.retry_events.extend(getattr(call_result, "retry_events", ()))
        result.retry_delays_seconds.extend(
            getattr(call_result, "retry_delays_seconds", ())
        )
        result.validation_attempts_used = validation_round + 1
        result.api_latency_seconds += getattr(call_result, "api_latency_seconds", 0.0)
        result.backoff_seconds += getattr(call_result, "backoff_seconds", 0.0)
        if call_result.text is not None:
            result.raw_responses.append(call_result.text)

        if getattr(call_result, "finish_reason", None) in {"length", "max_tokens", "content_filter"}:
            result.failure_terminal = True
            result.error_message = "Incomplete provider response; partial JSON is not a successful extraction."
            return result

        if not call_result.success or call_result.text is None:
            result.failure_terminal = getattr(call_result, "failure_terminal", False)
            result.error_message = (
                f"LLM call failed on validation round {validation_round + 1}: "
                f"{call_result.error_message}"
            )
            logger.error("[%s] %s", schema_id, result.error_message)
            return result

        parsed_ir, parse_error = _try_parse_json(call_result.text)
        if parsed_ir is None:
            last_validation = IRValidationResult(
                is_valid=False, schema_errors=[parse_error or "unknown JSON parse error"]
            )
            logger.warning(
                "[%s] validation round %d: %s",
                schema_id,
                validation_round + 1,
                parse_error,
            )
            user_prompt = prompts.build_retry_prompt(
                errors=[parse_error or "unknown JSON parse error"],
                previous_response=call_result.text,
            )
            continue

        parsed_ir = _apply_runtime_ir_defaults(
            parsed_ir,
            schema_name=schema_id,
            tier=tier,
            source_image=image_path,
        )
        validation = validate_ir(parsed_ir)
        last_ir = parsed_ir
        last_validation = validation

        if validation.is_valid:
            result.success = True
            result.ir = parsed_ir
            result.validation = validation
            return result

        logger.warning(
            "[%s] validation round %d failed with %d error(s)",
            schema_id,
            validation_round + 1,
            len(validation.all_errors),
        )
        user_prompt = prompts.build_retry_prompt(
            errors=validation.all_errors, previous_response=call_result.text
        )

    # Exhausted validation retries without producing a valid IR.
    result.success = False
    result.failure_terminal = True
    result.ir = last_ir
    result.validation = last_validation
    result.error_message = (
        f"IR failed schema/semantic validation after "
        f"{max_validation_retries + 1} attempt(s)."
    )
    return result
