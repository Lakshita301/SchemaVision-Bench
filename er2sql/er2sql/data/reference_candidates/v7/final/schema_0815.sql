-- Source: https://github.com/soccin/BIC-RNAseq/blob/dbb6b46d5ae3555c3a021c0b55ca2d9f10f06d19/lib/R/AnnotationDbi/DBschemas/schemas_0.9/RODENTCHIP_DB.sql?raw=true
-- Tables detected: 24 | FK/REFERENCES mentions: 58

CREATE TABLE genes (
  id INTEGER PRIMARY KEY,
  gene_id VARCHAR(10) NOT NULL UNIQUE           -- Entrez Gene ID
);

CREATE TABLE probes (
  id INTEGER NULL,                              -- REFERENCES genes
  probe_id VARCHAR(80) PRIMARY KEY,             -- manufacturer ID
  accession VARCHAR(20) NULL,                   -- GenBank accession number
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE alias (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  alias_symbol VARCHAR(80) NOT NULL,            -- gene symbol or alias
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE chromosomes (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  chromosome VARCHAR(2) NOT NULL,               -- chromosome name
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE chromosome_locations (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  chromosome VARCHAR(20) NOT NULL,              -- sequence name
  start_location INTEGER NOT NULL,
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE cytogenetic_locations (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  cytogenetic_location VARCHAR(20) NOT NULL,    -- cytoband location
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE ec (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  ec_number VARCHAR(13) NOT NULL,               -- EC number (no "EC:" prefix)
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE gene_info (
  id INTEGER NOT NULL UNIQUE,                   -- REFERENCES genes
  gene_name VARCHAR(255) NOT NULL,              -- gene name
  symbol VARCHAR(80) NOT NULL,                  -- gene symbol
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE go_bp (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE go_bp_all (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE go_cc (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE go_cc_all (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE go_mf (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE go_mf_all (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  go_id CHAR(10) NOT NULL,                      -- GO ID
  evidence CHAR(3) NOT NULL,                    -- GO evidence code
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE kegg (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  kegg_id CHAR(5) NOT NULL,                     -- KEGG pathway short ID
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE pfam (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  ipi_id CHAR(11) NOT NULL,                     -- IPI accession number
  pfam_id CHAR(7) NULL,                         -- Pfam ID
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE prosite (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  ipi_id CHAR(11) NOT NULL,                     -- IPI accession number
  prosite_id CHAR(7) NULL,                      -- PROSITE ID
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE pubmed (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  pubmed_id VARCHAR(10) NOT NULL,               -- PubMed ID
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE refseq (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  accession VARCHAR(20) NOT NULL,               -- RefSeq accession number
  FOREIGN KEY (id) REFERENCES genes (id)
);

CREATE TABLE unigene (
  id INTEGER NOT NULL,                          -- REFERENCES genes
  unigene_id VARCHAR(10) NOT NULL,              -- UniGene ID
  FOREIGN KEY (id) REFERENCES genes (id)
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

