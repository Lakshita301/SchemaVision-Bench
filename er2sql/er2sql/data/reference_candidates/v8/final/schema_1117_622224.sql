-- Source: https://github.com/zcielz/zciel-pro-public/blob/55b49a915a8a39a5f5c3ed4e49a5f0803705e7c9/springboot/quartz/learn_quartz/src/main/java/cn/zciel/learn/Jdbc_way/quartz_test.sql?raw=true
-- Tables detected: 11 | FK constraints: 5
CREATE TABLE qrtz_blob_triggers (
    sched_name varchar(120) NOT NULL,
    "trigger_name" varchar(80) NOT NULL,
    "trigger_group" varchar(80) NOT NULL,
    blob_data BYTEA,
    PRIMARY KEY (sched_name,"trigger_name","trigger_group")
);

CREATE TABLE qrtz_calendars (
    sched_name varchar(120) NOT NULL,
    calendar_name varchar(80) NOT NULL,
    calendar BYTEA NOT NULL,
    PRIMARY KEY (calendar_name)
);

CREATE TABLE qrtz_cron_triggers (
    sched_name varchar(120) NOT NULL,
    "trigger_name" varchar(80) NOT NULL,
    "trigger_group" varchar(80) NOT NULL,
    cron_expression varchar(120) NOT NULL,
    time_zone_id varchar(80) DEFAULT NULL,
    PRIMARY KEY (sched_name,"trigger_name","trigger_group")
);

CREATE TABLE qrtz_fired_triggers (
    sched_name varchar(120) NOT NULL,
    entry_id varchar(95) NOT NULL,
    "trigger_name" varchar(80) NOT NULL,
    "trigger_group" varchar(80) NOT NULL,
    instance_name varchar(80) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority int NOT NULL,
    state varchar(16) NOT NULL,
    job_name varchar(80) DEFAULT NULL,
    job_group varchar(80) DEFAULT NULL,
    is_nonconcurrent int DEFAULT NULL,
    requests_recovery int DEFAULT NULL,
    PRIMARY KEY (sched_name,entry_id)
);

CREATE TABLE qrtz_job_details (
    sched_name varchar(120) NOT NULL,
    job_name varchar(80) NOT NULL,
    job_group varchar(80) NOT NULL,
    description varchar(120) DEFAULT NULL,
    job_class_name varchar(128) NOT NULL,
    is_durable int NOT NULL,
    is_nonconcurrent int NOT NULL,
    is_update_data int NOT NULL,
    requests_recovery int NOT NULL,
    job_data BYTEA,
    PRIMARY KEY (sched_name,job_name,job_group)
);

CREATE TABLE qrtz_locks (
    sched_name varchar(120) NOT NULL,
    lock_name varchar(40) NOT NULL,
    PRIMARY KEY (sched_name,lock_name)
);

CREATE TABLE qrtz_paused_trigger_grps (
    sched_name varchar(120) NOT NULL,
    "trigger_group" varchar(80) NOT NULL,
    PRIMARY KEY (sched_name,"trigger_group")
);

CREATE TABLE qrtz_scheduler_state (
    sched_name varchar(120) NOT NULL,
    instance_name varchar(80) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL,
    PRIMARY KEY (sched_name,instance_name)
);

CREATE TABLE qrtz_simple_triggers (
    sched_name varchar(120) NOT NULL,
    "trigger_name" varchar(80) NOT NULL,
    "trigger_group" varchar(80) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL,
    PRIMARY KEY (sched_name,"trigger_name","trigger_group")
);

CREATE TABLE qrtz_simprop_triggers (
    sched_name varchar(120) NOT NULL,
    "TRIGGER_NAME" varchar(200) NOT NULL,
    "TRIGGER_GROUP" varchar(200) NOT NULL,
    str_prop_1 varchar(512) DEFAULT NULL,
    str_prop_2 varchar(512) DEFAULT NULL,
    str_prop_3 varchar(512) DEFAULT NULL,
    int_prop_1 int DEFAULT NULL,
    int_prop_2 int DEFAULT NULL,
    long_prop_1 bigint DEFAULT NULL,
    long_prop_2 bigint DEFAULT NULL,
    dec_prop_1 decimal(13,4) DEFAULT NULL,
    dec_prop_2 decimal(13,4) DEFAULT NULL,
    bool_prop_1 varchar(1) DEFAULT NULL,
    bool_prop_2 varchar(1) DEFAULT NULL,
    PRIMARY KEY (sched_name,"TRIGGER_NAME","TRIGGER_GROUP")
);

CREATE TABLE qrtz_triggers (
    sched_name varchar(120) NOT NULL,
    "trigger_name" varchar(80) NOT NULL,
    "trigger_group" varchar(80) NOT NULL,
    job_name varchar(80) NOT NULL,
    job_group varchar(80) NOT NULL,
    description varchar(120) DEFAULT NULL,
    next_fire_time bigint DEFAULT NULL,
    prev_fire_time bigint DEFAULT NULL,
    priority int DEFAULT NULL,
    trigger_state varchar(16) NOT NULL,
    trigger_type varchar(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint DEFAULT NULL,
    calendar_name varchar(80) DEFAULT NULL,
    misfire_instr smallint DEFAULT NULL,
    job_data BYTEA,
    PRIMARY KEY (sched_name,"trigger_name","trigger_group")
);
ALTER TABLE qrtz_blob_triggers ADD CONSTRAINT qrtz_blob_triggers_ibfk_1 FOREIGN KEY (sched_name, "trigger_name", "trigger_group") REFERENCES qrtz_triggers (sched_name, "trigger_name", "trigger_group");
ALTER TABLE qrtz_cron_triggers ADD CONSTRAINT qrtz_cron_triggers_ibfk_1 FOREIGN KEY (sched_name, "trigger_name", "trigger_group") REFERENCES qrtz_triggers (sched_name, "trigger_name", "trigger_group");
ALTER TABLE qrtz_simple_triggers ADD CONSTRAINT qrtz_simple_triggers_ibfk_1 FOREIGN KEY (sched_name, "trigger_name", "trigger_group") REFERENCES qrtz_triggers (sched_name, "trigger_name", "trigger_group");
ALTER TABLE qrtz_simprop_triggers ADD CONSTRAINT qrtz_simprop_triggers_ibfk_1 FOREIGN KEY (sched_name, "TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES qrtz_triggers (sched_name, "trigger_name", "trigger_group");
ALTER TABLE qrtz_triggers ADD CONSTRAINT qrtz_triggers_ibfk_1 FOREIGN KEY (sched_name, job_name, job_group) REFERENCES qrtz_job_details (sched_name, job_name, job_group);
CREATE INDEX ON qrtz_triggers (sched_name,job_name,job_group);
