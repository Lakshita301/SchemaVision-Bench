-- Source: https://github.com/rgabriana/Work/blob/9adb8cd1727fde513bc512426c1588aff195c2d0/old_work/svn/gems/trunk/enlighted_portal/artifacts/sql/InstallSQL.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 4

CREATE TABLE roles (
    id bigint NOT NULL,
    name character varying
);

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    created_on date,
    role_id bigint,
    status character varying
);

CREATE TABLE customer (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address  character varying,
    email character varying,
    contact character varying
   
);

CREATE TABLE license_detail (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    level character varying NOT NULL,
    start_date character varying NOT NULL,
    end_date character varying NOT NULL,
    created_on date,
    mac_id character varying NOT NULL,
    api_key bytea,
    status character varying
   
);

CREATE TABLE user_audit (
    id bigint NOT NULL,
    username character varying NOT null,
    action_type character varying NOT NULL,   
	log_time timestamp without time zone not null,
    description character varying,
    ip_address character varying NOT null DEFAULT ''
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ONLY users
    ADD CONSTRAINT user_role_fk FOREIGN KEY (role_id) REFERENCES roles(id);

ALTER TABLE ONLY license_detail
    ADD CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(id);

