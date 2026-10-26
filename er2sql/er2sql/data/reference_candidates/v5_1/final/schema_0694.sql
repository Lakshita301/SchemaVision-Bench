-- Source: https://github.com/fluby/neonetods/blob/7cb02af84de8f20db689497113b1631e42dc0022/ddls/taxonomy_schema_ddl.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 7
CREATE TABLE high_level
(
    taxon_id varchar(255)     NOT NULL,
    source_id_family_up varchar(255),
    kingdom varchar(255),
    subkingdom varchar(255),
    superdivision varchar(255),
    phylum_or_division varchar(255),
    subdivision varchar(255),
    class varchar(255),
    subclass varchar(255),
    order_name varchar(255),
    family varchar(255),
    family_common varchar(255),
    source_id_subfamily_down varchar(255),
    subfamily varchar(255),
    tribe varchar(255),
    genus varchar(255)     NOT NULL,
    notes text
);
CREATE TABLE mammals
(
    taxon_id varchar(255),
    spp_id varchar(255)     NOT NULL,
    source_id varchar(255),
    scientific_name varchar(255),
    genus varchar(255),
    subgenus varchar(255),
    species varchar(255),
    subspecies varchar(255),
    authority_name varchar(255),
    authority_year numeric,
    itis_number numeric,
    common_name varchar(255),
    CONSTRAINT mammals_taxon_id_fkey FOREIGN KEY (taxon_id, genus)
  REFERENCES high_level (taxon_id,genus)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
CREATE TABLE birds
(
    taxon_id varchar(255),
    spp_id varchar(255)     NOT NULL,
    source_id varchar(255),
    scientific_name varchar(255),
    genus varchar(255),
    subgenus varchar(255),
    species varchar(255),
    subspecies varchar(255),
    authority_name varchar(255),
    authority_year numeric,
    itis_number numeric,
    common_name varchar(255)
);
CREATE TABLE inverts
(
    taxon_id varchar(255),
    spp_id varchar(255)     NOT NULL,
    source_id varchar(255),
    scientific_name varchar(255),
    genus varchar(255),
    subgenus varchar(255),
    species varchar(255),
    subspecies varchar(255),
    authority_name varchar(255),
    authority_year numeric,
    itis_number numeric,
    common_name varchar(255)
);
CREATE TABLE plants
(
    taxon_id varchar(255),
    spp_id varchar(255)     NOT NULL,
    source_id varchar(255),
    scientific_name varchar(255),
    genus varchar(255),
    subgenus varchar(255),
    species varchar(255),
    subspecies varchar(255),
    authority_name varchar(255),
    authority_year numeric,
    itis_number numeric,
    common_name varchar(255),
    CONSTRAINT plants_taxon_id_fkey FOREIGN KEY (taxon_id, genus)
  REFERENCES high_level (taxon_id,genus)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
CREATE TABLE herps
(
    taxon_id varchar(255),
    spp_id varchar(255)     NOT NULL,
    source_id varchar(255),
    scientific_name varchar(255),
    genus varchar(255),
    subgenus varchar(255),
    species varchar(255),
    subspecies varchar(255),
    authority_name varchar(255),
    authority_year numeric,
    itis_number numeric,
    common_name varchar(255),
    CONSTRAINT herps_taxon_id_fkey FOREIGN KEY (taxon_id, genus)
  REFERENCES high_level (taxon_id,genus)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
