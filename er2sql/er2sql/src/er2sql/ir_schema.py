"""
Canonical JSON Intermediate Representation (IR) schema.

This is the ONLY artifact that crosses the boundary between Module 2
(ER Diagram Parsing Agent) and Module 3 (SQL Generation Agent). Per the
locked research plan, the IR must represent:

    - entities/tables
    - attributes/columns
    - data types where visually available
    - primary keys
    - foreign keys
    - relationships
    - cardinality
    - relationship direction where applicable
    - relevant constraint metadata

The schema is intentionally permissive about *missing* visual
information (e.g. Tier 2 diagrams have PK/FK badges stripped, Tier 3
diagrams have cardinality symbols stripped) by allowing many fields to
be null / omitted-with-default, but it is strict about *shape*
(unknown keys are rejected, required keys must be present, enums are
enforced). This lets downstream code trust the structure of any IR
that passes validation, even if some semantic fields are unknown.
"""

from __future__ import annotations

CARDINALITY_VALUES = ["one", "many", "zero_or_one", "zero_or_many", "unknown", None]
RELATIONSHIP_TYPE_VALUES = ["identifying", "non_identifying", "many_to_many", "unknown", None]
REFERENTIAL_ACTION_VALUES = ["CASCADE", "SET NULL", "RESTRICT", "NO ACTION", None]
TIER_VALUES = ["tier1", "tier2", "tier3"]

CANONICAL_IR_SCHEMA_VERSION = "1.0"

CANONICAL_IR_JSON_SCHEMA = {
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "https://er2sql.local/schemas/canonical_ir.json",
    "title": "ER2SQL Canonical Intermediate Representation",
    "type": "object",
    "additionalProperties": False,
    "required": ["schema_name", "tables", "relationships", "metadata"],
    "properties": {
        "ir_schema_version": {"type": "string"},
        "schema_name": {"type": "string", "minLength": 1},
        "tables": {
            "type": "array",
            "minItems": 1,
            "items": {"$ref": "#/$defs/table"},
        },
        "relationships": {
            "type": "array",
            "items": {"$ref": "#/$defs/relationship"},
        },
        "metadata": {"$ref": "#/$defs/metadata"},
    },
    "$defs": {
        "column": {
            "type": "object",
            "additionalProperties": False,
            "required": ["name"],
            "properties": {
                "name": {"type": "string", "minLength": 1},
                "data_type": {"type": ["string", "null"]},
                "is_primary_key": {"type": "boolean"},
                "is_foreign_key": {"type": "boolean"},
                "nullable": {"type": ["boolean", "null"]},
                "unique": {"type": ["boolean", "null"]},
                "default_value": {"type": ["string", "null"]},
                "notes": {"type": ["string", "null"]},
            },
        },
        "foreign_key": {
            "type": "object",
            "additionalProperties": False,
            "required": ["columns", "ref_table", "ref_columns"],
            "properties": {
                "columns": {
                    "type": "array",
                    "items": {"type": "string", "minLength": 1},
                    "minItems": 1,
                },
                "ref_table": {"type": "string", "minLength": 1},
                "ref_columns": {
                    "type": "array",
                    "items": {"type": "string", "minLength": 1},
                    "minItems": 1,
                },
                "on_delete": {"enum": REFERENTIAL_ACTION_VALUES},
                "on_update": {"enum": REFERENTIAL_ACTION_VALUES},
            },
        },
        "table": {
            "type": "object",
            "additionalProperties": False,
            "required": ["name", "columns"],
            "properties": {
                "name": {"type": "string", "minLength": 1},
                "columns": {
                    "type": "array",
                    "minItems": 1,
                    "items": {"$ref": "#/$defs/column"},
                },
                "primary_key": {
                    "type": "array",
                    "items": {"type": "string", "minLength": 1},
                },
                "foreign_keys": {
                    "type": "array",
                    "items": {"$ref": "#/$defs/foreign_key"},
                },
                "check_constraints": {
                    "type": "array",
                    "items": {"type": "string"},
                },
                "has_declared_primary_key": {"type": ["boolean", "null"]},
                "notes": {"type": ["string", "null"]},
            },
        },
        "relationship": {
            "type": "object",
            "additionalProperties": False,
            "required": ["left_table", "right_table"],
            "properties": {
                "name": {"type": ["string", "null"]},
                "left_table": {"type": "string", "minLength": 1},
                "right_table": {"type": "string", "minLength": 1},
                "left_cardinality": {"enum": CARDINALITY_VALUES},
                "right_cardinality": {"enum": CARDINALITY_VALUES},
                "relationship_type": {"enum": RELATIONSHIP_TYPE_VALUES},
                "direction": {"type": ["string", "null"]},
                "notes": {"type": ["string", "null"]},
            },
        },
        "metadata": {
            "type": "object",
            "additionalProperties": False,
            "required": ["tier", "source_image"],
            "properties": {
                "tier": {"enum": TIER_VALUES},
                "source_image": {"type": "string"},
                "no_declared_pk_tables": {
                    "type": "array",
                    "items": {"type": "string"},
                },
                "parser_confidence": {
                    "type": ["number", "null"],
                    "minimum": 0,
                    "maximum": 1,
                },
                "extraction_warnings": {
                    "type": "array",
                    "items": {"type": "string"},
                },
            },
        },
    },
}


def empty_ir_skeleton(schema_name: str, tier: str, source_image: str) -> dict:
    """Return a minimal, schema-shaped IR skeleton. Useful for tests/fixtures."""
    return {
        "ir_schema_version": CANONICAL_IR_SCHEMA_VERSION,
        "schema_name": schema_name,
        "tables": [],
        "relationships": [],
        "metadata": {
            "tier": tier,
            "source_image": source_image,
            "no_declared_pk_tables": [],
            "parser_confidence": None,
            "extraction_warnings": [],
        },
    }
