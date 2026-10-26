-- Source: https://github.com/rgabriana/Work/blob/9adb8cd1727fde513bc512426c1588aff195c2d0/old_work/svn/gems/branches/rel_branch_3.6.X/motion_aggregator/MotionControllerApp/artifacts/sql/motionInstallSQL.sql?raw=true
-- Tables detected: 5 | FK constraints: 3
CREATE TABLE system_configuration (
    id bigint NOT NULL,
    name character varying,
    value character varying,
    CONSTRAINT system_configuration_pk PRIMARY KEY (id),
    CONSTRAINT unique_system_configuration_name UNIQUE (name)
);
CREATE TABLE motion_packets (
    id bigint NOT NULL,
    fixture_id bigint,
    blob_id character varying,
    local_x integer,
    local_y integer,
    global_x integer,
    global_y integer,
    capture_at timestamp without time zone,
    CONSTRAINT motion_packets_pk PRIMARY KEY (id)
);
CREATE TABLE fixture (
    id bigint NOT NULL,
    mac character varying,
    x integer,
    y integer,
    floor_id bigint,
    CONSTRAINT fixture_pk PRIMARY KEY (id)
);
CREATE TABLE floor (
    id bigint NOT NULL,
    name character varying,
    width integer,
    height integer,
    CONSTRAINT floor_pk PRIMARY KEY (id)
);
CREATE TABLE display_data (
    id bigint NOT NULL,
    message text,
    CONSTRAINT display_data_pk PRIMARY KEY (id)
);
ALTER TABLE motion_packets ADD CONSTRAINT fixture_id_fk FOREIGN KEY(fixture_id) REFERENCES fixture(id);
ALTER TABLE motion_packets ADD CONSTRAINT fixture_id_fk FOREIGN KEY(fixture_id) REFERENCES fixture(id);
ALTER TABLE fixture ADD CONSTRAINT floor_id_fk FOREIGN KEY(floor_id) REFERENCES floor(id);
