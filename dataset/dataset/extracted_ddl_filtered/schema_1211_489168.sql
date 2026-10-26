-- Source: https://github.com/polandj/securetomato/blob/bd2cc0ca10b40197d07e611bb80c9d2445525003/release/src/router/mysql/mysql-test/suite/funcs_1/triggers/trig_frkey.inc?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE t0 (col1 CHAR(50))
ENGINE = $engine_type;

CREATE TABLE t1 (id INT NOT NULL, col1 CHAR(50), PRIMARY KEY (id))
ENGINE = $engine_type;

CREATE TABLE t2 (id INT PRIMARY KEY, f_id INT,
   INDEX par_ind (f_id), col1 CHAR(50),
   FOREIGN KEY (f_id) REFERENCES t1(id) ON DELETE SET NULL)
ENGINE = $engine_type;

CREATE TABLE t1 (id INT NOT NULL, col1 CHAR(50), PRIMARY KEY (id))
ENGINE = $engine_type;

CREATE TABLE t2 (id INT PRIMARY KEY, f_id INT,
   INDEX par_ind (f_id), col1 CHAR(50),
   FOREIGN KEY (f_id) REFERENCES t1(id) ON UPDATE CASCADE)
ENGINE = $engine_type;

