-- Source: https://github.com/codehaus/castor/blob/974f853be5680427a195a6b8ae3ce63a65a309b6/castor/tags/castor-1.3.3-rc1/trunk/cpactf/src/test/ddl/org/castor/cpa/test/test1217/mysql-create.sql?raw=true
-- Tables detected: 4 | FK constraints: 3
CREATE TABLE test1217_person (
    oid VARCHAR(8) NOT NULL,
    name VARCHAR(60) NOT NULL,
    PRIMARY KEY (oid)
);
CREATE TABLE test1217_base (
    oid VARCHAR(8) NOT NULL,
    name VARCHAR(60) NOT NULL,
    PRIMARY KEY (oid)
);
CREATE TABLE test1217_extended (
    oid VARCHAR(8) NOT NULL,
    exnum VARCHAR(20) NOT NULL,
    PRIMARY KEY (oid),
    FOREIGN KEY (oid)
REFERENCES test1217_base (oid)
);
CREATE TABLE test1217_product (
    oid VARCHAR(8) NOT NULL,
    code VARCHAR(12) NOT NULL,
    price NUMERIC(12,2) NOT NULL,
    company VARCHAR(8) NOT NULL,
    part VARCHAR(8) NOT NULL,
    PRIMARY KEY (oid),
    FOREIGN KEY (company)
REFERENCES test1217_person (oid)
);
ALTER TABLE test1217_product
ADD FOREIGN KEY (part)
REFERENCES test1217_base (oid);
