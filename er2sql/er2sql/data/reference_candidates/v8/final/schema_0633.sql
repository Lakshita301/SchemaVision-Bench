-- Source: https://github.com/hsy-hub/ruoyi/blob/1fc194dea85403be310d0e320a6b08683957b09d/sql/quartz.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 10
create table QRTZ_JOB_DETAILS (
    sched_name varchar(120)    not null,
    job_name varchar(200)    not null,
    job_group varchar(200)    not null,
    description varchar(250)    null,
    job_class_name varchar(250)    not null,
    is_durable varchar(1)      not null,
    is_nonconcurrent varchar(1)      not null,
    is_update_data varchar(1)      not null,
    requests_recovery varchar(1)      not null,
    job_data BYTEA            null,
    primary key (sched_name,job_name,job_group)
);

create table QRTZ_TRIGGERS (
    sched_name varchar(120)    not null,
    trigger_name varchar(200)    not null,
    trigger_group varchar(200)    not null,
    job_name varchar(200)    not null,
    job_group varchar(200)    not null,
    description varchar(250)    null,
    next_fire_time bigint      null,
    prev_fire_time bigint      null,
    priority integer         null,
    trigger_state varchar(16)     not null,
    trigger_type varchar(8)      not null,
    start_time bigint      not null,
    end_time bigint      null,
    calendar_name varchar(200)    null,
    misfire_instr smallint     null,
    job_data BYTEA            null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,job_name,job_group) references QRTZ_JOB_DETAILS(sched_name,job_name,job_group)
);

create table QRTZ_SIMPLE_TRIGGERS (
    sched_name varchar(120)    not null,
    trigger_name varchar(200)    not null,
    trigger_group varchar(200)    not null,
    repeat_count bigint       not null,
    repeat_interval bigint      not null,
    times_triggered bigint      not null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);

create table QRTZ_CRON_TRIGGERS (
    sched_name varchar(120)    not null,
    trigger_name varchar(200)    not null,
    trigger_group varchar(200)    not null,
    cron_expression varchar(200)    not null,
    time_zone_id varchar(80),
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);

create table QRTZ_BLOB_TRIGGERS (
    sched_name varchar(120)    not null,
    trigger_name varchar(200)    not null,
    trigger_group varchar(200)    not null,
    blob_data BYTEA            null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);

create table QRTZ_CALENDARS (
    sched_name varchar(120)    not null,
    calendar_name varchar(200)    not null,
    calendar BYTEA            not null,
    primary key (sched_name,calendar_name)
);

create table QRTZ_PAUSED_TRIGGER_GRPS (
    sched_name varchar(120)    not null,
    trigger_group varchar(200)    not null,
    primary key (sched_name,trigger_group)
);

create table QRTZ_FIRED_TRIGGERS (
    sched_name varchar(120)    not null,
    entry_id varchar(95)     not null,
    trigger_name varchar(200)    not null,
    trigger_group varchar(200)    not null,
    instance_name varchar(200)    not null,
    fired_time bigint      not null,
    sched_time bigint      not null,
    priority integer         not null,
    state varchar(16)     not null,
    job_name varchar(200)    null,
    job_group varchar(200)    null,
    is_nonconcurrent varchar(1)      null,
    requests_recovery varchar(1)      null,
    primary key (sched_name,entry_id)
);

create table QRTZ_SCHEDULER_STATE (
    sched_name varchar(120)    not null,
    instance_name varchar(200)    not null,
    last_checkin_time bigint      not null,
    checkin_interval bigint      not null,
    primary key (sched_name,instance_name)
);

create table QRTZ_LOCKS (
    sched_name varchar(120)    not null,
    lock_name varchar(40)     not null,
    primary key (sched_name,lock_name)
);

create table QRTZ_SIMPROP_TRIGGERS (
    sched_name varchar(120)    not null,
    trigger_name varchar(200)    not null,
    trigger_group varchar(200)    not null,
    str_prop_1 varchar(512)    null,
    str_prop_2 varchar(512)    null,
    str_prop_3 varchar(512)    null,
    int_prop_1 int             null,
    int_prop_2 int             null,
    long_prop_1 bigint          null,
    long_prop_2 bigint          null,
    dec_prop_1 numeric(13,4)   null,
    dec_prop_2 numeric(13,4)   null,
    bool_prop_1 varchar(1)      null,
    bool_prop_2 varchar(1)      null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);
