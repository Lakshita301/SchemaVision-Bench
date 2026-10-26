-- Source: https://github.com/pq1518110364/open-capacity-platform/blob/feb46e49c496bd9aea8908fc577d6773f50a0619/sql/06.job-center.sql?raw=true
-- Tables detected: 16 | FK/REFERENCES mentions: 5
CREATE TABLE "xxl_job_qrtz_calendars" (
    "sched_name" varchar(120) NOT NULL,
    "calendar_name" varchar(200) NOT NULL,
    "calendar" BYTEA NOT NULL,
    PRIMARY KEY ("sched_name","calendar_name")
);

CREATE TABLE "xxl_job_qrtz_fired_triggers" (
    "sched_name" varchar(120) NOT NULL,
    "entry_id" varchar(95) NOT NULL,
    "trigger_name" varchar(200) NOT NULL,
    "trigger_group" varchar(200) NOT NULL,
    "instance_name" varchar(200) NOT NULL,
    "fired_time" bigint NOT NULL,
    "sched_time" bigint NOT NULL,
    "priority" int NOT NULL,
    "state" varchar(16) NOT NULL,
    "job_name" varchar(200) DEFAULT NULL,
    "job_group" varchar(200) DEFAULT NULL,
    "is_nonconcurrent" varchar(1) DEFAULT NULL,
    "requests_recovery" varchar(1) DEFAULT NULL,
    PRIMARY KEY ("sched_name","entry_id")
);

CREATE TABLE "xxl_job_qrtz_job_details" (
    "sched_name" varchar(120) NOT NULL,
    "job_name" varchar(200) NOT NULL,
    "job_group" varchar(200) NOT NULL,
    "description" varchar(250) DEFAULT NULL,
    "job_class_name" varchar(250) NOT NULL,
    "is_durable" varchar(1) NOT NULL,
    "is_nonconcurrent" varchar(1) NOT NULL,
    "is_update_data" varchar(1) NOT NULL,
    "requests_recovery" varchar(1) NOT NULL,
    "job_data" BYTEA,
    PRIMARY KEY ("sched_name","job_name","job_group")
);

CREATE TABLE "xxl_job_qrtz_locks" (
    "sched_name" varchar(120) NOT NULL,
    "lock_name" varchar(40) NOT NULL,
    PRIMARY KEY ("sched_name","lock_name")
);

CREATE TABLE "xxl_job_qrtz_paused_trigger_grps" (
    "sched_name" varchar(120) NOT NULL,
    "trigger_group" varchar(200) NOT NULL,
    PRIMARY KEY ("sched_name","trigger_group")
);

CREATE TABLE "xxl_job_qrtz_scheduler_state" (
    "sched_name" varchar(120) NOT NULL,
    "instance_name" varchar(200) NOT NULL,
    "last_checkin_time" bigint NOT NULL,
    "checkin_interval" bigint NOT NULL,
    PRIMARY KEY ("sched_name","instance_name")
);

CREATE TABLE "xxl_job_qrtz_trigger_group" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app_name" varchar(64) NOT NULL COMMENT '执行器AppName',
    "title" varchar(12) NOT NULL COMMENT '执行器名称',
    "order" SMALLINT NOT NULL DEFAULT '0' COMMENT '排序',
    "address_type" SMALLINT NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
    "address_list" varchar(512) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "xxl_job_qrtz_trigger_info" (
    "id" int NOT NULL AUTO_INCREMENT,
    "job_group" int NOT NULL COMMENT '执行器主键ID',
    "job_cron" varchar(128) NOT NULL COMMENT '任务执行CRON',
    "job_desc" varchar(255) NOT NULL,
    "add_time" TIMESTAMP DEFAULT NULL,
    "update_time" TIMESTAMP DEFAULT NULL,
    "author" varchar(64) DEFAULT NULL COMMENT '作者',
    "alarm_email" varchar(255) DEFAULT NULL COMMENT '报警邮件',
    "executor_route_strategy" varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
    "executor_handler" varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
    "executor_param" varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
    "executor_block_strategy" varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
    "executor_fail_strategy" varchar(50) DEFAULT NULL COMMENT '失败处理策略',
    "glue_type" varchar(50) NOT NULL COMMENT 'GLUE类型',
    "glue_source" text COMMENT 'GLUE源代码',
    "glue_remark" varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
    "glue_updatetime" TIMESTAMP DEFAULT NULL COMMENT 'GLUE更新时间',
    "child_jobid" varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE "xxl_job_qrtz_trigger_log" (
    "id" int NOT NULL AUTO_INCREMENT,
    "job_group" int NOT NULL COMMENT '执行器主键ID',
    "job_id" int NOT NULL COMMENT '任务，主键ID',
    "glue_type" varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
    "executor_address" varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
    "executor_handler" varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
    "executor_param" varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
    "trigger_time" TIMESTAMP DEFAULT NULL COMMENT '调度-时间',
    "trigger_code" int NOT NULL COMMENT '调度-结果',
    "trigger_msg" varchar(2048) DEFAULT NULL COMMENT '调度-日志',
    "handle_time" TIMESTAMP DEFAULT NULL COMMENT '执行-时间',
    "handle_code" int NOT NULL COMMENT '执行-状态',
    "handle_msg" varchar(2048) DEFAULT NULL COMMENT '执行-日志',
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

CREATE TABLE "xxl_job_qrtz_trigger_logglue" (
    "id" int NOT NULL AUTO_INCREMENT,
    "job_id" int NOT NULL COMMENT '任务，主键ID',
    "glue_type" varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
    "glue_source" text COMMENT 'GLUE源代码',
    "glue_remark" varchar(128) NOT NULL COMMENT 'GLUE备注',
    "add_time" timestamp NULL DEFAULT NULL,
    "update_time" timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE TABLE "xxl_job_qrtz_trigger_registry" (
    "id" int NOT NULL AUTO_INCREMENT,
    "registry_group" varchar(255) NOT NULL,
    "registry_key" varchar(255) NOT NULL,
    "registry_value" varchar(255) NOT NULL,
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE "xxl_job_qrtz_triggers" (
    "sched_name" varchar(120) NOT NULL,
    "trigger_name" varchar(200) NOT NULL,
    "trigger_group" varchar(200) NOT NULL,
    "job_name" varchar(200) NOT NULL,
    "job_group" varchar(200) NOT NULL,
    "description" varchar(250) DEFAULT NULL,
    "next_fire_time" bigint DEFAULT NULL,
    "prev_fire_time" bigint DEFAULT NULL,
    "priority" int DEFAULT NULL,
    "trigger_state" varchar(16) NOT NULL,
    "trigger_type" varchar(8) NOT NULL,
    "start_time" bigint NOT NULL,
    "end_time" bigint DEFAULT NULL,
    "calendar_name" varchar(200) DEFAULT NULL,
    "misfire_instr" smallint DEFAULT NULL,
    "job_data" BYTEA,
    PRIMARY KEY ("sched_name","trigger_name","trigger_group"),
    KEY "sched_name" ("sched_name","job_name","job_group"),
    CONSTRAINT "xxl_job_qrtz_triggers_ibfk_1" FOREIGN KEY ("sched_name", "job_name", "job_group") REFERENCES "xxl_job_qrtz_job_details" ("sched_name", "job_name", "job_group")
);

CREATE TABLE "xxl_job_qrtz_simprop_triggers" (
    "sched_name" varchar(120) NOT NULL,
    "trigger_name" varchar(200) NOT NULL,
    "trigger_group" varchar(200) NOT NULL,
    "str_prop_1" varchar(512) DEFAULT NULL,
    "str_prop_2" varchar(512) DEFAULT NULL,
    "str_prop_3" varchar(512) DEFAULT NULL,
    "int_prop_1" int DEFAULT NULL,
    "int_prop_2" int DEFAULT NULL,
    "long_prop_1" bigint DEFAULT NULL,
    "long_prop_2" bigint DEFAULT NULL,
    "dec_prop_1" decimal(13,4) DEFAULT NULL,
    "dec_prop_2" decimal(13,4) DEFAULT NULL,
    "bool_prop_1" varchar(1) DEFAULT NULL,
    "bool_prop_2" varchar(1) DEFAULT NULL,
    PRIMARY KEY ("sched_name","trigger_name","trigger_group"),
    CONSTRAINT "xxl_job_qrtz_simprop_triggers_ibfk_1" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "xxl_job_qrtz_triggers" ("sched_name", "trigger_name", "trigger_group")
);

CREATE TABLE "xxl_job_qrtz_simple_triggers" (
    "sched_name" varchar(120) NOT NULL,
    "trigger_name" varchar(200) NOT NULL,
    "trigger_group" varchar(200) NOT NULL,
    "repeat_count" bigint NOT NULL,
    "repeat_interval" bigint NOT NULL,
    "times_triggered" bigint NOT NULL,
    PRIMARY KEY ("sched_name","trigger_name","trigger_group"),
    CONSTRAINT "xxl_job_qrtz_simple_triggers_ibfk_1" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "xxl_job_qrtz_triggers" ("sched_name", "trigger_name", "trigger_group")
);

CREATE TABLE "xxl_job_qrtz_cron_triggers" (
    "sched_name" varchar(120) NOT NULL,
    "trigger_name" varchar(200) NOT NULL,
    "trigger_group" varchar(200) NOT NULL,
    "cron_expression" varchar(200) NOT NULL,
    "time_zone_id" varchar(80) DEFAULT NULL,
    PRIMARY KEY ("sched_name","trigger_name","trigger_group"),
    CONSTRAINT "xxl_job_qrtz_cron_triggers_ibfk_1" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "xxl_job_qrtz_triggers" ("sched_name", "trigger_name", "trigger_group")
);

CREATE TABLE "xxl_job_qrtz_blob_triggers" (
    "sched_name" varchar(120) NOT NULL,
    "trigger_name" varchar(200) NOT NULL,
    "trigger_group" varchar(200) NOT NULL,
    "blob_data" BYTEA,
    PRIMARY KEY ("sched_name","trigger_name","trigger_group"),
    CONSTRAINT "xxl_job_qrtz_blob_triggers_ibfk_1" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "xxl_job_qrtz_triggers" ("sched_name", "trigger_name", "trigger_group")
);
