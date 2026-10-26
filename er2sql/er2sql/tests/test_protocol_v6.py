import hashlib
from pathlib import Path
from unittest.mock import patch

from er2sql.module5_verification.executor import _is_infrastructure_sqlstate, verify_schema_with_infra_retry
from er2sql.module5_verification.models import DDLExecutionResult, VerificationResult
from er2sql.module7_evaluation.protocol import validate_protocol
from er2sql.module7_evaluation.evaluator import _looks_like_sql
from er2sql.utils.sql_normalization import normalize_sql_for_ablation


ROOT = Path(__file__).resolve().parents[1]


def test_v6_protocol_is_pinned_and_supported():
    protocol = ROOT / "config" / "paper_protocol_v6.yaml"
    manifest = ROOT / "config" / "experiment.paper-final-v6.yaml"
    import yaml

    spec = yaml.safe_load(manifest.read_text(encoding="utf-8"))["experiment"]
    assert hashlib.sha256(protocol.read_bytes()).hexdigest() == spec["protocol_sha256"]
    assert validate_protocol(protocol, spec["protocol_sha256"])["protocol_version"] == 6


def test_infrastructure_sqlstate_policy_is_narrow_and_explicit():
    assert all(_is_infrastructure_sqlstate(state) for state in ("57014", "57P01", "08006", "53200"))
    assert not any(_is_infrastructure_sqlstate(state) for state in ("42601", "23505", "42P01"))


def test_normalized_ablation_preserves_literals_and_statement_order():
    source = "create table a (v text default 'create table'); create table b (id int);"
    normalized = normalize_sql_for_ablation(source)
    assert "'create table'" in normalized
    assert normalized.index("CREATE TABLE a") < normalized.index("CREATE TABLE b")


def test_not_sql_class_ignores_sql_words_in_prose_and_comments():
    assert not _looks_like_sql("Here is the phrase CREATE TABLE, but no query.")
    assert not _looks_like_sql("-- CREATE TABLE example (id int)")
    assert _looks_like_sql("-- generated DDL\nCREATE TABLE example (id int);")


def test_wrapper_runs_raw_and_normalized_as_separate_verification_passes():
    result = VerificationResult(
        schema_id="s1", tier="tier1", ddl_execution=DDLExecutionResult(success=True),
    )
    normalized_result = VerificationResult(
        schema_id="s1", tier="tier1", ddl_execution=DDLExecutionResult(success=True),
        constraint_tests_total=2, constraint_tests_passed=1,
        constraint_enforcement_rate=0.5,
    )
    with patch("er2sql.module5_verification.executor._verify_schema_with_infra_retry",
               side_effect=[result, normalized_result]) as verify:
        actual = verify_schema_with_infra_retry(
            conn=object(), sql_ddl="create table a (id int);",
            test_suite=object(), tier="tier1", schema_id="s1", schema_prefix="test",
        )
    assert verify.call_count == 2
    assert verify.call_args_list[0].kwargs["sql_ddl"] == "create table a (id int);"
    assert verify.call_args_list[1].kwargs["sql_ddl"].startswith("CREATE TABLE a")
    assert actual.normalized_sql_ablation["ddl_execution_success"] is True
    assert actual.normalized_sql_ablation["constraint_enforcement_rate"] == 0.5
