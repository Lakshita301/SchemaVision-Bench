-- Source: https://github.com/DAINTINESS-Group/Schema_Evolution_Datasets/blob/9a5b20bd52424fc31e41d22c50f3847e1c7574ad/SchemaEvolutionDatasets2017/Med/biosql/2013_collection/processed%20schemata/1033520952.sql?raw=true
-- Tables detected: 21 | FK/REFERENCES mentions: 53

CREATE TABLE biodatabase (
  	biodatabase_id 	INT(10) UNSIGNED NOT NULL auto_increment,
  	name           	VARCHAR(40) NOT NULL,
	authority	VARCHAR(40),
	PRIMARY KEY (biodatabase_id),
  	UNIQUE (name)
) TYPE=INNODB;

CREATE TABLE taxon (
  	taxon_id   	INT(10) UNSIGNED NOT NULL auto_increment,
  	binomial 	VARCHAR(96) NOT NULL,
  	common_name 	VARCHAR(255),
  	ncbi_taxon_id 	INT(10),
  	full_lineage 	TEXT NOT NULL,
	PRIMARY KEY (taxon_id),
  	UNIQUE (binomial),
  	UNIQUE (ncbi_taxon_id),
  	UNIQUE (common_name)
) TYPE=INNODB;

CREATE TABLE ontology_term (
       	ontology_term_id INT(10) UNSIGNED NOT NULL auto_increment,
       	term_name        VARCHAR(255) NOT NULL,
       	term_definition  TEXT,
	term_identifier	 VARCHAR(40),
	category_id      INT(10) UNSIGNED,
	PRIMARY KEY (ontology_term_id),
	UNIQUE (term_name,category_id),
	UNIQUE (term_identifier)
) TYPE=INNODB;

CREATE TABLE bioentry (
	bioentry_id	INT(10) UNSIGNED NOT NULL auto_increment,
  	biodatabase_id  INT(10) UNSIGNED NOT NULL,
  	taxon_id     	INT(10) UNSIGNED,
  	display_id   	VARCHAR(40) NOT NULL,
  	accession    	VARCHAR(40) NOT NULL,
  	identifier   	VARCHAR(40),
  	description  	VARCHAR(255),
  	entry_version 	TINYINT, 
  	division	VARCHAR(3),
	PRIMARY KEY (bioentry_id),
  	UNIQUE (biodatabase_id,accession,entry_version),
  	UNIQUE (identifier,biodatabase_id)
) TYPE=INNODB;

CREATE TABLE biosequence (
  	bioentry_id     INT(10) UNSIGNED NOT NULL,
  	seq_version     SMALLINT, 
  	seq_length      INT(10), 
  	biosequence_str LONGTEXT,
  	alphabet        VARCHAR(10),
	PRIMARY KEY (bioentry_id)
) TYPE=INNODB;

CREATE TABLE dbxref (
        dbxref_id	INT(10) UNSIGNED NOT NULL auto_increment,
        dbname          VARCHAR(40) NOT NULL,
        accession       VARCHAR(40) NOT NULL,
	PRIMARY KEY (dbxref_id),
        UNIQUE(dbname, accession)
) TYPE=INNODB;

CREATE TABLE dbxref_qualifier_value (
	dbxref_qualifier_value_id  INT(10) UNSIGNED NOT NULL auto_increment,
       	dbxref_id 		INT(10) UNSIGNED NOT NULL,
       	ontology_term_id 	INT(10) UNSIGNED NOT NULL,
       	qualifier_value		TEXT,
	PRIMARY KEY (dbxref_qualifier_value_id)
) TYPE=INNODB;

CREATE TABLE bioentry_dblink (
--     	bioentry_dblink_id INT(10) UNSIGNED NOT NULL auto_increment,
       	bioentry_id        INT(10) UNSIGNED NOT NULL,
       	dbxref_id          INT(10) UNSIGNED NOT NULL,
--	PRIMARY KEY (bioentry_dblink_id),
--	UNIQUE (bioentry_id,dbxref_id)
	PRIMARY KEY (bioentry_id,dbxref_id)
) TYPE=INNODB;

CREATE TABLE reference (
  	reference_id       INT(10) UNSIGNED NOT NULL auto_increment,
  	reference_location TEXT NOT NULL,
  	reference_title    TEXT,
  	reference_authors  TEXT NOT NULL,
  	reference_medline  INT(10),
	PRIMARY KEY (reference_id),
	UNIQUE (reference_medline)
) TYPE=INNODB;

CREATE TABLE bioentry_reference (
  	bioentry_id 	INT(10) UNSIGNED NOT NULL,
  	reference_id 	INT(10) UNSIGNED NOT NULL,
  	reference_start INT(10),
  	reference_end   INT(10),
  	reference_rank  SMALLINT NOT NULL,
  	PRIMARY KEY(bioentry_id,reference_id,reference_rank)
) TYPE=INNODB;

CREATE TABLE comment (
  	comment_id  	INT(10) UNSIGNED NOT NULL auto_increment,
  	bioentry_id    	INT(10) UNSIGNED NOT NULL,
  	comment_text   	TEXT NOT NULL,
  	comment_rank   	SMALLINT NOT NULL,
	PRIMARY KEY (comment_id),
  	UNIQUE(bioentry_id, comment_rank)
) TYPE=INNODB;

CREATE TABLE bioentry_qualifier_value (
	bioentry_id   		INT(10) UNSIGNED NOT NULL,
   	ontology_term_id  	INT(10) UNSIGNED NOT NULL,
   	qualifier_value         TEXT
) TYPE=INNODB;

CREATE TABLE seqfeature_source (
--        	seqfeature_source_id 	INT(10) UNSIGNED NOT NULL auto_increment,
--       	source_name 		VARCHAR(255) NOT NULL,
-- 	PRIMARY KEY (seqfeature_source_id)
-- ) TYPE=INNODB;

CREATE TABLE seqfeature (
   	seqfeature_id 		INT(10) UNSIGNED NOT NULL auto_increment,
   	bioentry_id   		INT(10) UNSIGNED NOT NULL,
   	ontology_term_id	INT(10) UNSIGNED,
   	seqfeature_source_id  	INT(10) UNSIGNED,
   	seqfeature_rank 	INT(5),
	PRIMARY KEY (seqfeature_id),
	UNIQUE (bioentry_id,ontology_term_id,seqfeature_rank)
) TYPE=INNODB;

CREATE TABLE seqfeature_relationship (
   	parent_seqfeature_id	INT(10) UNSIGNED NOT NULL,
   	child_seqfeature_id 	INT(10) UNSIGNED NOT NULL,
   	ontology_term_id 	INT(10) UNSIGNED NOT NULL,
   	relationship_rank 	INT(5),
   	PRIMARY KEY (parent_seqfeature_id,child_seqfeature_id,ontology_term_id)
) TYPE=INNODB;

CREATE TABLE seqfeature_qualifier_value (
	seqfeature_id 		INT(10) UNSIGNED NOT NULL,
   	ontology_term_id 	INT(10) UNSIGNED NOT NULL,
   	qualifier_rank 		SMALLINT NOT NULL,
   	qualifier_value  	TEXT NOT NULL,
   	PRIMARY KEY (seqfeature_id,ontology_term_id,qualifier_rank)
) TYPE=INNODB;

CREATE TABLE seqfeature_location (
	seqfeature_location_id 	INT(10) UNSIGNED NOT NULL auto_increment,
   	seqfeature_id		INT(10) UNSIGNED NOT NULL,
   	seq_start              	INT(10),
   	seq_end                	INT(10),
   	seq_strand             	TINYINT NOT NULL,
   	location_rank          	SMALLINT,
	PRIMARY KEY (seqfeature_location_id),
   	UNIQUE (seqfeature_id, location_rank)
) TYPE=INNODB;

CREATE TABLE remote_seqfeature_name (
       	seqfeature_location_id 	INT(10) UNSIGNED NOT NULL,
       	accession 		VARCHAR(40) NOT NULL,
       	version   		TINYINT NOT NULL,
	PRIMARY KEY (seqfeature_location_id)
) TYPE=INNODB;

CREATE TABLE location_qualifier_value (
	seqfeature_location_id	INT(10) UNSIGNED NOT NULL,
   	ontology_term_id 	INT(10) UNSIGNED NOT NULL,
   	qualifier_value  	VARCHAR(255) NOT NULL,
   	qualifier_int_value 	INT(10),
	PRIMARY KEY (seqfeature_location_id,ontology_term_id)
) TYPE=INNODB;

CREATE TABLE cache_corba_support (
       biodatabase_id    int(10) unsigned NOT NULL PRIMARY KEY,  
       http_ior_string   VARCHAR(255),
       direct_ior_string VARCHAR(255)
       );

CREATE TABLE _tmp AS SELECT * FROM ontology_term;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ontology_term ADD CONSTRAINT FKontology_ontology
	FOREIGN KEY (category_id) REFERENCES ontology_term(ontology_term_id)
	ON DELETE CASCADE;

ALTER TABLE bioentry ADD CONSTRAINT FKtaxon_bioentry
	FOREIGN KEY (taxon_id) REFERENCES taxon(taxon_id);

ALTER TABLE bioentry ADD CONSTRAINT FKbiodatabase_bioentry
	FOREIGN KEY (biodatabase_id) REFERENCES biodatabase(biodatabase_id);

ALTER TABLE biosequence ADD CONSTRAINT FKbioentry_bioseq
	FOREIGN KEY (bioentry_id) REFERENCES bioentry(bioentry_id)
	ON DELETE CASCADE;

ALTER TABLE comment ADD CONSTRAINT FKbioentry_comment
	FOREIGN KEY(bioentry_id) REFERENCES bioentry(bioentry_id)
	ON DELETE CASCADE;

ALTER TABLE bioentry_dblink ADD CONSTRAINT FKbioentry_dblink
        FOREIGN KEY (bioentry_id) REFERENCES bioentry(bioentry_id)
	ON DELETE CASCADE;

ALTER TABLE bioentry_dblink ADD CONSTRAINT FKdbxref_dblink
       	FOREIGN KEY (dbxref_id) REFERENCES dbxref(dbxref_id)
	ON DELETE CASCADE;

ALTER TABLE dbxref_qualifier_value ADD CONSTRAINT FKont_dbxrefqual
	FOREIGN KEY (ontology_term_id) REFERENCES ontology_term(ontology_term_id);

ALTER TABLE dbxref_qualifier_value ADD CONSTRAINT FKdbxref_dbxrefqual
	FOREIGN KEY (dbxref_id) REFERENCES dbxref(dbxref_id)
	ON DELETE CASCADE;

ALTER TABLE bioentry_reference ADD CONSTRAINT FKbioentry_entryref
	FOREIGN KEY (bioentry_id) REFERENCES bioentry(bioentry_id)
	ON DELETE CASCADE;

ALTER TABLE bioentry_reference ADD CONSTRAINT FKreference_entryref
	FOREIGN KEY (reference_id) REFERENCES reference(reference_id)
	ON DELETE CASCADE;

ALTER TABLE bioentry_qualifier_value ADD CONSTRAINT FKbioentry_entqual
	FOREIGN KEY (bioentry_id) REFERENCES bioentry(bioentry_id)
	ON DELETE CASCADE;

ALTER TABLE bioentry_qualifier_value ADD CONSTRAINT FKontology_entqual
	FOREIGN KEY (ontology_term_id) REFERENCES ontology_term(ontology_term_id)
	ON DELETE CASCADE;

ALTER TABLE seqfeature ADD CONSTRAINT FKontology_seqfeature
	FOREIGN KEY (ontology_term_id) REFERENCES ontology_term(ontology_term_id);

ALTER TABLE seqfeature ADD CONSTRAINT FKsourceterm_seqfeature
	FOREIGN KEY (seqfeature_source_id) REFERENCES ontology_term(ontology_term_id)
	ON DELETE CASCADE;

ALTER TABLE seqfeature ADD CONSTRAINT FKbioentry_seqfeature
	FOREIGN KEY (bioentry_id) REFERENCES bioentry(bioentry_id)
	ON DELETE CASCADE;

ALTER TABLE seqfeature_relationship ADD CONSTRAINT FKontology_seqfeatrel
	FOREIGN KEY (ontology_term_id) REFERENCES ontology_term(ontology_term_id)	ON DELETE CASCADE;

ALTER TABLE seqfeature_relationship ADD CONSTRAINT FKparentfeat_seqfeatrel
	FOREIGN KEY (parent_seqfeature_id) REFERENCES seqfeature(seqfeature_id)
	ON DELETE CASCADE;

ALTER TABLE seqfeature_relationship ADD CONSTRAINT FKchildfeat_seqfeatrel
	FOREIGN KEY (child_seqfeature_id) REFERENCES seqfeature(seqfeature_id)
	ON DELETE CASCADE;

ALTER TABLE seqfeature_qualifier_value ADD CONSTRAINT FKontology_featqual
	FOREIGN KEY (ontology_term_id) REFERENCES ontology_term(ontology_term_id)
	ON DELETE CASCADE;

ALTER TABLE seqfeature_qualifier_value ADD CONSTRAINT FKseqfeature_featqual
	FOREIGN KEY (seqfeature_id) REFERENCES seqfeature(seqfeature_id)
	ON DELETE CASCADE;

ALTER TABLE seqfeature_location ADD CONSTRAINT FKseqfeature_featloc
	FOREIGN KEY (seqfeature_id) REFERENCES seqfeature(seqfeature_id)
	ON DELETE CASCADE;

ALTER TABLE remote_seqfeature_name ADD CONSTRAINT FKfeatloc_remotefeat
	FOREIGN KEY (seqfeature_location_id) REFERENCES seqfeature_location(seqfeature_location_id)
	ON DELETE CASCADE;

ALTER TABLE location_qualifier_value ADD CONSTRAINT FKfeatloc_locqual
	FOREIGN KEY (seqfeature_location_id) REFERENCES seqfeature_location(seqfeature_location_id)
	ON DELETE CASCADE;

ALTER TABLE location_qualifier_value ADD CONSTRAINT FKontology_locqual
	FOREIGN KEY (ontology_term_id) REFERENCES ontology_term(ontology_term_id)
	ON DELETE CASCADE;

