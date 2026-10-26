-- Source: https://github.com/floored1585/pixel/blob/c119eceee08b811571751e2f8af234e428660e49/config/db_init.sql?raw=true
-- Tables detected: 13 | FK/REFERENCES mentions: 18

CREATE TABLE component (
    hw_type text NOT NULL,
    device text NOT NULL,
    index text NOT NULL,
    last_updated bigint NOT NULL,
    description text DEFAULT ''::text,
    worker text NOT NULL,
    component_id integer NOT NULL
);

CREATE TABLE component_event (
    event_id integer NOT NULL,
    component_id integer NOT NULL,
    subtype text NOT NULL,
    "time" bigint NOT NULL,
    data jsonb NOT NULL,
    processed boolean DEFAULT false NOT NULL
);

CREATE TABLE cpu (
    util integer NOT NULL,
    component_id integer NOT NULL
);

CREATE TABLE device (
    device text NOT NULL,
    ip inet NOT NULL,
    last_poll integer,
    next_poll integer DEFAULT 0,
    last_poll_duration smallint,
    last_poll_result smallint,
    last_poll_text text,
    currently_polling smallint DEFAULT 0,
    worker text,
    pps_out bigint DEFAULT 0,
    bps_out bigint DEFAULT 0,
    discards_out bigint DEFAULT 0,
    sys_descr text,
    vendor text,
    sw_descr text,
    sw_version text,
    hw_model text,
    uptime integer,
    yellow_alarm smallint,
    red_alarm smallint,
    errors_out bigint DEFAULT 0,
    poller_uuid text
);

CREATE TABLE device_event (
    id integer NOT NULL,
    device text NOT NULL,
    subtype text NOT NULL,
    "time" bigint NOT NULL,
    data jsonb NOT NULL
);

CREATE TABLE fan (
    status smallint NOT NULL,
    vendor_status smallint,
    status_text text NOT NULL,
    component_id integer NOT NULL
);

CREATE TABLE global_config (
    table_name text NOT NULL,
    setting text NOT NULL,
    value text NOT NULL,
    description text NOT NULL,
    type text NOT NULL,
    last_updated bigint NOT NULL
);

CREATE TABLE instance (
    hostname text NOT NULL,
    ip inet NOT NULL,
    last_updated bigint NOT NULL,
    core boolean NOT NULL,
    master boolean NOT NULL,
    poller boolean NOT NULL,
    config_hash text NOT NULL
);

CREATE TABLE interface (
    name text NOT NULL,
    hc_in_octets numeric NOT NULL,
    hc_out_octets numeric NOT NULL,
    hc_in_ucast_pkts numeric NOT NULL,
    hc_out_ucast_pkts numeric NOT NULL,
    speed bigint NOT NULL,
    mtu integer NOT NULL,
    admin_status integer NOT NULL,
    admin_status_time bigint NOT NULL,
    oper_status integer NOT NULL,
    oper_status_time bigint NOT NULL,
    in_discards numeric NOT NULL,
    in_errors numeric NOT NULL,
    out_discards numeric NOT NULL,
    out_errors numeric NOT NULL,
    bps_in bigint,
    bps_out bigint,
    discards_in bigint,
    errors_in bigint,
    discards_out bigint,
    errors_out bigint,
    pps_in bigint,
    pps_out bigint,
    bps_util_in real,
    bps_util_out real,
    type text NOT NULL,
    component_id integer NOT NULL
);

CREATE TABLE memory (
    used bigint,
    free bigint,
    total bigint,
    util real NOT NULL,
    component_id integer NOT NULL
);

CREATE TABLE meta (
    id integer DEFAULT 1 NOT NULL,
    db_version integer,
    CONSTRAINT meta_id_check CHECK ((id = 1))
);

CREATE TABLE psu (
    status smallint NOT NULL,
    vendor_status smallint,
    status_text text NOT NULL,
    component_id integer NOT NULL
);

CREATE TABLE temperature (
    temperature smallint NOT NULL,
    threshold smallint,
    status smallint NOT NULL,
    vendor_status smallint,
    status_text text NOT NULL,
    component_id integer NOT NULL
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ONLY component
    ADD CONSTRAINT component_device_fkey FOREIGN KEY (device) REFERENCES device(device) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY component_event
    ADD CONSTRAINT component_event_component_id_fkey FOREIGN KEY (component_id) REFERENCES component(component_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY cpu
    ADD CONSTRAINT cpu_id_fkey FOREIGN KEY (component_id) REFERENCES component(component_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY device_event
    ADD CONSTRAINT device_event_device_fkey FOREIGN KEY (device) REFERENCES device(device) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY fan
    ADD CONSTRAINT fan_id_fkey FOREIGN KEY (component_id) REFERENCES component(component_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY interface
    ADD CONSTRAINT interface_id_fkey FOREIGN KEY (component_id) REFERENCES component(component_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY memory
    ADD CONSTRAINT memory_id_fkey FOREIGN KEY (component_id) REFERENCES component(component_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY psu
    ADD CONSTRAINT psu_id_fkey FOREIGN KEY (component_id) REFERENCES component(component_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY temperature
    ADD CONSTRAINT temperature_id_fkey FOREIGN KEY (component_id) REFERENCES component(component_id) ON UPDATE CASCADE ON DELETE CASCADE;

