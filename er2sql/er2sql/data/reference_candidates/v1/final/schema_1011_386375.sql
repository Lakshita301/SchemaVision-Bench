-- Source: https://github.com/JavaQualitasCorpus/castor-1.3.3/blob/998e4784805f81e1a6fb907c59eb5c01d29673d1/cpactf/src/test/ddl/org/castor/cpa/test/test2527/derby-create.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE test2527_log (
    id         INT NOT NULL,
    time_stamp TIMESTAMP NOT NULL,
    source     VARCHAR(100) NOT NULL,  
    llevel     VARCHAR(10) NOT NULL,  
    message    VARCHAR(500) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE test2527_log_exception (
    id         INT NOT NULL,
    entry_id   INT NOT NULL,
    stacktrace CLOB NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE test2527_log_reference (
    id         INT NOT NULL,
    rtype      VARCHAR(100) NOT NULL,
    rvalue     VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE test2527_log_exception
ADD CONSTRAINT test2527_log_exception_fk
FOREIGN KEY (entry_id) REFERENCES test2527_log (id);

ALTER TABLE test2527_log_reference
ADD CONSTRAINT test2527_log_reference_fk
FOREIGN KEY (id) REFERENCES test2527_log (id);

