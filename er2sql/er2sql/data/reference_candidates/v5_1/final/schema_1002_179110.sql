-- Source: https://github.com/BackupTheBerlios/sourcenav-svn/blob/5fbee4a187f5692230d9ca6f75af5701beacbd4e/tags/SN-NG4.4/db4/test/scr038/data/many_tables.sql?raw=true
-- Tables detected: 30 | FK constraints: 2
CREATE TABLE table1 (
    att_int INT PRIMARY KEY,
    att_char CHAR(2),
    att_varchar VARCHAR(20),
    att_bit BIT,
    att_tinyint SMALLINT,
    att_smallint SMALLINT,
    att_integer INTEGER,
    att_bigint BIGINT,
    att_real REAL,
    att_double DOUBLE PRECISION,
    att_float REAL,
    att_decimal DECIMAL,
    att_numeric NUMERIC,
    att_bin bin(10)
);

CREATE TABLE table2 (
    att_int INT PRIMARY KEY
);

CREATE TABLE table3 (
    att_char CHAR(2) PRIMARY KEY
);

CREATE TABLE table4 (
    att_varchar VARCHAR(20) PRIMARY KEY
);

CREATE TABLE table5 (
    att_bit BIT PRIMARY KEY
);

CREATE TABLE table6 (
    att_tinyint SMALLINT PRIMARY KEY
);

CREATE TABLE table7 (
    att_smallint SMALLINT PRIMARY KEY
);

CREATE TABLE table8 (
    att_integer INTEGER PRIMARY KEY
);

CREATE TABLE table9 (
    att_bigint BIGINT PRIMARY KEY
);

CREATE TABLE table10 (
    att_real REAL PRIMARY KEY
);

CREATE TABLE table11 (
    att_double DOUBLE PRECISION PRIMARY KEY
);

CREATE TABLE table12 (
    att_float REAL PRIMARY KEY
);

CREATE TABLE table13 (
    att_decimal DECIMAL PRIMARY KEY
);

CREATE TABLE table14 (
    att_numeric NUMERIC PRIMARY KEY
);

CREATE TABLE table15 (
    att_binary bin(10) PRIMARY KEY
);

CREATE TABLE table16 (
    att_int INT PRIMARY KEY,
    att_char CHAR(2),
    att_varchar VARCHAR(20),
    att_bit BIT,
    att_tinyint SMALLINT,
    att_smallint SMALLINT,
    att_integer INTEGER,
    att_bigint BIGINT,
    att_real REAL,
    att_double DOUBLE PRECISION,
    att_float REAL,
    att_decimal DECIMAL,
    att_numeric NUMERIC,
    att_bin bin(10)
);

CREATE TABLE table17 (
    att_int INT PRIMARY KEY
);

CREATE TABLE table18 (
    att_char CHAR(2) PRIMARY KEY
);

CREATE TABLE table19 (
    att_varchar VARCHAR(20) PRIMARY KEY
);

CREATE TABLE table20 (
    att_bit BIT PRIMARY KEY
);

CREATE TABLE table21 (
    att_tinyint SMALLINT PRIMARY KEY
);

CREATE TABLE table22 (
    att_smallint SMALLINT PRIMARY KEY
);

CREATE TABLE table23 (
    att_integer INTEGER PRIMARY KEY
);

CREATE TABLE table24 (
    att_bigint BIGINT PRIMARY KEY
);

CREATE TABLE table25 (
    att_real REAL PRIMARY KEY
);

CREATE TABLE table26 (
    att_double DOUBLE PRECISION PRIMARY KEY
);

CREATE TABLE table27 (
    att_float REAL PRIMARY KEY
);

CREATE TABLE table28 (
    att_decimal DECIMAL PRIMARY KEY
);

CREATE TABLE table29 (
    att_numeric NUMERIC PRIMARY KEY
);

CREATE TABLE table30 (
    att_binary bin(100) PRIMARY KEY
);
ALTER TABLE table1 ADD CONSTRAINT table8_fk FOREIGN KEY(att_integer)
                           REFERENCES table8(att_integer);
ALTER TABLE table16 ADD CONSTRAINT table17_fk FOREIGN KEY(att_int)
                           REFERENCES table17(att_int);
