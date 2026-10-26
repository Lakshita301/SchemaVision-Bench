"""Recover test-relevant gold constraints from Module 1 source SQL.

This is a deliberately small DDL reader, not a dialect transpiler. It handles
the conventional CREATE TABLE forms used by the benchmark and records parse
limits as warnings so unsupported source constraints are visible in results.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field


@dataclass
class GoldSchemaParseResult:
    ir: dict
    warnings: list[str] = field(default_factory=list)


_CREATE_TABLE = re.compile(
    r"\bCREATE\s+(?:TEMP(?:ORARY)?\s+)?TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?",
    re.IGNORECASE,
)
_ALTER_TABLE = re.compile(r"\bALTER\s+TABLE\s+(?:ONLY\s+)?", re.IGNORECASE)
_CONSTRAINT_PREFIX = re.compile(
    r"^CONSTRAINT\s+(?:\"[^\"]+\"|`[^`]+`|\[[^\]]+\]|\S+)\s+", re.IGNORECASE
)
_COLUMN_MARKER = re.compile(
    r"\b(?:CONSTRAINT|PRIMARY|NOT|NULL|UNIQUE|REFERENCES|CHECK|DEFAULT|"
    r"COLLATE|AUTO_INCREMENT|AUTOINCREMENT|COMMENT|GENERATED)\b",
    re.IGNORECASE,
)

# Keep literal/comment positions stable, so grammar searches cannot discover
# fake CREATE/ALTER/constraint keywords inside a default value or comment.
_QUOTED = re.compile(r"'(?:''|[^'])*'|\"(?:\"\"|[^\"])*\"|`(?:``|[^`])*`|\[(?:\]\]|[^\]])*\]")
_SQL_PART = re.compile(_QUOTED.pattern + r'|--[^\n]*|\#[^\n]*|/\*.*?\*/', re.DOTALL)


def _strip_comments(sql):
    return _SQL_PART.sub(lambda m: ' ' * len(m[0]) if m[0].startswith(('--', '#', '/*')) else m[0], sql)


def _mask_quoted(sql):
    return _QUOTED.sub(lambda m: '~' * len(m[0]), sql)


def _split_top_level(body, separator=','):
    masked = _mask_quoted(body)
    parts, depth, start = [], 0, 0
    for i, char in enumerate(masked):
        if char == '(':
            depth += 1
        elif char == ')':
            depth -= 1
        elif char == separator and depth == 0:
            parts.append(body[start:i].strip())
            start = i + 1
    if body[start:].strip():
        parts.append(body[start:].strip())
    return parts


def _identifier(text: str, start: int = 0) -> tuple[str | None, int]:
    while start < len(text) and text[start].isspace():
        start += 1
    if start >= len(text):
        return None, start
    opener = text[start]
    if opener in ('"', "`", "["):
        closer = "]" if opener == "[" else opener
        end = start + 1
        while end < len(text):
            if text[end] == closer:
                if end + 1 < len(text) and text[end + 1] == closer:
                    end += 2
                    continue
                return text[start + 1:end].replace(closer * 2, closer), end + 1
            end += 1
        return None, len(text)
    end = start
    while end < len(text) and (text[end].isalnum() or text[end] in "_$."):
        end += 1
    if end == start:
        return None, start
    return text[start:end].split(".")[-1], end


def _matching_paren(text: str, opening: int) -> int | None:
    depth = 0
    masked = _mask_quoted(text)
    i = opening
    while i < len(text):
        char = masked[i]
        if char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return None


def _split_definitions(body: str) -> list[str]:
    return _split_top_level(body)


def _column_list(text: str) -> list[str]:
    opening = text.find("(")
    if opening == -1:
        return []
    closing = _matching_paren(text, opening)
    if closing is None:
        return []
    names = []
    for item in _split_definitions(text[opening + 1 : closing]):
        name, _ = _identifier(item)
        if name:
            names.append(name)
    return names


def _check_expression(text: str) -> str | None:
    match = re.search(r"\bCHECK\s*\(", _mask_quoted(text), re.IGNORECASE)
    if not match:
        return None
    opening = text.find("(", match.start())
    closing = _matching_paren(text, opening)
    return text[opening + 1 : closing].strip() if closing is not None else None


def _mark(table: dict, column_name: str, key: str, value: object) -> None:
    for column in table["columns"]:
        if column["name"] == column_name:
            column[key] = value
            return


def _add_fk(table: dict, definition: str, warnings: list[str]) -> None:
    match = re.search(
        r"\bFOREIGN\s+KEY\s*\((?P<columns>[^)]*)\)\s*REFERENCES\s*",
        definition,
        re.IGNORECASE,
    )
    if not match:
        return
    columns = _column_list("(" + match.group("columns") + ")")
    ref_table, after_ref_table = _identifier(definition, match.end())
    reference_tail = definition[after_ref_table:].lstrip()
    ref_columns = _column_list(reference_tail) if reference_tail.startswith('(') else []
    if not columns or not ref_table or (reference_tail.startswith('(') and len(columns) != len(ref_columns)):
        warnings.append(f"Could not parse ground-truth foreign key: {definition!r}")
        return
    action = lambda kind: re.search(
        rf"\bON\s+{kind}\s+(CASCADE|SET\s+NULL|RESTRICT|NO\s+ACTION)", definition, re.IGNORECASE
    )
    on_delete = action("DELETE")
    on_update = action("UPDATE")
    table["foreign_keys"].append(
        {
            "columns": columns,
            "ref_table": ref_table,
            "ref_columns": ref_columns,
            "on_delete": on_delete.group(1).upper() if on_delete else None,
            "on_update": on_update.group(1).upper() if on_update else None,
        }
    )


def _table_constraint(table: dict, definition: str, warnings: list[str]) -> bool:
    tail = _CONSTRAINT_PREFIX.sub("", definition.strip())
    upper = tail.upper()
    if re.match(r"^PRIMARY\s+KEY\b", upper):
        table["primary_key"] = _column_list(tail)
        return True
    if re.match(r"^FOREIGN\s+KEY\b", upper):
        _add_fk(table, tail, warnings)
        return True
    if re.match(r'^UNIQUE\b', upper):
        columns = _column_list(tail)
        if columns:
            table.setdefault('unique_constraints', []).append(columns)
        else:
            warnings.append(f"Could not parse UNIQUE constraint: {definition!r}")
        return True
    if re.match(r'^CHECK\b', upper):
        expression = _check_expression(tail)
        if expression:
            table["check_constraints"].append(expression)
        else:
            warnings.append(f"Could not parse ground-truth CHECK: {definition!r}")
        return True
    # Physical, non-unique indexes are not columns or relational constraints.
    if re.match(r"^(?:KEY|INDEX)\s+", tail, re.IGNORECASE):
        indexed_columns = _column_list(tail)
        known_columns = {c['name'] for c in table['columns']}
        if indexed_columns and set(indexed_columns) <= known_columns:
            return True
    return False


def _column(table: dict, definition: str, warnings: list[str]) -> None:
    name, after_name = _identifier(definition)
    if not name:
        warnings.append(f"Could not parse ground-truth column: {definition!r}")
        return
    tail = definition[after_name:].strip()
    grammar = _mask_quoted(tail)
    marker = _COLUMN_MARKER.search(grammar)
    data_type = tail[:marker.start() if marker else len(tail)].strip() or None
    if data_type is None:
        warnings.append(f"Could not determine data type for '{table['name']}.{name}'.")
    table["columns"].append(
        {
            "name": name,
            "data_type": data_type,
            "nullable": not bool(re.search(r"\bNOT\s+NULL\b", grammar, re.IGNORECASE)),
            "unique": bool(re.search(r"\bUNIQUE\b", grammar, re.IGNORECASE)),
        }
    )
    enum = re.match(r"^ENUM\s*\((.*)\)$", data_type or '', re.IGNORECASE | re.DOTALL)
    if enum:
        members = _split_definitions(enum.group(1))
        if members and all(re.fullmatch(r"\s*'(?:''|[^'])*'\s*", value) for value in members):
            table['check_constraints'].append(f"{name} IN ({', '.join(value.strip() for value in members)})")
        else:
            warnings.append(f"Could not recover exact ENUM membership for '{table['name']}.{name}'.")
    if re.match(r'^SET\s*\(', data_type or '', re.IGNORECASE):
        warnings.append(f"SET domain is outside the supported reference semantics for '{table['name']}.{name}'.")
    if re.search(r"\bPRIMARY\s+KEY\b", grammar, re.IGNORECASE):
        table["primary_key"].append(name)
        _mark(table, name, "nullable", False)
    if re.search(r"\bREFERENCES\b", grammar, re.IGNORECASE):
        ref = re.search(r"\bREFERENCES\s*", grammar, re.IGNORECASE)
        ref_table, after_ref_table = _identifier(tail, ref.end()) if ref else (None, 0)
        reference_tail = tail[after_ref_table:].lstrip()
        ref_columns = _column_list(reference_tail) if reference_tail.startswith('(') else []
        if ref_table and (ref_columns or not reference_tail.startswith('(')):
            action = lambda kind: re.search(
                rf"\bON\s+{kind}\s+(CASCADE|SET\s+NULL|RESTRICT|NO\s+ACTION)",
                tail,
                re.IGNORECASE,
            )
            on_delete = action("DELETE")
            on_update = action("UPDATE")
            table["foreign_keys"].append(
                {"columns": [name], "ref_table": ref_table, "ref_columns": ref_columns,
                 "on_delete": on_delete.group(1).upper() if on_delete else None,
                 "on_update": on_update.group(1).upper() if on_update else None}
            )
        else:
            warnings.append(f"Could not parse inline ground-truth foreign key: {definition!r}")
    for match in re.finditer(r'\bCHECK\s*\(', grammar, re.IGNORECASE):
        expression = _check_expression(tail[match.start():])
        if expression:
            table['check_constraints'].append(expression)


def parse_ground_truth_sql(sql_ddl: str, schema_id: str) -> GoldSchemaParseResult:
    """Create a minimal IR used exclusively for gold Module 4 tests."""
    warnings: list[str] = []
    # The dataset's source DDL is authoritative only after its ALTER statements
    # have been applied in source order. Resolve state before deriving tests;
    # the normalizer helper is imported lazily to avoid a module import cycle.
    from ..module7_evaluation.reference_normalization import _resolved_source_state
    sql_ddl, _, state_warnings = _resolved_source_state(sql_ddl)
    warnings.extend(state_warnings)
    sql_ddl = _strip_comments(sql_ddl)
    grammar = _mask_quoted(sql_ddl)
    if re.search(r'\b(?:MATCH\s+(?:FULL|PARTIAL)|ON\s+(?:UPDATE|DELETE)\s+SET\s+DEFAULT|EXCLUDE|NULLS\s+NOT\s+DISTINCT)\b', grammar, re.I):
        warnings.append('Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).')
    if re.search(r'\$[A-Za-z_0-9]*\$', grammar):
        warnings.append('Dollar-quoted SQL is outside the gold parser supported subset.')
    tables: list[dict] = []
    for match in _CREATE_TABLE.finditer(grammar):
        table_name, after_name = _identifier(sql_ddl, match.end())
        opening = sql_ddl.find("(", after_name)
        if not table_name or opening == -1:
            warnings.append("Could not parse a CREATE TABLE definition.")
            continue
        closing = _matching_paren(sql_ddl, opening)
        if closing is None:
            warnings.append(f"Unbalanced CREATE TABLE definition for '{table_name}'.")
            continue
        table = {"name": table_name, "columns": [], "primary_key": [], "foreign_keys": [], "check_constraints": []}
        for definition in _split_definitions(sql_ddl[opening + 1 : closing]):
            if not _table_constraint(table, definition, warnings):
                _column(table, definition, warnings)
        for pk_column in table["primary_key"]:
            _mark(table, pk_column, "is_primary_key", True)
            _mark(table, pk_column, "nullable", False)
        tables.append(table)
    tables_by_name = {table["name"]: table for table in tables}
    if len(tables_by_name) != len(tables):
        warnings.append("Duplicate CREATE TABLE names: source contains multiple schema variants; review required.")
    for match in _ALTER_TABLE.finditer(grammar):
        table_name, after_name = _identifier(sql_ddl, match.end())
        statement_end = grammar.find(";", after_name)
        definition = sql_ddl[after_name : statement_end if statement_end != -1 else len(sql_ddl)].strip()
        if not table_name or table_name not in tables_by_name:
            warnings.append(f"Unsupported ALTER TABLE target: {definition!r}")
            continue
        table = tables_by_name[table_name]
        for clause in _split_definitions(definition):
            constraint = re.sub(r'^ADD\s+', '', clause, flags=re.IGNORECASE)
            if constraint == clause or not _table_constraint(table, constraint, warnings):
                warnings.append(f"Unsupported ALTER TABLE constraint: {clause!r}")
        for pk_column in table["primary_key"]:
            _mark(table, pk_column, "is_primary_key", True)
            _mark(table, pk_column, "nullable", False)
    if not tables:
        warnings.append("No CREATE TABLE definitions were recovered from ground-truth SQL.")
    # Names in constraint clauses can differ in case from unquoted column
    # declarations. Resolve only exact or unambiguous case-folded matches,
    # consistent with the evaluator's documented identifier policy.
    def resolve(name, choices):
        if name in choices:
            return name
        matches = [c for c in choices if c.casefold() == name.casefold()]
        if len(matches) == 1:
            return matches[0]
        warnings.append(f'Unresolved or ambiguous constraint identifier: {name!r}')
        return name

    for statement in _split_top_level(sql_ddl, ';'):
        match = re.match(r'CREATE\s+UNIQUE\s+INDEX\s+(?:IF\s+NOT\s+EXISTS\s+)?', statement, re.I)
        if not match:
            continue
        _, end = _identifier(statement, match.end())
        on = re.match(r'\s+ON\s+', statement[end:], re.I)
        if not on:
            warnings.append('Unsupported UNIQUE index definition: ' + statement)
            continue
        target, after = _identifier(statement, end + on.end())
        target = resolve(target or '', tables_by_name)
        table = tables_by_name.get(target)
        columns = _column_list(statement[after:])
        opening = statement.find('(', after)
        closing = _matching_paren(statement, opening) if opening >= 0 else None
        simple = closing is not None and not statement[closing+1:].strip()
        if simple:
            for item in _split_definitions(statement[opening+1:closing]):
                _, finish = _identifier(item)
                simple = simple and not item[finish:].strip()
        if not table or not columns or not simple:
            warnings.append('Partial/expression/unsupported UNIQUE index: ' + statement)
            continue
        table.setdefault('unique_constraints', []).append(columns)

    for table in tables:
        names = [c['name'] for c in table['columns']]
        if len(names) != len(set(names)):
            warnings.append(f"Duplicate column names in {table['name']!r}")
        table['primary_key'] = [resolve(c, names) for c in table['primary_key']]
        for c in table['primary_key']:
            _mark(table, c, 'is_primary_key', True)
            _mark(table, c, 'nullable', False)
        unique_sets = [[resolve(c, names) for c in cols] for cols in table.get('unique_constraints', [])]
        table['unique_constraints'] = []
        for cols in unique_sets:
            if len(cols) == 1 and cols[0] in names:
                _mark(table, cols[0], 'unique', True)
            elif cols not in table['unique_constraints']:
                table['unique_constraints'].append(cols)
        for fk in table['foreign_keys']:
            fk['columns'] = [resolve(c, names) for c in fk['columns']]
            fk['ref_table'] = resolve(fk['ref_table'], tables_by_name)
            remote = tables_by_name.get(fk['ref_table'])
            if remote:
                if not fk['ref_columns']:
                    # SQL REFERENCES parent without a column list means its
                    # declared PK, not an inferred/added key or arbitrary UNIQUE.
                    fk['ref_columns'] = list(remote['primary_key'])
                fk['ref_columns'] = [resolve(c, [col['name'] for col in remote['columns']]) for c in fk['ref_columns']]
            if not fk['ref_columns'] or len(fk['ref_columns']) != len(fk['columns']):
                warnings.append(f"FK {table['name']}.{fk['columns']} has no compatible declared referenced key in {fk['ref_table']!r}.")
    return GoldSchemaParseResult(
        ir={
            "schema_name": schema_id,
            "tables": tables,
            "relationships": [],
            "metadata": {"tier": "unknown", "source_image": "ground_truth_sql"},
        },
        warnings=warnings,
    )
