"""Module 7: paper-level evaluation and reporting.

Module 7 is deliberately read-only with respect to model and database work.
It consumes the JSON artifacts produced by Modules 2--6 and writes aggregate
metrics, CSV tables, a manifest, and a Markdown report.  It never calls an
LLM and never opens a database connection.
"""

from .evaluator import (
    EvaluationReport,
    compare_reports,
    evaluate_results_dir,
    write_model_comparison_artifacts,
    write_evaluation_artifacts,
)

__all__ = [
    "EvaluationReport",
    "compare_reports",
    "evaluate_results_dir",
    "write_evaluation_artifacts",
    "write_model_comparison_artifacts",
]
