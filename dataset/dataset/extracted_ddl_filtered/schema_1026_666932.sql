-- Source: https://github.com/pexip/os-postgresql-13/blob/639b98ba5471706917449c62bb568524635f7a88/src/test/regress/sql/collate.sql?raw=true
-- Tables detected: 12 | FK constraints: 2

CREATE TABLE collate_test1 (
    a int,
    b text COLLATE "C" NOT NULL
);

CREATE TABLE collate_test_fail (
    a int COLLATE "C",
    b text
);

CREATE TABLE collate_test_like (
    LIKE collate_test1
);

CREATE TABLE collate_test2 (
    a int,
    b text COLLATE "POSIX"
);

CREATE TABLE collate_test4 (
    a int,
    b testdomain_p
);

CREATE TABLE collate_test5 (
    a int,
    b testdomain_p COLLATE "C"
);

CREATE TABLE collate_test10 (
    a int,
    x text COLLATE "C",
    y text COLLATE "POSIX"
);

CREATE TABLE test_u AS SELECT a, b FROM collate_test1 UNION ALL SELECT a, b FROM collate_test2;

CREATE TABLE collate_test20 (f1 text COLLATE "C" PRIMARY KEY);

CREATE TABLE collate_test21 (f2 text COLLATE "POSIX" REFERENCES collate_test20);

CREATE TABLE collate_test22 (f2 text COLLATE "POSIX");

CREATE TABLE collate_test23 (f1 text collate mycoll2);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE collate_test22 ADD FOREIGN KEY (f2) REFERENCES collate_test20;

ALTER TABLE collate_test22 ADD FOREIGN KEY (f2) REFERENCES collate_test20;

