-- Source: https://github.com/parijat-singh/CamundaBPM/blob/db20011108ad7eba7b793e2b63f1dc0ae8d778d2/engine/src/main/resources/org/camunda/bpm/engine/db/create/activiti.mysql.create.engine.sql?raw=true
-- Tables detected: 19 | FK constraints: 27
create table ACT_GE_PROPERTY (
    NAME_ varchar(64),
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_GE_BYTEARRAY (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    DEPLOYMENT_ID_ varchar(64),
    BYTES_ BYTEA,
    GENERATED_ SMALLINT,
    TENANT_ID_ varchar(64),
    TYPE_ integer,
    CREATE_TIME_ TIMESTAMP,
    ROOT_PROC_INST_ID_ varchar(64),
    REMOVAL_TIME_ TIMESTAMP,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_GE_SCHEMA_LOG (
    ID_ varchar(64),
    TIMESTAMP_ TIMESTAMP,
    VERSION_ varchar(255),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RE_DEPLOYMENT (
    ID_ varchar(64),
    NAME_ varchar(255),
    DEPLOY_TIME_ TIMESTAMP,
    SOURCE_ varchar(255),
    TENANT_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_EXECUTION (
    ID_ varchar(64),
    REV_ integer,
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    BUSINESS_KEY_ varchar(255),
    PARENT_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SUPER_EXEC_ varchar(64),
    SUPER_CASE_EXEC_ varchar(64),
    CASE_INST_ID_ varchar(64),
    ACT_ID_ varchar(255),
    ACT_INST_ID_ varchar(64),
    IS_ACTIVE_ SMALLINT,
    IS_CONCURRENT_ SMALLINT,
    IS_SCOPE_ SMALLINT,
    IS_EVENT_SCOPE_ SMALLINT,
    SUSPENSION_STATE_ integer,
    CACHED_ENT_STATE_ integer,
    SEQUENCE_COUNTER_ bigint,
    TENANT_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    LOCK_EXP_TIME_ TIMESTAMP NULL,
    LOCK_OWNER_ varchar(255),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROCESS_DEF_ID_ varchar(64),
    PROCESS_DEF_KEY_ varchar(255),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    FAILED_ACT_ID_ varchar(255),
    DUEDATE_ TIMESTAMP NULL,
    REPEAT_ varchar(255),
    REPEAT_OFFSET_ bigint DEFAULT 0,
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    DEPLOYMENT_ID_ varchar(64),
    SUSPENSION_STATE_ integer NOT NULL DEFAULT 1,
    JOB_DEF_ID_ varchar(64),
    PRIORITY_ bigint NOT NULL DEFAULT 0,
    SEQUENCE_COUNTER_ bigint,
    TENANT_ID_ varchar(64),
    CREATE_TIME_ TIMESTAMP,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_JOBDEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    PROC_DEF_ID_ varchar(64),
    PROC_DEF_KEY_ varchar(255),
    ACT_ID_ varchar(255),
    JOB_TYPE_ varchar(255) NOT NULL,
    JOB_CONFIGURATION_ varchar(255),
    SUSPENSION_STATE_ integer,
    JOB_PRIORITY_ bigint,
    TENANT_ID_ varchar(64),
    DEPLOYMENT_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RE_PROCDEF (
    ID_ varchar(64) not null,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) not null,
    VERSION_ integer not null,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    HAS_START_FORM_KEY_ SMALLINT,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(64),
    VERSION_TAG_ varchar(64),
    HISTORY_TTL_ integer,
    STARTABLE_ boolean NOT NULL default TRUE,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_TASK (
    ID_ varchar(64),
    REV_ integer,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    CASE_EXECUTION_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    CASE_DEF_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    TASK_DEF_KEY_ varchar(255),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    DELEGATION_ varchar(64),
    PRIORITY_ integer,
    CREATE_TIME_ TIMESTAMP,
    DUE_DATE_ TIMESTAMP,
    FOLLOW_UP_DATE_ TIMESTAMP,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_IDENTITYLINK (
    ID_ varchar(64),
    REV_ integer,
    GROUP_ID_ varchar(255),
    TYPE_ varchar(255),
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    TENANT_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_VARIABLE (
    ID_ varchar(64) not null,
    REV_ integer,
    TYPE_ varchar(255) not null,
    NAME_ varchar(255) not null,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    CASE_EXECUTION_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    TASK_ID_ varchar(64),
    BATCH_ID_ varchar(64),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ DOUBLE PRECISION,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    VAR_SCOPE_ varchar(64) not null,
    SEQUENCE_COUNTER_ bigint,
    IS_CONCURRENT_LOCAL_ SMALLINT,
    TENANT_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_EVENT_SUBSCR (
    ID_ varchar(64) not null,
    REV_ integer,
    EVENT_TYPE_ varchar(255) not null,
    EVENT_NAME_ varchar(255),
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTIVITY_ID_ varchar(255),
    CONFIGURATION_ varchar(255),
    CREATED_ TIMESTAMP not null,
    TENANT_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_INCIDENT (
    ID_ varchar(64) not null,
    REV_ integer not null,
    INCIDENT_TIMESTAMP_ TIMESTAMP not null,
    INCIDENT_MSG_ varchar(4000),
    INCIDENT_TYPE_ varchar(255) not null,
    EXECUTION_ID_ varchar(64),
    ACTIVITY_ID_ varchar(255),
    FAILED_ACTIVITY_ID_ varchar(255),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    CAUSE_INCIDENT_ID_ varchar(64),
    ROOT_CAUSE_INCIDENT_ID_ varchar(64),
    CONFIGURATION_ varchar(255),
    TENANT_ID_ varchar(64),
    JOB_DEF_ID_ varchar(64),
    ANNOTATION_ varchar(4000),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_AUTHORIZATION (
    ID_ varchar(64) not null,
    REV_ integer not null,
    TYPE_ integer not null,
    GROUP_ID_ varchar(255),
    USER_ID_ varchar(255),
    RESOURCE_TYPE_ integer not null,
    RESOURCE_ID_ varchar(255),
    PERMS_ integer,
    REMOVAL_TIME_ TIMESTAMP,
    ROOT_PROC_INST_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_FILTER (
    ID_ varchar(64) not null,
    REV_ integer not null,
    RESOURCE_TYPE_ varchar(255) not null,
    NAME_ varchar(255) not null,
    OWNER_ varchar(255),
    QUERY_ TEXT not null,
    PROPERTIES_ TEXT,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_METER_LOG (
    ID_ varchar(64) not null,
    NAME_ varchar(64) not null,
    REPORTER_ varchar(255),
    VALUE_ bigint,
    TIMESTAMP_ TIMESTAMP,
    MILLISECONDS_ bigint DEFAULT 0,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_TASK_METER_LOG (
    ID_ varchar(64) not null,
    ASSIGNEE_HASH_ bigint,
    TIMESTAMP_ TIMESTAMP,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_EXT_TASK (
    ID_ varchar(64) not null,
    REV_ integer not null,
    WORKER_ID_ varchar(255),
    TOPIC_NAME_ varchar(255),
    RETRIES_ integer,
    ERROR_MSG_ varchar(4000),
    ERROR_DETAILS_ID_ varchar(64),
    LOCK_EXP_TIME_ TIMESTAMP NULL,
    SUSPENSION_STATE_ integer,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    PROC_DEF_KEY_ varchar(255),
    ACT_ID_ varchar(255),
    ACT_INST_ID_ varchar(64),
    TENANT_ID_ varchar(64),
    PRIORITY_ bigint NOT NULL DEFAULT 0,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table ACT_RU_BATCH (
    ID_ varchar(64) not null,
    REV_ integer not null,
    TYPE_ varchar(255),
    TOTAL_JOBS_ integer,
    JOBS_CREATED_ integer,
    JOBS_PER_SEED_ integer,
    INVOCATIONS_PER_JOB_ integer,
    SEED_JOB_DEF_ID_ varchar(64),
    BATCH_JOB_DEF_ID_ varchar(64),
    MONITOR_JOB_DEF_ID_ varchar(64),
    SUSPENSION_STATE_ integer,
    CONFIGURATION_ varchar(255),
    TENANT_ID_ varchar(64),
    CREATE_USER_ID_ varchar(255),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE ACT_GE_BYTEARRAY ADD constraint ACT_FK_BYTEARR_DEPL
    foreign key (DEPLOYMENT_ID_)
    references ACT_RE_DEPLOYMENT (ID_);
ALTER TABLE ACT_RU_EXECUTION ADD constraint ACT_FK_EXE_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_) on delete cascade on update cascade;
ALTER TABLE ACT_RU_EXECUTION ADD constraint ACT_FK_EXE_PARENT
    foreign key (PARENT_ID_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_EXECUTION ADD constraint ACT_FK_EXE_SUPER
    foreign key (SUPER_EXEC_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_EXECUTION ADD constraint ACT_FK_EXE_PROCDEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF (ID_);
ALTER TABLE ACT_RU_JOB ADD constraint ACT_FK_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);
ALTER TABLE ACT_RU_TASK ADD constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_TASK ADD constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_TASK ADD constraint ACT_FK_TASK_PROCDEF
  foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
ALTER TABLE ACT_RU_IDENTITYLINK ADD constraint ACT_FK_TSKASS_TASK
    foreign key (TASK_ID_)
    references ACT_RU_TASK (ID_);
ALTER TABLE ACT_RU_IDENTITYLINK ADD constraint ACT_FK_ATHRZ_PROCEDEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF(ID_);
ALTER TABLE ACT_RU_VARIABLE ADD constraint ACT_FK_VAR_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_VARIABLE ADD constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION(ID_);
ALTER TABLE ACT_RU_VARIABLE ADD constraint ACT_FK_VAR_BYTEARRAY
    foreign key (BYTEARRAY_ID_)
    references ACT_GE_BYTEARRAY (ID_);
ALTER TABLE ACT_RU_VARIABLE ADD constraint ACT_FK_VAR_BATCH
    foreign key (BATCH_ID_)
    references ACT_RU_BATCH (ID_);
ALTER TABLE ACT_RU_EVENT_SUBSCR ADD constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION(ID_);
ALTER TABLE ACT_RU_INCIDENT ADD constraint ACT_FK_INC_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_INCIDENT ADD constraint ACT_FK_INC_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_INCIDENT ADD constraint ACT_FK_INC_PROCDEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF (ID_);
ALTER TABLE ACT_RU_INCIDENT ADD constraint ACT_FK_INC_CAUSE
    foreign key (CAUSE_INCIDENT_ID_)
    references ACT_RU_INCIDENT (ID_) on delete cascade on update cascade;
ALTER TABLE ACT_RU_INCIDENT ADD constraint ACT_FK_INC_RCAUSE
    foreign key (ROOT_CAUSE_INCIDENT_ID_)
    references ACT_RU_INCIDENT (ID_) on delete cascade on update cascade;
ALTER TABLE ACT_RU_INCIDENT ADD constraint ACT_FK_INC_JOB_DEF
    foreign key (JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);
ALTER TABLE ACT_RU_EXT_TASK ADD constraint ACT_FK_EXT_TASK_ERROR_DETAILS
    foreign key (ERROR_DETAILS_ID_)
    references ACT_GE_BYTEARRAY (ID_);
ALTER TABLE ACT_RU_EXT_TASK ADD constraint ACT_FK_EXT_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
ALTER TABLE ACT_RU_BATCH ADD constraint ACT_FK_BATCH_SEED_JOB_DEF
    foreign key (SEED_JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);
ALTER TABLE ACT_RU_BATCH ADD constraint ACT_FK_BATCH_MONITOR_JOB_DEF
    foreign key (MONITOR_JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);
ALTER TABLE ACT_RU_BATCH ADD constraint ACT_FK_BATCH_JOB_DEF
    foreign key (BATCH_JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);
