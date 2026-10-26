"""Module 6 direct baseline: ER image --[one vision LLM call]--> SQL DDL.

Unlike Modules 2 and 3, this experimental control arm deliberately sends the
diagram image directly to a vision-capable LLM. It has no IR input and does not
call the structured parser or SQL generator, preserving the one-call baseline
specified in the research plan.
"""

from __future__ import annotations

import logging
from dataclasses import dataclass
from typing import Optional

from ..llm_client import LLMClient
from ..utils.io_utils import strip_code_fences
from . import prompts

logger = logging.getLogger("er2sql.module6_direct_baseline")


@dataclass
class DirectBaselineResult:
    success: bool
    schema_id: str
    tier: str
    image_path: str
    sql_ddl: Optional[str] = None
    raw_response: Optional[str] = None
    llm_attempts_used: int = 0
    error_message: Optional[str] = None
    dialect: str = "postgres"
    input_tokens: Optional[int] = None
    output_tokens: Optional[int] = None
    total_tokens: Optional[int] = None
    latency_seconds: Optional[float] = None
    estimated_cost_usd: Optional[float] = None
    finish_reason: Optional[str] = None
    retry_events: tuple[str, ...] = ()
    retry_delays_seconds: tuple[float, ...] = ()
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
            "sql_ddl": self.sql_ddl,
            "raw_response": self.raw_response,
            "llm_attempts_used": self.llm_attempts_used,
            "error_message": self.error_message,
            "dialect": self.dialect,
            "input_tokens": self.input_tokens,
            "output_tokens": self.output_tokens,
            "total_tokens": self.total_tokens,
            "latency_seconds": self.latency_seconds,
            "estimated_cost_usd": self.estimated_cost_usd,
            "finish_reason": self.finish_reason,
            "retry_events": list(self.retry_events),
            "retry_delays_seconds": list(self.retry_delays_seconds),
            "architecture": "direct_image_to_sql_one_call",
        }


def generate_sql_directly_from_image(
    image_path: str,
    schema_id: str,
    tier: str,
    client: LLMClient,
    dialect: str = "postgres",
    max_retries: Optional[int] = None,
) -> DirectBaselineResult:
    """Generate DDL with one direct image-to-text completion operation."""
    call_result = client.complete_with_image(
        system_prompt=prompts.build_system_prompt(dialect),
        user_prompt=prompts.build_user_prompt(schema_id, tier, dialect),
        image_path=image_path,
        max_retries=max_retries,
    )
    incomplete = getattr(call_result, "finish_reason", None) in {"length", "max_tokens", "content_filter"}
    if not call_result.success or call_result.text is None or incomplete:
        logger.error("[%s] direct baseline failed: %s", schema_id, call_result.error_message)
        return DirectBaselineResult(
            success=False,
            raw_response=call_result.text,
            failure_terminal=incomplete or getattr(call_result, "failure_terminal", False),
            api_latency_seconds=getattr(call_result, "api_latency_seconds", 0.0),
            backoff_seconds=getattr(call_result, "backoff_seconds", 0.0),
            schema_id=schema_id,
            tier=tier,
            image_path=image_path,
            llm_attempts_used=call_result.attempts_used,
            error_message=call_result.error_message,
            dialect=dialect,
            input_tokens=call_result.input_tokens,
            output_tokens=call_result.output_tokens,
            total_tokens=call_result.total_tokens,
            latency_seconds=call_result.latency_seconds,
            estimated_cost_usd=call_result.estimated_cost_usd,
            finish_reason=getattr(call_result, "finish_reason", None),
            retry_events=getattr(call_result, "retry_events", ()),
            retry_delays_seconds=getattr(call_result, "retry_delays_seconds", ()),
        )
    return DirectBaselineResult(
        success=True,
        api_latency_seconds=getattr(call_result, "api_latency_seconds", 0.0),
        backoff_seconds=getattr(call_result, "backoff_seconds", 0.0),
        schema_id=schema_id,
        tier=tier,
        image_path=image_path,
        sql_ddl=strip_code_fences(call_result.text),
        raw_response=call_result.text,
        llm_attempts_used=call_result.attempts_used,
        dialect=dialect,
        input_tokens=call_result.input_tokens,
        output_tokens=call_result.output_tokens,
        total_tokens=call_result.total_tokens,
        latency_seconds=call_result.latency_seconds,
        estimated_cost_usd=call_result.estimated_cost_usd,
        finish_reason=getattr(call_result, "finish_reason", None),
        retry_events=getattr(call_result, "retry_events", ()),
        retry_delays_seconds=getattr(call_result, "retry_delays_seconds", ()),
    )
