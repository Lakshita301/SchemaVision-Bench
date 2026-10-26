-- Source: https://github.com/CodeGit/SequenceImp/blob/cf8ce0f29b530739d70b1535c6b1b356036fda1f/dependencies-bin/windows/bin/R/library/AnnotationDbi/DBschemas/schemas_1.0/ARABIDOPSISCHIP_DB.sql?raw=true
-- Tables detected: 18 | FK constraints: 14

CREATE TABLE genes (
  _id INTEGER PRIMARY KEY,
  gene_id CHAR(9) NOT NULL UNIQUE               -- AGI locus ID
);

CREATE TABLE probes (
  probe_id VARCHAR(80) NOT NULL,                -- manufacturer ID
  is_multiple SMALLINT NOT NULL,                -- a silly and useless field
  _id INTEGER NULL,                             -- REFERENCES genes
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE aracyc (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  pathway_name VARCHAR(255) NOT NULL,            -- AraCyc pathway name
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE chromosome_locations (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  seqname CHAR(1) NOT NULL,                      -- Arabidopsis chromosome
  start_location INTEGER NOT NULL,
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE ec (                                --    Table
  _id INTEGER NOT NULL,                          -- 
  ec_number VARCHAR(13) NOT NULL,                --    NOT
  FOREIGN KEY (_id) REFERENCES genes (_id)       -- 
);

CREATE TABLE enzyme (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  ec_name VARCHAR(255) NOT NULL,                 -- EC name
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE gene_info (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  gene_name VARCHAR(255) NULL,                   -- gene name
  symbol VARCHAR(80) NULL,                       -- gene symbol
  chromosome CHAR(1) NULL,                       -- Arabidopsis chromosome
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE go_bp (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                       -- GO ID
  evidence CHAR(3) NOT NULL,                     -- GO evidence code
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE go_bp_all (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                       -- GO ID
  evidence CHAR(3) NOT NULL,                     -- GO evidence code
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE go_cc (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                       -- GO ID
  evidence CHAR(3) NOT NULL,                     -- GO evidence code
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE go_cc_all (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                       -- GO ID
  evidence CHAR(3) NOT NULL,                     -- GO evidence code
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE go_mf (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                       -- GO ID
  evidence CHAR(3) NOT NULL,                     -- GO evidence code
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE go_mf_all (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                       -- GO ID
  evidence CHAR(3) NOT NULL,                     -- GO evidence code
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE kegg (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  path_id CHAR(5) NOT NULL,                      -- KEGG pathway short ID
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE pubmed (
  _id INTEGER NOT NULL,                          -- REFERENCES genes
  pubmed_id VARCHAR(10) NOT NULL,                -- PubMed ID
  FOREIGN KEY (_id) REFERENCES genes (_id)
);

CREATE TABLE metadata (
  name VARCHAR(80) PRIMARY KEY,
  value VARCHAR(255)
);

CREATE TABLE map_counts (
  map_name VARCHAR(80) PRIMARY KEY,
  count INTEGER NOT NULL
);

CREATE TABLE map_metadata (
  map_name VARCHAR(80) NOT NULL,
  source_name VARCHAR(80) NOT NULL,
  source_url VARCHAR(255) NOT NULL,
  source_date VARCHAR(20) NOT NULL
);

