"""
Configuration loading for the er2sql pipeline.

Config is split across two sources:

    1. A YAML file (config/config.yaml, copied from config.example.yaml)
       describing which model each module should use, generation
       parameters, retries, dataset tier paths, and output location.

    2. A .env file (or real environment variables) holding the actual
       secret API keys. The YAML file never contains a raw key -- it
       only names the environment variable to read (`api_key_env`).
       This keeps secrets out of anything you might commit or share.

Call `load_config(path)` to get a fully-resolved `PipelineConfig`.
"""

from __future__ import annotations

import os
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Optional

import yaml

try:
    from dotenv import load_dotenv

    _DOTENV_AVAILABLE = True
except ImportError:  # pragma: no cover
    _DOTENV_AVAILABLE = False


class ConfigError(RuntimeError):
    pass


@dataclass
class LLMProviderConfig:
    """Config for one LLM role (e.g. 'module2_parsing' or 'module3_generation')."""

    model: str
    api_key_env: str
    provider: Optional[str] = None
    model_revision: Optional[str] = None
    api_base: Optional[str] = None
    vision_capable: Optional[bool] = None
    image_url_format: str = "openai"
    temperature: float = 0.2
    max_retries: int = 3
    request_timeout: float = 120.0
    max_completion_tokens: Optional[int] = None
    token_limit_parameter: str = "max_completion_tokens"
    reasoning_effort: Optional[str] = None
    response_format_json: bool = False
    input_cost_per_million: Optional[float] = None
    output_cost_per_million: Optional[float] = None
    retry_initial_delay_seconds: float = 1.0
    retry_max_delay_seconds: float = 30.0
    retry_backoff_multiplier: float = 2.0
    retry_jitter_seconds: float = 0.25
    max_retry_cost_usd: Optional[float] = None
    estimated_cost_per_attempt_usd: Optional[float] = None
    validation_retries: int = 0

    def resolve_api_key(self) -> str:
        key = os.environ.get(self.api_key_env, "")
        if not key:
            raise ConfigError(
                f"Environment variable '{self.api_key_env}' is not set (or empty). "
                f"Add it to your .env file or export it before running the CLI."
            )
        return key


@dataclass
class TierPathConfig:
    diagrams_dir: str
    sql_dir: str


@dataclass
class DatabaseConfig:
    """
    Optional. Config for Module 5 (SQL Verification / Database
    Execution). If the `database:` section is absent from config.yaml
    entirely, verification is skipped automatically and the pipeline
    behaves exactly as it did before Modules 4/5 existed (Module 2 +
    Module 3 only).
    """

    host: str
    port: int
    dbname: str
    user: str
    password_env: str
    schema_prefix: str = "er2sql_verify"
    statement_timeout_ms: int = 5000

    def resolve_password(self) -> str:
        pwd = os.environ.get(self.password_env, "")
        if not pwd:
            raise ConfigError(
                f"Environment variable '{self.password_env}' is not set (or empty). "
                f"Add it to your .env file or export it before running the CLI."
            )
        return pwd


@dataclass
class OutputConfig:
    base_dir: str = "outputs"


@dataclass
class PipelineConfig:
    module2_parsing: LLMProviderConfig
    module3_generation: LLMProviderConfig
    module6_direct_baseline: Optional[LLMProviderConfig] = None
    tiers: dict[str, TierPathConfig] = field(default_factory=dict)
    output: OutputConfig = field(default_factory=OutputConfig)
    sql_dialect: str = "postgres"
    database: Optional[DatabaseConfig] = None
    raw_yaml: dict[str, Any] = field(default_factory=dict)


def _build_llm_provider_config(d: dict) -> LLMProviderConfig:
    if "model" not in d or "api_key_env" not in d:
        raise ConfigError(
            "Each llm entry in config.yaml requires at least 'model' and "
            "'api_key_env'."
        )
    config = LLMProviderConfig(
        model=d["model"],
        validation_retries=int(d.get("validation_retries", 0)),
        api_key_env=d["api_key_env"],
        provider=d.get("provider"),
        model_revision=d.get("model_revision"),
        api_base=d.get("api_base"),
        vision_capable=(
            bool(d["vision_capable"])
            if d.get("vision_capable") is not None
            else None
        ),
        image_url_format=str(d.get("image_url_format", "openai")),
        temperature=float(d.get("temperature", 0.2)),
        max_retries=int(d.get("max_retries", 3)),
        request_timeout=float(d.get("request_timeout", 120.0)),
        max_completion_tokens=(
            int(d["max_completion_tokens"])
            if d.get("max_completion_tokens") is not None
            else None
        ),
        token_limit_parameter=str(
            d.get("token_limit_parameter", "max_completion_tokens")
        ),
        reasoning_effort=d.get("reasoning_effort"),
        response_format_json=bool(d.get("response_format_json", False)),
        input_cost_per_million=(
            float(d["input_cost_per_million"])
            if d.get("input_cost_per_million") is not None
            else None
        ),
        output_cost_per_million=(
            float(d["output_cost_per_million"])
            if d.get("output_cost_per_million") is not None
            else None
        ),
        retry_initial_delay_seconds=float(d.get("retry_initial_delay_seconds", 1.0)),
        retry_max_delay_seconds=float(d.get("retry_max_delay_seconds", 30.0)),
        retry_backoff_multiplier=float(d.get("retry_backoff_multiplier", 2.0)),
        retry_jitter_seconds=float(d.get("retry_jitter_seconds", 0.25)),
        max_retry_cost_usd=(
            float(d["max_retry_cost_usd"])
            if d.get("max_retry_cost_usd") is not None
            else None
        ),
        estimated_cost_per_attempt_usd=(
            float(d["estimated_cost_per_attempt_usd"])
            if d.get("estimated_cost_per_attempt_usd") is not None
            else None
        ),
    )
    if config.max_retries < 1:
        raise ConfigError("llm.max_retries must be at least 1.")
    if config.validation_retries < 0:
        raise ConfigError("validation_retries must be non-negative.")
    if config.token_limit_parameter not in {"max_completion_tokens", "max_tokens"}:
        raise ConfigError(
            "llm.token_limit_parameter must be 'max_completion_tokens' or 'max_tokens'."
        )
    if config.image_url_format not in {"openai", "string"}:
        raise ConfigError("llm.image_url_format must be 'openai' or 'string'.")
    if config.retry_initial_delay_seconds < 0 or config.retry_max_delay_seconds < 0:
        raise ConfigError("LLM retry delays must be non-negative.")
    if config.retry_backoff_multiplier < 1:
        raise ConfigError("llm.retry_backoff_multiplier must be at least 1.")
    if config.retry_jitter_seconds < 0:
        raise ConfigError("llm.retry_jitter_seconds must be non-negative.")
    if (config.max_retry_cost_usd is None) != (
        config.estimated_cost_per_attempt_usd is None
    ):
        raise ConfigError(
            "max_retry_cost_usd and estimated_cost_per_attempt_usd must be configured together."
        )
    if config.max_retry_cost_usd is not None and config.max_retry_cost_usd < 0:
        raise ConfigError("llm.max_retry_cost_usd must be non-negative.")
    if (
        config.estimated_cost_per_attempt_usd is not None
        and config.estimated_cost_per_attempt_usd < 0
    ):
        raise ConfigError("llm.estimated_cost_per_attempt_usd must be non-negative.")
    return config


def _build_database_config(d: dict) -> DatabaseConfig:
    required = ("host", "port", "dbname", "user", "password_env")
    missing = [k for k in required if k not in d]
    if missing:
        raise ConfigError(
            f"config.yaml's 'database' section is missing required key(s): {missing}"
        )
    return DatabaseConfig(
        host=d["host"],
        port=int(d["port"]),
        dbname=d["dbname"],
        user=d["user"],
        password_env=d["password_env"],
        schema_prefix=d.get("schema_prefix", "er2sql_verify"),
        statement_timeout_ms=int(d.get("statement_timeout_ms", 5000)),
    )


def load_config(config_path: str | Path, dotenv_path: str | Path | None = None, *, load_environment: bool = True) -> PipelineConfig:
    """
    Load and resolve a PipelineConfig from a YAML file.

    Also loads a .env file if `python-dotenv` is installed. Looks for
    `.env` next to the config file first, then falls back to `.env`
    in the current working directory, unless `dotenv_path` is given
    explicitly.
    """
    config_path = Path(config_path)
    if not config_path.exists():
        raise ConfigError(
            f"Config file not found: {config_path}. Copy config/config.example.yaml "
            f"to config/config.yaml and edit it first."
        )

    if _DOTENV_AVAILABLE and load_environment:
        candidates = []
        if dotenv_path is not None:
            candidates.append(Path(dotenv_path))
        candidates.append(config_path.parent.parent / ".env")
        candidates.append(Path.cwd() / ".env")
        for candidate in candidates:
            if candidate.exists():
                load_dotenv(dotenv_path=candidate, override=False)
                break

    with open(config_path, "r", encoding="utf-8") as f:
        raw = yaml.safe_load(f) or {}

    llm_section = raw.get("llm", {})
    if "module2_parsing" not in llm_section or "module3_generation" not in llm_section:
        raise ConfigError(
            "config.yaml must define llm.module2_parsing and llm.module3_generation."
        )

    module2_cfg = _build_llm_provider_config(llm_section["module2_parsing"])
    module3_cfg = _build_llm_provider_config(llm_section["module3_generation"])
    module6_raw = llm_section.get("module6_direct_baseline")
    module6_cfg = _build_llm_provider_config(module6_raw) if module6_raw else None

    tiers_raw = (raw.get("dataset", {}) or {}).get("tiers", {}) or {}
    tiers: dict[str, TierPathConfig] = {}
    for tier_name, tier_val in tiers_raw.items():
        if "diagrams_dir" not in tier_val or "sql_dir" not in tier_val:
            raise ConfigError(
                f"dataset.tiers.{tier_name} must define diagrams_dir and sql_dir."
            )
        tiers[tier_name] = TierPathConfig(
            diagrams_dir=tier_val["diagrams_dir"],
            sql_dir=tier_val["sql_dir"],
        )

    output_raw = raw.get("output", {}) or {}
    output_cfg = OutputConfig(base_dir=output_raw.get("base_dir", "outputs"))

    sql_dialect = raw.get("sql_dialect", "postgres")

    database_raw = raw.get("database")
    database_cfg = _build_database_config(database_raw) if database_raw else None

    return PipelineConfig(
        module2_parsing=module2_cfg,
        module3_generation=module3_cfg,
        module6_direct_baseline=module6_cfg,
        tiers=tiers,
        output=output_cfg,
        sql_dialect=sql_dialect,
        database=database_cfg,
        raw_yaml=raw,
    )
