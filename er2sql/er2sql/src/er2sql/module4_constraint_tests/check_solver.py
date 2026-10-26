"""Bounded deterministic witnesses for a declared SQL CHECK subset.

No eval(), SQL execution, or LLM. Supports comparisons, IN, BETWEEN and
AND/OR over columns and scalar literals. Unknown syntax stays unsupported.
Finite search is a fixture builder, not a general constraint solver.
"""
import re
from datetime import date as date_value, datetime as datetime_value, time as time_value
from decimal import Decimal, InvalidOperation

TOKEN = re.compile(r'''\s*("(?:""|[^"])*"|`[^`]+`|\[[^\]]+\]|'(?:''|[^'])*'|-?\d+(?:\.\d+)?|>=|<=|<>|!=|[=><(),]|[A-Za-z_][\w$]*)''')


def parse_check(expression):
    tokens, position = [], 0
    while position < len(expression.rstrip()):
        match = TOKEN.match(expression, position)
        if not match:
            raise ValueError('unsupported CHECK token')
        tokens.append(match.group(1))
        position = match.end()
    index = 0

    def take(expected=None):
        nonlocal index
        if index >= len(tokens):
            raise ValueError('incomplete CHECK')
        token = tokens[index]
        if expected is not None and token.upper() != expected:
            raise ValueError('unsupported CHECK grammar')
        index += 1
        return token

    def peek(word):
        return index < len(tokens) and tokens[index].upper() == word

    def operand():
        token = take()
        if token.upper() in {'LENGTH', 'CHAR_LENGTH'} and peek('('):
            take('(')
            argument = operand()
            take(')')
            return ('length', argument)
        if token.startswith("'"):
            return ('literal', token[1:-1].replace("''", "'"))
        if re.fullmatch(r'-?\d+(?:\.\d+)?', token):
            return ('literal', float(token) if '.' in token else int(token))
        if token.upper() in {'TRUE', 'FALSE', 'NULL'}:
            return ('literal', {'TRUE':True, 'FALSE':False, 'NULL':None}[token.upper()])
        if token[0] in '"`[':
            return ('column', token[1:-1].replace('""', '"'))
        if re.fullmatch(r'[A-Za-z_][\w$]*', token):
            return ('column', token)
        raise ValueError('unsupported CHECK operand')

    def atom():
        if peek('('):
            take('(')
            result = disjunction()
            take(')')
            return result
        left = operand()
        operator = take().upper()
        if operator == 'BETWEEN':
            low = operand()
            take('AND')
            return ('and', ('>=', left, low), ('<=', left, operand()))
        if operator == 'IN':
            take('(')
            choices = [operand()]
            while peek(','):
                take(',')
                choices.append(operand())
            take(')')
            return ('in', left, tuple(choices))
        if operator == 'LIKE':
            return ('like', left, operand())
        if operator == 'NOT' and peek('LIKE'):
            take('LIKE')
            return ('not_like', left, operand())
        if operator == 'IS':
            negate = False
            if peek('NOT'):
                take('NOT')
                negate = True
            take('NULL')
            return ('is_not_null' if negate else 'is_null', left)
        if operator not in {'=', '<>', '!=', '>', '<', '>=', '<='}:
            raise ValueError('unsupported CHECK operator')
        return (operator, left, operand())

    def conjunction():
        node = atom()
        while peek('AND'):
            take('AND')
            node = ('and', node, atom())
        return node

    def disjunction():
        node = conjunction()
        while peek('OR'):
            take('OR')
            node = ('or', node, conjunction())
        return node

    node = disjunction()
    if index != len(tokens):
        raise ValueError('unsupported CHECK suffix')
    return node


def evaluate(node, row):
    kind = node[0]
    if kind == 'column':
        return row[node[1]]
    if kind == 'literal':
        return node[1]
    if kind == 'length':
        v = evaluate(node[1], row)
        if v is not None and not isinstance(v, str):
            raise TypeError('Only string LENGTH witnesses are supported')
        return None if v is None else len(v)
    if kind == 'is_null':
        return evaluate(node[1], row) is None
    if kind == 'is_not_null':
        return evaluate(node[1], row) is not None
    if kind in {'and', 'or'}:
        a, b = evaluate(node[1], row), evaluate(node[2], row)
        if kind == 'and':
            return False if a is False or b is False else None if a is None or b is None else True
        return True if a is True or b is True else None if a is None or b is None else False
    a = evaluate(node[1], row)
    if kind == 'in':
        values = [evaluate(n, row) for n in node[2]]
        return None if a is None else True if a in values else None if None in values else False
    b = evaluate(node[2], row)
    if kind in {'like', 'not_like'}:
        if a is None or b is None:
            return None
        if not isinstance(a, str) or not isinstance(b, str):
            raise TypeError('LIKE fixtures require strings')
        # SQL LIKE treats only '%' and '_' as wildcards; bracket expressions
        # are literal characters (unlike a regular expression).
        pattern = ''.join('.*' if c == '%' else '.' if c == '_' else re.escape(c) for c in b)
        matched = re.fullmatch(pattern, a, flags=re.DOTALL) is not None
        return matched if kind == 'like' else not matched
    if a is None or b is None:
        return None
    if kind == '=':
        return a == b
    if kind in {'<>', '!='}:
        return a != b
    if kind == '>':
        return a > b
    if kind == '<':
        return a < b
    if kind == '>=':
        return a >= b
    return a <= b


def leaves(node):
    if node[0] in {'column', 'literal'}:
        yield node
    else:
        yield from leaves(node[1])
        if node[0] in {'length', 'is_null', 'is_not_null'}:
            return
        elif node[0] == 'in':
            for child in node[2]:
                yield from leaves(child)
        else:
            yield from leaves(node[2])


def parsed_checks(table):
    nodes, warnings = [], []
    names = {c['name'] for c in table.get('columns', [])}
    for expression in table.get('check_constraints', []):
        try:
            node = parse_check(expression)
            if any(kind == 'column' and name not in names for kind, name in leaves(node)):
                raise ValueError('unknown column')
            nodes.append((expression, node))
        except ValueError as exc:
            warnings.append(f"Unsupported CHECK expression on '{table['name']}': {expression!r} ({exc})")
    return nodes, warnings


def witness(table, nodes, row, locked=(), reject_index=None, limit=4096):
    columns = {c['name']: c for c in table.get('columns', [])}
    atoms = [atom for _, node in nodes for atom in leaves(node)]
    names = sorted({v for k, v in atoms if k == 'column'} - set(locked))
    null_sensitive_names = {
        name
        for _, node in nodes
        for kind, name in leaves(node)
        if kind == 'column' and node[0] in {'is_null', 'is_not_null'}
    }
    constants = [v for k, v in atoms if k == 'literal' and v is not None]
    domains = []
    for name in names:
        dtype = (columns[name].get('data_type') or '').lower()
        candidates = [row.get(name)] + constants
        if 'timestamp' in dtype or ('datetime' in dtype):
            candidates.extend(['1900-01-01 00:00:00', '2099-12-31 23:59:59'])
        elif dtype.strip() == 'date' or dtype.startswith('date('):
            candidates.extend(['1900-01-01', '2099-12-31'])
        elif dtype.strip() == 'time' or dtype.startswith('time('):
            candidates.extend(['00:00:00', '23:59:59'])
        if any(k in dtype for k in ('char', 'text')):
            for value in constants:
                if isinstance(value, int) and not isinstance(value, bool) and 0 <= value <= 256:
                    candidates.extend('x' * n for n in {max(0, value-1), value, value+1})
            for kind, pattern in atoms:
                if kind == 'literal' and isinstance(pattern, str) and ('%' in pattern or '_' in pattern):
                    # Preserve literal bracket syntax: for SQL LIKE, [0-9]
                    # is text, not a character class.
                    candidates.extend([pattern.replace('%', 'x').replace('_', 'x'), 'x'])
        for value in constants:
            if isinstance(value, (float, int)) and not isinstance(value, bool):
                candidates.extend([value - 1, value + 1, value - .5, value + .5])
        candidates.extend([0, 1, -1, True, False, '~', 'X', ''])
        length = re.search(r'(?:n?varchar2?|n?char|character varying|character)\s*\((\d+)\)', dtype)
        precision = re.search(r'(?:numeric|decimal|number)\s*\((\d+)(?:\s*,\s*(\d+))?\)', dtype)
        filtered = []
        for value in candidates:
            # Never use NULL as a witness to a valid constraint: that can
            # evade a predicate rather than exercise its permitted domain.
            if value is None:
                if name in null_sensitive_names:
                    filtered.append(value)
                continue
            if any(k in dtype for k in ('int', 'serial')) and (not isinstance(value, int) or isinstance(value, bool)):
                continue
            if any(k in dtype for k in ('numeric', 'decimal', 'number', 'real', 'double', 'float')) and (not isinstance(value, (int, float)) or isinstance(value, bool)):
                continue
            if 'bool' in dtype and not isinstance(value, bool):
                continue
            if ('timestamp' in dtype or 'datetime' in dtype) and isinstance(value, str):
                try:
                    datetime_value.fromisoformat(value)
                except ValueError:
                    continue
            elif (dtype.strip() == 'date' or dtype.startswith('date(')) and isinstance(value, str):
                try:
                    date_value.fromisoformat(value)
                except ValueError:
                    continue
            elif (dtype.strip() == 'time' or dtype.startswith('time(')) and isinstance(value, str):
                try:
                    time_value.fromisoformat(value)
                except ValueError:
                    continue
            elif any(k in dtype for k in ('timestamp', 'datetime', 'date', 'time')) and not isinstance(value, str):
                continue
            if any(k in dtype for k in ('char', 'text')) and not isinstance(value, str):
                continue
            if length and isinstance(value, str) and len(value) > int(length.group(1)):
                continue
            if re.fullmatch(r'(?:char|character|nchar)', dtype.strip()) and isinstance(value, str) and len(value) > 1:
                continue
            if precision and isinstance(value, (int, float)) and not isinstance(value, bool):
                p, s = int(precision[1]), int(precision[2] or 0)
                try:
                    decimal = Decimal(str(value))
                    # A witness must retain its value after type conversion;
                    # otherwise the predicate we evaluated is not what SQL sees.
                    if abs(decimal) >= Decimal(10) ** (p-s) or decimal != decimal.quantize(Decimal(10) ** -s):
                        continue
                except InvalidOperation:
                    continue
            if ('smallint' in dtype or dtype.strip() == 'int2') and isinstance(value, int) and not -32768 <= value <= 32767:
                continue
            if not any(type(value) is type(v) and value == v for v in filtered):
                filtered.append(value)
        domains.append(filtered)
    # Prune each fully assigned predicate immediately. A Cartesian product
    # wastes the entire budget on independent columns before reaching a
    # valid early column value in wide schemas.
    dependencies = [{v for k, v in leaves(node) if k == 'column'} for _, node in nodes]
    budget = [limit]
    def search(position, candidate, assigned):
        try:
            for i, (_, node) in enumerate(nodes):
                if dependencies[i] <= assigned:
                    result = evaluate(node, candidate)
                    if not (result is False if i == reject_index else result is not False):
                        return None
        except (TypeError, KeyError):
            return None
        if position == len(names):
            return candidate
        name = names[position]
        for value in domains[position]:
            if budget[0] <= 0:
                return None
            budget[0] -= 1
            found = search(position + 1, {**candidate, name:value}, assigned | {name})
            if found is not None:
                return found
        return None
    return search(0, dict(row), set(row) - set(names))
