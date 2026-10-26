-- Recovery evidence only; not installed into the benchmark.
-- Pinned source inspected 1 October 2026:
-- https://raw.githubusercontent.com/clockmakerbrett/the-bug-files/385ecadab89f655f8ef8b0e7b1da7f0d9a73f884/database.sql
-- This exact domain declaration precedes CREATE TABLE bugs upstream,
-- but is missing from extracted_ddl_filtered/schema_0517.sql.
CREATE TYPE status_type AS ENUM ('To Do', 'Doing', 'Done');
