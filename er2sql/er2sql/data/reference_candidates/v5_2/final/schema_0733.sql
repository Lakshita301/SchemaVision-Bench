-- Source: https://github.com/Osbornroad/Delivery/blob/851e533c0f8b1ffaa7c19bbf70c90c8545a08200/target/classes/db/initDB.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 4

CREATE TABLE finishParts
(
    id                     SERIAL PRIMARY KEY,
    finishPartNumber       VARCHAR UNIQUE NOT NULL,
    sortNum                INTEGER NOT NULL
);

CREATE TABLE kits
(
    id                     SERIAL PRIMARY KEY,
    kitName                VARCHAR UNIQUE NOT NULL,
    wib224                 VARCHAR UNIQUE NOT NULL,
    series                 VARCHAR NOT NULL,
    sortNum                INTEGER NOT NULL,
    current                BOOLEAN DEFAULT TRUE
);

CREATE TABLE kits_finish_parts
(
    kits_id          INTEGER NOT NULL,
    finish_parts_id  INTEGER NOT NULL,
    PRIMARY KEY (kits_id, finish_parts_id),
    CONSTRAINT fk_variants_finish_parts_1 FOREIGN KEY (kits_id) REFERENCES kits (id),
    CONSTRAINT fk_variants_finish_parts_2 FOREIGN KEY (finish_parts_id) REFERENCES finishParts (id)
);

CREATE TABLE notes
(
  id                 SERIAL PRIMARY KEY,
  fieldKey           INTEGER,
  aPoint             VARCHAR,
  sequence           VARCHAR,
  modelVariant       VARCHAR,
  series             VARCHAR,
  number             INTEGER,
  planned            TIMESTAMP,
  wib225             VARCHAR,
  wib224             VARCHAR,
  aPointDateTime     TIMESTAMP
);

CREATE TABLE matching224
(
  id                 SERIAL PRIMARY KEY,
  concat             VARCHAR,
  wib224             VARCHAR
);

