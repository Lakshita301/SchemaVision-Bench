-- Source: https://github.com/rgabriana/Work/blob/9adb8cd1727fde513bc512426c1588aff195c2d0/old_work/svn/gems/branches/dev_branch_2.1.0/debs/em_dashboard/home/enlighted/InstallSQL.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 6

CREATE TABLE energy_consumption (
    id bigint NOT NULL,
    gems_id bigint NOT NULL,
    tenants_id bigint,
    power_used numeric(19,2),
    base_power_used numeric(19,2),
    cost double precision,
    base_cost double precision,
    occ_saving numeric(19,2) DEFAULT 0,
    tuneup_saving numeric(19,2) DEFAULT 0,
    ambient_saving numeric(19,2) DEFAULT 0,
    manual_saving numeric(19,2) DEFAULT 0,
    totalfixturecontributed bigint,
    price double precision,
    saved_power_used numeric(19,2),
    saved_cost double precision,
    capture_at timestamp without time zone,
    CONSTRAINT unique_energy_consumption UNIQUE(capture_at, gems_id)
);

CREATE TABLE gems (
    id bigint NOT NULL,
    name character varying(20) NOT NULL,
    gems_unique_address character varying,
    mac_id character varying,
    gems_ip_address character varying NOT NULL,
    port integer DEFAULT 443 NOT NULL,
    version bigint,
    api_key varchar(25),
    status character varying DEFAULT 'I'
);

CREATE TABLE roles (
    id bigint NOT NULL,
    name character varying
);

CREATE TABLE tenants (
    id bigint NOT NULL,
    valid_domain_name character varying
);

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    created_on date,
    role_id bigint,
    tenant_id bigint,
    status character varying
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ONLY energy_consumption
    ADD CONSTRAINT energy_consumption_tenants_id FOREIGN KEY (tenants_id) REFERENCES tenants(id);

ALTER TABLE ONLY users
    ADD CONSTRAINT user_role_fk FOREIGN KEY (role_id) REFERENCES roles(id);

ALTER TABLE ONLY users
    ADD CONSTRAINT user_tenant_id FOREIGN KEY (tenant_id) REFERENCES tenants(id);

