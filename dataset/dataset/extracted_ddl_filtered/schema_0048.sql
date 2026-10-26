-- Source: https://github.com/jterrace/craq/blob/c394900b4da384abc7af2a2723140c693778e767/db-5.0.21/test/scr038/data/sample_nontxn_index.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 2

CREATE TABLE coin (cid INT(8) PRIMARY KEY,
                       unit VARCHAR2(20),
                       value NUMERIC(8,2), 
                       mintage_year INT(8),
                       mint_id INT(8),
                       CONSTRAINT mint_id_fk FOREIGN KEY(mint_id)
                           REFERENCES mint(mid));

CREATE TABLE mint (mid INT(8) PRIMARY KEY,
       country VARCHAR2(20),
       city VARCHAR2(20));

CREATE TABLE random (rid VARCHAR2(20) PRIMARY KEY,
       chunk bin(127));

