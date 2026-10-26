-- Source: https://github.com/richardgong1987/RuoYi-extend/blob/7cc398c719467e420ee64560ccd71b4aa7fef988/sql/quartz.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 10
create table QRTZ_JOB_DETAILS (
    sched_name varchar(120)    not null            ,
    job_name varchar(200)    not null            ,
    job_group varchar(200)    not null            ,
    description varchar(250)    null                ,
    job_class_name varchar(250)    not null            ,
    is_durable varchar(1)      not null            ,
    is_nonconcurrent varchar(1)      not null            ,
    is_update_data varchar(1)      not null            ,
    requests_recovery varchar(1)      not null            ,
    job_data BYTEA            null                ,
    primary key (sched_name, job_name, job_group)
);

create table QRTZ_TRIGGERS (
    sched_name varchar(120)    not null            ,
    trigger_name varchar(200)    not null            ,
    trigger_group varchar(200)    not null            ,
    job_name varchar(200)    not null            ,
    job_group varchar(200)    not null            ,
    description varchar(250)    null                ,
    next_fire_time bigint      null                ,
    prev_fire_time bigint      null                ,
    priority integer         null                ,
    trigger_state varchar(16)     not null            ,
    trigger_type varchar(8)      not null            ,
    start_time bigint      not null            ,
    end_time bigint      null                ,
    calendar_name varchar(200)    null                ,
    misfire_instr smallint     null                ,
    job_data BYTEA            null                ,
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, job_name, job_group) references QRTZ_JOB_DETAILS(sched_name, job_name, job_group)
);

create table QRTZ_SIMPLE_TRIGGERS (
    sched_name varchar(120)    not null            ,
    trigger_name varchar(200)    not null            ,
    trigger_group varchar(200)    not null            ,
    repeat_count bigint       not null            ,
    repeat_interval bigint      not null            ,
    times_triggered bigint      not null            ,
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
);

create table QRTZ_CRON_TRIGGERS (
    sched_name varchar(120)    not null            ,
    trigger_name varchar(200)    not null            ,
    trigger_group varchar(200)    not null            ,
    cron_expression varchar(200)    not null            ,
    time_zone_id varchar(80)                         ,
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
);

create table QRTZ_BLOB_TRIGGERS (
    sched_name varchar(120)    not null            ,
    trigger_name varchar(200)    not null            ,
    trigger_group varchar(200)    not null            ,
    blob_data BYTEA            null                ,
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
);

create table QRTZ_CALENDARS (
    sched_name varchar(120)    not null            ,
    calendar_name varchar(200)    not null            ,
    calendar BYTEA            not null            ,
    primary key (sched_name, calendar_name)
);

create table QRTZ_PAUSED_TRIGGER_GRPS (
    sched_name varchar(120)    not null            ,
    trigger_group varchar(200)    not null            ,
    primary key (sched_name, trigger_group)
);

create table QRTZ_FIRED_TRIGGERS (
    sched_name varchar(120)    not null            ,
    entry_id varchar(95)     not null            ,
    trigger_name varchar(200)    not null            ,
    trigger_group varchar(200)    not null            ,
    instance_name varchar(200)    not null            ,
    fired_time bigint      not null            ,
    sched_time bigint      not null            ,
    priority integer         not null            ,
    state varchar(16)     not null            ,
    job_name varchar(200)    null                ,
    job_group varchar(200)    null                ,
    is_nonconcurrent varchar(1)      null                ,
    requests_recovery varchar(1)      null                ,
    primary key (sched_name, entry_id)
);

create table QRTZ_SCHEDULER_STATE (
    sched_name varchar(120)    not null            ,
    instance_name varchar(200)    not null            ,
    last_checkin_time bigint      not null            ,
    checkin_interval bigint      not null            ,
    primary key (sched_name, instance_name)
);

create table QRTZ_LOCKS (
    sched_name varchar(120)    not null            ,
    lock_name varchar(40)     not null            ,
    primary key (sched_name, lock_name)
);

create table QRTZ_SIMPROP_TRIGGERS (
    sched_name varchar(120)    not null            ,
    trigger_name varchar(200)    not null            ,
    trigger_group varchar(200)    not null            ,
    str_prop_1 varchar(512)    null                ,
    str_prop_2 varchar(512)    null                ,
    str_prop_3 varchar(512)    null                ,
    int_prop_1 int             null                ,
    int_prop_2 int             null                ,
    long_prop_1 bigint          null                ,
    long_prop_2 bigint          null                ,
    dec_prop_1 numeric(13,4)   null                ,
    dec_prop_2 numeric(13,4)   null                ,
    bool_prop_1 varchar(1)      null                ,
    bool_prop_2 varchar(1)      null                ,
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
);
COMMENT ON COLUMN QRTZ_JOB_DETAILS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.job_name IS '任务名称';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.job_group IS '任务组名';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.description IS '相关介绍';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.job_class_name IS '执行任务类名称';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.is_durable IS '是否持久化';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.is_nonconcurrent IS '是否并发';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.is_update_data IS '是否更新数据';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.requests_recovery IS '是否接受恢复执行';
COMMENT ON COLUMN QRTZ_JOB_DETAILS.job_data IS '存放持久化job对象';
COMMENT ON COLUMN QRTZ_TRIGGERS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_TRIGGERS.trigger_name IS '触发器的名字';
COMMENT ON COLUMN QRTZ_TRIGGERS.trigger_group IS '触发器所属组的名字';
COMMENT ON COLUMN QRTZ_TRIGGERS.job_name IS 'qrtz_job_details表job_name的外键';
COMMENT ON COLUMN QRTZ_TRIGGERS.job_group IS 'qrtz_job_details表job_group的外键';
COMMENT ON COLUMN QRTZ_TRIGGERS.description IS '相关介绍';
COMMENT ON COLUMN QRTZ_TRIGGERS.next_fire_time IS '上一次触发时间（毫秒）';
COMMENT ON COLUMN QRTZ_TRIGGERS.prev_fire_time IS '下一次触发时间（默认为-1表示不触发）';
COMMENT ON COLUMN QRTZ_TRIGGERS.priority IS '优先级';
COMMENT ON COLUMN QRTZ_TRIGGERS.trigger_state IS '触发器状态';
COMMENT ON COLUMN QRTZ_TRIGGERS.trigger_type IS '触发器的类型';
COMMENT ON COLUMN QRTZ_TRIGGERS.start_time IS '开始时间';
COMMENT ON COLUMN QRTZ_TRIGGERS.end_time IS '结束时间';
COMMENT ON COLUMN QRTZ_TRIGGERS.calendar_name IS '日程表名称';
COMMENT ON COLUMN QRTZ_TRIGGERS.misfire_instr IS '补偿执行的策略';
COMMENT ON COLUMN QRTZ_TRIGGERS.job_data IS '存放持久化job对象';
COMMENT ON COLUMN QRTZ_SIMPLE_TRIGGERS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_SIMPLE_TRIGGERS.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN QRTZ_SIMPLE_TRIGGERS.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN QRTZ_SIMPLE_TRIGGERS.repeat_count IS '重复的次数统计';
COMMENT ON COLUMN QRTZ_SIMPLE_TRIGGERS.repeat_interval IS '重复的间隔时间';
COMMENT ON COLUMN QRTZ_SIMPLE_TRIGGERS.times_triggered IS '已经触发的次数';
COMMENT ON COLUMN QRTZ_CRON_TRIGGERS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_CRON_TRIGGERS.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN QRTZ_CRON_TRIGGERS.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN QRTZ_CRON_TRIGGERS.cron_expression IS 'cron表达式';
COMMENT ON COLUMN QRTZ_CRON_TRIGGERS.time_zone_id IS '时区';
COMMENT ON COLUMN QRTZ_BLOB_TRIGGERS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_BLOB_TRIGGERS.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN QRTZ_BLOB_TRIGGERS.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN QRTZ_BLOB_TRIGGERS.blob_data IS '存放持久化Trigger对象';
COMMENT ON COLUMN QRTZ_CALENDARS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_CALENDARS.calendar_name IS '日历名称';
COMMENT ON COLUMN QRTZ_CALENDARS.calendar IS '存放持久化calendar对象';
COMMENT ON COLUMN QRTZ_PAUSED_TRIGGER_GRPS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_PAUSED_TRIGGER_GRPS.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.entry_id IS '调度器实例id';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.instance_name IS '调度器实例名';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.fired_time IS '触发的时间';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.sched_time IS '定时器制定的时间';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.priority IS '优先级';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.state IS '状态';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.job_name IS '任务名称';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.job_group IS '任务组名';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.is_nonconcurrent IS '是否并发';
COMMENT ON COLUMN QRTZ_FIRED_TRIGGERS.requests_recovery IS '是否接受恢复执行';
COMMENT ON COLUMN QRTZ_SCHEDULER_STATE.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_SCHEDULER_STATE.instance_name IS '实例名称';
COMMENT ON COLUMN QRTZ_SCHEDULER_STATE.last_checkin_time IS '上次检查时间';
COMMENT ON COLUMN QRTZ_SCHEDULER_STATE.checkin_interval IS '检查间隔时间';
COMMENT ON COLUMN QRTZ_LOCKS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_LOCKS.lock_name IS '悲观锁名称';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.sched_name IS '调度名称';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.trigger_name IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.trigger_group IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.str_prop_1 IS 'String类型的trigger的第一个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.str_prop_2 IS 'String类型的trigger的第二个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.str_prop_3 IS 'String类型的trigger的第三个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.int_prop_1 IS 'int类型的trigger的第一个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.int_prop_2 IS 'int类型的trigger的第二个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.long_prop_1 IS 'long类型的trigger的第一个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.long_prop_2 IS 'long类型的trigger的第二个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.dec_prop_1 IS 'decimal类型的trigger的第一个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.dec_prop_2 IS 'decimal类型的trigger的第二个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.bool_prop_1 IS 'Boolean类型的trigger的第一个参数';
COMMENT ON COLUMN QRTZ_SIMPROP_TRIGGERS.bool_prop_2 IS 'Boolean类型的trigger的第二个参数';
COMMENT ON TABLE QRTZ_SIMPROP_TRIGGERS IS '同步机制的行锁表';
COMMENT ON TABLE QRTZ_LOCKS IS '存储的悲观锁信息表';
COMMENT ON TABLE QRTZ_SCHEDULER_STATE IS '调度器状态表';
COMMENT ON TABLE QRTZ_FIRED_TRIGGERS IS '已触发的触发器表';
COMMENT ON TABLE QRTZ_PAUSED_TRIGGER_GRPS IS '暂停的触发器表';
COMMENT ON TABLE QRTZ_CALENDARS IS '日历信息表';
COMMENT ON TABLE QRTZ_BLOB_TRIGGERS IS 'Blob类型的触发器表';
COMMENT ON TABLE QRTZ_CRON_TRIGGERS IS 'Cron类型的触发器表';
COMMENT ON TABLE QRTZ_SIMPLE_TRIGGERS IS '简单触发器的信息表';
COMMENT ON TABLE QRTZ_TRIGGERS IS '触发器详细信息表';
COMMENT ON TABLE QRTZ_JOB_DETAILS IS '任务详细信息表';
