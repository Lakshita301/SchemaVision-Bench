"""Manifest-driven orchestration for reproducible ER2SQL experiments.

The orchestrator is deliberately thin: Modules 2--6 remain responsible for
generation and verification, while this module fixes the experiment matrix,
output layout, resume behavior, provenance, and post-run Module 7 reports.
"""

from __future__ import annotations

import hashlib
import json
import re
import csv
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Optional

import yaml

from .. import __version__
from ..config import ConfigError, PipelineConfig, load_config
from ..dataset import discover_tier_dataset
from ..module6_direct_baseline.runner import run_direct_baseline_tier
from ..pipeline.runner import compute_common_ids_across_tiers, run_tier
from ..utils.io_utils import ensure_dir, read_json, write_json, write_text
from .evaluator import (
    EvaluationReport,
    compare_reports,
    detect_truncation_exclusions,
    evaluate_results_dir,
    write_evaluation_artifacts,
    write_model_comparison_artifacts,
)

MANIFEST_VERSION = 1
ARMS = ("direct", "structured")
_SAFE_COMPONENT = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]*$")


class ExperimentManifestError(ValueError):
    """Raised when an experiment manifest is incomplete or inconsistent."""


@dataclass(frozen=True)
class ModelRunSpec:
    name: str
    config_path: str
    arms: tuple[str, ...]
    prompt_version: Optional[str] = None
    expected_cost_usd: Optional[float] = None
    cost_tolerance_fraction: float = 0.25
    minimum_success_rate: float = 0.90
    max_rate_limit_events: int = 5


@dataclass(frozen=True)
class ExperimentSpec:
    name: str
    output_root: str
    models: tuple[ModelRunSpec, ...]
    tiers: Optional[tuple[str, ...]] = None
    common_only: bool = True
    limit: Optional[int] = None
    schema_ids: Optional[tuple[str, ...]] = None
    resume: bool = True
    verify: bool = True
    evaluate: bool = True
    stop_on_error: bool = True
    require_complete_model_metadata: bool = False
    prompts_frozen: bool = False
    phase: str = "development"
    split_file: Optional[str] = None
    oracle_audit: Optional[str] = None
    pilot_validation: Optional[str] = None
    evaluator_validation: Optional[str] = None
    protocol_file: Optional[str] = None
    protocol_sha256: Optional[str] = None
    contamination_split_file: Optional[str] = None
    contamination_audit: Optional[str] = None
    contamination_audit_sha256: Optional[str] = None
    reference_status_manifest: Optional[str] = None
    reference_status_manifest_sha256: Optional[str] = None
    local_audit_only: bool = False


@dataclass
class PreparedModel:
    spec: ModelRunSpec
    config_path: Path
    config: PipelineConfig
    tiers: list[str]
    selected_ids: dict[str, set[str]]


def _now() -> str:
    return datetime.now(timezone.utc).isoformat()


def _safe_component(value: Any, field_name: str) -> str:
    text = str(value or "").strip()
    if not _SAFE_COMPONENT.fullmatch(text) or text in {".", ".."}:
        raise ExperimentManifestError(
            f"{field_name} must contain only letters, numbers, '.', '_' or '-' "
            "and must not be a path."
        )
    return text


def _resolve_input_path(value: str, manifest_path: Path) -> Path:
    candidate = Path(value)
    if candidate.is_absolute():
        return candidate
    # Evidence paths commonly do not exist until the first audit/pilot ends.
    # Their meaning must not change merely because the file was created.
    if candidate.parts and candidate.parts[0] in {'config', 'docs', 'data', 'outputs', 'src', 'tests'}:
        project = next((p for p in manifest_path.resolve().parents if (p/'pyproject.toml').is_file()), Path.cwd())
        return (project / candidate).resolve()
    return (manifest_path.resolve().parent / candidate).resolve()


def _resolve_output_path(value: str) -> Path:
    candidate = Path(value)
    return candidate if candidate.is_absolute() else (Path.cwd() / candidate).resolve()


def load_experiment_manifest(path: str | Path) -> ExperimentSpec:
    """Load and validate a version-1 YAML experiment manifest."""
    manifest_path = Path(path)
    if not manifest_path.exists():
        raise ExperimentManifestError(f"Experiment manifest not found: {manifest_path}")
    with manifest_path.open("r", encoding="utf-8") as handle:
        raw = yaml.safe_load(handle) or {}

    version = raw.get("version")
    if version != MANIFEST_VERSION:
        raise ExperimentManifestError(
            f"Unsupported experiment manifest version {version!r}; expected {MANIFEST_VERSION}."
        )
    experiment = raw.get("experiment")
    if not isinstance(experiment, dict):
        raise ExperimentManifestError("Manifest requires an 'experiment' mapping.")

    name = _safe_component(experiment.get("name"), "experiment.name")
    output_root = str(experiment.get("output_root") or f"outputs/experiments/{name}")
    limit = experiment.get("limit")
    if limit is not None:
        limit = int(limit)
        if limit <= 0:
            raise ExperimentManifestError("experiment.limit must be a positive integer or null.")
    schema_ids_raw = experiment.get("schema_ids")
    phase = experiment.get("phase", "development")
    if phase not in {"development", "pilot", "final", "structural"}:
        raise ExperimentManifestError("phase must be development, pilot, final or structural")
    split_file = experiment.get("split_file")
    if split_file:
        split_path = _resolve_input_path(split_file, manifest_path)
        split = read_json(split_path)
        groups = {key: set(split[key]) for key in ("development", "pilot", "final")}
        if any(groups[a] & groups[b] for a, b in (("development", "pilot"), ("development", "final"), ("pilot", "final"))):
            raise ExperimentManifestError("Dataset splits overlap")
        if phase in groups:
            selected = sorted(groups[phase])
            if schema_ids_raw is not None and set(schema_ids_raw) != set(selected):
                raise ExperimentManifestError("schema_ids disagree with frozen split")
            schema_ids_raw = selected
        elif phase == "structural":
            status_file = experiment.get("reference_status_manifest")
            status_hash = experiment.get("reference_status_manifest_sha256")
            if not status_file or not status_hash:
                raise ExperimentManifestError(
                    "Structural runs require a hashed reference_status_manifest."
                )
            status_path = _resolve_input_path(status_file, manifest_path)
            if not status_path.is_file():
                raise ExperimentManifestError(f"Reference-status manifest not found: {status_path}")
            if hashlib.sha256(status_path.read_bytes()).hexdigest() != status_hash:
                raise ExperimentManifestError("Reference-status manifest hash does not match the frozen manifest.")
            with status_path.open("r", encoding="utf-8-sig", newline="") as handle:
                status_rows = list(csv.DictReader(handle))
            final_ids = groups["final"]
            selected = sorted(
                str(row.get("schema_id", "")).strip()
                for row in status_rows
                if row.get("reference_status") == "structural_only"
                and str(row.get("schema_id", "")).strip() in final_ids
            )
            if not selected or len(selected) != len(set(selected)):
                raise ExperimentManifestError("Structural status manifest produced no IDs or duplicate IDs.")
            if schema_ids_raw is not None and set(schema_ids_raw) != set(selected):
                raise ExperimentManifestError("schema_ids disagree with the frozen structural-only final set")
            schema_ids_raw = selected
    if phase in {"pilot", "final"} and (not split_file or not experiment.get("oracle_audit")):
        raise ExperimentManifestError("Pilot/final evaluation requires split_file and oracle_audit")
    if phase == "final" and (not split_file or not experiment.get("oracle_audit") or not experiment.get("pilot_validation")):
        raise ExperimentManifestError("Final evaluation requires split_file, oracle_audit and pilot_validation")
    schema_ids = None
    if schema_ids_raw is not None:
        if not isinstance(schema_ids_raw, list) or not schema_ids_raw:
            raise ExperimentManifestError("experiment.schema_ids must be a non-empty list.")
        schema_ids = tuple(str(value).strip() for value in schema_ids_raw)
        if any(not value for value in schema_ids) or len(set(schema_ids)) != len(schema_ids):
            raise ExperimentManifestError(
                "experiment.schema_ids must contain unique, non-empty schema IDs."
            )
        if limit is not None:
            raise ExperimentManifestError(
                "Use either experiment.schema_ids or experiment.limit, not both."
            )

    tiers_raw = experiment.get("tiers")
    tiers = None
    if tiers_raw is not None:
        if not isinstance(tiers_raw, list) or not tiers_raw:
            raise ExperimentManifestError("experiment.tiers must be a non-empty list or omitted.")
        tiers = tuple(str(tier) for tier in tiers_raw)

    models_raw = raw.get("models")
    if not isinstance(models_raw, list) or not models_raw:
        raise ExperimentManifestError("Manifest requires a non-empty 'models' list.")
    models: list[ModelRunSpec] = []
    seen_names: set[str] = set()
    for index, item in enumerate(models_raw):
        if not isinstance(item, dict):
            raise ExperimentManifestError(f"models[{index}] must be a mapping.")
        model_name = _safe_component(item.get("name"), f"models[{index}].name")
        if model_name in seen_names:
            raise ExperimentManifestError(f"Duplicate model name in manifest: {model_name}")
        seen_names.add(model_name)
        config_path = str(item.get("config") or "").strip()
        if not config_path:
            raise ExperimentManifestError(f"models[{index}].config is required.")
        arms_raw = item.get("arms", ["structured", "direct"])
        if not isinstance(arms_raw, list) or not arms_raw:
            raise ExperimentManifestError(f"models[{index}].arms must be a non-empty list.")
        arms = tuple(str(arm) for arm in arms_raw)
        unknown = sorted(set(arms) - set(ARMS))
        if unknown:
            raise ExperimentManifestError(
                f"models[{index}].arms contains unknown arm(s) {unknown}; choose from {ARMS}."
            )
        if len(set(arms)) != len(arms):
            raise ExperimentManifestError(f"models[{index}].arms contains duplicates.")
        models.append(
            ModelRunSpec(
                name=model_name,
                config_path=config_path,
                arms=arms,
                prompt_version=(
                    str(item["prompt_version"]).strip()
                    if item.get("prompt_version") is not None
                    else None
                ),
                expected_cost_usd=(
                    float(item["expected_cost_usd"])
                    if item.get("expected_cost_usd") is not None
                    else None
                ),
                cost_tolerance_fraction=float(item.get("cost_tolerance_fraction", 0.25)),
                minimum_success_rate=float(item.get("minimum_success_rate", 0.90)),
                max_rate_limit_events=int(item.get("max_rate_limit_events", 5)),
            )
        )
        if not models[-1].prompt_version:
            raise ExperimentManifestError(
                f"models[{index}].prompt_version is required so prompt/config freezes are auditable."
            )
        if models[-1].expected_cost_usd is not None and models[-1].expected_cost_usd < 0:
            raise ExperimentManifestError(
                f"models[{index}].expected_cost_usd must be non-negative."
            )
        if models[-1].cost_tolerance_fraction < 0:
            raise ExperimentManifestError(
                f"models[{index}].cost_tolerance_fraction must be non-negative."
            )
        if not 0 <= models[-1].minimum_success_rate <= 1:
            raise ExperimentManifestError(
                f"models[{index}].minimum_success_rate must be between 0 and 1."
            )
        if models[-1].max_rate_limit_events < 0:
            raise ExperimentManifestError(
                f"models[{index}].max_rate_limit_events must be non-negative."
            )

    return ExperimentSpec(
        protocol_file=str(_resolve_input_path(experiment['protocol_file'], manifest_path)) if experiment.get('protocol_file') else None,
        protocol_sha256=experiment.get('protocol_sha256'),
        contamination_split_file=(str(_resolve_input_path(experiment['contamination_split_file'], manifest_path))
                                  if experiment.get('contamination_split_file') else None),
        contamination_audit=(str(_resolve_input_path(experiment['contamination_audit'], manifest_path))
                             if experiment.get('contamination_audit') else None),
        contamination_audit_sha256=experiment.get('contamination_audit_sha256'),
        reference_status_manifest=(str(_resolve_input_path(experiment['reference_status_manifest'], manifest_path))
                                   if experiment.get('reference_status_manifest') else None),
        reference_status_manifest_sha256=experiment.get('reference_status_manifest_sha256'),
        local_audit_only=bool(experiment.get('local_audit_only', False)),
        evaluator_validation=str(_resolve_input_path(experiment['evaluator_validation'], manifest_path)) if experiment.get('evaluator_validation') else None,
        pilot_validation=str(_resolve_input_path(experiment['pilot_validation'], manifest_path)) if experiment.get('pilot_validation') else None,
        phase=phase,
        split_file=str(_resolve_input_path(split_file, manifest_path)) if split_file else None,
        oracle_audit=str(_resolve_input_path(experiment['oracle_audit'], manifest_path)) if experiment.get('oracle_audit') else None,
        name=name,
        output_root=output_root,
        models=tuple(models),
        tiers=tiers,
        common_only=bool(experiment.get("common_only", True)),
        limit=limit,
        schema_ids=schema_ids,
        resume=bool(experiment.get("resume", True)),
        verify=bool(experiment.get("verify", True)),
        evaluate=bool(experiment.get("evaluate", True)),
        stop_on_error=bool(experiment.get("stop_on_error", True)),
        require_complete_model_metadata=bool(
            experiment.get("require_complete_model_metadata", False)
        ),
        prompts_frozen=bool(experiment.get("prompts_frozen", False)),
    )


def _validate_provider_metadata(
    config: PipelineConfig,
    role: str,
    *,
    vision_required: bool,
) -> None:
    raw = ((config.raw_yaml.get("llm") or {}).get(role) or {})
    provider = getattr(config, role)
    if provider is None:
        raise ExperimentManifestError(f"Final config is missing llm.{role}.")
    required_explicit = {
        "provider",
        "model",
        "model_revision",
        "api_base",
        "vision_capable",
        "image_url_format",
        "temperature",
        "max_completion_tokens",
        "token_limit_parameter",
        "input_cost_per_million",
        "output_cost_per_million",
        "max_retries",
        "response_format_json",
        "retry_initial_delay_seconds",
        "retry_max_delay_seconds",
        "retry_backoff_multiplier",
        "retry_jitter_seconds",
        "max_retry_cost_usd",
        "estimated_cost_per_attempt_usd",
    }
    missing = sorted(key for key in required_explicit if key not in raw)
    if missing:
        raise ExperimentManifestError(
            f"Final config llm.{role} must explicitly define {missing}."
        )
    if not provider.provider or not provider.model_revision or not provider.api_base:
        raise ExperimentManifestError(
            f"Final config llm.{role} requires non-empty provider, model_revision, and api_base."
        )
    if vision_required and provider.vision_capable is not True:
        raise ExperimentManifestError(
            f"Final config llm.{role} must declare vision_capable: true."
        )
    if provider.input_cost_per_million is None or provider.output_cost_per_million is None:
        raise ExperimentManifestError(f"Final config llm.{role} requires explicit pricing.")
    if provider.max_completion_tokens is None:
        raise ExperimentManifestError(
            f"Final config llm.{role} requires an explicit max_completion_tokens limit."
        )
    if (
        provider.max_retry_cost_usd is None
        or provider.estimated_cost_per_attempt_usd is None
    ):
        raise ExperimentManifestError(
            f"Final config llm.{role} requires explicit retry-cost protection."
        )


def _validate_config_for_arms(
    config: PipelineConfig,
    model: ModelRunSpec,
    verify: bool,
    require_complete_model_metadata: bool,
    require_cost_estimate: bool = True,
) -> None:
    if "direct" in model.arms and config.module6_direct_baseline is None:
        raise ExperimentManifestError(
            f"Model '{model.name}' requests the direct arm, but {model.config_path} "
            "does not define llm.module6_direct_baseline."
        )
    if verify and config.database is None:
        raise ExperimentManifestError(
            f"Experiment verification is enabled, but {model.config_path} has no database section."
        )
    if require_complete_model_metadata:
        if require_cost_estimate and model.expected_cost_usd is None:
            raise ExperimentManifestError(
                f"Final model '{model.name}' requires expected_cost_usd for pilot budget validation."
            )
        if "structured" in model.arms:
            _validate_provider_metadata(config, "module2_parsing", vision_required=True)
            _validate_provider_metadata(config, "module3_generation", vision_required=False)
        if "direct" in model.arms:
            _validate_provider_metadata(
                config, "module6_direct_baseline", vision_required=True
            )


def _select_schema_ids(
    config: PipelineConfig,
    tiers: list[str],
    *,
    common_only: bool,
    limit: Optional[int],
    explicit_ids: Optional[tuple[str, ...]],
) -> dict[str, set[str]]:
    if common_only:
        common_ids = sorted(compute_common_ids_across_tiers(config, tiers=tiers))
        if explicit_ids is not None:
            missing = sorted(set(explicit_ids) - set(common_ids))
            if missing:
                raise ExperimentManifestError(
                    f"Explicit held-out schema IDs are not available in every tier: {missing}"
                )
            common_ids = list(explicit_ids)
        if limit is not None:
            common_ids = common_ids[:limit]
        selected = set(common_ids)
        return {tier: set(selected) for tier in tiers}

    selected_by_tier: dict[str, set[str]] = {}
    for tier in tiers:
        tier_config = config.tiers[tier]
        report = discover_tier_dataset(
            tier_config.diagrams_dir, tier_config.sql_dir, tier
        )
        ids = [record.schema_id for record in report.records]
        if explicit_ids is not None:
            missing = sorted(set(explicit_ids) - set(ids))
            if missing:
                raise ExperimentManifestError(
                    f"Tier '{tier}' is missing explicit schema IDs: {missing}"
                )
            ids = list(explicit_ids)
        if limit is not None:
            ids = ids[:limit]
        selected_by_tier[tier] = set(ids)
    return selected_by_tier


def prepare_experiment(
    manifest_path: str | Path,
    *, load_environment: bool = True,
) -> tuple[ExperimentSpec, Path, list[PreparedModel]]:
    """Resolve configs and freeze the exact schema selection without calling providers."""
    path = Path(manifest_path).resolve()
    spec = load_experiment_manifest(path)
    protocol_rules = None
    if spec.phase in {'pilot', 'final', 'structural'}:
        from .protocol import validate_protocol
        try:
            protocol_rules = validate_protocol(spec.protocol_file, spec.protocol_sha256)
        except (ValueError, OSError) as exc:
            raise ExperimentManifestError(str(exc)) from exc
    if spec.phase in {'pilot', 'final', 'structural'} and not spec.local_audit_only:
        if protocol_rules.get('protocol_version') not in {5, 6}:
            raise ExperimentManifestError(
                'Paid pilot/final runs now require prospective protocol v5 or v6 and a completed contamination audit; '
                'v1-v4 manifests remain available only for historical/local-audit use.'
            )
        if (not spec.contamination_split_file or not spec.contamination_audit
                or not spec.contamination_audit_sha256):
            raise ExperimentManifestError(
                'Protocol v5 paid runs require contamination_split_file, contamination_audit and contamination_audit_sha256.'
            )
        audit_path = Path(spec.contamination_audit)
        if not audit_path.is_file():
            raise ExperimentManifestError(f'Contamination audit report not found: {audit_path}')
        actual_audit_hash = hashlib.sha256(audit_path.read_bytes()).hexdigest()
        if actual_audit_hash != spec.contamination_audit_sha256:
            raise ExperimentManifestError('Contamination audit report hash does not match the frozen manifest.')
        try:
            contamination_report = read_json(audit_path)
        except (OSError, ValueError) as exc:
            raise ExperimentManifestError(f'Could not read contamination audit report: {exc}') from exc
        contamination_split_path = Path(spec.contamination_split_file)
        if not contamination_split_path.is_file():
            raise ExperimentManifestError(
                f'Contamination source split not found: {contamination_split_path}'
            )
        contamination_split = read_json(contamination_split_path)
        split_hash = hashlib.sha256(contamination_split_path.read_bytes()).hexdigest()
        registry_rel = (protocol_rules.get('contamination') or {}).get('risk_registry')
        registry_path = _resolve_input_path(str(registry_rel), path) if registry_rel else None
        expected_registry_hash = (
            hashlib.sha256(registry_path.read_bytes()).hexdigest()
            if registry_path and registry_path.is_file() else None
        )
        metadata_coverage = contamination_report.get('metadata_coverage') or {}
        source_coverage = contamination_report.get('source_sql_coverage') or {}
        if (contamination_report.get('audit_policy') != 'er2sql_contamination_risk_v1'
                or contamination_report.get('audit_status') != 'complete'
                or not contamination_report.get('ready_for_paid_run')
                or contamination_report.get('split_sha256') != split_hash
                or contamination_report.get('registry_sha256') != expected_registry_hash
                or contamination_report.get('schema_count') != sum(
                    len(contamination_split[group]) for group in ('development', 'pilot', 'final')
                )
                or not set(spec.schema_ids or ()).issubset(
                    set(contamination_split.get('final' if spec.phase == 'structural' else spec.phase, ()))
                )
                or metadata_coverage.get('missing_schema_ids')
                or metadata_coverage.get('incomplete_reviews')
                or source_coverage.get('hashed') != contamination_report.get('schema_count')
                or contamination_report.get('blockers')):
            raise ExperimentManifestError(
                'Contamination audit is incomplete/not ready or is for a different frozen split.'
            )
    if spec.phase in {'pilot', 'final'} and not (
        spec.require_complete_model_metadata and spec.prompts_frozen and spec.verify
        and spec.evaluate and spec.common_only
    ):
        raise ExperimentManifestError('Paper pilot/final requires frozen prompts, complete model metadata, common IDs, verification and evaluation')
    if spec.phase == 'structural':
        if not (spec.require_complete_model_metadata and spec.prompts_frozen and not spec.verify
                and spec.evaluate and spec.common_only and spec.split_file
                and spec.reference_status_manifest and spec.reference_status_manifest_sha256):
            raise ExperimentManifestError(
                'Structural track requires frozen metadata/prompts, common IDs, evaluation, no DB verification, '
                'the held-out split, and a hashed reference-status manifest.'
            )
        status_path = Path(spec.reference_status_manifest)
        if (not status_path.is_file()
                or hashlib.sha256(status_path.read_bytes()).hexdigest() != spec.reference_status_manifest_sha256):
            raise ExperimentManifestError('Structural reference-status manifest is missing or stale.')
        with status_path.open('r', encoding='utf-8-sig', newline='') as handle:
            status_rows = list(csv.DictReader(handle))
        status_map = {str(r.get('schema_id', '')).strip(): r.get('reference_status') for r in status_rows}
        if any(status_map.get(schema_id) != 'structural_only' for schema_id in (spec.schema_ids or ())):
            raise ExperimentManifestError('Structural run contains an ID not marked structural_only.')
    if spec.require_complete_model_metadata and not spec.prompts_frozen:
        raise ExperimentManifestError(
            "Final paid runs require experiment.prompts_frozen: true."
        )
    prepared: list[PreparedModel] = []
    seen_config_paths: set[Path] = set()
    for model in spec.models:
        config_path = _resolve_input_path(model.config_path, path)
        if config_path in seen_config_paths:
            raise ExperimentManifestError(
                f"Each model must use its own config file; duplicate path: {config_path}"
            )
        seen_config_paths.add(config_path)
        try:
            config = load_config(config_path, load_environment=load_environment)
        except ConfigError as exc:
            raise ExperimentManifestError(str(exc)) from exc
        _validate_config_for_arms(
            config,
            model,
            spec.verify,
            spec.require_complete_model_metadata,
            require_cost_estimate=spec.phase not in {'final', 'structural'},
        )
        if protocol_rules and protocol_rules.get('protocol_version') in {3, 4, 5, 6}:
            expected_cap = int(protocol_rules['models']['common_output_token_cap'])
            stages = [config.module2_parsing, config.module3_generation]
            if 'direct' in model.arms:
                stages.append(config.module6_direct_baseline)
            for stage_config in stages:
                if stage_config is None or stage_config.max_completion_tokens != expected_cap:
                    raise ExperimentManifestError(
                        f"Protocol v3 requires the identical {expected_cap}-token output cap in every selected model stage; "
                        f"'{model.name}' has {getattr(stage_config, 'max_completion_tokens', None)}."
                    )
        if protocol_rules and protocol_rules.get('protocol_version') == 6 and spec.phase in {'pilot', 'final'}:
            expected_timeout = int(protocol_rules['sql_handling']['statement_timeout_ms'])
            actual_timeout = config.database.statement_timeout_ms if config.database else None
            if actual_timeout != expected_timeout:
                raise ExperimentManifestError(
                    f"Protocol v6 requires the same {expected_timeout} ms PostgreSQL statement timeout; "
                    f"'{model.name}' config has {actual_timeout}."
                )
        if spec.phase in {'pilot', 'final', 'structural'} and config.module2_parsing.validation_retries != 0:
            raise ExperimentManifestError('Paper protocol excludes model-output repair: validation_retries must be 0')
        tiers = list(spec.tiers) if spec.tiers is not None else list(config.tiers)
        if not tiers:
            raise ExperimentManifestError(f"Model '{model.name}' config defines no dataset tiers.")
        unknown_tiers = [tier for tier in tiers if tier not in config.tiers]
        if unknown_tiers:
            raise ExperimentManifestError(
                f"Model '{model.name}' config does not define tier(s): {unknown_tiers}."
            )
        selected_ids = _select_schema_ids(
            config,
            tiers,
            common_only=spec.common_only,
            limit=spec.limit,
            explicit_ids=spec.schema_ids,
        )
        prepared.append(
            PreparedModel(
                spec=model,
                config_path=config_path,
                config=config,
                tiers=tiers,
                selected_ids=selected_ids,
            )
        )
    if prepared and any(p.selected_ids != prepared[0].selected_ids for p in prepared[1:]):
        raise ExperimentManifestError("All models must evaluate identical schema/tier IDs")
    return spec, _resolve_output_path(spec.output_root), prepared


def _arm_output_dir(output_root: Path, model_name: str, arm: str) -> Path:
    return output_root / "results" / model_name / arm


def _arm_results_dir(output_root: Path, model_name: str, arm: str) -> Path:
    base = _arm_output_dir(output_root, model_name, arm)
    return base / "module6_direct_baseline" if arm == "direct" else base


def _prompt_sources() -> dict[str, Path]:
    package_root = Path(__file__).resolve().parents[1]
    return {
        "module2": package_root / "module2_parsing" / "prompts.py",
        "module3": package_root / "module3_generation" / "prompts.py",
        "module6": package_root / "module6_direct_baseline" / "prompts.py",
    }


def _prompt_hashes() -> dict[str, str]:
    return {
        name: hashlib.sha256(path.read_bytes()).hexdigest()
        for name, path in _prompt_sources().items()
        if path.exists()
    }


def _snapshot_prompts(output_root: Path) -> None:
    prompt_dir = ensure_dir(output_root / "provenance" / "prompts")
    for name, path in _prompt_sources().items():
        if path.exists():
            write_text(prompt_dir / f"{name}_prompts.py", path.read_text(encoding="utf-8"))


def _redact_secrets(value: Any) -> Any:
    if isinstance(value, dict):
        redacted = {}
        for key, child in value.items():
            lowered = str(key).casefold()
            sensitive = lowered in {
                "password",
                "secret",
                "api_key",
                "token",
                "access_token",
                "refresh_token",
            }
            is_env_reference = lowered.endswith("_env")
            redacted[key] = "<redacted>" if sensitive and not is_env_reference else _redact_secrets(child)
        return redacted
    if isinstance(value, list):
        return [_redact_secrets(item) for item in value]
    return value


def build_experiment_plan(
    spec: ExperimentSpec,
    output_root: Path,
    prepared: list[PreparedModel],
) -> dict:
    """Build a serializable dry-run plan and provenance snapshot."""
    models = []
    total_schema_tasks = 0
    nominal_min_calls = 0
    nominal_max_calls = 0
    for item in prepared:
        arm_rows = []
        selected_ids = {
            tier: sorted(ids) for tier, ids in item.selected_ids.items()
        }
        schema_instances = sum(len(ids) for ids in item.selected_ids.values())
        for arm in item.spec.arms:
            minimum_per_schema = 1
            maximum_per_schema = 1 if arm == "direct" else 2
            arm_rows.append(
                {
                    "arm": arm,
                    "output_dir": str(_arm_output_dir(output_root, item.spec.name, arm)),
                    "results_dir": str(_arm_results_dir(output_root, item.spec.name, arm)),
                    "schema_tier_tasks": schema_instances,
                    "nominal_llm_calls_min": schema_instances * minimum_per_schema,
                    "nominal_llm_calls_max": schema_instances * maximum_per_schema,
                }
            )
            total_schema_tasks += schema_instances
            nominal_min_calls += schema_instances * minimum_per_schema
            nominal_max_calls += schema_instances * maximum_per_schema
        models.append(
            {
                "name": item.spec.name,
                "input_sha256": {
                    tier: {r.schema_id: {
                        "image": hashlib.sha256(Path(r.image_path).read_bytes()).hexdigest(),
                        "sql": hashlib.sha256(Path(r.sql_path).read_bytes()).hexdigest(),
                    } for r in discover_tier_dataset(item.config.tiers[tier].diagrams_dir,
                                                     item.config.tiers[tier].sql_dir, tier).records
                       if r.schema_id in ids}
                    for tier, ids in item.selected_ids.items()
                },
                "config_path": str(item.config_path),
                "prompt_version": item.spec.prompt_version,
                "tiers": item.tiers,
                "selected_schema_ids": selected_ids,
                "selected_schema_counts": {
                    tier: len(ids) for tier, ids in item.selected_ids.items()
                },
                "arms": arm_rows,
                "resolved_config": _redact_secrets(item.config.raw_yaml),
            }
        )
    plan = {
        'protocol_sha256': spec.protocol_sha256,
        'contamination_split_sha256': (
            hashlib.sha256(Path(spec.contamination_split_file).read_bytes()).hexdigest()
            if spec.contamination_split_file else None
        ),
        'contamination_audit_sha256': (
            hashlib.sha256(Path(spec.contamination_audit).read_bytes()).hexdigest()
            if spec.contamination_audit else None
        ),
        "execution_policy": "fixed_attempts_no_repair_with_truncation_exclusions",
        "source_sha256": {str(p.relative_to(Path(__file__).parents[1])): hashlib.sha256(p.read_bytes()).hexdigest()
                          for p in sorted(Path(__file__).parents[1].rglob('*.py'))},
                "split_sha256": hashlib.sha256(Path(spec.split_file).read_bytes()).hexdigest() if spec.split_file else None,
        "manifest_version": MANIFEST_VERSION,
        "er2sql_version": __version__,
        "experiment": {
            **asdict(spec),
            "models": [asdict(model) for model in spec.models],
            "output_root": str(output_root),
        },
        "prompt_sha256": _prompt_hashes(),
        "models": models,
        "totals": {
            "schema_tier_arm_tasks": total_schema_tasks,
            "nominal_llm_calls_min": nominal_min_calls,
            "nominal_llm_calls_max": nominal_max_calls,
            "note": (
                "Structured minimum assumes every Module 2 response fails before Module 3; maximum assumes every parse reaches Module 3. Counts exclude transport retries."
            ),
        },
    }
    reference_sql_inputs = sorted({
        (tier, sid, hashes['sql'])
        for model in models
        for tier, schema_hashes in model['input_sha256'].items()
        for sid, hashes in schema_hashes.items()
    })
    reference_fingerprint = {
        'protocol_sha256': plan['protocol_sha256'],
        'split_sha256': plan['split_sha256'],
        'schema_sql_inputs': reference_sql_inputs,
    }
    plan['reference_plan_sha256'] = hashlib.sha256(json.dumps(
        reference_fingerprint, sort_keys=True, separators=(',', ':'), ensure_ascii=False
    ).encode('utf-8')).hexdigest()
    fingerprint_payload = json.dumps(
        plan, sort_keys=True, separators=(",", ":"), ensure_ascii=False
    ).encode("utf-8")
    plan["plan_sha256"] = hashlib.sha256(fingerprint_payload).hexdigest()
    return plan


def _validate_credentials(item: PreparedModel, verify: bool) -> None:
    providers = []
    if "structured" in item.spec.arms:
        providers.extend([item.config.module2_parsing, item.config.module3_generation])
    if "direct" in item.spec.arms and item.config.module6_direct_baseline is not None:
        providers.append(item.config.module6_direct_baseline)
    for provider in providers:
        provider.resolve_api_key()
    if verify and item.config.database is not None:
        item.config.database.resolve_password()


def _write_status(output_root: Path, status: dict) -> None:
    write_json(output_root / "run_status.json", status)


def _write_pilot_validation(
    spec: ExperimentSpec,
    output_root: Path,
    prepared: list[PreparedModel],
    reports_by_arm: dict[str, dict[str, EvaluationReport]],
    status: dict,
) -> dict[str, str]:
    expected = {
        item.spec.name: sum(len(ids) for ids in item.selected_ids.values())
        for item in prepared
    }
    model_specs = {model.name: model for model in spec.models}
    compile_qualifies = {
        model_name: max(
            [(reports.get(model_name).overall.get("compile_rate") or 0.0)
             for reports in reports_by_arm.values() if model_name in reports],
            default=0.0,
        ) >= 0.20
        for model_name in expected
    }
    best_compile_rate = {
        model_name: max(
            ((reports.get(model_name).overall.get("compile_rate") or 0.0)
             for reports in reports_by_arm.values() if model_name in reports),
            default=0.0,
        )
        for model_name in expected
    }
    observed_model_costs = {}
    for model_name in expected:
        costs = [
            (report.overall.get('lifetime_usage') or {}).get('estimated_cost_usd_known', report.overall.get("total_estimated_cost_usd"))
            for model_reports in reports_by_arm.values()
            for name, report in model_reports.items()
            if name == model_name
        ]
        observed_model_costs[model_name] = (
            sum(float(cost) for cost in costs if isinstance(cost, (int, float)))
            if any(isinstance(cost, (int, float)) for cost in costs)
            else None
        )
    rows = []
    for arm, model_reports in sorted(reports_by_arm.items()):
        for model_name, report in sorted(model_reports.items()):
            overall = report.overall
            lifetime = overall.get('lifetime_usage') or {}
            schema_rows = report.schema_metrics
            parsing_ok = (
                True
                if arm == "direct"
                else bool(overall.get("parsing_success", 0) > 0)
            )
            usage_complete = bool(schema_rows) and all(
                row.get("input_tokens") is not None
                and row.get("output_tokens") is not None
                for row in schema_rows
            )
            expected_count = expected[model_name]
            model_spec = model_specs[model_name]
            observed_model_cost = observed_model_costs[model_name]
            cost_within_estimate = None
            if (
                model_spec.expected_cost_usd is not None
                and observed_model_cost is not None
            ):
                allowed = model_spec.expected_cost_usd * (
                    1.0 + model_spec.cost_tolerance_fraction
                )
                cost_within_estimate = observed_model_cost <= allowed
            row = {
                "model": model_name,
                "arm": arm,
                "expected_schema_tier_instances": expected_count,
                "observed_schema_tier_instances": overall.get("schema_count", 0),
                "artifact_count_complete": overall.get("assigned_artifact_count", overall.get("schema_count", 0)) == expected_count,
                "compile_rate": overall.get("compile_rate"),
                "best_arm_compile_rate": best_compile_rate[model_name],
                "model_inclusion_threshold": 0.20,
                "model_inclusion_threshold_passed": compile_qualifies[model_name],
                "vision_and_generation_work": bool(
                    parsing_ok
                    and (overall.get("generation_success_rate") or 0.0)
                    >= model_spec.minimum_success_rate
                ),
                "json_ir_output_works": (
                    (overall.get("parsing_success_rate") or 0.0)
                    >= model_spec.minimum_success_rate
                    if arm == "structured"
                    else None
                ),
                "output_truncated_count": overall.get("output_truncated_count", 0),
                "no_detected_truncation": overall.get("output_truncated_count", 0) == 0,
                "provider_usage_capture_complete": usage_complete,
                "rate_limit_event_count": lifetime.get('rate_limit_events', overall.get("rate_limit_event_count", 0)),
                "rate_limits_manageable": (
                    lifetime.get('rate_limit_events', overall.get("rate_limit_event_count", 0))
                    <= model_spec.max_rate_limit_events
                ),
                "retry_event_count": overall.get("retry_event_count", 0),
                "estimated_cost_usd": overall.get("total_estimated_cost_usd"),
                "expected_model_cost_usd": model_spec.expected_cost_usd,
                "observed_model_cost_usd": observed_model_cost,
                "cost_within_estimate": cost_within_estimate,
                "resume_observed": any(task.get('model') == model_name and task.get('arm') == arm
                                       and int((task.get('summary') or {}).get('skipped_already_done') or 0) > 0
                                       for task in status.get('tasks', [])),
                "unresolved_api_attempts": lifetime.get('unresolved_attempts', 0),
                "usage_unknown_attempts": lifetime.get('usage_unknown_attempts', 0),
                "lifetime_estimated_cost_usd_known": lifetime.get('estimated_cost_usd_known'),
            }
            # Model quality and observational operational fields are outcomes
            # or diagnostics, not readiness gates. Keep generation, JSON-IR,
            # truncation, resume, and API-attempt fields above visible; the
            # preregistered compile threshold determines model inclusion.
            row["automated_gate_passed"] = all(
                row[key]
                for key in (
                    "artifact_count_complete",
                    "model_inclusion_threshold_passed",
                    "provider_usage_capture_complete",
                    "rate_limits_manageable",
                )
            )
            if row["cost_within_estimate"] is False:
                row["automated_gate_passed"] = False
            rows.append(row)

    payload = {
        "source_sha256": build_experiment_plan(spec, output_root, prepared)['source_sha256'],
        "split_sha256": hashlib.sha256(Path(spec.split_file).read_bytes()).hexdigest() if spec.split_file else None,
        "contamination_split_sha256": (
            hashlib.sha256(Path(spec.contamination_split_file).read_bytes()).hexdigest()
            if spec.contamination_split_file else None
        ),
        "contamination_audit_sha256": (
            hashlib.sha256(Path(spec.contamination_audit).read_bytes()).hexdigest()
            if spec.contamination_audit else None
        ),
        "configuration_sha256": {item.spec.name: hashlib.sha256(json.dumps(_redact_secrets(item.config.raw_yaml), sort_keys=True).encode()).hexdigest() for item in prepared},
        "experiment": spec.name,
        "prompt_version_by_model": {
            model.name: model.prompt_version for model in spec.models
        },
        "prompt_sha256": _prompt_hashes(),
        "resume_validation_note": (
            "Resume is confirmed only after rerunning the same frozen manifest with --resume "
            "and observing skipped_already_done > 0."
        ),
        "readiness_policy_amendment": (
            "Model-output quality fields (generation, valid JSON IR, and truncation) are "
            "diagnostic outcomes, not readiness gates; model inclusion uses the preregistered "
            "best-arm compile-rate threshold. Resume observations and unresolved API attempts "
            "are reported, not launch gates. See docs/audits/pilot_readiness_amendment_20261012.md."
        ),
        "all_automated_gates_passed": bool(rows)
        and all(row["automated_gate_passed"] for row in rows),
        "rows": rows,
    }
    report_root = ensure_dir(output_root / "reports")
    json_path = report_root / "pilot_validation.json"
    markdown_path = report_root / "pilot_validation.md"
    write_json(json_path, payload)
    lines = [
        "# Pilot validation",
        "",
        "| Model | Arm | Artifacts complete | Compile rate | ≥20% in any arm | Vision/generation (result) | JSON IR (result) | Truncations (result) | Usage captured | Rate limits manageable | Rate-limit events | Retries | Arm cost USD | Cost within estimate | Resume observed | Operational gate |",
        "|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|",
    ]
    for row in rows:
        lines.append(
            f"| {row['model']} | {row['arm']} | {row['artifact_count_complete']} | {row['compile_rate']} | "
            f"{row['model_inclusion_threshold_passed']} | {row['vision_and_generation_work']} | {row['json_ir_output_works']} | "
            f"{row['no_detected_truncation']} | {row['provider_usage_capture_complete']} | "
            f"{row['rate_limits_manageable']} | {row['rate_limit_event_count']} | "
            f"{row['retry_event_count']} | "
            f"{row['estimated_cost_usd']} | {row['cost_within_estimate']} | "
            f"{row['resume_observed']} | "
            f"{row['automated_gate_passed']} |"
        )
    lines.extend(["", payload["resume_validation_note"], ""])
    write_text(markdown_path, "\n".join(lines))
    return {"json": str(json_path), "markdown": str(markdown_path)}


def _evaluate_experiment(
    spec: ExperimentSpec,
    output_root: Path,
    prepared: list[PreparedModel],
    status: dict,
) -> None:
    reports_by_arm: dict[str, dict[str, EvaluationReport]] = {}
    contamination_low_risk_ids: set[str] | None = None
    contamination_audit_hash = None
    if spec.contamination_audit:
        contamination_report = read_json(spec.contamination_audit)
        contamination_low_risk_ids = set(
            contamination_report.get("low_risk_sensitivity_schema_ids", [])
        )
        contamination_audit_hash = hashlib.sha256(
            Path(spec.contamination_audit).read_bytes()
        ).hexdigest()
    for item in prepared:
        model_reports: dict[str, EvaluationReport] = {}
        model_result_dirs = [
            _arm_results_dir(output_root, item.spec.name, arm)
            for arm in item.spec.arms
        ]
        truncation_exclusions = detect_truncation_exclusions(model_result_dirs)
        write_json(output_root / "reports" / item.spec.name / "evaluation_exclusions.json", {
            "policy": "exclude_paired_cell_only_when_output_limit_finish_and_stage_output_is_unusable",
            "confirmation_rule": (
                "Module 2 parse/validation failure, or SQL missing / rejected for syntax at end-of-input; "
                "a length/max_tokens finish by itself is not sufficient"
            ),
            "reason": "confirmed unusable output after provider output limit; no chunking or regeneration",
            "excluded_paired_schema_tier_cells": truncation_exclusions,
        })
        common_ids = (
            set.intersection(*(set(ids) for ids in item.selected_ids.values()))
            if spec.common_only and item.selected_ids
            else None
        )
        for arm in item.spec.arms:
            evaluator_arm = "direct" if arm == "direct" else "structured"
            report = evaluate_results_dir(
                _arm_results_dir(output_root, item.spec.name, arm),
                arm=evaluator_arm,
                model_name=item.spec.name,
                tiers=item.tiers,
                restrict_to_ids=common_ids,
                excluded_schema_tiers=truncation_exclusions,
            )
            model_reports[arm] = report
            reports_by_arm.setdefault(arm, {})[item.spec.name] = report

        for arm, report in model_reports.items():
            comparison = None
            if arm != "direct" and "direct" in model_reports:
                comparison = compare_reports(report, model_reports["direct"])
            report_dir = output_root / "reports" / item.spec.name / arm
            write_evaluation_artifacts(
                report,
                report_dir,
                comparison=comparison,
                manifest={
                    "experiment": spec.name,
                    "model": item.spec.name,
                    "arm": arm,
                    "config_path": str(item.config_path),
                    "prompt_version": item.spec.prompt_version,
                    "prompt_sha256": _prompt_hashes(),
                    "tiers": item.tiers,
                    "common_only": spec.common_only,
                    "evaluation_track": "structural_only" if spec.phase == "structural" else "executable_verified",
                    "interpret_compile_and_CER_metrics": spec.phase != "structural",
                },
            )

        if contamination_low_risk_ids is not None:
            sensitivity_reports: dict[str, EvaluationReport] = {}
            selected_eligible_ids = set().union(*item.selected_ids.values())
            sensitivity_ids = contamination_low_risk_ids & selected_eligible_ids
            for arm in item.spec.arms:
                evaluator_arm = "direct" if arm == "direct" else "structured"
                sensitivity = evaluate_results_dir(
                    _arm_results_dir(output_root, item.spec.name, arm),
                    arm=evaluator_arm,
                    model_name=item.spec.name,
                    tiers=item.tiers,
                    restrict_to_ids=sensitivity_ids,
                    excluded_schema_tiers=truncation_exclusions,
                )
                sensitivity_reports[arm] = sensitivity
            for arm, sensitivity in sensitivity_reports.items():
                comparison = (
                    compare_reports(sensitivity, sensitivity_reports["direct"])
                    if arm != "direct" and "direct" in sensitivity_reports
                    else None
                )
                write_evaluation_artifacts(
                    sensitivity,
                    output_root / "reports" / item.spec.name / arm / "low_risk_sensitivity",
                    comparison=comparison,
                    manifest={
                        "experiment": spec.name,
                        "model": item.spec.name,
                        "arm": arm,
                        "contamination_sensitivity": "reviewed low-risk-only subset",
                        "contamination_audit_sha256": contamination_audit_hash,
                        "schema_ids": sorted(sensitivity_ids),
                    },
                )

    comparison_outputs = {}
    for arm, reports in reports_by_arm.items():
        if len(reports) > 1:
            comparison_outputs[arm] = write_model_comparison_artifacts(
                reports, output_root / "reports" / "model_comparisons" / arm
            )
    pilot_validation = (
        _write_pilot_validation(spec, output_root, prepared, reports_by_arm, status)
        if spec.phase == 'pilot' else None
    )
    status["evaluation"] = {
        "completed_at": _now(),
        "model_comparisons": comparison_outputs,
        "pilot_validation": pilot_validation,
        "track": "structural_only" if spec.phase == "structural" else "executable_verified",
        "schema_ids": sorted(set().union(*(set(ids) for item in prepared for ids in item.selected_ids.values()))),
        "interpret_compile_and_CER_metrics": spec.phase != "structural",
    }


def run_experiment(
    manifest_path: str | Path,
    *,
    dry_run: bool = False,
    resume_override: Optional[bool] = None,
    evaluate_override: Optional[bool] = None,
) -> dict:
    """Execute or preview every model/arm/tier cell defined by a manifest."""
    spec, output_root, prepared = prepare_experiment(manifest_path)
    if getattr(spec, 'local_audit_only', False) and not dry_run:
        raise ExperimentManifestError('This manifest is local-audit-only; provider calls are explicitly disabled.')
    plan = build_experiment_plan(spec, output_root, prepared)
    plan["source_manifest"] = str(Path(manifest_path).resolve())
    if dry_run:
        return {"dry_run": True, "plan": plan}

    if spec.phase in {'final', 'structural'} and any(m.expected_cost_usd is None for m in spec.models):
        raise ExperimentManifestError(
            'Set per-model expected_cost_usd from the pilot before paid final or structural execution; '
            'local audits and dry runs remain available'
        )

    if spec.oracle_audit:
        audit = read_json(spec.oracle_audit)
        from .reference_gate import validate_reference_evidence
        try:
            validate_reference_evidence(audit, plan)
        except (ValueError, KeyError, OSError) as exc:
            raise ExperimentManifestError(str(exc)) from exc
    if spec.pilot_validation:
        pilot = read_json(spec.pilot_validation)
        configs = {item.spec.name: hashlib.sha256(json.dumps(_redact_secrets(item.config.raw_yaml), sort_keys=True).encode()).hexdigest() for item in prepared}
        if (not pilot.get('all_automated_gates_passed') or pilot.get('prompt_sha256') != _prompt_hashes()
                or pilot.get('configuration_sha256') != configs
                or pilot.get('source_sha256') != plan['source_sha256']
                or pilot.get('split_sha256') != plan['split_sha256']
                or pilot.get('contamination_audit_sha256') != plan.get('contamination_audit_sha256')):
            raise ExperimentManifestError('Final run requires a passing pilot for these exact model configurations and prompts')

    if spec.phase in {'pilot', 'final'}:
        if not spec.evaluator_validation:
            raise ExperimentManifestError('Paper runs require evaluator_validation mutation evidence')
        controls = read_json(spec.evaluator_validation)
        if (controls.get('validation_version') != 2 or not controls.get('all_passed') or controls.get('source_sha256') != plan['source_sha256']
                or not controls.get('independent_controls') or not all(r.get('passed') for r in controls['independent_controls'])
                or not controls.get('same_sqlstate_wrong_constraint_control_passed')):
            raise ExperimentManifestError('Evaluator mutation controls failed or are stale; rerun local mutation validation')

    resume = spec.resume if resume_override is None else resume_override
    evaluate = spec.evaluate if evaluate_override is None else evaluate_override
    frozen_path = output_root / "resolved_manifest.json"
    if output_root.exists() and not frozen_path.exists() and any(output_root.iterdir()):
        raise ExperimentManifestError(
            f"Output root '{output_root}' is not empty and has no resolved_manifest.json. "
            "Choose a new output_root so unrelated results cannot be mixed."
        )
    if frozen_path.exists():
        previous = read_json(frozen_path)
        if previous.get("plan_sha256") != plan.get("plan_sha256"):
            raise ExperimentManifestError(
                f"Output root '{output_root}' already belongs to a different experiment plan. "
                "Use its original manifest or choose a new experiment.name/output_root."
            )
    ensure_dir(output_root)
    write_json(frozen_path, plan)
    _snapshot_prompts(output_root)
    status = {
        "experiment": spec.name,
        "status": "running",
        "started_at": _now(),
        "finished_at": None,
        "resume": resume,
        "verify": spec.verify,
        "tasks": [],
        "errors": [],
    }
    _write_status(output_root, status)

    try:
        for item in prepared:
            _validate_credentials(item, spec.verify)
            for arm in item.spec.arms:
                output_dir = _arm_output_dir(output_root, item.spec.name, arm)
                for tier in item.tiers:
                    task = {
                        "model": item.spec.name,
                        "arm": arm,
                        "tier": tier,
                        "status": "running",
                        "started_at": _now(),
                        "finished_at": None,
                        "output_dir": str(output_dir),
                    }
                    status["tasks"].append(task)
                    _write_status(output_root, status)
                    try:
                        if arm == "direct":
                            summary = run_direct_baseline_tier(
                                config=item.config,
                                tier=tier,
                                limit=None,
                                output_dir_override=str(output_dir),
                                restrict_to_ids=item.selected_ids[tier],
                                resume=resume,
                                verify=spec.verify,
                            ).as_dict()
                        else:
                            summary = run_tier(
                                config=item.config,
                                tier=tier,
                                limit=None,
                                output_dir_override=str(output_dir),
                                restrict_to_ids=item.selected_ids[tier],
                                resume=resume,
                                verify=spec.verify,
                            ).as_dict()
                        task.update(status="complete", summary=summary, finished_at=_now())
                    except Exception as exc:  # noqa: BLE001 - preserve status before deciding to stop
                        task.update(status="failed", error=str(exc), finished_at=_now())
                        status["errors"].append(
                            {"model": item.spec.name, "arm": arm, "tier": tier, "error": str(exc)}
                        )
                        _write_status(output_root, status)
                        if spec.stop_on_error:
                            raise
                    _write_status(output_root, status)

        if evaluate:
            _evaluate_experiment(spec, output_root, prepared, status)
        status["status"] = "completed_with_errors" if status["errors"] else "complete"
    except Exception as exc:
        status["status"] = "failed"
        if not status["errors"] or status["errors"][-1].get("error") != str(exc):
            status["errors"].append({"phase": "orchestration", "error": str(exc)})
        status["finished_at"] = _now()
        _write_status(output_root, status)
        raise

    status["finished_at"] = _now()
    _write_status(output_root, status)
    return {"dry_run": False, "output_root": str(output_root), "status": status}
