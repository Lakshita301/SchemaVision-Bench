"""
LLM client abstraction.

Wraps the OpenAI Python SDK's chat.completions endpoint, which is
supported not just by OpenAI itself but by an OpenAI-compatible
surface exposed by many other providers (Gemini's OpenAI-compatible
endpoint, OpenRouter, vLLM/local servers, etc.) via a configurable
`api_base`. This mirrors the pattern already used in the base paper's
run.py (OpenAI client + configurable api_base + api_key), so swapping
models later only means editing config.yaml, not this file.

Two methods are exposed on purpose, with different signatures:

    complete_with_image(...)   -- used ONLY by Module 2 (parsing).
                                   Sends the diagram image + a prompt.

    complete_text_only(...)    -- used ONLY by Module 3 (generation)
                                   and any future text-only module.
                                   Has no image parameter at all --
                                   it is structurally impossible to
                                   pass an image through this method,
                                   which is what enforces the "Module
                                   3 never sees the image" constraint
                                   at the client level as well as at
                                   the module level.

Both methods share the same retry loop, logging, and error handling.
"""

from __future__ import annotations

import logging
import random
import time
import json
import hashlib
import uuid
from pathlib import Path
from dataclasses import dataclass, asdict
from datetime import datetime, timezone
from email.utils import parsedate_to_datetime
from typing import Optional

from openai import APIConnectionError, APIStatusError, APITimeoutError, OpenAI, RateLimitError

from .config import LLMProviderConfig
from .utils.image_utils import encode_image_data_url

logger = logging.getLogger("er2sql.llm_client")


@dataclass
class LLMCallResult:
    success: bool
    text: Optional[str]
    attempts_used: int
    error_message: Optional[str] = None
    input_tokens: Optional[int] = None
    output_tokens: Optional[int] = None
    total_tokens: Optional[int] = None
    latency_seconds: Optional[float] = None
    estimated_cost_usd: Optional[float] = None
    failure_kind: Optional[str] = None
    retryable: Optional[bool] = None
    retry_delays_seconds: tuple[float, ...] = ()
    retry_events: tuple[str, ...] = ()
    finish_reason: Optional[str] = None
    failure_terminal: bool = False
    api_latency_seconds: float = 0.0
    backoff_seconds: float = 0.0
    call_id: Optional[str] = None


def _retry_after_seconds(exc: Exception) -> Optional[float]:
    response = getattr(exc, "response", None)
    headers = getattr(response, "headers", None) or getattr(exc, "headers", None) or {}
    value = headers.get("retry-after") or headers.get("Retry-After")
    if value is None:
        return None
    try:
        return max(0.0, float(value))
    except (TypeError, ValueError):
        try:
            parsed = parsedate_to_datetime(str(value))
            if parsed.tzinfo is None:
                parsed = parsed.replace(tzinfo=timezone.utc)
            return max(0.0, (parsed - datetime.now(timezone.utc)).total_seconds())
        except (TypeError, ValueError, OverflowError):
            return None


def _classify_exception(exc: Exception) -> tuple[bool, str]:
    """Classify provider failures without relying on message-string matching."""
    if isinstance(exc, RateLimitError):
        return True, "rate_limit"
    if isinstance(exc, APITimeoutError):
        return True, "timeout"
    if isinstance(exc, APIConnectionError):
        return True, "connection"
    status_code = getattr(exc, "status_code", None)
    if status_code is None:
        response = getattr(exc, "response", None)
        status_code = getattr(response, "status_code", None)
    if isinstance(status_code, int):
        if status_code in {408, 409, 425, 429} or status_code >= 500:
            return True, f"http_{status_code}"
        return False, f"http_{status_code}"
    if isinstance(exc, APIStatusError):
        return False, "api_status"
    return False, exc.__class__.__name__.casefold()


class LLMClient:
    """Thin wrapper around one configured OpenAI-compatible endpoint."""

    def __init__(self, provider_config: LLMProviderConfig):
        self.config = provider_config
        self._client = OpenAI(
            api_key=provider_config.resolve_api_key(),
            base_url=provider_config.api_base or None,
            timeout=provider_config.request_timeout,
            max_retries=0,  # Only our visible, budgeted retry loop may retry.
        )
        self.audit_path = None
        self.audit_context = {}

    def _audit(self, event: dict) -> None:
        if getattr(self, "audit_path", None) is None:
            return
        path = Path(self.audit_path)
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("a", encoding="utf-8") as handle:
            handle.write(json.dumps({**self.audit_context, "at": datetime.now(timezone.utc).isoformat(),
                                     "model": self.config.model, **event}) + "\n")
            handle.flush()

    def complete_with_image(
        self,
        system_prompt: str,
        user_prompt: str,
        image_path: str,
        max_retries: Optional[int] = None,
    ) -> LLMCallResult:
        """
        Vision-capable completion: system prompt + user prompt + one
        image. Intended for Module 2 (ER Diagram Parsing Agent) only.
        """
        retries = max_retries if max_retries is not None else self.config.max_retries
        image_data_url = encode_image_data_url(image_path)

        messages = [
            {"role": "system", "content": system_prompt},
            {
                "role": "user",
                "content": [
                    {"type": "text", "text": user_prompt},
                    {
                        "type": "image_url",
                        "image_url": (
                            {"url": image_data_url}
                            if self.config.image_url_format == "openai"
                            else image_data_url
                        ),
                    },
                ],
            },
        ]
        return self._run_completion(messages, retries)

    def complete_text_only(
        self,
        system_prompt: str,
        user_prompt: str,
        max_retries: Optional[int] = None,
    ) -> LLMCallResult:
        """
        Text-only completion: system prompt + user prompt, no image.
        Intended for Module 3 (SQL Generation Agent) and any future
        text-only module. There is
        deliberately no image parameter on this method.
        """
        retries = max_retries if max_retries is not None else self.config.max_retries
        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt},
        ]
        return self._run_completion(messages, retries)

    def _run_completion(self, messages: list[dict], max_retries: int) -> LLMCallResult:
        request_sha256 = hashlib.sha256(json.dumps({"messages": messages, "model": self.config.model,
            "config": asdict(self.config),
            "context": getattr(self, "audit_context", {})}, sort_keys=True).encode()).hexdigest()
        # Recover a response durably received before a process interruption.
        # A fresh replication must use a new experiment output directory.
        if getattr(self, "audit_path", None) and Path(self.audit_path).exists():
            for line in reversed(Path(self.audit_path).read_text(encoding='utf-8').splitlines()):
                try:
                    event = json.loads(line)
                except ValueError:
                    continue
                if event.get('request_sha256') == request_sha256 and event.get('event') == 'attempt_finished':
                    incomplete = not event.get('success')
                    return LLMCallResult(success=not incomplete, text=event.get('text'),
                        attempts_used=event['attempt'], input_tokens=event.get('input_tokens'),
                        output_tokens=event.get('output_tokens'), estimated_cost_usd=event.get('estimated_cost_usd'),
                        total_tokens=event.get('total_tokens'), latency_seconds=event.get('latency_seconds'),
                        retry_events=tuple(event.get('retry_events', [])),
                        retry_delays_seconds=tuple(event.get('retry_delays_seconds', [])),
                        backoff_seconds=sum(event.get('retry_delays_seconds', [])),
                        finish_reason=event.get('finish_reason'), failure_terminal=incomplete,
                        failure_kind='incomplete_output' if incomplete else None,
                        error_message='Incomplete provider response' if incomplete else None,
                        api_latency_seconds=event.get('api_latency_seconds', 0), call_id=event.get('call_id'))
        max_retries = max(1, int(max_retries))
        last_error: Optional[str] = None
        last_failure_kind: Optional[str] = None
        last_retryable: Optional[bool] = None
        retry_delays: list[float] = []
        retry_events: list[str] = []
        overall_started = time.perf_counter()
        call_id = uuid.uuid4().hex
        api_elapsed = 0.0
        for attempt in range(1, max_retries + 1):
            attempt_started = time.perf_counter()
            self._audit({"event": "attempt_started", "request_sha256": request_sha256, "call_id": call_id, "attempt": attempt})
            try:
                request_kwargs = dict(
                    model=self.config.model,
                    messages=messages,
                    temperature=self.config.temperature,
                )
                if self.config.max_completion_tokens is not None:
                    request_kwargs[self.config.token_limit_parameter] = (
                        self.config.max_completion_tokens
                    )
                if self.config.reasoning_effort is not None:
                    request_kwargs["reasoning_effort"] = self.config.reasoning_effort
                if self.config.response_format_json:
                    request_kwargs["response_format"] = {"type": "json_object"}
                response = self._client.chat.completions.create(**request_kwargs)
                request_elapsed = time.perf_counter() - attempt_started
                api_elapsed += request_elapsed
                content = response.choices[0].message.content
                finish_reason = getattr(response.choices[0], "finish_reason", None)
                if content is None:
                    raise ValueError("Model returned an empty message content.")
                text = content.strip()
                elapsed = time.perf_counter() - overall_started
                usage = getattr(response, "usage", None)
                input_tokens = getattr(usage, "prompt_tokens", None)
                output_tokens = getattr(usage, "completion_tokens", None)
                total_tokens = getattr(usage, "total_tokens", None)
                estimated_cost_usd = None
                if (
                    input_tokens is not None
                    and output_tokens is not None
                    and self.config.input_cost_per_million is not None
                    and self.config.output_cost_per_million is not None
                ):
                    estimated_cost_usd = (
                        (input_tokens / 1_000_000) * self.config.input_cost_per_million
                        + (output_tokens / 1_000_000) * self.config.output_cost_per_million
                    )
                logger.info(
                    "LLM call succeeded on attempt %d/%d (model=%s)",
                    attempt,
                    max_retries,
                    self.config.model,
                )
                incomplete = finish_reason in {"length", "max_tokens", "content_filter"} or not text
                self._audit({"event": "attempt_finished", "call_id": call_id, "attempt": attempt,
                             "request_sha256": request_sha256,
                             "response_model": getattr(response, "model", None),
                             "response_id": getattr(response, "id", None), "text": text,
                             "finish_reason": finish_reason, "input_tokens": input_tokens,
                             "output_tokens": output_tokens, "estimated_cost_usd": estimated_cost_usd,
                             "total_tokens": total_tokens, "latency_seconds": elapsed,
                             "retry_events": retry_events, "retry_delays_seconds": retry_delays,
                             "billed_cost_usd": None, "api_latency_seconds": request_elapsed,
                             "success": not incomplete})
                return LLMCallResult(
                    success=not incomplete,
                    error_message="Incomplete provider response" if incomplete else None,
                    failure_kind="incomplete_output" if incomplete else None,
                    failure_terminal=incomplete,
                    api_latency_seconds=api_elapsed,
                    backoff_seconds=sum(retry_delays),
                    call_id=call_id,
                    text=text,
                    attempts_used=attempt,
                    input_tokens=input_tokens,
                    output_tokens=output_tokens,
                    total_tokens=total_tokens,
                    latency_seconds=elapsed,
                    estimated_cost_usd=estimated_cost_usd,
                    retry_delays_seconds=tuple(retry_delays),
                    retry_events=tuple(retry_events),
                    finish_reason=finish_reason,
                )
            except Exception as exc:  # noqa: BLE001 - provider SDKs expose multiple error subclasses
                request_elapsed = time.perf_counter() - attempt_started
                api_elapsed += request_elapsed
                last_error = str(exc)
                last_retryable, last_failure_kind = _classify_exception(exc)
                retry_events.append(last_failure_kind)
                self._audit({"event": "attempt_failed", "call_id": call_id, "attempt": attempt,
                             "failure_kind": last_failure_kind, "retryable": last_retryable,
                             "api_latency_seconds": request_elapsed, "usage_known": False,
                             "billed_cost_usd": None})
                logger.warning(
                    "LLM call failed on attempt %d/%d (model=%s, kind=%s, retryable=%s): %s",
                    attempt,
                    max_retries,
                    self.config.model,
                    last_failure_kind,
                    last_retryable,
                    last_error,
                )
                if not last_retryable or attempt >= max_retries:
                    break

                retry_number = attempt
                if (
                    self.config.max_retry_cost_usd is not None
                    and self.config.estimated_cost_per_attempt_usd is not None
                    and retry_number * self.config.estimated_cost_per_attempt_usd
                    > self.config.max_retry_cost_usd
                ):
                    last_failure_kind = "retry_cost_limit"
                    last_retryable = False
                    last_error = (
                        f"Retry stopped before attempt {attempt + 1}: estimated retry cost "
                        f"would exceed ${self.config.max_retry_cost_usd:.6f}."
                    )
                    logger.error("%s", last_error)
                    break

                exponential = min(
                    self.config.retry_max_delay_seconds,
                    self.config.retry_initial_delay_seconds
                    * (self.config.retry_backoff_multiplier ** (attempt - 1)),
                )
                jitter = (
                    random.uniform(0.0, self.config.retry_jitter_seconds)
                    if self.config.retry_jitter_seconds
                    else 0.0
                )
                retry_after = _retry_after_seconds(exc)
                delay = max(exponential + jitter, retry_after or 0.0)
                retry_delays.append(delay)
                self._audit({"event": "backoff", "call_id": call_id, "attempt": attempt, "seconds": delay})
                logger.info(
                    "Retrying model=%s in %.3f second(s) after %s.",
                    self.config.model,
                    delay,
                    last_failure_kind,
                )
                time.sleep(delay)

        logger.error(
            "LLM call stopped after %d attempt(s) for model=%s",
            attempt,
            self.config.model,
        )
        return LLMCallResult(
            success=False,
            text=None,
            attempts_used=attempt,
            error_message=last_error,
            latency_seconds=time.perf_counter() - overall_started,
            failure_kind=last_failure_kind,
            retryable=last_retryable,
            retry_delays_seconds=tuple(retry_delays),
            retry_events=tuple(retry_events),
            failure_terminal=False,  # Provider/auth/transport failures are not model-quality outcomes.
            api_latency_seconds=api_elapsed,
            backoff_seconds=sum(retry_delays),
            call_id=call_id,
        )


def build_llm_client(provider_config: LLMProviderConfig) -> LLMClient:
    return LLMClient(provider_config)
