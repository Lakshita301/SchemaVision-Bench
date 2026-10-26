import unittest

from scripts.audit_backend_compatibility import (
    MYSQL_ALLOWED,
    POSTGRES_ALLOWED,
    first_words,
    split_statements,
    unsafe_reason,
)


class BackendCompatibilityAuditTests(unittest.TestCase):
    def test_split_preserves_semicolons_inside_strings_and_comments(self):
        statements = split_statements(
            "CREATE TABLE t (v TEXT DEFAULT 'a;b'); -- note;\n"
            "ALTER TABLE t ADD COLUMN id INT;"
        )
        self.assertEqual(len(statements), 2)
        self.assertIn("'a;b'", statements[0])

    def test_create_database_and_use_are_never_executed(self):
        for sql in ("CREATE DATABASE elsewhere", "USE unrelated"):
            with self.subTest(sql=sql):
                statements = split_statements(sql)
                self.assertIsNotNone(unsafe_reason(statements, MYSQL_ALLOWED))

    def test_non_ddl_statements_are_rejected(self):
        statements = split_statements("INSERT INTO t VALUES (1)")
        self.assertIsNotNone(unsafe_reason(statements, MYSQL_ALLOWED))

    def test_schema_ddl_is_allowlisted_for_each_backend(self):
        mysql = split_statements("CREATE TABLE t (id INT PRIMARY KEY)")
        postgres = split_statements("COMMENT ON TABLE t IS 'note'")
        self.assertIsNone(unsafe_reason(mysql, MYSQL_ALLOWED))
        self.assertIsNone(unsafe_reason(postgres, POSTGRES_ALLOWED))

    def test_leading_comments_do_not_hide_statement_kind(self):
        self.assertEqual(first_words("-- comment\nCREATE TABLE t (id INT)"),
                         ("CREATE", "TABLE", "T"))


if __name__ == "__main__":
    unittest.main()
