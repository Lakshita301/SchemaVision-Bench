"""
Deterministic validation of the canonical JSON IR.

Two layers of validation are performed, deliberately kept separate:

1. Structural (JSON Schema) validation
   -- shape, required keys, types, enums. Implemented with the
      `jsonschema` library against CANONICAL_IR_JSON_SCHEMA.

2. Semantic (referential) validation
   -- checks that cannot be expressed in JSON Schema alone, e.g.:
        * table names are unique
        * column names are unique within a table
        * primary_key entries reference real columns on that table
        * foreign_key.columns reference real columns on that table
        * foreign_key.ref_table references a table that exists
        * foreign_key.ref_columns reference real columns on ref_table
        * relationship.left_table / right_table reference real tables

Both layers run entirely deterministically (no LLM calls), matching
the locked plan's instruction that "Deterministic schema/IR
validation" sits between Module 2 and Module 3.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any

from jsonschema import Draft202012Validator

from .ir_schema import CANONICAL_IR_JSON_SCHEMA

_VALIDATOR = Draft202012Validator(CANONICAL_IR_JSON_SCHEMA)


@dataclass
class IRValidationResult:
    is_valid: bool
    schema_errors: list[str] = field(default_factory=list)
    semantic_errors: list[str] = field(default_factory=list)

    @property
    def all_errors(self) -> list[str]:
        return [*self.schema_errors, *self.semantic_errors]

    def as_dict(self) -> dict:
        return {
            "is_valid": self.is_valid,
            "schema_errors": self.schema_errors,
            "semantic_errors": self.semantic_errors,
        }


def _format_schema_error(err) -> str:
    path = "$" + "".join(
        f"[{p!r}]" if isinstance(p, str) else f"[{p}]" for p in err.absolute_path
    )
    return f"{path}: {err.message}"


def _run_schema_validation(ir: dict) -> list[str]:
    errors = sorted(_VALIDATOR.iter_errors(ir), key=lambda e: list(e.absolute_path))
    return [_format_schema_error(e) for e in errors]


def _run_semantic_validation(ir: dict) -> list[str]:
    """
    Only runs meaningful semantic checks if the object at least has the
    expected top-level shape. If `ir` is missing "tables" entirely (a
    schema error will already have been raised for that), semantic
    checks are skipped to avoid confusing cascade errors.
    """
    errors: list[str] = []

    tables = ir.get("tables")
    if not isinstance(tables, list):
        return errors

    table_names_seen: dict[str, int] = {}
    table_columns: dict[str, set[str]] = {}

    for t_idx, table in enumerate(tables):
        if not isinstance(table, dict):
            continue
        name = table.get("name")
        if isinstance(name, str):
            table_names_seen[name] = table_names_seen.get(name, 0) + 1

        columns = table.get("columns")
        col_names: set[str] = set()
        if isinstance(columns, list):
            seen_cols: dict[str, int] = {}
            for c_idx, col in enumerate(columns):
                if not isinstance(col, dict):
                    continue
                col_name = col.get("name")
                if isinstance(col_name, str):
                    seen_cols[col_name] = seen_cols.get(col_name, 0) + 1
                    col_names.add(col_name)
            for col_name, count in seen_cols.items():
                if count > 1:
                    errors.append(
                        f"table '{name}' (index {t_idx}): duplicate column name "
                        f"'{col_name}' appears {count} times"
                    )
        if isinstance(name, str):
            table_columns[name] = col_names

    for name, count in table_names_seen.items():
        if count > 1:
            errors.append(f"duplicate table name '{name}' appears {count} times")

    table_name_set = set(table_columns.keys())

    for t_idx, table in enumerate(tables):
        if not isinstance(table, dict):
            continue
        name = table.get("name", f"<table index {t_idx}>")
        own_columns = table_columns.get(name, set())

        primary_key = table.get("primary_key") or []
        if isinstance(primary_key, list):
            for pk_col in primary_key:
                if isinstance(pk_col, str) and pk_col not in own_columns:
                    errors.append(
                        f"table '{name}': primary_key references unknown column "
                        f"'{pk_col}'"
                    )

        foreign_keys = table.get("foreign_keys") or []
        if isinstance(foreign_keys, list):
            for fk_idx, fk in enumerate(foreign_keys):
                if not isinstance(fk, dict):
                    continue
                fk_columns = fk.get("columns") or []
                ref_table = fk.get("ref_table")
                ref_columns = fk.get("ref_columns") or []

                if isinstance(fk_columns, list):
                    for fk_col in fk_columns:
                        if isinstance(fk_col, str) and fk_col not in own_columns:
                            errors.append(
                                f"table '{name}' foreign_keys[{fk_idx}]: column "
                                f"'{fk_col}' is not a column of '{name}'"
                            )

                if isinstance(ref_table, str):
                    if ref_table not in table_name_set:
                        errors.append(
                            f"table '{name}' foreign_keys[{fk_idx}]: ref_table "
                            f"'{ref_table}' does not exist in this schema"
                        )
                    elif isinstance(ref_columns, list):
                        ref_table_columns = table_columns.get(ref_table, set())
                        for ref_col in ref_columns:
                            if (
                                isinstance(ref_col, str)
                                and ref_col not in ref_table_columns
                            ):
                                errors.append(
                                    f"table '{name}' foreign_keys[{fk_idx}]: "
                                    f"ref_columns entry '{ref_col}' is not a "
                                    f"column of ref_table '{ref_table}'"
                                )

    relationships = ir.get("relationships")
    if isinstance(relationships, list):
        for r_idx, rel in enumerate(relationships):
            if not isinstance(rel, dict):
                continue
            left_table = rel.get("left_table")
            right_table = rel.get("right_table")
            if isinstance(left_table, str) and left_table not in table_name_set:
                errors.append(
                    f"relationships[{r_idx}]: left_table '{left_table}' does not "
                    f"exist in this schema"
                )
            if isinstance(right_table, str) and right_table not in table_name_set:
                errors.append(
                    f"relationships[{r_idx}]: right_table '{right_table}' does "
                    f"not exist in this schema"
                )

    return errors


def validate_ir(ir: Any) -> IRValidationResult:
    """
    Validate a parsed JSON object against the canonical IR schema and
    the deterministic semantic rules described above.

    `ir` is expected to already be a Python dict (i.e. json.loads has
    already been applied to whatever text the LLM returned). If it is
    not even a dict, only a schema error is produced.
    """
    if not isinstance(ir, dict):
        return IRValidationResult(
            is_valid=False,
            schema_errors=[f"root value is not a JSON object (got {type(ir).__name__})"],
            semantic_errors=[],
        )

    schema_errors = _run_schema_validation(ir)
    # Only bother with semantic checks if the structural shape is sound
    # enough to make them meaningful (top-level required keys present).
    semantic_errors = _run_semantic_validation(ir) if not schema_errors else []

    is_valid = not schema_errors and not semantic_errors
    return IRValidationResult(
        is_valid=is_valid,
        schema_errors=schema_errors,
        semantic_errors=semantic_errors,
    )
