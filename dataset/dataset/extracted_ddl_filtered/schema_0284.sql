-- Source: https://github.com/apavlo/h-store/blob/e49885293bf32dad701cb08a3394719d4f844a64/third_party/cpp/berkeleydb/test/sql_codegen/data/sample_env_txn_dbs_mix_txn.sql?raw=true
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

