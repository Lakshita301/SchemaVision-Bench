-- Source: https://github.com/Bioconductor/AnnotationDbi/blob/eaf4862b7867068c25366cb479496179e6e60d09/inst/DBschemas/schemas_0.9/YEASTCHIP_DB.sql?raw=true
-- Tables detected: 17 | FK/REFERENCES mentions: 37

CREATE TABLE sgd (
  id INTEGER PRIMARY KEY,
  systematic_name VARCHAR(14) NULL UNIQUE,      -- Yeast ORF ID
  gene_name VARCHAR(14) NULL UNIQUE,            -- Yeast gene name
  sgd_id CHAR(10) NOT NULL UNIQUE               -- SGD ID
);

CREATE TABLE probes (
  id INTEGER NULL,                              -- REFERENCES sgd
  probe_id VARCHAR(80) PRIMARY KEY,             -- manufacturer ID
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE chromosome_features (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  chromosome VARCHAR(2) NULL,                   -- chromosome name
  start INTEGER NULL,
  feature_description TEXT NULL,                -- Yeast feature description
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE ec (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  ec_number VARCHAR(13) NOT NULL,               -- EC number (no "EC:" prefix)
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE gene2alias (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  alias VARCHAR(13) NOT NULL,                   -- Yeast gene alias
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE go_bp (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE go_bp_all (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE go_cc (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE go_cc_all (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE go_mf (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE go_mf_all (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE kegg (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  kegg_id CHAR(5) NOT NULL,                     -- KEGG pathway short ID
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE pubmed (
  id INTEGER NOT NULL,                          -- REFERENCES sgd
  pubmed_id VARCHAR(10) NOT NULL,               -- PubMed ID
  FOREIGN KEY (id) REFERENCES sgd (id)
);

CREATE TABLE chrlengths (
  chr VARCHAR(2) PRIMARY KEY,                   -- chromosome name
  length INTEGER NOT NULL
);

CREATE TABLE metadata (
  name VARCHAR(80) PRIMARY KEY,
  value VARCHAR(255)
);

CREATE TABLE qcdata (
  map_name VARCHAR(80) PRIMARY KEY,
  count INTEGER NOT NULL
);

CREATE TABLE map_metadata (
  map_name VARCHAR(80) NOT NULL,
  source_name VARCHAR(80) NOT NULL,
  source_url VARCHAR(255) NOT NULL,
  source_date VARCHAR(20) NOT NULL
);

