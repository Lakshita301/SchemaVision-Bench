-- Source: https://github.com/JTSDK/jtsdk-tools-dep/blob/d607f30e266565d2936ade546d4a81200e49633a/src/pgsql/R-DaaS/enum-scripts/R-DaaS-Enum.sql?raw=true
-- Tables detected: 33 | FK/REFERENCES mentions: 25

CREATE TABLE enum.antenna_path
(
    antenna_path_id SMALLSERIAL PRIMARY KEY,
    antenna_path_abbreviation VARCHAR(1) NOT NULL,
    antenna_path_meaning VARCHAR(15) NOT NULL,
    CONSTRAINT uq_antenna_path UNIQUE (antenna_path_abbreviation, antenna_path_meaning)
);

CREATE TABLE enum.award
(
    award_id SMALLSERIAL PRIMARY KEY,
    award_name VARCHAR(15),
    award_import_only BOOL NOT NULL DEFAULT '1',
    CONSTRAINT uq_award UNIQUE (award_name)
);

CREATE TABLE enum.arrl_section
(
    arrl_section_id SMALLSERIAL PRIMARY KEY,
    arrl_section_abbreviation VARCHAR(4) NOT NULL,
    arrl_section_name VARCHAR(70) NOT NULL,
    dxcc_entity_id SMALLINT NOT NULL,
    arrl_section_from_date date,
    arrl_section_deleted_date date
);

CREATE TABLE enum.band
(
    band_id SMALLSERIAL PRIMARY KEY,
    band_name VARCHAR(6) NOT NULL,
    band_lower_freq NUMERIC NOT NULL,
    band_upper_freq NUMERIC NOT NULL,
    CONSTRAINT uq_band_name UNIQUE (band_name)
);

CREATE TABLE enum.contest
(
    contest_id SMALLSERIAL PRIMARY KEY,
    contest_name VARCHAR(60),
    contest_description VARCHAR(120),
    contest_import_only BOOL NOT NULL DEFAULT '0',
    weblink_id SMALLINT,
    CONSTRAINT uq_contest_name UNIQUE (contest_name)
);

CREATE TABLE enum.continent
(
    continent_id SMALLSERIAL PRIMARY KEY,
    continent_abbreviation VARCHAR(2),
    continent_name VARCHAR(14),
    CONSTRAINT uq_continent_name UNIQUE (continent_abbreviation, continent_name)
);

CREATE TABLE enum.credit_facet
(
    credit_facet_id SMALLSERIAL PRIMARY KEY,
    credit_facet_name VARCHAR(20),
    CONSTRAINT uq_credit_facet_name UNIQUE (credit_facet_name)
);

CREATE TABLE enum.credit_award
(
    credit_award_id SMALLSERIAL PRIMARY KEY,
    credit_award_name VARCHAR(60),
    CONSTRAINT uq_credit_award_name UNIQUE (credit_award_name)
);

CREATE TABLE enum.credit_sponsor
(
    credit_sponsor_id SMALLSERIAL PRIMARY KEY,
    credit_sponsor_name VARCHAR(20),
    CONSTRAINT uq_credit_sponsor_name UNIQUE (credit_sponsor_name)
);

CREATE TABLE enum.credit
(
    credit_id SMALLSERIAL PRIMARY KEY,
    credit_for VARCHAR(24) NOT NULL,
    credit_sponsor_id SMALLINT NOT NULL,
    credit_award_id SMALLINT NOT NULL,
    credit_facet_id SMALLINT NOT NULL,
CONSTRAINT uq_credit_for UNIQUE (credit_for)
);

CREATE TABLE enum.dxcc_entity
(
    dxcc_entity_id SMALLINT PRIMARY KEY,
    dxcc_entity_code VARCHAR(4) NOT NULL,
    dxcc_entity_name VARCHAR(90) NOT NULL,
    dxcc_entity_deleted BOOL DEFAULT 'n',
    CONSTRAINT uq_dxcc_entity UNIQUE (dxcc_entity_code, dxcc_entity_name)
);

CREATE TABLE enum.state
(
    state_id SMALLSERIAL PRIMARY KEY,
    state_abbreviation VARCHAR(2) NOT NULL,
    state_name VARCHAR(20) NOT NULL,
    CONSTRAINT uq_state UNIQUE (state_abbreviation, state_name)
);

CREATE TABLE enum.county_name
(
    county_name_id SMALLSERIAL PRIMARY KEY,
    county_name VARCHAR(60) NOT NULL,
    CONSTRAINT uq_county_name UNIQUE (county_name)
);

CREATE TABLE enum.state_county
(
    state_country_id SMALLSERIAL PRIMARY KEY,
    state_id SMALLINT NOT NULL,
    county_name_id SMALLINT NOT NULL
);

CREATE TABLE enum.mode
(
    mode_id SMALLSERIAL PRIMARY KEY,
    mode_name VARCHAR(20) NOT NULL,
    mode_description_id SMALLINT,
    mode_import_only BOOL NOT NULL DEFAULT '0',
    CONSTRAINT uq_mode_name UNIQUE (mode_name)
);

CREATE TABLE enum.submode
(
    submode_id SMALLSERIAL PRIMARY KEY,
    mode_id SMALLINT NOT NULL,
    submode_name VARCHAR(20) NOT NULL,
    mode_description_id SMALLINT,
    CONSTRAINT uq_submode_name UNIQUE (submode_name)
);

CREATE TABLE enum.mode_description
(
    mode_description_id SMALLSERIAL PRIMARY KEY,
    mode_description_content VARCHAR(120) NOT NULL
);

CREATE TABLE enum.cq_zone
(
    cqzone_id SMALLINT PRIMARY KEY,
    cqzone_number SMALLINT NOT NULL,
    cqzone_short_description VARCHAR(60) NOT NULL,
    cqzone_long_description VARCHAR,
    weblink_id SMALLINT,
    CONSTRAINT uq_cq_zone UNIQUE (cqzone_number)
);

CREATE TABLE enum.itu_zone
(
    ituzone_id SMALLINT PRIMARY KEY,
    ituzone_number SMALLINT NOT NULL,
    ituzone_short_description VARCHAR(120),
    ituzone_long_description VARCHAR,
    weblink_id SMALLINT,
    CONSTRAINT ck_itu_zone UNIQUE (ituzone_number)
);

CREATE TABLE enum.oblast
(
    oblast_id SMALLSERIAL PRIMARY KEY,
    oblast_code VARCHAR(10) NOT NULL,
    oblast_name VARCHAR(120) NOT NULL,
    oblast_deleted BOOL NOT NULL DEFAULT '0',
    oblast_comment VARCHAR(120) NOT NULL,
    CONSTRAINT uq_oblast_code UNIQUE (oblast_code)
);

CREATE TABLE enum.propogation
(
    propogation_id SMALLSERIAL PRIMARY KEY,
    propogation_abbreviation VARCHAR(10) NOT NULL,
    propogation_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_propogation UNIQUE (propogation_abbreviation)
);

CREATE TABLE enum.pas
(
    pas_id SMALLSERIAL PRIMARY KEY,
    dxcc_entity_id SMALLINT NOT NULL,
    pas_code VARCHAR(10) NOT NULL,
    pas_subdivision VARCHAR(80) NOT NULL,
    CONSTRAINT uq_pas_name UNIQUE (pas_code)
);

CREATE TABLE enum.sas
(
    sas_id SMALLSERIAL PRIMARY KEY,
    pas_id SMALLINT NOT NULL,
    sas_name VARCHAR(80) NOT NULL,
    CONSTRAINT uq_sas_name UNIQUE (sas_name)
);

CREATE TABLE enum.qsl_medium
(
    qsl_medium_id SMALLSERIAL PRIMARY KEY,
    qsl_medium_type VARCHAR(10) NOT NULL,
    qsl_medium_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_medium UNIQUE (qsl_medium_type)
);

CREATE TABLE enum.qsl_rcvd
(
    qsl_rcvd_id SMALLSERIAL PRIMARY KEY,
    qsl_rcvd_status VARCHAR(1) NOT NULL,
    qsl_rcvd_status_import_only BOOL NOT NULL DEFAULT '0',
    qsl_rcvd_meaning VARCHAR(20) NOT NULL,
    qsl_rcvd_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_rcvd_status UNIQUE (qsl_rcvd_status)
);

CREATE TABLE enum.qsl_sent
(
    qsl_sent_id SMALLSERIAL PRIMARY KEY,
    qsl_sent_status VARCHAR(1) NOT NULL,
    qsl_sent_status_import_only BOOL NOT NULL DEFAULT '0',
    qsl_sent_meaning VARCHAR(20) NOT NULL,
    qsl_sent_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_sent_status UNIQUE (qsl_sent_status)
);

CREATE TABLE enum.qsl_via
(
    qsl_via_id SMALLSERIAL PRIMARY KEY,
    qsl_via_abbreviation VARCHAR(1) NOT NULL,
    qsl_via_import_only BOOL NOT NULL DEFAULT '0',
    qsl_via_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qsl_method UNIQUE (qsl_via_abbreviation)
);

CREATE TABLE enum.qso_complete
(
    id SMALLSERIAL PRIMARY KEY,
    qso_complete_abbreviation VARCHAR(1) NOT NULL,
    qso_complete_meaning VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qso_complete_abbreviation UNIQUE (qso_complete_abbreviation)
);

CREATE TABLE enum.qso_status
(
    qso_status_id SMALLSERIAL PRIMARY KEY,
    qso_status_abbreviation VARCHAR(1) NOT NULL,
    qso_status_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qso_status UNIQUE (qso_status_abbreviation)
);

CREATE TABLE enum.qso_upload_status
(
    qso_upload_status_id SMALLSERIAL PRIMARY KEY,
    qso_upload_status_abbreviaiton VARCHAR(1) NOT NULL,
    qso_upload_status_description VARCHAR(120) NOT NULL,
    CONSTRAINT uq_qso_upload_status UNIQUE (qso_upload_status_abbreviaiton)
);

CREATE TABLE enum.region
(
    region_id SMALLSERIAL PRIMARY KEY,
    region_entity_code VARCHAR(4) NOT NULL,
    dxcc_entity_id SMALLINT NOT NULL,
    region_name VARCHAR(120) NOT NULL,
    region_prefix VARCHAR(6) NOT NULL,
    CONSTRAINT uq_region UNIQUE (region_entity_code)
);

CREATE TABLE enum.region_applicability
(
    region_applicability_id SMALLSERIAL PRIMARY KEY,
    weblink_id SMALLINT NOT NULL
);

CREATE TABLE enum.weblink
(
    weblink_id SMALLSERIAL PRIMARY KEY,
    weblink_name VARCHAR(20) NOT NULL,
    weblink_short_name VARCHAR(10) NOT NULL,
    weblink_description VARCHAR(120) NOT NULL,
    weblink_url TEXT NOT NULL,
    CONSTRAINT uq_weblink UNIQUE (weblink_name)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE enum.arrl_section ADD CONSTRAINT fk_arrl_section_dxcc_entity
    FOREIGN KEY (dxcc_entity_id) REFERENCES enum.dxcc_entity (dxcc_entity_id);

ALTER TABLE enum.contest ADD CONSTRAINT fk_contest_weblink
    FOREIGN KEY (weblink_id) REFERENCES enum.weblink (weblink_id);

ALTER TABLE enum.credit ADD CONSTRAINT fk_credit_credit_sponsor
    FOREIGN KEY (credit_sponsor_id) REFERENCES enum.credit_sponsor (credit_sponsor_id);

ALTER TABLE enum.credit ADD CONSTRAINT fk_credit_credit_award
    FOREIGN KEY (credit_award_id) REFERENCES enum.credit_award (credit_award_id);

ALTER TABLE enum.credit ADD CONSTRAINT fk_credit_credit_facet
    FOREIGN KEY (credit_facet_id) REFERENCES enum.credit_facet (credit_facet_id);

ALTER TABLE enum.state_county ADD CONSTRAINT fk_state_county_state
    FOREIGN KEY (state_id) REFERENCES enum.state (state_id);

ALTER TABLE enum.state_county ADD CONSTRAINT fk_state_county_county_name
    FOREIGN KEY (county_name_id) REFERENCES enum.county_name (county_name_id);

ALTER TABLE enum.pas ADD CONSTRAINT fk_pas_dxcc_entity
    FOREIGN KEY (dxcc_entity_id) REFERENCES enum.dxcc_entity (dxcc_entity_id);

ALTER TABLE enum.region ADD CONSTRAINT fk_region_dxcc_entity
    FOREIGN KEY (dxcc_entity_id) REFERENCES enum.dxcc_entity (dxcc_entity_id);

ALTER TABLE enum.mode ADD CONSTRAINT fk_mode_mode_description
    FOREIGN KEY (mode_description_id) REFERENCES enum.mode_description (mode_description_id);

ALTER TABLE enum.submode ADD CONSTRAINT fk_submode_mode
    FOREIGN KEY (mode_id) REFERENCES enum.mode (mode_id);

ALTER TABLE enum.submode ADD CONSTRAINT fk_submode_mode_description
    FOREIGN KEY (mode_description_id) REFERENCES enum.mode_description (mode_description_id);

