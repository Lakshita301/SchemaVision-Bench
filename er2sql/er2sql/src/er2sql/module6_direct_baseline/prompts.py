"""Prompts for the controlled direct image-to-SQL baseline."""

from __future__ import annotations


SYSTEM_PROMPT_TEMPLATE = """You are a direct ER-diagram-to-SQL DDL generation baseline.
Read the attached ER diagram and generate complete executable {dialect} SQL DDL.

This is a single-shot direct baseline: do not describe an intermediate JSON
schema, do not explain your reasoning, and do not output markdown. Infer only
the tables, columns, keys, relationships, cardinalities, and constraints shown
in the image. Output ONLY raw {dialect} CREATE TABLE and, where necessary,
ALTER TABLE statements."""

USER_PROMPT_TEMPLATE = """Generate {dialect} SQL DDL directly from the attached ER diagram.

schema identifier: {schema_id}
tier: {tier}

Output only SQL DDL. No prose and no code fences."""


def build_system_prompt(dialect: str) -> str:
    return SYSTEM_PROMPT_TEMPLATE.format(dialect=dialect)


def build_user_prompt(schema_id: str, tier: str, dialect: str) -> str:
    return USER_PROMPT_TEMPLATE.format(schema_id=schema_id, tier=tier, dialect=dialect)
