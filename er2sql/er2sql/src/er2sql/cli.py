"""
Command-line interface.

Usage (after `pip install -e .` from the project root):

    er2sql run --config config/config.yaml --tier tier1
    er2sql run --config config/config.yaml --tier tier1 --limit 5
    er2sql run-all --config config/config.yaml
    er2sql experiment --manifest config/experiment.yaml --dry-run
    er2sql evaluate --config config/config.yaml --run-name final
    er2sql validate-ir --ir-file path/to/some_ir.json

Equivalently, without installing the package:

    python -m er2sql.cli run --config config/config.yaml --tier tier1

See README.md for full setup instructions (API keys, config.yaml,
wiring in your data folders).
"""

from __future__ import annotations

import argparse
import json
import logging
import sys
from pathlib import Path

from .config import ConfigError, load_config
from .ir_validator import validate_ir
from .module6_direct_baseline.runner import run_direct_baseline_tier
from .module7_evaluation import (
    compare_reports,
    evaluate_results_dir,
    write_evaluation_artifacts,
    write_model_comparison_artifacts,
)
from .module7_evaluation.contamination_audit import main as _contamination_audit_main
from .module7_evaluation.orchestrator import ExperimentManifestError, run_experiment
from .pipeline.runner import compute_common_ids_across_tiers, run_tier
from .utils.io_utils import write_json


def _setup_logging(verbose: bool) -> None:
    level = logging.DEBUG if verbose else logging.INFO
    logging.basicConfig(
        level=level,
        format="%(asctime)s - %(levelname)s - %(name)s - %(message)s",
    )


def _cmd_run(args: argparse.Namespace) -> int:
    try:
        config = load_config(args.config)
    except ConfigError as exc:
        print(f"Config error: {exc}", file=sys.stderr)
        return 1

    try:
        restrict_to_ids = None
        if args.common_only:
            restrict_to_ids = compute_common_ids_across_tiers(config)
            print(
                f"--common-only: restricting to {len(restrict_to_ids)} schema_id(s) "
                f"present in every tier defined in config.yaml",
                file=sys.stderr,
            )

        summary = run_tier(
            config=config,
            tier=args.tier,
            limit=args.limit,
            output_dir_override=args.output_dir,
            restrict_to_ids=restrict_to_ids,
            resume=args.resume,
        )
    except KeyError as exc:
        print(str(exc), file=sys.stderr)
        return 1

    print(json.dumps(summary.as_dict(), indent=2))
    return 0


def _cmd_run_all(args: argparse.Namespace) -> int:
    try:
        config = load_config(args.config)
    except ConfigError as exc:
        print(f"Config error: {exc}", file=sys.stderr)
        return 1

    if not config.tiers:
        print(
            "No tiers defined in config.yaml under dataset.tiers. "
            "Add tier1/tier2/tier3 entries first.",
            file=sys.stderr,
        )
        return 1

    restrict_to_ids = None
    if args.common_only:
        restrict_to_ids = compute_common_ids_across_tiers(config)
        print(
            f"--common-only: restricting to {len(restrict_to_ids)} schema_id(s) "
            f"present in every tier defined in config.yaml",
            file=sys.stderr,
        )

    all_summaries = {}
    for tier in config.tiers:
        summary = run_tier(
            config=config,
            tier=tier,
            limit=args.limit,
            output_dir_override=args.output_dir,
            restrict_to_ids=restrict_to_ids,
            resume=args.resume,
        )
        all_summaries[tier] = summary.as_dict()

    print(json.dumps(all_summaries, indent=2))
    return 0


def _cmd_validate_ir(args: argparse.Namespace) -> int:
    ir_path = Path(args.ir_file)
    if not ir_path.exists():
        print(f"File not found: {ir_path}", file=sys.stderr)
        return 1

    with open(ir_path, "r", encoding="utf-8") as f:
        try:
            ir = json.load(f)
        except json.JSONDecodeError as exc:
            print(f"File is not valid JSON: {exc}", file=sys.stderr)
            return 1

    result = validate_ir(ir)
    print(json.dumps(result.as_dict(), indent=2))
    return 0 if result.is_valid else 1


def _cmd_run_direct_baseline(args: argparse.Namespace) -> int:
    try:
        config = load_config(args.config)
        restrict_to_ids = compute_common_ids_across_tiers(config) if args.common_only else None
        summary = run_direct_baseline_tier(
            config=config,
            tier=args.tier,
            limit=args.limit,
            output_dir_override=args.output_dir,
            restrict_to_ids=restrict_to_ids,
            resume=args.resume,
        )
    except (ConfigError, KeyError) as exc:
        print(f"Config error: {exc}", file=sys.stderr)
        return 1
    print(json.dumps(summary.as_dict(), indent=2))
    return 0


def _cmd_audit_contamination(args: argparse.Namespace) -> int:
    return _contamination_audit_main(args.audit_args)


def _cmd_run_all_direct_baseline(args: argparse.Namespace) -> int:
    try:
        config = load_config(args.config)
        restrict_to_ids = compute_common_ids_across_tiers(config) if args.common_only else None
        summaries = {
            tier: run_direct_baseline_tier(
                config=config,
                tier=tier,
                limit=args.limit,
                output_dir_override=args.output_dir,
                restrict_to_ids=restrict_to_ids,
                resume=args.resume,
            ).as_dict()
            for tier in config.tiers
        }
    except (ConfigError, KeyError) as exc:
        print(f"Config error: {exc}", file=sys.stderr)
        return 1
    print(json.dumps(summaries, indent=2))
    return 0


def _cmd_evaluate(args: argparse.Namespace) -> int:
    """Aggregate existing Module 2--6 artifacts (Module 7, no LLM/DB calls)."""
    try:
        config = load_config(args.config)
    except ConfigError as exc:
        print(f"Config error: {exc}", file=sys.stderr)
        return 1

    restrict_to_ids = None
    if args.common_only:
        restrict_to_ids = compute_common_ids_across_tiers(config)
        print(
            f"--common-only: restricting evaluation to {len(restrict_to_ids)} "
            "schema_id(s) shared by all configured tiers",
            file=sys.stderr,
        )

    results_dir = Path(args.results_dir or config.output.base_dir)
    exclusion_dirs = [results_dir]
    if args.compare_dir:
        exclusion_dirs.append(Path(args.compare_dir))
    from .module7_evaluation.evaluator import detect_truncation_exclusions
    truncation_exclusions = detect_truncation_exclusions(exclusion_dirs)
    if args.model_name:
        model_name = args.model_name
    elif args.arm == "direct" and config.module6_direct_baseline is not None:
        model_name = config.module6_direct_baseline.model
    else:
        model_name = config.module2_parsing.model

    report = evaluate_results_dir(
        results_dir,
        arm=args.arm,
        model_name=model_name,
        tiers=args.tiers,
        restrict_to_ids=restrict_to_ids,
        limit=args.limit,
        excluded_schema_tiers=truncation_exclusions,
    )

    comparison = None
    if args.compare_dir:
        reference = evaluate_results_dir(
            args.compare_dir,
            arm=args.compare_arm,
            model_name=args.compare_model_name,
            tiers=args.tiers,
            restrict_to_ids=restrict_to_ids,
            limit=args.limit,
            excluded_schema_tiers=truncation_exclusions,
        )
        comparison = compare_reports(report, reference)

    report_dir = Path(
        args.report_dir
        or (Path(config.output.base_dir) / "module7_evaluation" / args.run_name)
    )

    if args.model_dir:
        if args.results_dir or args.compare_dir:
            print("--model-dir cannot be combined with --results-dir or --compare-dir.", file=sys.stderr)
            return 1
        model_reports = {}
        model_artifacts = {}
        for spec in args.model_dir:
            if "=" not in spec:
                print(
                    f"Invalid --model-dir '{spec}'. Use MODEL_NAME=RESULTS_DIRECTORY.",
                    file=sys.stderr,
                )
                return 1
            name, directory = spec.split("=", 1)
            if not name.strip() or not directory.strip():
                print(
                    f"Invalid --model-dir '{spec}'. Use MODEL_NAME=RESULTS_DIRECTORY.",
                    file=sys.stderr,
                )
                return 1
            model_report = evaluate_results_dir(
                directory,
                arm=args.arm,
                model_name=name.strip(),
                tiers=args.tiers,
                restrict_to_ids=restrict_to_ids,
                limit=args.limit,
            )
            model_reports[name.strip()] = model_report
            model_artifacts[name.strip()] = write_evaluation_artifacts(
                model_report,
                report_dir / name.strip(),
                manifest={
                    "module": "module7",
                    "run_name": args.run_name,
                    "arm": args.arm,
                    "model_name": name.strip(),
                    "results_dir": directory,
                    "common_only": args.common_only,
                    "limit": args.limit,
                    "no_model_or_database_calls": True,
                },
            )
        comparison_paths = write_model_comparison_artifacts(model_reports, report_dir)
        print(
            json.dumps(
                {
                    "run_name": args.run_name,
                    "arm": args.arm,
                    "models": list(model_reports),
                    "model_artifacts": model_artifacts,
                    "comparison_artifacts": comparison_paths,
                },
                indent=2,
            )
        )
        return 1 if args.strict and any(report.warnings for report in model_reports.values()) else 0

    manifest = {
        "module": "module7",
        "run_name": args.run_name,
        "arm": args.arm,
        "model_name": model_name,
        "results_dir": str(results_dir),
        "compare_dir": args.compare_dir,
        "compare_arm": args.compare_arm if args.compare_dir else None,
        "tiers": args.tiers,
        "common_only": args.common_only,
        "limit": args.limit,
        "config_path": str(Path(args.config)),
        "no_model_or_database_calls": True,
    }
    paths = write_evaluation_artifacts(
        report,
        report_dir,
        comparison=comparison,
        manifest=manifest,
    )
    write_json(report_dir / "evaluation_exclusions.json", {
        "policy": "exclude_paired_cell_only_when_output_limit_finish_and_stage_output_is_unusable",
        "confirmation_rule": (
            "Module 2 parse/validation failure, or SQL missing / rejected for syntax at end-of-input; "
            "a length/max_tokens finish by itself is not sufficient"
        ),
        "excluded_paired_schema_tier_cells": truncation_exclusions,
        "source_results_dirs": [str(path) for path in exclusion_dirs],
    })
    print(
        json.dumps(
            {
                "run_name": args.run_name,
                "arm": args.arm,
                "schema_count": report.overall["schema_count"],
                "artifacts": paths,
                "warnings": report.warnings,
            },
            indent=2,
        )
    )
    return 1 if args.strict and report.warnings else 0


def _cmd_experiment(args: argparse.Namespace) -> int:
    """Run or preview a complete manifest-defined experimental matrix."""
    try:
        result = run_experiment(
            args.manifest,
            dry_run=args.dry_run,
            resume_override=args.resume,
            evaluate_override=False if args.skip_evaluation else None,
        )
    except (ExperimentManifestError, ConfigError, KeyError) as exc:
        print(f"Experiment configuration error: {exc}", file=sys.stderr)
        return 1
    except Exception as exc:  # noqa: BLE001 - run_status.json already records task context
        print(f"Experiment failed: {exc}", file=sys.stderr)
        return 1
    print(json.dumps(result, indent=2))
    status = (result.get("status") or {}).get("status")
    return 1 if status in {"failed", "completed_with_errors"} else 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="er2sql", description="ER Diagram -> SQL DDL multi-agent pipeline"
    )
    parser.add_argument(
        "-v", "--verbose", action="store_true", help="Enable debug logging"
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    experiment_parser = subparsers.add_parser(
        "experiment",
        help="Run a reproducible model x arm x tier matrix from a YAML manifest",
    )
    experiment_parser.add_argument(
        "--manifest", required=True, help="Path to the experiment YAML manifest"
    )
    experiment_parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Validate and print the exact experiment plan without API or database calls",
    )
    experiment_resume_group = experiment_parser.add_mutually_exclusive_group()
    experiment_resume_group.add_argument(
        "--resume",
        dest="resume",
        action="store_true",
        help="Override the manifest and resume completed artifacts",
    )
    experiment_resume_group.add_argument(
        "--no-resume",
        dest="resume",
        action="store_false",
        help="Override the manifest and process the selected artifacts again",
    )
    experiment_parser.set_defaults(resume=None)
    experiment_parser.add_argument(
        "--skip-evaluation",
        action="store_true",
        help="Run experiment cells without generating Module 7 reports afterward",
    )
    experiment_parser.set_defaults(func=_cmd_experiment)

    run_parser = subparsers.add_parser(
        "run", help="Run Module 2 + Module 3 over a single tier"
    )
    run_parser.add_argument(
        "--config", default="config/config.yaml", help="Path to config.yaml"
    )
    run_parser.add_argument(
        "--tier", required=True, help="Tier name as defined in config.yaml (e.g. tier1)"
    )
    run_parser.add_argument(
        "--limit", type=int, default=None, help="Only process the first N schemas"
    )
    run_parser.add_argument(
        "--output-dir",
        default=None,
        help="Override output.base_dir from config.yaml for this run",
    )
    run_parser.add_argument(
        "--common-only",
        action="store_true",
        help=(
            "Restrict this tier's run to only the schema_ids that are present "
            "(matched to a diagram + SQL pair) in EVERY tier defined in "
            "config.yaml. Use this to guarantee paired triplets across tiers "
            "when individual tier folders contain a few extra stray files."
        ),
    )
    run_parser.add_argument(
        "--resume",
        action="store_true",
        help=(
            "Reuse successful Module 2/3 results. When verification is enabled, "
            "backfill only Modules 4/5 for results that do not have verification yet."
        ),
    )
    run_parser.set_defaults(func=_cmd_run)

    run_all_parser = subparsers.add_parser(
        "run-all", help="Run Module 2 + Module 3 over every tier defined in config.yaml"
    )
    run_all_parser.add_argument(
        "--config", default="config/config.yaml", help="Path to config.yaml"
    )
    run_all_parser.add_argument(
        "--limit", type=int, default=None, help="Only process the first N schemas per tier"
    )
    run_all_parser.add_argument(
        "--output-dir",
        default=None,
        help="Override output.base_dir from config.yaml for this run",
    )
    run_all_parser.add_argument(
        "--common-only",
        action="store_true",
        help=(
            "Restrict every tier's run to only the schema_ids present in ALL "
            "tiers defined in config.yaml (true paired triplets)."
        ),
    )
    run_all_parser.add_argument(
        "--resume",
        action="store_true",
        help=(
            "Reuse successful Module 2/3 results and backfill missing Modules 4/5 "
            "verification for every tier."
        ),
    )
    run_all_parser.set_defaults(func=_cmd_run_all)

    direct_parser = subparsers.add_parser(
        "run-direct-baseline",
        help="Run Module 6's one-call image-to-SQL baseline over one tier",
    )
    direct_parser.add_argument("--config", default="config/config.yaml", help="Path to config.yaml")
    direct_parser.add_argument("--tier", required=True, help="Tier name as defined in config.yaml")
    direct_parser.add_argument("--limit", type=int, default=None, help="Only process the first N schemas")
    direct_parser.add_argument("--output-dir", default=None, help="Override output.base_dir from config.yaml")
    direct_parser.add_argument("--common-only", action="store_true", help="Restrict to schema IDs shared by every tier")
    direct_parser.add_argument(
        "--resume",
        action="store_true",
        help="Reuse existing direct SQL and backfill missing gold verification without an LLM call",
    )
    direct_parser.set_defaults(func=_cmd_run_direct_baseline)

    direct_all_parser = subparsers.add_parser(
        "run-all-direct-baseline",
        help="Run Module 6's one-call image-to-SQL baseline over every tier",
    )
    direct_all_parser.add_argument("--config", default="config/config.yaml", help="Path to config.yaml")
    direct_all_parser.add_argument("--limit", type=int, default=None, help="Only process the first N schemas per tier")
    direct_all_parser.add_argument("--output-dir", default=None, help="Override output.base_dir from config.yaml")
    direct_all_parser.add_argument("--common-only", action="store_true", help="Restrict to schema IDs shared by every tier")
    direct_all_parser.add_argument(
        "--resume",
        action="store_true",
        help="Reuse existing direct SQL and backfill missing gold verification without an LLM call",
    )
    direct_all_parser.set_defaults(func=_cmd_run_all_direct_baseline)

    evaluate_parser = subparsers.add_parser(
        "evaluate",
        help=(
            "Run Module 7 aggregation over existing per-schema artifacts "
            "(read-only with respect to LLMs and PostgreSQL)"
        ),
    )
    evaluate_parser.add_argument(
        "--config", default="config/config.yaml", help="Path to config.yaml"
    )
    evaluate_parser.add_argument(
        "--results-dir",
        default=None,
        help="Directory containing tier/schema JSON artifacts (default: output.base_dir)",
    )
    evaluate_parser.add_argument(
        "--model-dir",
        action="append",
        default=None,
        metavar="MODEL=DIR",
        help=(
            "Evaluate multiple model artifact directories; repeat this option, "
            "for example --model-dir mistral=outputs/mistral"
        ),
    )
    evaluate_parser.add_argument(
        "--arm",
        choices=("structured", "direct"),
        default="structured",
        help="Artifact arm to aggregate (default: structured Modules 2--5)",
    )
    evaluate_parser.add_argument(
        "--run-name", default="evaluation", help="Name used for the report directory"
    )
    evaluate_parser.add_argument(
        "--report-dir", default=None, help="Override the Module 7 report directory"
    )
    evaluate_parser.add_argument(
        "--model-name", default=None, help="Model label stored in the report manifest"
    )
    evaluate_parser.add_argument(
        "--tiers", nargs="*", default=None, help="Only evaluate the named tiers"
    )
    evaluate_parser.add_argument(
        "--common-only",
        action="store_true",
        help="Restrict to schema IDs present in every configured tier",
    )
    evaluate_parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Only aggregate the first N discovered result artifacts",
    )
    evaluate_parser.add_argument(
        "--compare-dir",
        default=None,
        help="Optional second artifact directory for arm comparison",
    )
    evaluate_parser.add_argument(
        "--compare-arm",
        choices=("structured", "direct"),
        default="direct",
        help="Arm represented by --compare-dir (default: direct)",
    )
    evaluate_parser.add_argument(
        "--compare-model-name",
        default=None,
        help="Optional model label for the comparison report",
    )
    evaluate_parser.add_argument(
        "--strict",
        action="store_true",
        help="Return a nonzero status if aggregation warnings are produced",
    )
    evaluate_parser.set_defaults(func=_cmd_evaluate)

    validate_parser = subparsers.add_parser(
        "validate-ir", help="Validate a standalone canonical IR JSON file"
    )
    validate_parser.add_argument("--ir-file", required=True, help="Path to a JSON file")
    validate_parser.set_defaults(func=_cmd_validate_ir)

    contamination_parser = subparsers.add_parser(
        "audit-contamination",
        help="Audit dataset provenance, popular-schema risk, and cross-split leakage",
    )
    contamination_parser.add_argument(
        "audit_args", nargs=argparse.REMAINDER,
        help="Arguments forwarded to the contamination audit; see --help after this command",
    )
    contamination_parser.set_defaults(func=_cmd_audit_contamination)

    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    _setup_logging(args.verbose)
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
