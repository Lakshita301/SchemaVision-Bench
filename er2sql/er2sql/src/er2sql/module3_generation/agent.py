"""
Module 3: SQL Generation Agent.

    canonical JSON IR  --[text LLM]-->  SQL DDL

CRITICAL ARCHITECTURAL CONSTRAINT (see ER-SCHEMA2SQL_RESEARCH_PLAN
___LOCKED_DIRECTION): this module receives ONLY the canonical JSON
IR produced by Module 2. It NEVER receives the original ER diagram
image. This is enforced structurally, not just by convention:

    * `generate_sql_from_ir` below has no image_path parameter, and
      never touches disk to read an image.
    * It calls `LLMClient.complete_text_only`, whose method signature
      has no image parameter at all (see llm_client.py) -- so even a
      future maintainer editing this file could not accidentally
      smuggle an image into this call without also editing the client
      contract, which is documented as reserved for Module 2.

If a future change ever needs the Generator to see the image, that is
a different research design and must not be made by quietly editing
this function.
"""

from __future__ import annotations

import logging
from dataclasses import dataclass, field
from typing import Optional

from ..llm_client import LLMClient
from ..utils.io_utils import strip_code_fences
from . import prompts

logger = logging.getLogger("er2sql.module3_generation")


@dataclass
class GenerationResult:
    success: bool
    schema_id: str
    tier: str
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
        }


def generate_sql_from_ir(
    ir: dict,
    schema_id: str,
    tier: str,
    client: LLMClient,
    dialect: str = "postgres",
    max_retries: Optional[int] = None,
) -> GenerationResult:
    """
    Generate SQL DDL from a canonical JSON IR dict.

    Note the signature: (ir, schema_id, tier, client, dialect,
    max_retries). There is intentionally no `image_path` argument.
    """
    system_prompt = prompts.build_system_prompt(dialect)
    user_prompt = prompts.build_user_prompt(ir, dialect)

    call_result = client.complete_text_only(
        system_prompt=system_prompt,
        user_prompt=user_prompt,
        max_retries=max_retries,
    )

    incomplete = getattr(call_result, "finish_reason", None) in {"length", "max_tokens", "content_filter"}
    if not call_result.success or call_result.text is None or incomplete:
        logger.error(
            "[%s] SQL generation failed: %s", schema_id, call_result.error_message
        )
        return GenerationResult(
            success=False,
            schema_id=schema_id,
            tier=tier,
            raw_response=call_result.text,
            failure_terminal=incomplete or getattr(call_result, "failure_terminal", False),
            api_latency_seconds=getattr(call_result, "api_latency_seconds", 0.0),
            backoff_seconds=getattr(call_result, "backoff_seconds", 0.0),
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

    sql_ddl = strip_code_fences(call_result.text)

    return GenerationResult(
        success=True,
        api_latency_seconds=getattr(call_result, "api_latency_seconds", 0.0),
        backoff_seconds=getattr(call_result, "backoff_seconds", 0.0),
        schema_id=schema_id,
        tier=tier,
        sql_ddl=sql_ddl,
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
