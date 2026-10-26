"""Independent hand-authored PostgreSQL probes for evaluator validation.

These probes do not use the gold parser or fixture generator. They complement
the generated mutation suite; neither suite proves arbitrary SQL equivalence.
"""
from ..module4_constraint_tests.models import PostCheck, TestCase, TestSuite


def independent_controls(verify):
    rows = []

    def check(name, ddl, tests, expected, states=None):
        result = verify(ddl, TestSuite(schema_id=name, tests=tests), name)
        actual = [t['passed'] for t in result['test_results']]
        ok = result['ddl_execution']['success'] and actual == expected
        if states is not None:
            ok = ok and [t['error_sqlstate'] for t in result['test_results']] == states
        rows.append({'name': name, 'passed': bool(ok), 'ddl': ddl,
                     'tests': [t.as_dict() for t in tests], 'expected_passes': expected,
                     'verification': result})

    def rejection(name, kind, table, columns, setup, action, state, **kwargs):
        return TestCase(test_id=name, test_type=kind, table=table, columns=columns,
                        column=columns[0] if len(columns) == 1 else None,
                        description=name, setup_sql=setup, action_sql=action,
                        expect='failure', expected_sqlstates=[state], **kwargs)

    pk = rejection('pk', 'primary_key_duplicate_rejected', 'p', ['a', 'b'],
                   ['INSERT INTO p VALUES (1,2)'], 'INSERT INTO p VALUES (1,2)', '23505')
    composite = 'CREATE TABLE p(a INT,b INT,PRIMARY KEY(a,b));'
    check('composite_pk', composite, [pk], [True], ['23505'])
    check('composite_pk_missing', 'CREATE TABLE p(a INT,b INT);', [pk], [False])

    ddl = composite + 'CREATE TABLE c(id INT PRIMARY KEY,x INT,y INT,FOREIGN KEY(x,y) REFERENCES p(a,b));'
    fk = rejection('fk', 'foreign_key_reject_invalid_parent', 'c', ['x','y'], [],
                   'INSERT INTO c VALUES(1,7,8)', '23503', ref_table='p', ref_columns=['a','b'])
    valid = TestCase(test_id='valid', test_type='foreign_key_accept_valid_parent', table='c',
                    description='distinct composite values exercise ordered FK mapping',
                    setup_sql=['INSERT INTO p VALUES(1,2)'], action_sql='INSERT INTO c VALUES(1,1,2)')
    check('composite_fk', ddl, [fk, valid], [True, True], ['23503', None])
    check('composite_fk_swapped', ddl.replace('REFERENCES p(a,b)', 'REFERENCES p(b,a)'),
          [fk, valid], [False, False], ['23503','23503'])
    check('deferred_fk', ddl.replace('REFERENCES p(a,b)', 'REFERENCES p(a,b) DEFERRABLE INITIALLY DEFERRED'),
          [fk, valid], [True, True], ['23503', None])
    bad_setup = rejection('bad_setup', 'foreign_key_reject_invalid_parent', 'c', ['x','y'],
                         ['INSERT INTO c VALUES(1,7,8)'], 'INSERT INTO c VALUES(2,7,8)',
                         '23503', ref_table='p', ref_columns=['a','b'])
    check('deferred_setup_failure', ddl.replace('REFERENCES p(a,b)', 'REFERENCES p(a,b) DEFERRABLE INITIALLY DEFERRED'),
          [bad_setup], [False], ['23503'])

    restrict = rejection('restrict', 'cascade_behavior', 'c', ['x','y'],
                         ['INSERT INTO p VALUES(1,2)', 'INSERT INTO c VALUES(1,1,2)'],
                         'DELETE FROM p', '23503', ref_table='p', ref_columns=['a','b'])
    check('delete_restrict', ddl, [restrict], [True], ['23503'])
    # Separate single-column reference, with two relationships to the same
    # parent: error from y cannot stand in for missing constraint on x.
    other_fk = ('CREATE TABLE p(id INT PRIMARY KEY); CREATE TABLE c(x INT,y INT REFERENCES p(id));')
    wrong_fk = rejection('wrong_fk', 'cascade_behavior', 'c', ['x'],
                         ['INSERT INTO p VALUES(1)', 'INSERT INTO c VALUES(1,1)'],
                         'DELETE FROM p', '23503', ref_table='p', ref_columns=['id'])
    check('wrong_fk_delete_rejection', other_fk, [wrong_fk], [False], ['23503'])

    nulls = TestCase(test_id='nulls', test_type='cascade_behavior', table='c', description='both FK columns become NULL',
                    setup_sql=['INSERT INTO p VALUES(1,2)', 'INSERT INTO c VALUES(1,1,2)'],
                    action_sql='DELETE FROM p', post_check=PostCheck(
                        sql='SELECT COUNT(*)=1 AND BOOL_AND(x IS NULL AND y IS NULL) FROM c',
                        expected_column='all_null', expected_value=True))
    check('composite_set_null', ddl.replace('REFERENCES p(a,b)', 'REFERENCES p(a,b) ON DELETE SET NULL'),
          [nulls], [True])
    check('partial_set_null_mutant', ddl.replace('REFERENCES p(a,b)', 'REFERENCES p(a,b) ON DELETE SET NULL (x)'),
          [nulls], [False])

    nn = rejection('wrong_nn', 'not_null_reject_null', 't', ['a'], [],
                   'INSERT INTO t VALUES(NULL,NULL)', '23502')
    check('wrong_not_null_column', 'CREATE TABLE t(a INT,b INT NOT NULL)', [nn], [False], ['23502'])
    ck = rejection('wrong_check', 'check_constraint_reject_invalid', 't', ['a'], [],
                   'INSERT INTO t VALUES(-1,-1)', '23514')
    check('wrong_check_column', 'CREATE TABLE t(a INT,b INT CHECK(b>0))', [ck], [False], ['23514'])
    unknown = rejection('unknown', 'unique_reject_duplicate', 't', [],
                        ['INSERT INTO t VALUES(1)'], 'INSERT INTO t VALUES(1)', '23505')
    check('missing_target_metadata', 'CREATE TABLE t(a INT UNIQUE)', [unknown], [False], ['23505'])

    nullable = TestCase(test_id='nullable', test_type='check_constraint_accept_valid', table='t',
                        description='SQL NULL obeys three-valued CHECK and ordinary UNIQUE semantics',
                        setup_sql=['INSERT INTO t VALUES(NULL)'], action_sql='INSERT INTO t VALUES(NULL)')
    check('null_semantics', 'CREATE TABLE t(a INT UNIQUE CHECK(a>0));', [nullable], [True])
    insert = TestCase(test_id='isolation', test_type='foreign_key_accept_valid_parent', table='t',
                      description='identical operations in separate savepoints do not collide',
                      action_sql='INSERT INTO t VALUES(1)')
    check('savepoint_isolation', 'CREATE TABLE t(a INT PRIMARY KEY)', [insert, insert], [True, True])
    return rows
