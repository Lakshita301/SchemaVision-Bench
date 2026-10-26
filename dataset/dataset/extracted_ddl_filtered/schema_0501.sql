-- Source: https://github.com/MrCsabaToth/SOEMPI/blob/9f5a5dcee415791255ac1458e9573e7205356346/data/create_database_schema.sql?raw=true
-- Tables detected: 20 | FK/REFERENCES mentions: 73

CREATE TABLE app_user (
    id bigint NOT NULL,
    username varchar(50) NOT NULL,
    email varchar(255) NOT NULL,
    phone_number varchar(255),
    password_hint varchar(255),
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    website varchar(255),
    account_expired boolean NOT NULL,
    account_locked boolean NOT NULL,
    credentials_expired boolean NOT NULL,
    city varchar(50) NOT NULL,
    province varchar(100),
    postal_code varchar(15) NOT NULL,
    address varchar(150),
    country varchar(100),
    account_enabled boolean,
    "version" integer,
    "password" varchar(255) NOT NULL
) WITHOUT OIDS;

CREATE TABLE role (
    id bigint NOT NULL,
    name varchar(20),
    description varchar(64)
) WITHOUT OIDS;

CREATE TABLE user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
) WITHOUT OIDS;

CREATE TABLE person (
    person_id BIGINT NOT NULL,
    original_id varchar(64),

    date_created timestamp without time zone NOT NULL,
    creator_id bigint --NOT NULL
) WITHOUT OIDS;

CREATE TABLE person_link (
    person_link_id integer NOT NULL,
    left_person_id BIGINT NOT NULL,
    right_person_id BIGINT NOT NULL,
    binary_vector varchar(65535),
    continous_vector varchar(65535),
    weight double precision NOT NULL,
    link_state integer NOT NULL
) WITHOUT OIDS;

CREATE TABLE person_match (
    person_match_id integer NOT NULL,
    match_title varchar(255) NOT NULL,
    left_dataset_id integer NOT NULL,
    right_dataset_id integer NOT NULL,
    matchconfiguration bytea NOT NULL,
    matchfellegisunter bytea,
    blockfellegisunter bytea,
    total_records bigint NOT NULL,
    bf_k_parameter integer,
    bf_fill_factor double precision,
    creator_id bigint, --NOT NULL,
    date_created timestamp without time zone NOT NULL
) WITHOUT OIDS;

CREATE TABLE person_match_request (
    person_match_request_id integer NOT NULL,
    dataset_id integer NOT NULL,
    match_name varchar(255) NOT NULL,
    blocking_service_name varchar(255) NOT NULL,
    matching_service_name varchar(255) NOT NULL,
    dh_secret integer,
    dh_public_key bytea,
    match_pair_stat_half_table_name varchar(255),
    person_match_id integer,
    completed boolean NOT NULL,
    creator_id bigint, --NOT NULL,
    date_created timestamp without time zone NOT NULL
) WITHOUT OIDS;

CREATE TABLE field_type (
    field_type_cd integer NOT NULL,
    field_type_name varchar(64) NOT NULL,
    field_type_description varchar(255),
    field_type_code varchar(64) NOT NULL
) WITHOUT OIDS;

CREATE TABLE field_meaning (
    field_meaning_cd integer NOT NULL,
    field_meaning_name varchar(64) NOT NULL,
    field_meaning_description varchar(255),
    field_meaning_code varchar(64) NOT NULL
) WITHOUT OIDS;

CREATE TABLE column_match_information (
    column_match_information_id integer NOT NULL,
    person_match_id integer NOT NULL,
    left_field_name varchar(255) NOT NULL,
    right_field_name varchar(255) NOT NULL,
    field_type_cd integer NOT NULL,
    field_type_modifier varchar(255),
    field_meaning_cd integer NOT NULL,
    comparison_function_name varchar(255),
    fs_m_value double precision,
    fs_u_value double precision,
    bf_proposed_m double precision,
    bf_possible_m double precision,
    bf_final_m double precision
) WITHOUT OIDS;

CREATE TABLE dataset (
  dataset_id     integer NOT NULL,
  user_id        integer, --NOT NULL,
  table_name     varchar(255) NOT NULL,
  file_name      varchar(255) NOT NULL,
  total_records  bigint NOT NULL,
  imported_ind   char NOT NULL DEFAULT 'N'::bpchar,
  date_created   timestamp WITHOUT TIME ZONE NOT NULL
) WITHOUT OIDS;

CREATE TABLE column_information (
    column_information_id integer NOT NULL,
    dataset_id integer NOT NULL,
    field_name varchar(255) NOT NULL,
    field_type_cd integer NOT NULL,
    field_type_modifier varchar(255),
    field_meaning_cd integer NOT NULL,
    field_transformation varchar(255),
    bf_m_parameter integer,
    bf_k_parameter integer,
    average_field_length double precision,
    number_of_missing integer
) WITHOUT OIDS;

CREATE TABLE key (
    id BIGINT NOT NULL,
    publickeypart1 bytea,
    publickeypart2 bytea,
    publickeypart3 bytea,
    privatekeypart1 bytea,
    privatekeypart2 bytea,
    privatekeypart3 bytea,
    date_created timestamp without time zone NOT NULL,
    creator_id bigint, --NOT NULL,
    date_voided timestamp without time zone,
    voided_by_id bigint
) WITHOUT OIDS;

CREATE TABLE salt (
    id BIGINT NOT NULL,
    salt bytea,
    date_created timestamp without time zone NOT NULL,
    creator_id bigint, --NOT NULL,
    date_voided timestamp without time zone,
    voided_by_id bigint
) WITHOUT OIDS;

CREATE TABLE user_session (
    session_id integer NOT NULL,
    date_created timestamp without time zone NOT NULL,
    session_key varchar(255),
    user_id bigint NOT NULL
) WITHOUT OIDS;

CREATE TABLE audit_event (
    audit_event_id integer NOT NULL,
    date_created timestamp without time zone NOT NULL,
    audit_event_type_cd integer NOT NULL,
    audit_event_description varchar(255),
    ref_person_id BIGINT,
    alt_ref_person_id BIGINT,
    ref_key_id BIGINT,
    ref_salt_id BIGINT,
    creator_id integer --NOT NULL
) WITHOUT OIDS;

CREATE TABLE audit_event_type (
    audit_event_type_cd integer NOT NULL,
    audit_event_type_name varchar(64) NOT NULL,
    audit_event_type_description varchar(255),
    audit_event_type_code varchar(64) NOT NULL
) WITHOUT OIDS;

CREATE TABLE person_link_review (
    person_link_review_id integer NOT NULL,
    left_person_id BIGINT NOT NULL,
    right_person_id BIGINT NOT NULL,
    date_created timestamp without time zone NOT NULL,
    weight double precision,
    creator_id bigint NOT NULL,
    reviewer_id integer,
    date_reviewed integer
) WITHOUT OIDS;

CREATE TABLE match_pair_stat_half (
    match_pair_stat_half_id BIGINT NOT NULL,
    person_pseudo_id BIGINT NOT NULL,
    match_state boolean NOT NULL
) WITHOUT OIDS;

CREATE TABLE match_pair_stat (
    match_pair_stat_id BIGINT NOT NULL,
    left_person_pseudo_id BIGINT NOT NULL,
    right_person_pseudo_id BIGINT NOT NULL,
    match_state boolean NOT NULL
) WITHOUT OIDS;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ONLY person_link
    ADD CONSTRAINT fk_left_person_id FOREIGN KEY (left_person_id) REFERENCES person(person_id);

ALTER TABLE ONLY person_link
    ADD CONSTRAINT fk_right_person_id FOREIGN KEY (right_person_id) REFERENCES person(person_id);

ALTER TABLE ONLY person_match
    ADD CONSTRAINT fk_left_dataset_id FOREIGN KEY (left_dataset_id) REFERENCES dataset(dataset_id);

ALTER TABLE ONLY person_match
    ADD CONSTRAINT fk_right_dataset_id FOREIGN KEY (right_dataset_id) REFERENCES dataset(dataset_id);

ALTER TABLE ONLY person_match
    ADD CONSTRAINT fk_created_by_app_user_match FOREIGN KEY (creator_id) REFERENCES app_user(id);

ALTER TABLE ONLY person_match_request
    ADD CONSTRAINT fk_person_match_request_dataset_id FOREIGN KEY (dataset_id) REFERENCES dataset(dataset_id);

ALTER TABLE ONLY person_match_request
    ADD CONSTRAINT fk_person_match_request_person_match_id FOREIGN KEY (person_match_id) REFERENCES person_match(person_match_id);

ALTER TABLE ONLY person_match_request
    ADD CONSTRAINT fk_created_by_app_user_match_request FOREIGN KEY (creator_id) REFERENCES app_user(id);

ALTER TABLE ONLY column_match_information
    ADD CONSTRAINT fk_column_match_information_person_match_id FOREIGN KEY (person_match_id) REFERENCES person_match(person_match_id);

ALTER TABLE ONLY column_match_information
    ADD CONSTRAINT fk_column_match_information_field_type_cd FOREIGN KEY (field_type_cd) REFERENCES field_type(field_type_cd);

ALTER TABLE ONLY column_match_information
    ADD CONSTRAINT fk_column_match_information_field_meaning_cd FOREIGN KEY (field_meaning_cd) REFERENCES field_meaning(field_meaning_cd);

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk_user_role_user FOREIGN KEY (user_id) REFERENCES app_user(id);

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk_user_role_role FOREIGN KEY (role_id) REFERENCES role(id);

ALTER TABLE ONLY user_session
    ADD CONSTRAINT fk_user_session_user FOREIGN KEY (user_id) REFERENCES app_user(id);

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_created_by_app_user FOREIGN KEY (creator_id) REFERENCES app_user(id);

ALTER TABLE ONLY key
    ADD CONSTRAINT fk_key_created_by_app_user FOREIGN KEY (creator_id) REFERENCES app_user(id);

ALTER TABLE ONLY key
    ADD CONSTRAINT fk_key_voided_by_app_user FOREIGN KEY (voided_by_id) REFERENCES app_user(id);

ALTER TABLE ONLY salt
    ADD CONSTRAINT fk_salt_created_by_app_user FOREIGN KEY (creator_id) REFERENCES app_user(id);

ALTER TABLE ONLY salt
    ADD CONSTRAINT fk_salt_voided_by_app_user FOREIGN KEY (voided_by_id) REFERENCES app_user(id);

ALTER TABLE ONLY audit_event
    ADD CONSTRAINT fk_audit_event_type_cd FOREIGN KEY (audit_event_type_cd) REFERENCES audit_event_type(audit_event_type_cd);

ALTER TABLE ONLY audit_event
    ADD CONSTRAINT fk_ref_person_id FOREIGN KEY (ref_person_id) REFERENCES person(person_id);

ALTER TABLE ONLY audit_event
    ADD CONSTRAINT fk_alt_ref_person_id FOREIGN KEY (alt_ref_person_id) REFERENCES person(person_id);

ALTER TABLE ONLY audit_event
    ADD CONSTRAINT fk_ref_key_id FOREIGN KEY (ref_key_id) REFERENCES key(id);

ALTER TABLE ONLY audit_event
    ADD CONSTRAINT fk_ref_salt_id FOREIGN KEY (ref_salt_id) REFERENCES salt(id);

ALTER TABLE ONLY audit_event
    ADD CONSTRAINT fk_creator_id FOREIGN KEY (creator_id) REFERENCES app_user(id);

ALTER TABLE ONLY person_link_review
    ADD CONSTRAINT fk_left_person_id FOREIGN KEY (left_person_id) REFERENCES person(person_id);

ALTER TABLE ONLY person_link_review
    ADD CONSTRAINT fk_right_person_id FOREIGN KEY (right_person_id) REFERENCES person(person_id);

ALTER TABLE ONLY person_link_review
    ADD CONSTRAINT fk_creator_id FOREIGN KEY (creator_id) REFERENCES app_user(id);

ALTER TABLE ONLY person_link_review
    ADD CONSTRAINT fk_reviewer_id FOREIGN KEY (reviewer_id) REFERENCES app_user(id);

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_user FOREIGN KEY (user_id) REFERENCES app_user(id);

ALTER TABLE ONLY column_information
    ADD CONSTRAINT fk_column_information_dataset_id FOREIGN KEY (dataset_id) REFERENCES dataset(dataset_id);

ALTER TABLE ONLY match_pair_stat_half
    ADD CONSTRAINT fk_person_pseudo_id FOREIGN KEY (person_pseudo_id) REFERENCES person(person_id);

ALTER TABLE ONLY match_pair_stat
    ADD CONSTRAINT fk_left_person_pseudo_id FOREIGN KEY (left_person_pseudo_id) REFERENCES person(person_id);

ALTER TABLE ONLY match_pair_stat
    ADD CONSTRAINT fk_right_person_pseudo_id FOREIGN KEY (right_person_pseudo_id) REFERENCES person(person_id);

ALTER TABLE ONLY column_information
    ADD CONSTRAINT fk_column_information_field_type_cd FOREIGN KEY (field_type_cd) REFERENCES field_type(field_type_cd);

ALTER TABLE ONLY column_information
    ADD CONSTRAINT fk_column_information_field_meaning_cd FOREIGN KEY (field_meaning_cd) REFERENCES field_meaning(field_meaning_cd);

