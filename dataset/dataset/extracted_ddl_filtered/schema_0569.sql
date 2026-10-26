-- Source: https://github.com/tcdog001/autelan/blob/500128e4728ac48829836b2cdc2bc41b8570ab8a/rootfs/mysql-5.1.51/mysql-test/suite/funcs_1/triggers/trig_frkey.inc?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 7

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

