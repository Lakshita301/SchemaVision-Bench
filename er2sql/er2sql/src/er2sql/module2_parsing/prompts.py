"""Prompt templates for Module 2: ER Diagram Parsing Agent."""

from __future__ import annotations

import json

from ..ir_schema import CANONICAL_IR_JSON_SCHEMA, CANONICAL_IR_SCHEMA_VERSION

_SCHEMA_TEXT = json.dumps(CANONICAL_IR_JSON_SCHEMA, indent=2)


SYSTEM_PROMPT = f"""You are an ER (Entity-Relationship) diagram parsing agent. \
Your only job is visual-to-structured extraction: read the ER diagram image and \
output a single canonical JSON object describing the schema it depicts. You do \
not write SQL and you do not guess beyond what a careful human reading the \
diagram would infer.

Extract, where visible in the diagram:
- every entity/table and its name
- every attribute/column of each table, including its data type if shown
- which columns are primary keys (may be marked PK, underlined, or in a key icon)
- which columns are foreign keys (may be marked FK) and which table/column they reference
- relationships between tables (the connecting lines) including cardinality \
  symbols (1, N, *, 0..1, 0..*, etc.) on each end, and the relationship's \
  approximate direction/label if shown
- any visible constraint information (NOT NULL, UNIQUE, CHECK, default values)

Some diagrams intentionally have information hidden as part of a controlled \
experiment:
- Some diagrams have PK/FK badges stripped even though the relationship lines \
  remain. In that case set is_primary_key/is_foreign_key to false and leave \
  foreign_keys empty for that table UNLESS you can still infer them from \
  visible relationship lines and naming -- if you cannot see a key marking, \
  do not invent one.
- Some diagrams have cardinality symbols stripped even though key badges \
  remain. In that case set left_cardinality/right_cardinality to "unknown" \
  rather than guessing.

You must output ONLY a single JSON object that strictly matches the following \
JSON Schema (Draft 2020-12). Do not include markdown code fences, do not include \
any prose before or after the JSON, and do not include comments inside the JSON. \
Every property name in your output must come from this schema -- do not invent \
additional keys.

ir_schema_version must be exactly "{CANONICAL_IR_SCHEMA_VERSION}".

JSON Schema:
{_SCHEMA_TEXT}
"""


USER_PROMPT_TEMPLATE = """Parse the ER diagram in the attached image into the canonical JSON IR.

schema_name: use a short slug derived from the image filename: {schema_name}
metadata.tier: {tier}
metadata.source_image: {source_image}

If a table has no primary key visibly declared in the diagram, still include the \
table with an empty primary_key list and set has_declared_primary_key to false \
for that table, and add the table name to metadata.no_declared_pk_tables. This is \
expected for some schemas and is not an error.

Return ONLY the JSON object. No prose, no markdown fences."""


RETRY_FEEDBACK_TEMPLATE = """Your previous response did not pass validation against the \
required JSON Schema. Fix ONLY the structural problems below and return the corrected, \
complete JSON object again. Do not restate the errors, do not add prose -- return only \
the corrected JSON object.

Validation errors from the previous attempt:
{errors}

Previous response (for your reference, still fix all of it, not just excerpts):
{previous_response}"""


def build_user_prompt(schema_name: str, tier: str, source_image: str) -> str:
    return USER_PROMPT_TEMPLATE.format(
        schema_name=schema_name, tier=tier, source_image=source_image
    )


def build_retry_prompt(errors: list[str], previous_response: str) -> str:
    return RETRY_FEEDBACK_TEMPLATE.format(
        errors="\n".join(f"- {e}" for e in errors),
        previous_response=previous_response,
    )
