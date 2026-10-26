"""Frozen formatting-only normalizer for the secondary SQL ablation."""

NORMALIZER_NAME = "sqlparse.format"
NORMALIZER_MIN_VERSION = "0.5.0"


def normalize_sql_for_ablation(sql: str) -> str:
    """Format SQL without changing literals, identifiers, comments, or order."""
    import sqlparse

    return sqlparse.format(
        sql, keyword_case="upper", reindent=True,
        strip_comments=False, use_space_around_operators=True,
    )
