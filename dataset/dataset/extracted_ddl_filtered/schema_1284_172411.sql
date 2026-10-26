-- Source: https://github.com/Lind-Project/lind_project/blob/c651c27b29a1dd4edb989b2e96920a7569d9f3db/tests/applications/mysql/mysql-test/suite/innodb/include/innodb_import.inc?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE t1 (c1 INT) ENGINE = InnoDB
$c1_part;

CREATE TABLE t1 (c1 INT) ENGINE = InnoDB
$c1_part;

CREATE TABLE t1 (
col1 BIT(1),
col2 BOOLEAN,
col3 TINYINT,
col4 SMALLINT,
col5 MEDIUMINT,
col6 INT,
col7 BIGINT,
col8 FLOAT (14,3),
col9 DOUBLE (14,3),
col10 VARCHAR(20),
col11 TEXT,
col12 ENUM('a','b','c'),
col13 TEXT,
col14 CHAR(20),
col15 VARBINARY (400),
col16 BINARY(40),
col17 BLOB (400),
col18 INT NOT NULL PRIMARY KEY,
col19 DATE,
col20 DATETIME,
col21 TIMESTAMP NULL,
col22 TIME,
col23 YEAR) ENGINE = InnoDB
$c18_part;

CREATE TABLE t1 (
col1 BIT(1),
col2 BOOLEAN,
col3 TINYINT,
col4 SMALLINT,
col5 MEDIUMINT,
col6 INT,
col7 BIGINT,
col8 FLOAT (14,3),
col9 DOUBLE (14,3),
col10 VARCHAR(20),
col11 TEXT,
col12 ENUM('a','b','c'),
col13 TEXT,
col14 CHAR(20),
col15 VARBINARY (400),
col16 BINARY(40),
col17 BLOB (400),
col18 INT NOT NULL PRIMARY KEY,
col19 DATE,
col20 DATETIME,
col21 TIMESTAMP NULL,
col22 TIME,
col23 YEAR) ENGINE = InnoDB
$c18_part;

CREATE TABLE t1 (
col_1_varbinary VARBINARY (4000),
col_2_varchar VARCHAR (4000),
col_3_text TEXT (4000),
col_4_blob BLOB (4000),
col_5_text TEXT (4000),
col_6_varchar VARCHAR (4000),
col_7_binary BINARY (255)
) ROW_FORMAT=DYNAMIC ENGINE = InnoDB
$col7_part;

CREATE TABLE t1 (
col_1_varbinary VARBINARY (4000),
col_2_varchar VARCHAR (4000),
col_3_text TEXT (4000),
col_4_blob BLOB (4000),
col_5_text TEXT (4000),
col_6_varchar VARCHAR (4000),
col_7_binary BINARY (255)
) ROW_FORMAT=DYNAMIC ENGINE = InnoDB
$col7_part;

CREATE TABLE t1 (
col_1_int INT AUTO_INCREMENT,
col_2_varchar VARCHAR (20),
PRIMARY KEY (col_1_int)) ENGINE = InnoDB
$col1_part;

CREATE TABLE t1 (
col_1_int INT AUTO_INCREMENT,
col_2_varchar VARCHAR (20),
PRIMARY KEY (col_1_int)) ENGINE = InnoDB
$col1_part;

CREATE TABLE t1 (
col_1_int INT,col_2_varchar VARCHAR (20),
PRIMARY KEY (col_2_varchar)) ENGINE = InnoDB;

CREATE TABLE t1_fk (
col_1_int INT,col_2_varchar VARCHAR (20),
PRIMARY KEY (col_1_int),
FOREIGN KEY (col_2_varchar) REFERENCES t1(col_2_varchar)
) ENGINE = InnoDB;

CREATE TABLE t1 (
col_1_int INT,col_2_varchar VARCHAR (20),
PRIMARY KEY (col_2_varchar)) ENGINE = InnoDB;

CREATE TABLE t1_fk (
col_1_int INT,col_2_varchar VARCHAR (20),
PRIMARY KEY (col_1_int),
FOREIGN KEY (col_2_varchar) REFERENCES t1(col_2_varchar)
) ENGINE = InnoDB;

CREATE TABLE t1 (
col_1_int int,col_2_varchar VARCHAR (20),
PRIMARY KEY (col_2_varchar)) ENGINE = InnoDB
$col2_part;

CREATE TABLE t1 (
col_1_int int,col_2_varchar VARCHAR (20),
PRIMARY KEY (col_2_varchar)) ENGINE = InnoDB
$col2_part;

CREATE TABLE t1 (i int) ENGINE = InnoDB
$i_part;

CREATE TABLE t1 (i int) ENGINE = InnoDB
$i_part;

CREATE TABLE t1 (i int) ENGINE = InnoDB
$i_part;

create table with incorrect schema
eval CREATE TABLE t1 (i bigint) ENGINE = InnoDB
$i_part;

CREATE TABLE t1 (i int) ENGINE = InnoDB
$i_part;

CREATE TABLE t1 (i int) ENGINE = InnoDB
$i_part;

CREATE TABLE t1 (c1 INT) ENGINE = InnoDB
$c1_part;

CREATE TABLE t1 (c1 INT) ENGINE = InnoDB
$c1_part;

CREATE TABLE t1 (col_1 CHAR (255),
col_2 VARCHAR (255), col_3 VARCHAR (255),
col_4 VARCHAR (255),col_5 VARCHAR (255),
col_6 text (255), col_7 text (255),
col_8 text (255),col_9 text (255),
col_10 BLOB (255),col_11  BLOB (255),
col_12 BLOB (255), col_13 BLOB (255),
col_14 BLOB (255), col_15 int) ENGINE = InnoDB charset latin1
$col1_key_part;

CREATE TABLE t1 (col_1 CHAR (255),
col_2 VARCHAR (255), col_3 VARCHAR (255),
col_4 VARCHAR (255),col_5 VARCHAR (255),
col_6 text (255), col_7 text (255),
col_8 text (255),col_9 text (255),
col_10 BLOB (255),col_11  BLOB (255),
col_12 BLOB (255), col_13 BLOB (255),
col_14 BLOB (255), col_15 int) ENGINE = InnoDB charset latin1
$col1_key_part;

CREATE TABLE t1 (col_1 CHAR (255),
col_2 VARCHAR (255), col_3 VARCHAR (255),
col_4 VARCHAR (255),col_5 VARCHAR (255),
col_6 text (255), col_7 text (255),
col_8 text (255),col_9 text (255),
col_10 BLOB (255),col_11  BLOB (255),
col_12 BLOB (255), col_13 BLOB (255),
col_14 BLOB (255), col_15 int) ENGINE = InnoDB charset latin1
$col1_key_part;

CREATE TABLE t1 (col_1 CHAR (255),
col_2 VARCHAR (255), col_3 VARCHAR (255),
col_4 VARCHAR (255),col_5 VARCHAR (255),
col_6 text (255), col_7 text (255),
col_8 text (255),col_9 text (255),
col_10 BLOB (255),col_11  BLOB (255),
col_12 BLOB (255), col_13 BLOB (255),
col_14 BLOB (255), col_15 int) ENGINE = InnoDB charset latin1
$col1_key_part;

CREATE TABLE t1(col1 bit(1),
col2 boolean,col3 tinyint, col4 smallint,
col5 mediumint,col6 int, col7 bigint,
col8 float (14,3),col9 double (14,3),
col10 VARCHAR(20) CHARACTER SET utf8,
col11 TEXT CHARACTER SET binary,
col12 ENUM('a','b','c') CHARACTER SET binary,
col13 TEXT CHARACTER SET latin1 COLLATE latin1_general_cs,
col14 CHAR(20), col15 VARBINARY (400),
col16 BINARY(40), col17 BLOB (400),
col18 int not null primary key,
col19 DATE,col20 DATETIME, col21 TIMESTAMP NULL,
col22 TIME, col23 YEAR) ENGINE = InnoDB
$col18_part;

CREATE TABLE trigger_table (i int) ENGINE = InnoDB;

CREATE TABLE t1(col1 bit(1),
col2 boolean,col3 tinyint, col4 smallint,
col5 mediumint,col6 int, col7 bigint,
col8 float (14,3),col9 double (14,3),
col10 VARCHAR(20) CHARACTER SET utf8,
col11 TEXT CHARACTER SET binary,
col12 ENUM('a','b','c') CHARACTER SET binary,
col13 TEXT CHARACTER SET latin1 COLLATE latin1_general_cs,
col14 CHAR(20), col15 VARBINARY (400),
col16 BINARY(40), col17 BLOB (400),
col18 int not null primary key,
col19 DATE,col20 DATETIME, col21 TIMESTAMP NULL,
col22 TIME, col23 YEAR) ENGINE = InnoDB
$col18_part;

CREATE TABLE t1 (c1 INT) ENGINE = InnoDB
$c1_part;

CREATE TABLE t1 (c1 INT, c2 INT) ENGINE = InnoDB
$c1_part;

CREATE TABLE t1 (c1 INT) ENGINE = InnoDB
$c1_part;

CREATE TABLE t1 (c1 INT, c2 INT) ENGINE = InnoDB
$c1_part;

