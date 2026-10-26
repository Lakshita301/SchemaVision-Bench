"""Source-based, conservative PostgreSQL candidates. Never approves a review.

Lexically protects strings/comments/quoted names and edits only column type
positions and known table options. Does not construct a reference from the
test generator's IR. Candidates may still be non-executable or non-equivalent;
each change and blocker is recorded for independent semantic review.
"""
import argparse
import hashlib
import re
from pathlib import Path

from ..config import load_config
from ..module4_constraint_tests.gold_schema import _identifier, _matching_paren, _split_definitions, parse_ground_truth_sql
from ..utils.io_utils import read_json, write_json, write_text

POLICY = 'postgres-reference-candidates-v5.2'
CONVERTER_VERSION = 'postgres-reference-candidates-v5.2.0'
PROTECTED = re.compile(r'''--[^\n]*|\#[^\n]*|/\*.*?\*/|'(?:''|[^'])*'|"(?:""|[^"])*"|`(?:``|[^`])*`|\[[A-Za-z_](?:\]\]|[^\]])*\]''', re.DOTALL)
CREATE = re.compile(r'\bCREATE\s+(?:TEMP(?:ORARY)?\s+)?TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?(?P<table>[\w$.]+)\s*\(', re.I)
TYPE_MAP = {'tinyint':'SMALLINT', 'mediumint':'INTEGER', 'datetime':'TIMESTAMP',
            'longtext':'TEXT', 'mediumtext':'TEXT', 'tinytext':'TEXT',
            'longblob':'BYTEA', 'mediumblob':'BYTEA', 'tinyblob':'BYTEA', 'blob':'BYTEA',
            'varchar2':'VARCHAR', 'nvarchar':'VARCHAR', 'nvarchar2':'VARCHAR', 'nchar':'CHAR',
            'number':'NUMERIC', 'clob':'TEXT', 'nclob':'TEXT', 'longvarbinary':'BYTEA',
            'float':'REAL'}


def _policy_category(change):
    rules = (
        ('Removed integer display width', 'integer_display_width_removal'),
        ('Identity spelling', 'identity_by_default'),
        ('Type ', 'approved_type_mapping'),
        ('NUMBER wildcard precision', 'number_wildcard_to_numeric'),
        ('DOUBLE precision/scale', 'double_precision_mapping'),
        ('BINARY/VARBINARY', 'binary_to_bytea'),
        ('ENUM ->', 'enum_membership_check'),
        ('Unsigned integer widened', 'unsigned_integer_widening'),
        ('Column COMMENT literal', 'comment_metadata_conversion'),
        ('Table COMMENT literal', 'comment_metadata_conversion'),
        ('Inline ordinary index', 'ordinary_index_translation'),
        ('Named UNIQUE KEY/INDEX', 'unique_index_translation'),
        ('Named/unnamed UNIQUE', 'unique_index_translation'),
        ('Removed physical ENGINE', 'physical_option_removal'),
        ('Installed FKs', 'foreign_key_relocation'),
        ('Backtick identifier', 'quoted_identifier_case_policy'),
        ('Bracket identifier', 'quoted_identifier_case_policy'),
        ('Quoted reserved bare table', 'reserved_identifier_quoting'),
        ('Quoted reserved bare identifier', 'reserved_identifier_quoting'),
        ('Removed collation', 'collation_out_of_scope'),
        ('Removed ON UPDATE CURRENT_TIMESTAMP', 'on_update_timestamp_out_of_scope'),
        ('Applied source ALTER TABLE', 'resolved_source_alter_state'),
        ('Applied no-op source ALTER TABLE', 'resolved_source_alter_state'),
        ('Removed trailing comma', 'trailing_comma_removal'),
        ('Removed zero-date default', 'zero_date_default_removed'),
        ('Removed column CHARACTER SET', 'column_character_set_removed'),
        ('FLOAT(p,s)', 'float_precision_mapping'),
        ('Unnamed index', 'unnamed_index_translation'),
        ('Normalized CURRENT_TIMESTAMP', 'timestamp_call_normalization'),
        ('Normalized MySQL CURRENT_TIMESTAMP', 'timestamp_call_normalization'),
        ('Removed source schema prefix', 'source_schema_prefix_removed'),
        ('Converted # comment', 'hash_comment_conversion'),
        ('Converted integer boolean default', 'boolean_default_conversion'),
    )
    for prefix, category in rules:
        if change.startswith(prefix):
            return category
    return None


def _split_statements(sql):
    """Split SQL at semicolons outside protected strings/comments/identifiers."""
    masked = PROTECTED.sub(lambda m: re.sub(r'[^\n]', ' ', m.group()), sql)
    starts, statements = 0, []
    for index, char in enumerate(masked):
        if char == ';':
            statement = sql[starts:index + 1].strip()
            if statement:
                statements.append(statement)
            starts = index + 1
    tail = sql[starts:].strip()
    if tail:
        statements.append(tail)
    return statements


def _resolved_source_state(source):
    """Apply supported ALTER ADD/DROP operations to source CREATE state in order.

    Unsupported operations are retained as blockers. This intentionally does
    not guess at conflicting table definitions, generated constraints, or
    implicit CASCADE effects.
    """
    changes, blockers = [], []
    tables, extras = {}, []
    table_pattern = re.compile(r'\bCREATE\s+(?:TEMP(?:ORARY)?\s+)?TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?', re.I)
    alter_pattern = re.compile(r'\bALTER\s+TABLE\s+(?:ONLY\s+)?', re.I)
    for statement in _split_statements(source):
        # Preserve quoted identifier spellings so the keyword regex's trailing
        # whitespace cannot consume a masked table name; mask only literals and
        # comments that might contain fake CREATE/ALTER tokens.
        scan = PROTECTED.sub(
            lambda m: (m.group() if m.group().startswith(('"', '`', '['))
                      else re.sub(r'[^\n]', ' ', m.group())), statement)
        create = table_pattern.search(scan)
        if create:
            name, after_name = _identifier(statement, create.end())
            opening = statement.find('(', after_name)
            closing = _matching_paren(statement, opening) if opening >= 0 else None
            if not name or closing is None:
                blockers.append('Could not resolve CREATE TABLE state before applying ALTER statements.')
                extras.append(statement)
                continue
            key = name.casefold()
            if key in tables:
                blockers.append(f"Conflicting duplicate CREATE TABLE definitions for {name!r}; authoritative definition is ambiguous.")
                extras.append(statement)
                continue
            tables[key] = {'name':name, 'prefix':statement[:opening + 1],
                           'definitions':_split_definitions(statement[opening + 1:closing]),
                           'suffix':statement[closing:]}
            continue
        alter = alter_pattern.search(scan)
        if not alter:
            extras.append(statement)
            continue
        table_name, after_table = _identifier(statement, alter.end())
        state = tables.get((table_name or '').casefold())
        if not table_name or state is None:
            blockers.append(f'ALTER TABLE target {table_name!r} is not resolvable in source order.')
            extras.append(statement)
            continue
        body = statement[after_table:].strip().rstrip(';').strip()
        clauses = _split_definitions(body)
        applied = True
        for clause in clauses:
            add = re.match(r'^ADD\s+(?:COLUMN\s+)?(?:IF\s+NOT\s+EXISTS\s+)?(?P<definition>.+)$', clause, re.I | re.S)
            if add:
                definition = add['definition'].strip()
                is_constraint = bool(re.match(r'^(?:CONSTRAINT\b|PRIMARY(?:\s+KEY)?\b|FOREIGN\s+KEY\b|UNIQUE\b|CHECK\b|KEY\b|INDEX\b)', definition, re.I))
                if not is_constraint:
                    column_name, _ = _identifier(definition)
                    duplicate = any((_identifier(d)[0] or '').casefold() == (column_name or '').casefold()
                                    for d in state['definitions']
                                    if not re.match(r'^(?:CONSTRAINT\b|PRIMARY\b|FOREIGN\b|UNIQUE\b|CHECK\b)', d, re.I))
                    if not column_name or duplicate:
                        blockers.append(f'ALTER TABLE ADD COLUMN has missing or duplicate identifier: {clause!r}')
                        applied = False
                        continue
                state['definitions'].append(definition)
                changes.append(f'Applied source ALTER TABLE ADD in source order ({table_name}).')
                continue
            drop_fk = re.match(r'^DROP\s+FOREIGN\s+KEY\s+(?:IF\s+EXISTS\s+)?([\w$]+)$', clause, re.I)
            drop_constraint = re.match(r'^DROP\s+CONSTRAINT\s+(?:IF\s+EXISTS\s+)?([\w$]+)$', clause, re.I)
            drop_index = re.match(r'^DROP\s+INDEX\s+(?:IF\s+EXISTS\s+)?([\w$]+)$', clause, re.I)
            drop_column = re.match(r'^DROP\s+COLUMN\s+(?:IF\s+EXISTS\s+)?(.+)$', clause, re.I)
            if drop_fk or drop_constraint or drop_index:
                target = (drop_fk or drop_constraint or drop_index)[1].strip('"`[]').casefold()
                matches = []
                for idx, definition in enumerate(state['definitions']):
                    named = re.match(r'^CONSTRAINT\s+["`\[]?([\w$]+)', definition, re.I)
                    fk_named = re.match(r'^FOREIGN\s+KEY\s+["`\[]?([\w$]+)', definition, re.I)
                    index_named = re.match(r'^(?:UNIQUE\s+)?(?:KEY|INDEX)\s+["`\[]?([\w$]+)', definition, re.I)
                    explicit = named or fk_named or index_named
                    if explicit and explicit[1].casefold() == target:
                        matches.append(idx)
                    # MySQL's predictable implicit FK names are tracked for
                    # unnamed table FKs (table_ibfk_N); arbitrary names remain
                    # unresolved instead of deleting the wrong constraint.
                    elif drop_fk and re.match(r'^(?:CONSTRAINT\s+\S+\s+)?FOREIGN\s+KEY\b', definition, re.I):
                        fk_defs = [d for d in state['definitions'][:idx + 1]
                                   if re.match(r'^(?:CONSTRAINT\s+\S+\s+)?FOREIGN\s+KEY\b', d, re.I)]
                        implicit = f"{state['name']}_ibfk_{len(fk_defs)}".casefold()
                        if target == implicit:
                            matches.append(idx)
                if len(matches) == 1:
                    state['definitions'].pop(matches[0])
                    changes.append(f'Applied source ALTER TABLE DROP in source order ({table_name}).')
                elif not matches and 'IF EXISTS' in clause.upper():
                    changes.append(f'Applied no-op source ALTER TABLE DROP IF EXISTS ({table_name}).')
                else:
                    blockers.append(f'Unresolved or ambiguous ALTER TABLE constraint/index drop: {clause!r}')
                    applied = False
                continue
            if drop_column:
                target, end = _identifier(drop_column[1])
                dependent = []
                for definition in state['definitions']:
                    if re.match(r'^(?:CONSTRAINT\b|PRIMARY\b|FOREIGN\b|UNIQUE\b|CHECK\b)', definition, re.I):
                        if re.search(rf'(?<![\w$])(?:"{re.escape(target or "")}"|`{re.escape(target or "")}`|\b{re.escape(target or "")}\b)(?![\w$])', definition, re.I):
                            dependent.append(definition)
                indices = [i for i, d in enumerate(state['definitions'])
                           if (_identifier(d)[0] or '').casefold() == (target or '').casefold()]
                if not target or len(indices) != 1 or dependent:
                    blockers.append(f'ALTER TABLE DROP COLUMN is unresolved or still has declared dependent constraints: {clause!r}')
                    applied = False
                else:
                    state['definitions'].pop(indices[0])
                    changes.append(f'Applied source ALTER TABLE DROP COLUMN in source order ({table_name}).')
                continue
            if re.match(r'^DROP\s+PRIMARY\s+KEY$', clause, re.I):
                indices = [i for i, d in enumerate(state['definitions']) if re.match(r'^(?:CONSTRAINT\s+\S+\s+)?PRIMARY\s+KEY\b', d, re.I)]
                if len(indices) == 1:
                    state['definitions'].pop(indices[0])
                    changes.append(f'Applied source ALTER TABLE DROP PRIMARY KEY in source order ({table_name}).')
                else:
                    blockers.append(f'ALTER TABLE DROP PRIMARY KEY is unresolved or ambiguous: {clause!r}')
                    applied = False
                continue
            blockers.append(f'Unsupported ALTER TABLE operation; not applied: {clause!r}')
            applied = False
        if not applied:
            # Keep unsupported source SQL visible in the output for diagnosis;
            # the blocker prevents promotion to an oracle.
            extras.append(statement)
    if not tables or not changes:
        return source, changes, blockers
    statements = [s['prefix'] + '\n    ' + ',\n    '.join(s['definitions']) + '\n' + s['suffix']
                  for s in tables.values()]
    statements.extend(extras)
    return '\n'.join(s.rstrip().rstrip(';') + ';' for s in statements if s.strip()), changes, blockers


def _identity_tail(tail, dtype, changes, blockers):
    """Propose identities, never assert cross-engine NULL/0/sequence equivalence."""
    if re.search(r'\bGENERATED\b', tail, re.I):
        return tail
    identity = re.search(r'\b(?:AUTO_INCREMENT|AUTOINCREMENT|IDENTITY)\b(?:\s*\(\s*(-?\d+)\s*,\s*(-?\d+)\s*\))?', tail, re.I)
    if not identity:
        return tail
    if dtype not in {'int', 'integer', 'smallint', 'bigint', 'tinyint', 'mediumint'}:
        blockers.append('Identity on a non-integer type needs an explicit representation; left unchanged.')
        return tail
    if re.search(r'\b(?:DEFAULT|UNSIGNED|ZEROFILL)\b', tail, re.I):
        blockers.append('Identity combined with a default/unsigned domain needs review; left unchanged.')
        return tail
    if tail[identity.end():].lstrip().startswith('('):
        blockers.append('Unsupported identity options; left unchanged.')
        return tail
    options = ''
    if identity[1] is not None:
        if int(identity[2]) == 0:
            blockers.append('Identity increment zero is invalid; left unchanged.')
            return tail
        options = f' (START WITH {identity[1]} INCREMENT BY {identity[2]})'
    changes.append('Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.')
    return tail[:identity.start()] + 'GENERATED BY DEFAULT AS IDENTITY' + options + tail[identity.end():]


def _relocate_foreign_keys(masked, changes, blockers, identifiers):
    """Install table FKs after tables/keys, only in a pure additive DDL batch.

    No topological sort can handle mutual FKs. Moving the unchanged declaration
    to ALTER ADD can; do not do so across data writes or schema mutations.
    """
    statements = [s.strip() for s in masked.split(';') if s.strip()]
    additive = all(re.match(r'^(?:CREATE\s+(?:TABLE|(?:UNIQUE\s+)?INDEX)\b|ALTER\s+TABLE\s+[\w$.]+\s+ADD\b)', s, re.I) for s in statements)
    if not additive:
        return masked
    def identifier_key(name):
        # Each occurrence has a different protection token, even when the
        # underlying quoted table name is the same.
        return identifiers.get(name, name).casefold()
    positions = {identifier_key(m['table']): m.start() for m in CREATE.finditer(masked)}
    needs_reordering = False
    for match in CREATE.finditer(masked):
        close = _matching_paren(masked, match.end()-1)
        body = masked[match.end():close] if close is not None else ''
        for ref in re.finditer(r'\bREFERENCES\s+([\w$.]+)', body, re.I):
            if positions.get(identifier_key(ref[1]), -1) > match.start():
                needs_reordering = True
    if not needs_reordering:
        return masked
    patches, deferred = [], []
    for match in CREATE.finditer(masked):
        opening = match.end() - 1
        closing = _matching_paren(masked, opening)
        if closing is None:
            continue
        kept = []
        for definition in _split_definitions(masked[opening+1:closing]):
            if re.match(r'^(?:CONSTRAINT\s+[\w$]+\s+)?FOREIGN\s+KEY\s*\(', definition, re.I):
                deferred.append(f'ALTER TABLE {match["table"]} ADD {definition};')
            else:
                inline = re.search(r'(?:(?P<label>CONSTRAINT\s+[\w$]+)\s+)?(?P<ref>REFERENCES\s+[\w$.]+(?:\s*\([\w$,\s]+\))?(?:\s+MATCH\s+(?:SIMPLE|FULL|PARTIAL))?(?:\s+ON\s+(?:DELETE|UPDATE)\s+(?:CASCADE|RESTRICT|SET\s+NULL|SET\s+DEFAULT|NO\s+ACTION))*(?:\s+(?:NOT\s+)?DEFERRABLE)?(?:\s+INITIALLY\s+(?:DEFERRED|IMMEDIATE))?)\s*$', definition, re.I)
                if inline:
                    column = re.match(r'[\w$]+', definition)[0]
                    label = (inline['label'] + ' ') if inline['label'] else ''
                    deferred.append(f'ALTER TABLE {match["table"]} ADD {label}FOREIGN KEY ({column}) {inline["ref"]};')
                    kept.append(definition[:inline.start()].rstrip())
                else:
                    kept.append(definition)
        patches.append((opening+1, closing, '\n    ' + ',\n    '.join(kept) + '\n'))
    if not deferred:
        return masked
    for start, end, replacement in reversed(patches):
        masked = masked[:start] + replacement + masked[end:]
    changes.append('Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.')
    return masked.rstrip().rstrip(';') + ';\n' + '\n'.join(deferred)


def _strip_source_schema_prefixes(masked, changes, blockers, prefix):
    """Flatten a single source schema into the isolated PostgreSQL namespace."""
    ident = rf'(?:{re.escape(prefix)}\d+__|"(?:[^"]|"")+"|[A-Za-z_$][\w$]*)'
    context = re.compile(
        rf'(?P<ctx>\b(?:CREATE\s+(?:TEMP(?:ORARY)?\s+)?TABLE(?:\s+IF\s+NOT\s+EXISTS)?|'
        rf'REFERENCES|ALTER\s+TABLE(?:\s+ONLY)?|CREATE\s+(?:UNIQUE\s+)?INDEX(?:\s+{ident})?\s+ON|'
        rf'COMMENT\s+ON\s+(?:TABLE|COLUMN))\s+)'
        rf'(?P<schema>{ident})\.(?P<table>{ident})', re.I)
    matches = list(context.finditer(masked))
    schemas = {m['schema'].casefold() for m in matches}
    if len(schemas) > 1:
        blockers.append('Multiple source schema qualifiers occur in table DDL; flattening could merge namespaces.')
        return masked
    if matches:
        masked = context.sub(lambda m: m['ctx'] + m['table'], masked)
        changes.append('Removed source schema prefix; all source relations are isolated in one per-schema PostgreSQL namespace.')
    return masked


def normalize_source(source):
    source, state_changes, state_blockers = _resolved_source_state(source)
    changes, blockers, tokens = list(state_changes), list(state_blockers), []
    # Do not try to handle procedural strings/backslash escaping by guessing.
    if re.search(r'\$[A-Za-z_0-9]*\$', source) or "\\'" in source or re.search(r'/\*!', source):
        return {'sql':source, 'changes':[], 'blockers':['Dollar-quoted/procedural, backslash-escaped or executable-comment SQL requires manual review.']}
    prefix = '__ER2REF_' + hashlib.sha256(source.encode()).hexdigest()[:12] + '_'
    quoted_names = set()
    for match in PROTECTED.finditer(source):
        value = match.group()
        if value.startswith('`'):
            quoted_names.add(value[1:-1].replace('``', '`'))
        elif value.startswith('['):
            quoted_names.add(value[1:-1].replace(']]', ']'))
    # Detect case-fold collisions in the relevant name spaces: table names
    # share a schema namespace; column names share only their own table's.
    # Constraint and index names do not affect the scored schema dimensions.
    identifier_scopes = {'tables':[]}
    create_prefix = re.compile(r'\bCREATE\s+(?:TEMP(?:ORARY)?\s+)?TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?', re.I)
    for statement in _split_statements(source):
        create = create_prefix.search(statement)
        if not create:
            continue
        table_name, after_name = _identifier(statement, create.end())
        if table_name:
            identifier_scopes['tables'].append(table_name)
            column_scope = identifier_scopes.setdefault('columns:' + table_name.casefold(), [])
        else:
            continue
        opening = statement.find('(', after_name)
        closing = _matching_paren(statement, opening) if opening >= 0 else None
        if closing is not None:
            for definition in _split_definitions(statement[opening + 1:closing]):
                if re.match(r'^(?:CONSTRAINT\b|PRIMARY\b|FOREIGN\b|UNIQUE\b|CHECK\b|KEY\b|INDEX\b)', definition, re.I):
                    continue
                name, _ = _identifier(definition)
                if name:
                    column_scope.append(name)
    preserve_quoted_values = set()
    for values in identifier_scopes.values():
        by_fold = {}
        for value in set(values):
            by_fold.setdefault(value.casefold(), set()).add(value)
        for colliding in by_fold.values():
            if len(colliding) > 1:
                preserve_quoted_values.update(colliding.intersection(quoted_names))
    reserved = {'all','analyse','analyze','and','any','array','as','asc','between','bigint',
                'bit','boolean','both','case','cast','char','character','check','collate',
                'column','constraint','create','current_date','current_role','current_time',
                'current_timestamp','current_user','default','desc','distinct','do','else',
                'end','except','exists','false','fetch','float','for','foreign','from',
                'grant','group','having','in','initially','inner','int','integer','intersect',
                'into','is','join','leading','left','like','limit','localtime','localtimestamp',
                'not','null','numeric','offset','on','only','or','order','outer','overlaps',
                'placing','primary','references','returning','right','select','session_user',
                'some','symmetric','table','then','to','trailing','true','union','unique',
                'user','using','variadic','verbose','when','where','window','with'}
    def protect(match):
        value = match.group()
        if value.startswith('`'):
            original = value[1:-1].replace('``', '`')
            lower = original.lower()
            value = ('"' + original.replace('"', '""') + '"' if original in preserve_quoted_values else
                     '"' + lower.replace('"', '""') + '"' if not re.fullmatch(r'[a-z_][a-z0-9_$]*', lower) or lower in reserved else lower)
            changes.append('Backtick identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.')
        elif value.startswith('['):
            original = value[1:-1].replace(']]', ']')
            lower = original.lower()
            value = ('"' + original.replace('"', '""') + '"' if original in preserve_quoted_values else
                     '"' + lower.replace('"', '""') + '"' if not re.fullmatch(r'[a-z_][a-z0-9_$]*', lower) or lower in reserved else lower)
            changes.append('Bracket identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.')
        # Comments remain outside the code parser without affecting tokens.
        tokens.append(value)
        marker = f'{prefix}{len(tokens)-1}__'
        return '\n' + marker + '\n' if value.startswith(('--','/*')) else marker
    masked = PROTECTED.sub(protect, source)
    # MySQL's # comments are not accepted by PostgreSQL. They are comments,
    # so retain them as ordinary SQL comments rather than treating them as DDL.
    for index, token in enumerate(tokens):
        if token.startswith('#'):
            tokens[index] = '--' + token[1:]
            changes.append('Converted # comment to PostgreSQL -- comment; comment text retained.')
    comment_markers = {f'{prefix}{i}__':v for i,v in enumerate(tokens) if v.startswith(('--','#','/*'))}
    for marker in comment_markers:
        masked = masked.replace(marker, ' ' * len(marker))
    masked = _strip_source_schema_prefixes(masked, changes, blockers, prefix)
    patches, indexes, metadata = [], [], []
    for match in CREATE.finditer(masked):
        opening = match.end() - 1
        closing = _matching_paren(masked, opening)
        if closing is None:
            blockers.append('Unbalanced CREATE TABLE body.')
            continue
        definitions = _split_definitions(masked[opening+1:closing])
        revised = []
        for definition in definitions:
            # Only ordinary whole-column indexes: prefix/expression/fulltext
            # indexes may carry materially different semantics and stay intact.
            ordinary = re.fullmatch(
                r'(?:KEY|INDEX)\s+(?:(?P<name>[\w$]+)\s+)?(?:USING\s+(?:BTREE|HASH)\s+)?'
                r'\((?P<cols>[\w$]+(?:\s*,\s*[\w$]+)*)\)(?:\s+USING\s+(?:BTREE|HASH))?',
                definition, re.I)
            if ordinary:
                # MySQL index names are table-local; PostgreSQL names are not.
                # Let PostgreSQL name the physical index to avoid collisions.
                indexes.append(f'CREATE INDEX ON {match["table"]} ({ordinary["cols"]});')
                changes.append('Unnamed index translation: inline KEY/INDEX and USING BTREE/HASH -> standalone unnamed PostgreSQL index; columns retained.')
                continue
            unique = re.fullmatch(
                r'UNIQUE\s+(?:(?:KEY|INDEX)\s+)?(?:(?P<name>[\w$]+)\s+)?'
                r'(?:USING\s+(?:BTREE|HASH)\s+)?\((?P<cols>[\w$]+(?:\s*,\s*[\w$]+)*)\)'
                r'(?:\s+USING\s+(?:BTREE|HASH))?', definition, re.I)
            if unique:
                revised.append(f'UNIQUE ({unique["cols"]})')
                changes.append('Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.')
                continue
            column = re.match(r'^(?P<name>[\w$]+)\s+(?P<type>[A-Za-z_][\w]*)(?P<tail>.*)$', definition, re.S)
            if not column or column['name'].upper() in {'PRIMARY','FOREIGN','UNIQUE','CONSTRAINT','CHECK','KEY','INDEX'}:
                revised.append(definition)
                continue
            dtype, tail = column['type'].lower(), column['tail']
            original_column_name = column['name']
            column_name = original_column_name
            if column_name.casefold() in reserved:
                column_name = '"' + column_name.lower() + '"'
                changes.append('Quoted reserved bare identifier using its PostgreSQL lowercase-folded spelling.')
            comment = re.search(r'\bCOMMENT\s+(' + re.escape(prefix) + r'\d+__)', tail, re.I)
            if comment:
                marker = comment[1]
                token = tokens[int(marker[len(prefix):-2])]
                if token.startswith("'"):
                    metadata.append(f'COMMENT ON COLUMN {match["table"]}.{column["name"]} IS {marker};')
                    tail = tail[:comment.start()] + tail[comment.end():]
                    changes.append('Column COMMENT literal -> COMMENT ON COLUMN; metadata text retained.')
            replacement = TYPE_MAP.get(dtype)
            unsigned = bool(re.search(r'\b(?:UNSIGNED|ZEROFILL)\b', tail, re.I))
            if unsigned:
                unsigned_map = {'tinyint':'SMALLINT', 'smallint':'INTEGER', 'mediumint':'INTEGER',
                                'int':'BIGINT', 'integer':'BIGINT', 'bigint':'NUMERIC'}
                replacement = unsigned_map.get(dtype, replacement)
                tail = re.sub(r'\s+\b(?:UNSIGNED|ZEROFILL)\b', '', tail, flags=re.I)
                changes.append('Unsigned integer widened to a signed PostgreSQL type; nonnegative CHECK omitted by policy.')
            if dtype in {'int','integer','bigint','smallint','tinyint','mediumint'}:
                width = re.match(r'^\s*\(\s*\d+\s*\)', tail)
                if width:
                    tail = tail[width.end():]
                    changes.append('Removed integer display width; verify source does not rely on display formatting.')
                elif re.match(r'^\s*\(', tail):
                    blockers.append('Ambiguous integer precision/scale: no type inferred.')
            if dtype == 'double':
                replacement = 'DOUBLE PRECISION'
                width = re.match(r'^\s*\(\s*\d+(?:\s*,\s*\d+)?\s*\)', tail)
                if width:
                    tail = tail[width.end():]
                    changes.append('DOUBLE precision/scale mapped to DOUBLE PRECISION; rounding behavior is out of scope.')
                tail, precision_words = re.subn(r'^\s+PRECISION\b(?:\s+PRECISION\b)?', '', tail, count=1, flags=re.I)
                if precision_words and re.match(r'^\s*(?:NOT\s+NULL|NULL\b|DEFAULT\b|UNSIGNED\b|ZEROFILL\b|CHECK\b|REFERENCES\b|UNIQUE\b)', tail, re.I) is None and tail.strip():
                    # `DOUBLE PRECISION precision` is a recurring broken dump
                    # spelling, not a meaningful column modifier.
                    tail = re.sub(r'^\s+precision\b', '', tail, count=1, flags=re.I)
            if dtype == 'float':
                dimensions = re.match(r'^\s*\(\s*(\d+)\s*(?:,\s*(\d+)\s*)?\)', tail)
                replacement = 'REAL'
                if dimensions:
                    precision = int(dimensions[1])
                    replacement = 'REAL' if precision <= 24 else 'DOUBLE PRECISION'
                    tail = tail[dimensions.end():]
                    changes.append(f'FLOAT(p,s) mapped by declared precision ({precision}) to {replacement}; scale/display facet dropped.')
            if dtype == 'number' and re.match(r'^\s*\(\s*\*', tail):
                width = re.match(r'^\s*\(\s*\*\s*(?:,\s*\d+\s*)?\)', tail)
                if width:
                    tail = tail[width.end():]
                    changes.append('NUMBER wildcard precision -> unconstrained NUMERIC.')
            if dtype in {'binary','varbinary'}:
                replacement = 'BYTEA'
                width = re.match(r'^\s*\(\s*\d+\s*\)', tail)
                if width:
                    tail = tail[width.end():]
                changes.append('BINARY/VARBINARY -> BYTEA; exact length/padding is out of scope.')
            if dtype == 'enum':
                enum = re.match(r'^\s*\((?P<values>.*)\)(?P<rest>.*)$', tail, re.S)
                if enum:
                    values = _split_definitions(enum['values'])
                    literal_marker = re.compile(re.escape(prefix) + r'(\d+)__')
                    def is_string_literal(value):
                        value = value.strip()
                        marker = literal_marker.fullmatch(value)
                        if marker:
                            token = tokens[int(marker[1])]
                            return token.startswith("'") and token.endswith("'")
                        return bool(re.fullmatch(r"'(?:''|[^'])*'", value))
                    if values and all(is_string_literal(v) for v in values):
                        tail = enum['rest'] + f" CHECK ({column_name} IN ({', '.join(v.strip() for v in values)}))"
                        replacement = 'TEXT'
                        changes.append('ENUM -> TEXT with CHECK preserving the exact declared membership values.')
                    else:
                        blockers.append('ENUM values could not be represented exactly; left unchanged.')
                else:
                    blockers.append('ENUM declaration could not be parsed; left unchanged.')
            if dtype == 'set':
                blockers.append('SET domain is excluded by policy because no mechanically equivalent representation is defined.')
            # MySQL boolean aliases can carry integer defaults; PostgreSQL's
            # BOOLEAN requires boolean literals rather than 0/1.
            if dtype in {'bool', 'boolean'}:
                tail, count = re.subn(r'(\bDEFAULT\s+)0\b', r'\1FALSE', tail, flags=re.I)
                tail, count2 = re.subn(r'(\bDEFAULT\s+)1\b', r'\1TRUE', tail, flags=re.I)
                if count or count2:
                    changes.append('Converted integer boolean default 0/1 to FALSE/TRUE.')
            tail, charset_count = re.subn(r'\s+CHARACTER\s+SET\s+[\w$]+', '', tail, flags=re.I)
            if charset_count:
                changes.append('Removed column CHARACTER SET decoration; PostgreSQL database encoding governs storage.')
            # Zero dates are not representable in PostgreSQL. Drop the default,
            # retain the column type/nullability, and mark the loss explicitly.
            literal_markers = re.escape(prefix) + r'(\d+__)'
            for default in list(re.finditer(r'\bDEFAULT\s+(' + re.escape(prefix) + r'\d+__)', tail, re.I)):
                token = tokens[int(default[1][len(prefix):-2])]
                if token[:1] in {"'", '"'} and re.search(r'0000-00-00(?:[ T]00:00:00(?:\.0+)?)?', token):
                    tail = tail[:default.start()] + tail[default.end():]
                    changes.append('Removed zero-date default; PostgreSQL has no zero date and source default behavior is excluded.')
                    break
            tail, ts_count = re.subn(r'\bCURRENT_TIMESTAMP\s*\(\s*\)\s*\(\s*\)', 'CURRENT_TIMESTAMP', tail, flags=re.I)
            tail, ts_count_single = re.subn(r'\bCURRENT_TIMESTAMP\s*\(\s*\)', 'CURRENT_TIMESTAMP', tail, flags=re.I)
            if ts_count or ts_count_single:
                changes.append('Normalized MySQL CURRENT_TIMESTAMP() spelling to PostgreSQL CURRENT_TIMESTAMP.')
            if replacement:
                changes.append(f'Type {dtype} -> {replacement}; domain/storage differences require review.')
            tail = _identity_tail(tail, dtype, changes, blockers)
            revised.append(column_name + ' ' + (replacement or column['type']) + tail)
        if masked[opening+1:closing].rstrip().endswith(','):
            changes.append('Removed trailing comma after the last CREATE TABLE definition; no definition removed.')
        patches.append((opening+1, closing, '\n    ' + ',\n    '.join(revised) + '\n'))
    for start, end, replacement in reversed(patches):
        masked = masked[:start] + replacement + masked[end:]
    # Only physical engine/charset suffixes; collations are intentionally not
    # removed because they can change UNIQUE/FK equality semantics.
    # Move table comments into native metadata before matching physical options.
    for match in reversed(list(CREATE.finditer(masked))):
        close = _matching_paren(masked, match.end()-1)
        if close is None:
            continue
        end = masked.find(';', close)
        if end < 0:
            end = len(masked)
        suffix = masked[close+1:end]
        comment = re.search(r'\bCOMMENT\s*=\s*(' + re.escape(prefix) + r'\d+__)', suffix, re.I)
        if comment and tokens[int(comment[1][len(prefix):-2])].startswith("'"):
            metadata.append(f'COMMENT ON TABLE {match["table"]} IS {comment[1]};')
            start = close+1+comment.start()
            masked = masked[:start] + masked[close+1+comment.end():]
            changes.append('Table COMMENT literal -> COMMENT ON TABLE; metadata text retained.')
    # Remove table options from the exact matching CREATE TABLE boundary.
    # A global regex here can mistake a function-call `)` inside the table body
    # for the body's closing paren and silently truncate later columns.
    for match in reversed(list(CREATE.finditer(masked))):
        close = _matching_paren(masked, match.end() - 1)
        if close is None:
            continue
        end = masked.find(';', close)
        if end < 0:
            end = len(masked)
        suffix = masked[close + 1:end]
        if re.search(r'\b(?:ENGINE|TYPE)\s*=', suffix, re.I) or re.search(
                r'\b(?:CHARSET|CHARACTER\s+SET)\b', suffix, re.I):
            masked = masked[:close + 1] + masked[end:]
            changes.append('Removed physical ENGINE/table encoding option; encoding/collation review required.')
    # The v4 policy explicitly treats these as outside the evaluated schema
    # semantics: preserve DEFAULT CURRENT_TIMESTAMP but remove the MySQL-only
    # ON UPDATE clause and collation decorations.
    if re.search(r'\bON\s+UPDATE\s+CURRENT_TIMESTAMP', masked, re.I):
        changes.append('Removed ON UPDATE CURRENT_TIMESTAMP; automatic update behavior is out of scope.')
    if re.search(r'\bCOLLATE\b', masked, re.I):
        changes.append('Removed collation decoration; collation behavior is out of scope for structural/constraint grading.')
    masked = re.sub(r'\s+ON\s+UPDATE\s+CURRENT_TIMESTAMP(?:\s*\(\s*\d+\s*\))?', '', masked, flags=re.I)
    masked = re.sub(r'\s+COLLATE\s+(?:' + re.escape(prefix) + r'\d+__|[\w$.]+)', '', masked, flags=re.I)
    if '$engine_type' in masked:
        blockers.append('Unresolved engine template token; left unchanged.')
    # Relocation must run before restoring quote/literal tokens.
    identifiers = {f'{prefix}{i}__': (v[1:-1].replace('""', '"') if v.startswith('"') else v)
                   for i, v in enumerate(tokens)
                   if v.startswith('"') or re.fullmatch(r'[a-z_][a-z0-9_$]*', v)}
    masked = _relocate_foreign_keys(masked, changes, blockers, identifiers)
    if indexes:
        indexes = list(dict.fromkeys(indexes))
        masked = masked.rstrip().rstrip(';') + ';\n' + '\n'.join(indexes)
    if metadata:
        masked = masked.rstrip().rstrip(';') + ';\n' + '\n'.join(metadata)
    # Known table-name position only. Never replace USER in defaults/functions.
    def reserved_table(match):
        changes.append('Quoted reserved bare table name at a table/reference position using PostgreSQL lowercase folding.')
        return match['prefix'] + '"' + match['name'].lower() + '"'
    masked = re.sub(r'(?P<prefix>\b(?:CREATE\s+TABLE|REFERENCES|ALTER\s+TABLE|CREATE\s+INDEX\s+ON)\s+)(?P<name>user|order|group)\b(?![\w$.])', reserved_table, masked, flags=re.I)
    for i, value in enumerate(tokens):
        masked = masked.replace(f'{prefix}{i}__', value)
    # Restore provenance comments at the top; their text is never transformed.
    comments = '\n'.join(comment_markers.values())
    candidate = ((comments + '\n' if comments else '') + masked.strip() + '\n') if changes else source
    parsed = parse_ground_truth_sql(source, 'normalization_review')
    blockers.extend(parsed.warnings)
    return {'sql':candidate, 'changes':list(dict.fromkeys(changes)), 'blockers':list(dict.fromkeys(blockers))}


def prepare_candidates(config_path, split_file, phase, output, ids_override=None, cohort_label=None):
    config = load_config(config_path, load_environment=False)
    ids = list(ids_override) if ids_override is not None else read_json(split_file)[phase]
    if not ids or len(ids) != len(set(ids)) or any(not re.fullmatch(r'schema_[A-Za-z0-9_]+', sid) for sid in ids):
        raise ValueError('Candidate ID roster must contain unique schema IDs')
    sql_roots = {Path(t.sql_dir).resolve() for t in config.tiers.values()}
    if len(sql_roots) != 1:
        raise ValueError('Candidate builder requires a common source SQL directory')
    root = sql_roots.pop()
    destination = Path(output).resolve()
    if destination == root or root in destination.parents:
        raise ValueError('Candidates must be separate from the source dataset')
    if destination.exists() and any(destination.iterdir()):
        raise ValueError('Use a new empty candidate directory; prior reviews must not be overwritten')
    rows = []
    for sid in ids:
        source_path = (root / f'{sid}.sql').resolve()
        if source_path.parent != root:
            raise ValueError('Invalid schema ID')
        raw = source_path.read_bytes()
        if sid == 'schema_0924_372982':
            converted = {'sql':raw.decode('utf-8-sig'), 'changes':[],
                         'blockers':["Excluded by protocol v4: source contains SQLite internal sqlite_stat1 metadata, not an application schema."]}
        else:
            converted = normalize_source(raw.decode('utf-8-sig'))
        path = destination / f'{sid}.sql'
        candidate = converted.pop('sql')
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(candidate.encode('utf-8') if converted['changes'] else raw)
        approval_categories = [_policy_category(change) for change in converted['changes']]
        policy_eligible = (not converted['blockers'] and
                           all(category is not None for category in approval_categories))
        rows.append({'schema_id':sid, 'source_path':str(source_path), 'source_sha256':hashlib.sha256(raw).hexdigest(),
                     'reference_path':str(path), 'reference_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),
                     'status':('blocked' if converted['blockers'] else
                               'policy_candidate_pending_postgres_gate' if converted['changes'] and policy_eligible else
                               'requires_named_semantic_review' if converted['changes'] else 'unchanged'),
                     'policy_approval_categories':sorted(set(c for c in approval_categories if c)),
                     'policy_eligible':policy_eligible, **converted})
    manifest = {'policy':POLICY, 'converter_version':CONVERTER_VERSION,
                'cohort_label':cohort_label, 'model_calls':0, 'originals_modified':False, 'auto_approved':False,
                'normalizer_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                'gold_parser_sha256':hashlib.sha256((Path(__file__).parents[1]/'module4_constraint_tests'/'gold_schema.py').read_bytes()).hexdigest(),
                'phase':phase, 'split_sha256':hashlib.sha256(Path(split_file).read_bytes()).hexdigest(), 'rows':rows}
    write_json(destination / 'normalization_manifest.json', manifest)
    lines = ['# PostgreSQL reference candidates', '', 'Candidates are not approved until the PostgreSQL execution and generated-reference checks pass. No source schema was excluded during conversion. No LLM calls.', '',
             '| Schema | Changes | Blockers | Status |', '|---|---:|---:|---|']
    lines += [f"| {r['schema_id']} | {len(r['changes'])} | {len(r['blockers'])} | {r['status']} |" for r in rows]
    lines += ['', '## Per-schema conversion/review details', '']
    for row in rows:
        if not row['changes'] and not row['blockers']:
            continue
        lines += [f"### {row['schema_id']}", '', f"Source SHA256: `{row['source_sha256']}`", '',
                  f"Candidate SHA256: `{row['reference_sha256']}`", '']
        lines += ['- Change: ' + change for change in row['changes']]
        lines += ['- Blocker: ' + blocker for blocker in row['blockers']]
        lines.append('')
    write_text(destination / 'NORMALIZATION_REVIEW.md', '\n'.join(lines)+'\n')
    return manifest


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', default='config/models/mistral-small-4.yaml')
    parser.add_argument('--split-file', default='config/paper_splits.json')
    parser.add_argument('--phase', choices=['pilot','final'], required=True)
    parser.add_argument('--ids-manifest', help='Reuse exact schema IDs from a prior normalization_manifest.json')
    parser.add_argument('--cohort-label', help='Label the roster provenance in the output manifest')
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    ids_override = None
    if args.ids_manifest:
        ids_override = [row['schema_id'] for row in read_json(args.ids_manifest)['rows']]
    result = prepare_candidates(args.config, args.split_file, args.phase, args.output,
                                ids_override=ids_override, cohort_label=args.cohort_label)
    print(f"Created {len(result['rows'])} unapproved reference candidates. LLM calls: 0")


if __name__ == '__main__':
    main()
