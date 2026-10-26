"""
Deterministic value synthesis for Module 4.

Two responsibilities live here:

1. ValueFactory: turn an IR column's `data_type` string into a
   concrete, type-plausible literal Python value (and render it as a
   SQL literal). Every value is unique within a factory instance via
   a monotonic counter, so synthesized rows never accidentally collide
   with each other on a UNIQUE/PK column.

2. EnsureRowBuilder: given the IR's tables/columns/foreign_keys, build
   a fully valid row for a table -- recursively creating whatever
   parent rows its foreign keys require first -- entirely in SQL
   string form, with no database involved. Handles:
     - composite primary keys / composite foreign keys (columns are
       always treated as lists)
     - self-referencing foreign keys (e.g. replies.parent_reply_id ->
       replies.id) via nullable-fallback + cycle detection
     - tables with no declared primary key (common in this dataset;
       flagged by the plan's own audit notes)
"""

from __future__ import annotations

import re
from datetime import date, datetime, timedelta
from typing import Any, Optional


class ValueFactory:
    """Generates unique, type-plausible dummy values for one test case."""

    def __init__(self, seed_start: int = 0):
        self._counter = seed_start

    def _next(self) -> int:
        self._counter += 1
        return self._counter

    def dummy_value(self, data_type: Optional[str]) -> Any:
        """A fresh, type-plausible, unique-within-this-factory value."""
        n = self._next()
        dt = (data_type or "").lower()

        length = None
        m = re.search(r"\((\d+)", dt)
        if m:
            try:
                length = int(m.group(1))
            except ValueError:
                length = None

        if "bool" in dt:
            return n % 2 == 1
        bit = re.fullmatch(r'bit(?:\s+varying)?(?:\s*\(\s*(\d+)\s*\))?', dt.strip())
        if bit:
            width = int(bit[1] or 1)
            if not 1 <= width <= 4096:
                raise ValueError('BIT fixture width outside the supported 1..4096 range')
            return format((n - 1) % (2 ** width - 1) + 1, f'0{width}b')
        if dt.strip() == 'money':
            return f'{n}.00'
        if any(k in dt for k in ("int", "serial", "smallint", "bigint")):
            return 1000 + n
        if any(k in dt for k in ("float", "double", "real", "numeric", "decimal", "number")):
            precision = re.search(r'(?:numeric|decimal|number)\s*\((\d+)(?:\s*,\s*(\d+))?\)', dt)
            if precision:
                p, s = int(precision[1]), int(precision[2] or 0)
                return ((n - 1) % max(1, 10 ** p - 1) + 1) / (10 ** s)
            return 1.0 + n
        if "uuid" in dt:
            return f"00000000-0000-0000-0000-{n:012d}"
        if "timestamp" in dt or ("date" in dt and "time" in dt):
            return (datetime(2024, 1, 1) + timedelta(seconds=n)).isoformat(sep=' ')
        if "date" in dt:
            return (date(2024, 1, 1) + timedelta(days=n)).isoformat()
        if "time" in dt:
            return (datetime(2024, 1, 1) + timedelta(seconds=n)).time().isoformat()
        if "json" in dt:
            return "{}"
        if any(k in dt for k in ("blob", "binary", "bytea")):
            return f"blob{n}".encode("utf-8")

        val = f"val_{n}"
        if re.fullmatch(r'(?:char|character|nchar)', dt.strip()):
            length = 1  # SQL defaults unqualified CHAR to a single character.
        if length is not None and length > 0:
            val = val[-length:]
        return val

    def sentinel_invalid_value(self, data_type: Optional[str]) -> Any:
        """
        A value guaranteed not to collide with anything dummy_value()
        would ever produce, for foreign_key_reject_invalid_parent
        tests -- it must look like it could plausibly belong to the
        column's type family (so the insert doesn't fail for an
        unrelated type-mismatch reason) while being certain not to
        match any real parent key we synthesized.
        """
        dt = (data_type or "").lower()
        bit = re.fullmatch(r'bit(?:\s+varying)?(?:\s*\(\s*(\d+)\s*\))?', dt.strip())
        if bit:
            width = int(bit[1] or 1)
            if not 1 <= width <= 4096:
                raise ValueError('BIT fixture width outside the supported 1..4096 range')
            return '0' * width
        if dt.strip() == 'money':
            return '-1.00'
        numeric = any(
            k in dt
            for k in ("int", "serial", "smallint", "bigint", "float", "double", "real", "numeric", "decimal", "number")
        )
        if numeric:
            precision = re.search(r'(?:numeric|decimal|number)\s*\((\d+)\s*,\s*(\d+)\)', dt)
            if precision:
                return -1 / (10 ** int(precision[2]))
            return -1
        if 'uuid' in dt:
            return 'ffffffff-ffff-ffff-ffff-ffffffffffff'
        if 'timestamp' in dt:
            return '2099-12-31 23:59:59'
        if 'date' in dt:
            return '2099-12-31'
        if 'time' in dt:
            return '23:59:59'
        if 'bool' in dt:
            return False
        if any(k in dt for k in ('blob', 'binary', 'bytea')):
            return b'\xff'
        length = re.search(r'\((\d+)\)', dt)
        if re.fullmatch(r'(?:char|character|nchar)', dt.strip()):
            return '~'
        return ('~' * min(int(length.group(1)), 24)) if length else '__ER2SQL_NONEXISTENT_FK_VALUE__'

    def sql_literal(self, value: Any) -> str:
        if value is None:
            return "NULL"
        if isinstance(value, bool):
            return "TRUE" if value else "FALSE"
        if isinstance(value, (int, float)):
            return str(value)
        if isinstance(value, bytes):
            return "decode('" + value.hex() + "', 'hex')"
        escaped = str(value).replace("'", "''")
        return f"'{escaped}'"


def build_schema_index(ir: dict) -> dict:
    """A simple name -> table-dict lookup over the canonical IR."""
    tables = {}
    for t in ir.get("tables", []) or []:
        tables[t["name"]] = t
    return {"tables": tables}


class EnsureRowBuilder:
    """
    Builds INSERT statements for one test case's setup, resolving
    foreign-key dependencies recursively. Each instance is meant to be
    used for exactly one TestCase, then discarded.
    """

    def __init__(self, index: dict, value_factory: ValueFactory):
        self.index = index
        self.vf = value_factory
        self.ensured: dict[str, dict] = {}  # table_name -> the one canonical row already inserted for it
        self.setup_sql: list[str] = []
        self.warnings: list[str] = []
        self.isolate_parent_table: Optional[str] = None
        self.isolate_fk_columns: frozenset = frozenset()
        self.isolate_fk_table: Optional[str] = None

    def _col_nullable(self, table: dict, col_name: str) -> bool:
        for col in table.get("columns", []) or []:
            if col["name"] == col_name:
                # Explicit False means NOT NULL. Anything else (True,
                # None, or the key missing) is treated as nullable --
                # we never assume NOT NULL without positive evidence.
                return col.get("nullable") is not False
        return True

    def _col_type(self, table: dict, col_name: str) -> Optional[str]:
        for col in table.get("columns", []) or []:
            if col["name"] == col_name:
                return col.get("data_type")
        return None

    def _reaches(self, start: str, target: str, seen=frozenset()) -> bool:
        if start == target:
            return True
        if start in seen:
            return False
        table = self.index['tables'].get(start, {})
        return any(self._reaches(fk.get('ref_table'), target, seen | {start})
                   for fk in table.get('foreign_keys', []) if fk.get('ref_table'))

    def build_row_values(
        self,
        table_name: str,
        forced_values: Optional[dict] = None,
        visiting: frozenset = frozenset(),
        skip_fk: Optional[dict] = None,
    ) -> Optional[dict]:
        """
        Compute a full, valid {column_name: value} row for table_name
        WITHOUT inserting it anywhere. `forced_values` lets the caller
        pin specific columns (e.g. the foreign key under test) while
        every other column -- including this table's OTHER foreign
        keys -- is still resolved normally (recursively creating
        parent rows via self.ensure_row as needed, which DOES append
        to self.setup_sql).
        """
        forced_values = forced_values or {}
        table = self.index["tables"].get(table_name)
        if table is None:
            self.warnings.append(
                f"Cannot synthesize a row for unknown table '{table_name}' "
                f"(referenced by a foreign key but not defined in this IR)."
            )
            return None

        columns = table.get("columns", []) or []
        fks = table.get("foreign_keys", []) or []
        check_columns = set()
        if table.get('check_constraints'):
            from .check_solver import leaves, parsed_checks
            check_nodes, _ = parsed_checks(table)
            check_columns = {name for _, node in check_nodes for kind, name in leaves(node)
                             if kind == 'column'}
        row: dict = {}
        resolved_cols = set(forced_values.keys())
        row.update(forced_values)

        # Generate non-FK values first. Besides being deterministic, this
        # makes a NOT NULL self-reference satisfiable when its referenced
        # key is another column of this same row (e.g. oid REFERENCES id).
        fk_column_names = {c for fk in fks for c in (fk.get("columns") or [])}
        for col in columns:
            cname = col["name"]
            if cname not in resolved_cols and cname not in fk_column_names:
                row[cname] = self.vf.dummy_value(col.get("data_type"))

        for fk in fks:
            if fk is skip_fk:
                fk_cols = fk.get('columns') or []
                ref_table = fk.get('ref_table')
                ref_cols = fk.get('ref_columns') or []
                valid_pairs = [(c, rc) for c, rc in zip(fk_cols, ref_cols)
                               if c not in forced_values]
                if ref_table and valid_pairs:
                    parent_row = self.ensure_row(
                        ref_table, visiting | {table_name},
                        forced_values={rc: row[c] for c, rc in valid_pairs if c in row},
                    )
                    if parent_row is not None:
                        for c, rc in valid_pairs:
                            row[c] = parent_row.get(rc)
                            resolved_cols.add(c)
                continue
            fk_cols = fk.get("columns") or []
            ref_table = fk.get("ref_table")
            ref_cols = fk.get("ref_columns") or []
            if not fk_cols or not ref_table or not ref_cols:
                continue
            if all(c in resolved_cols for c in fk_cols):
                # Pinned columns may participate in more than one FK. Every
                # referenced table still needs a matching parent witness.
                required_parent = {rc: row[c] for c, rc in zip(fk_cols, ref_cols)
                                   if row.get(c) is not None}
                if required_parent and ref_table != table_name:
                    ensure = self.ensure_row
                    target_relationship = (table_name == self.isolate_fk_table
                                           and frozenset(fk_cols) == self.isolate_fk_columns)
                    if ref_table == self.isolate_parent_table and not target_relationship:
                        ensure = self.ensure_additional_row
                    ensure(ref_table, visiting | {table_name}, forced_values=required_parent)
                continue

            all_nullable = all(self._col_nullable(table, c) for c in fk_cols)

            # Optional relationships need not point at a row. Leaving them
            # NULL avoids accidental dependent rows that contaminate a later
            # RESTRICT/NO ACTION deletion test.
            if all_nullable and not (set(fk_cols) & check_columns) and not (set(fk_cols) & resolved_cols):
                for c in fk_cols:
                    if c not in resolved_cols:
                        row[c] = None
                        resolved_cols.add(c)
                continue

            # A self-FK can be valid without recursion if this row already
            # contains the referenced key value(s).
            if ref_table == table_name and all(rc in row for rc in ref_cols):
                for c, rc in zip(fk_cols, ref_cols):
                    if c not in resolved_cols:
                        row[c] = row[rc]
                        resolved_cols.add(c)
                continue

            # A materialized parent can be reused even when a caller marks it
            # visited. Two FKs to one parent are not a recursive dependency.
            if ref_table in self.ensured:
                if (ref_table == self.isolate_parent_table
                        and not (table_name == self.isolate_fk_table
                                 and frozenset(fk_cols) == self.isolate_fk_columns)):
                    other_parent = self.ensure_additional_row(ref_table)
                    if other_parent is not None:
                        for c, rc in zip(fk_cols, ref_cols):
                            if c not in resolved_cols:
                                row[c] = other_parent.get(rc)
                                resolved_cols.add(c)
                    continue
                for c, rc in zip(fk_cols, ref_cols):
                    if c in resolved_cols:
                        continue
                    row[c] = self.ensured[ref_table].get(rc)
                    resolved_cols.add(c)
                continue

            if ref_table == table_name or ref_table in visiting or (all_nullable and self._reaches(ref_table, table_name)):
                # Self-referencing or cyclic FK chain: cannot safely
                # recurse further.
                if all_nullable:
                    for c in fk_cols:
                        if c in resolved_cols:
                            continue
                        row[c] = None
                        resolved_cols.add(c)
                else:
                    self.warnings.append(
                        f"table '{table_name}': NOT NULL self-referencing/cyclic "
                        f"foreign key {fk_cols} could not be safely resolved to a "
                        f"real parent; no fixture was generated."
                    )
                    return None
                continue

            required_parent = {rc:row[c] for c, rc in zip(fk_cols, ref_cols)
                               if c in resolved_cols and row[c] is not None}
            ensure = self.ensure_row
            if (ref_table == self.isolate_parent_table
                    and not (table_name == self.isolate_fk_table
                             and frozenset(fk_cols) == self.isolate_fk_columns)):
                ensure = self.ensure_additional_row
            parent_row = ensure(ref_table, visiting | {table_name}, forced_values=required_parent)
            if parent_row is None:
                if all_nullable:
                    for c in fk_cols:
                        if c in resolved_cols:
                            continue
                        row[c] = None
                        resolved_cols.add(c)
                else:
                    self.warnings.append(
                        f"table '{table_name}': could not synthesize a required "
                        f"parent row in '{ref_table}' for NOT NULL foreign key "
                        f"{fk_cols}; no fixture was generated."
                    )
                    return None
                continue

            for c, rc in zip(fk_cols, ref_cols):
                if c in resolved_cols:
                    continue
                row[c] = parent_row.get(rc)
                resolved_cols.add(c)

        for col in columns:
            cname = col["name"]
            if cname in row:
                continue
            row[cname] = self.vf.dummy_value(col.get("data_type"))

        if table.get('check_constraints'):
            from .check_solver import parsed_checks, witness
            nodes, _ = parsed_checks(table)
            # Preserve the deliberately pinned negative-test values and FKs.
            fitted = witness(table, nodes, row, locked=resolved_cols)
            if fitted is not None:
                row = fitted
            else:
                self.warnings.append(f"No bounded CHECK-compatible fixture found for '{table_name}'.")
                return None

        return row

    def ensure_row(self, table_name: str, visiting: frozenset = frozenset(), forced_values=None) -> Optional[dict]:
        """
        Return a valid row for table_name, inserting it (and any
        parents it needs) into self.setup_sql if one hasn't already
        been ensured this session. Reuses the same row on repeat
        calls so multiple tests referencing the same parent don't
        each insert a fresh duplicate.
        """
        if table_name in self.ensured:
            if any(self.ensured[table_name].get(c) != v for c,v in (forced_values or {}).items()):
                self.warnings.append(f"Conflicting overlapping FK parent fixture for '{table_name}'.")
                return None
            return self.ensured[table_name]
        if table_name in visiting:
            return None  # cycle guard

        row = self.build_row_values(table_name, forced_values=forced_values, visiting=visiting)
        if row is None:
            return None

        insert_sql = self.build_insert(table_name, row)
        self.setup_sql.append(insert_sql)
        self.ensured[table_name] = row
        return row

    def ensure_additional_row(self, table_name: str, visiting: frozenset = frozenset(),
                              forced_values=None) -> Optional[dict]:
        """Insert another valid row without replacing the canonical fixture row.

        Used when a second test row must keep one target value duplicated but
        avoid colliding on a separate UNIQUE foreign-key column.
        """
        row = self.build_row_values(table_name, forced_values=forced_values, visiting=visiting)
        if row is None:
            return None
        table = self.index['tables'][table_name]
        unique_keys = []
        if table.get('primary_key'):
            unique_keys.append(set(table['primary_key']))
        unique_keys.extend({c['name']} for c in table.get('columns', []) if c.get('unique'))
        unique_keys.extend(set(key) for key in table.get('unique_constraints', []))
        for fk in table.get('foreign_keys', []) or []:
            local = fk.get('columns') or []
            remote = fk.get('ref_columns') or []
            parent = fk.get('ref_table')
            if not local or not remote or not parent or set(local) & set((forced_values or {}).keys()):
                continue
            if not any(set(local) <= key for key in unique_keys):
                continue
            if parent in visiting or parent == table_name:
                self.warnings.append(f"Cannot diversify unique FK {table_name}.{local}: cyclic fixture dependency.")
                continue
            alternate_parent = self.ensure_additional_row(parent, visiting=visiting | {table_name})
            if alternate_parent is not None:
                for local_col, remote_col in zip(local, remote):
                    row[local_col] = alternate_parent.get(remote_col)
        self.setup_sql.append(self.build_insert(table_name, row))
        return row

    def build_insert(self, table_name: str, row_values: dict) -> str:
        cols = list(row_values.keys())
        vals = [self.vf.sql_literal(row_values[c]) for c in cols]
        cols_sql = ", ".join(f'"{c}"' for c in cols)
        vals_sql = ", ".join(vals)
        # Fixtures provide deterministic keys even for GENERATED ALWAYS AS
        # IDENTITY. PostgreSQL also permits this on tables without identity.
        # Sequence/default generation is not part of these constraint tests.
        return f'INSERT INTO "{table_name}" ({cols_sql}) OVERRIDING SYSTEM VALUE VALUES ({vals_sql});'
