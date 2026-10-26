-- Source: https://github.com/apavlo/h-store/blob/e49885293bf32dad701cb08a3394719d4f844a64/third_party/cpp/berkeleydb/test/sql_codegen/data/sample_env_txn_dbs_mix_txn.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 2
CREATE TABLE coin (
    cid INT PRIMARY KEY,
    unit VARCHAR(20),
    value NUMERIC(8,2),
    mintage_year INT,
    mint_id INT
);

CREATE TABLE mint (
    mid INT PRIMARY KEY,
    country VARCHAR(20),
    city VARCHAR(20)
);

CREATE TABLE random (
    rid VARCHAR(20) PRIMARY KEY,
    chunk bin(127)
);
ALTER TABLE coin ADD CONSTRAINT mint_id_fk FOREIGN KEY(mint_id)
                           REFERENCES mint(mid);
