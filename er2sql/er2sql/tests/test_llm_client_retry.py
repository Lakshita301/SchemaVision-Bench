"""Offline tests for provider-aware retry and cost guards."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from er2sql.config import LLMProviderConfig
from er2sql.llm_client import LLMClient, _classify_exception


class FakeHTTPError(Exception):
    def __init__(self, status_code: int, retry_after: str | None = None):
        super().__init__(f"HTTP {status_code}")
        self.status_code = status_code
        self.response = SimpleNamespace(
            status_code=status_code,
            headers={"retry-after": retry_after} if retry_after else {},
        )


class SequenceCompletions:
    def __init__(self, outcomes):
        self.outcomes = iter(outcomes)
        self.calls = []

    def create(self, **kwargs):
        self.calls.append(kwargs)
        outcome = next(self.outcomes)
        if isinstance(outcome, Exception):
            raise outcome
        return outcome


def _response(text: str = "ok"):
    return SimpleNamespace(
        choices=[SimpleNamespace(message=SimpleNamespace(content=text))],
        usage=SimpleNamespace(prompt_tokens=10, completion_tokens=5, total_tokens=15),
    )


def _client(outcomes, **overrides) -> LLMClient:
    config = LLMProviderConfig(
        model="test-model-v1",
        api_key_env="UNUSED",
        retry_initial_delay_seconds=1.0,
        retry_max_delay_seconds=10.0,
        retry_backoff_multiplier=2.0,
        retry_jitter_seconds=0.0,
        **overrides,
    )
    client = object.__new__(LLMClient)
    client.config = config
    client._client = SimpleNamespace(
        chat=SimpleNamespace(completions=SequenceCompletions(outcomes))
    )
    return client


class RetryTests(unittest.TestCase):
    def test_sdk_retries_disabled(self):
        with patch('er2sql.llm_client.OpenAI') as sdk, patch.object(LLMProviderConfig, 'resolve_api_key', return_value='not-a-key'):
            LLMClient(LLMProviderConfig(model='fixture', api_key_env='UNUSED'))
        self.assertEqual(sdk.call_args.kwargs['max_retries'], 0)

    def test_audit_captures_rate_limit_and_response(self):
        import tempfile
        import json
        client = _client([FakeHTTPError(429, '1'), _response()])
        with tempfile.TemporaryDirectory() as d:
            client.audit_path = Path(d)/'attempts.jsonl'
            client.audit_context = {'schema_id':'s','tier':'tier1'}
            with patch('er2sql.llm_client.time.sleep'):
                result = client._run_completion([], 3)
            events = [json.loads(s) for s in client.audit_path.read_text().splitlines()]
        self.assertTrue(result.success)
        self.assertEqual([e['event'] for e in events], ['attempt_started','attempt_failed','backoff','attempt_started','attempt_finished'])
        self.assertEqual(events[1]['failure_kind'], 'http_429')
        self.assertEqual(events[-1]['output_tokens'], 5)

    def test_completed_response_replayed_without_provider_call(self):
        import tempfile
        client = _client([_response()])
        with tempfile.TemporaryDirectory() as d:
            client.audit_path = Path(d)/'attempts.jsonl'
            client.audit_context = {'schema_id':'s','role':'module3'}
            first = client._run_completion([], 3)
            second = client._run_completion([], 3)
        self.assertEqual(first.call_id, second.call_id)
        self.assertEqual(len(client._client.chat.completions.calls), 1)

    def test_retryable_status_uses_retry_after_then_succeeds(self) -> None:
        client = _client([FakeHTTPError(429, retry_after="3"), _response()])
        with patch("er2sql.llm_client.time.sleep") as sleep:
            result = client._run_completion([], 3)

        self.assertTrue(result.success)
        self.assertEqual(result.attempts_used, 2)
        self.assertEqual(result.retry_delays_seconds, (3.0,))
        sleep.assert_called_once_with(3.0)

    def test_permanent_error_is_not_retried(self) -> None:
        client = _client([FakeHTTPError(401)])
        with patch("er2sql.llm_client.time.sleep") as sleep:
            result = client._run_completion([], 3)

        self.assertFalse(result.success)
        self.assertEqual(result.attempts_used, 1)
        self.assertEqual(result.failure_kind, "http_401")
        self.assertFalse(result.retryable)
        sleep.assert_not_called()

    def test_retry_cost_guard_stops_before_extra_call(self) -> None:
        client = _client(
            [FakeHTTPError(503)],
            max_retry_cost_usd=0.005,
            estimated_cost_per_attempt_usd=0.01,
        )
        with patch("er2sql.llm_client.time.sleep") as sleep:
            result = client._run_completion([], 3)

        self.assertFalse(result.success)
        self.assertEqual(result.attempts_used, 1)
        self.assertEqual(result.failure_kind, "retry_cost_limit")
        sleep.assert_not_called()

    def test_status_classification(self) -> None:
        self.assertEqual(_classify_exception(FakeHTTPError(500)), (True, "http_500"))
        self.assertEqual(_classify_exception(FakeHTTPError(400)), (False, "http_400"))

    def test_provider_specific_token_and_image_shapes(self) -> None:
        client = _client(
            [_response()],
            max_completion_tokens=100,
            token_limit_parameter="max_tokens",
            image_url_format="string",
        )
        with patch(
            "er2sql.llm_client.encode_image_data_url", return_value="data:image/png;base64,AA=="
        ):
            result = client.complete_with_image("system", "user", "unused.png")

        self.assertTrue(result.success)
        call = client._client.chat.completions.calls[0]
        self.assertEqual(call["max_tokens"], 100)
        self.assertNotIn("max_completion_tokens", call)
        self.assertEqual(
            call["messages"][1]["content"][1]["image_url"],
            "data:image/png;base64,AA==",
        )


if __name__ == "__main__":
    unittest.main()
