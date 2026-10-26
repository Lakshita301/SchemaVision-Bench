-- Source: https://github.com/allenleung86/camundatomcat/blob/5425078dc18e57b723d5e8e4c4136ad501ca75f9/sql/create/h2_engine_7.10.0.sql?raw=true
-- Tables detected: 40 | FK/REFERENCES mentions: 76
-- Foreign keys added via ALTER TABLE:
create table ACT_GE_PROPERTY (
    NAME_ varchar(64),
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
);

create table ACT_GE_BYTEARRAY (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    DEPLOYMENT_ID_ varchar(64),
    BYTES_ longvarbinary,
    GENERATED_ bit,
    TENANT_ID_ varchar(64),
    TYPE_ integer,
    CREATE_TIME_ timestamp,
    ROOT_PROC_INST_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_RE_DEPLOYMENT (
    ID_ varchar(64),
    NAME_ varchar(255),
    DEPLOY_TIME_ timestamp,
    SOURCE_ varchar(255),
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

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
    ACT_INST_ID_ varchar(64),
    ACT_ID_ varchar(255),
    IS_ACTIVE_ bit,
    IS_CONCURRENT_ bit,
    IS_SCOPE_ bit,
    IS_EVENT_SCOPE_ bit,
    SUSPENSION_STATE_ integer,
    CACHED_ENT_STATE_ integer,
    SEQUENCE_COUNTER_ integer,
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_RU_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    LOCK_EXP_TIME_ timestamp,
    LOCK_OWNER_ varchar(255),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROCESS_DEF_ID_ varchar(64),
    PROCESS_DEF_KEY_ varchar(255),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp,
    REPEAT_ varchar(255),
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    DEPLOYMENT_ID_ varchar(64),
    SUSPENSION_STATE_ integer NOT NULL DEFAULT 1,
    JOB_DEF_ID_ varchar(64),
    PRIORITY_ bigint NOT NULL DEFAULT 0,
    SEQUENCE_COUNTER_ integer,
    TENANT_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    primary key (ID_)
);

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
    primary key (ID_)
);

create table ACT_RE_PROCDEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) NOT NULL,
    VERSION_ integer NOT NULL,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    HAS_START_FORM_KEY_ bit,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(64),
    VERSION_TAG_ varchar(64),
    HISTORY_TTL_ integer,
    STARTABLE_ boolean NOT NULL default TRUE,
    primary key (ID_)
);

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
    CREATE_TIME_ timestamp,
    DUE_DATE_ timestamp,
    FOLLOW_UP_DATE_ timestamp,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

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
);

create table ACT_RU_VARIABLE (
    ID_ varchar(64) not null,
    REV_ integer,
    TYPE_ varchar(255) not null,
    NAME_ varchar(255) not null,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    CASE_EXECUTION_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    TASK_ID_ varchar(64),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ DOUBLE PRECISION,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    VAR_SCOPE_ varchar(64) not null,
    SEQUENCE_COUNTER_ integer,
    IS_CONCURRENT_LOCAL_ bit,
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_RU_EVENT_SUBSCR (
    ID_ varchar(64) not null,
    REV_ integer,
    EVENT_TYPE_ varchar(255) not null,
    EVENT_NAME_ varchar(255),
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTIVITY_ID_ varchar(255),
    CONFIGURATION_ varchar(255),
    CREATED_ timestamp not null,
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_RU_INCIDENT (
    ID_ varchar(64) not null,
    REV_ integer not null,
    INCIDENT_TIMESTAMP_ timestamp not null,
    INCIDENT_MSG_ varchar(4000),
    INCIDENT_TYPE_ varchar(255) not null,
    EXECUTION_ID_ varchar(64),
    ACTIVITY_ID_ varchar(255),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    CAUSE_INCIDENT_ID_ varchar(64),
    ROOT_CAUSE_INCIDENT_ID_ varchar(64),
    CONFIGURATION_ varchar(255),
    TENANT_ID_ varchar(64),
    JOB_DEF_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_RU_AUTHORIZATION (
    ID_ varchar(64) not null,
    REV_ integer not null,
    TYPE_ integer not null,
    GROUP_ID_ varchar(255),
    USER_ID_ varchar(255),
    RESOURCE_TYPE_ integer not null,
    RESOURCE_ID_ varchar(255),
    PERMS_ integer,
    primary key (ID_)
);

create table ACT_RU_FILTER (
    ID_ varchar(64) not null,
    REV_ integer not null,
    RESOURCE_TYPE_ varchar(255) not null,
    NAME_ varchar(255) not null,
    OWNER_ varchar(255),
    QUERY_ CLOB not null,
    PROPERTIES_ CLOB,
    primary key (ID_)
);

create table ACT_RU_METER_LOG (
    ID_ varchar(64) not null,
    NAME_ varchar(64) not null,
    REPORTER_ varchar(255),
    VALUE_ long,
    TIMESTAMP_ timestamp,
    MILLISECONDS_ bigint DEFAULT 0,
    primary key (ID_)
);

create table ACT_RU_EXT_TASK (
    ID_ varchar(64) not null,
    REV_ integer not null,
    WORKER_ID_ varchar(255),
    TOPIC_NAME_ varchar(255),
    RETRIES_ integer,
    ERROR_MSG_ varchar(4000),
    ERROR_DETAILS_ID_ varchar(64),
    LOCK_EXP_TIME_ timestamp,
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
);

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
);

create table ACT_RE_CASE_DEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) NOT NULL,
    VERSION_ integer NOT NULL,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    TENANT_ID_ varchar(64),
    HISTORY_TTL_ integer,
    primary key (ID_)
);

create table ACT_RU_CASE_EXECUTION (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CASE_INST_ID_ varchar(64),
    SUPER_CASE_EXEC_ varchar(64),
    SUPER_EXEC_ varchar(64),
    BUSINESS_KEY_ varchar(255),
    PARENT_ID_ varchar(64),
    CASE_DEF_ID_ varchar(64),
    ACT_ID_ varchar(255),
    PREV_STATE_ integer,
    CURRENT_STATE_ integer,
    REQUIRED_ bit,
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_RU_CASE_SENTRY_PART (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CASE_INST_ID_ varchar(64),
    CASE_EXEC_ID_ varchar(64),
    SENTRY_ID_ varchar(255),
    TYPE_ varchar(255),
    SOURCE_CASE_EXEC_ID_ varchar(64),
    STANDARD_EVENT_ varchar(255),
    SOURCE_ varchar(255),
    VARIABLE_EVENT_ varchar(255),
    VARIABLE_NAME_ varchar(255),
    SATISFIED_ bit,
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_RE_DECISION_DEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) NOT NULL,
    VERSION_ integer NOT NULL,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    DEC_REQ_ID_ varchar(64),
    DEC_REQ_KEY_ varchar(255),
    TENANT_ID_ varchar(64),
    HISTORY_TTL_ integer,
    VERSION_TAG_ varchar(64),
    primary key (ID_)
);

create table ACT_RE_DECISION_REQ_DEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) NOT NULL,
    VERSION_ integer NOT NULL,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_HI_PROCINST (
    ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    BUSINESS_KEY_ varchar(255),
    PROC_DEF_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64) not null,
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    REMOVAL_TIME_ timestamp,
    DURATION_ bigint,
    START_USER_ID_ varchar(255),
    START_ACT_ID_ varchar(255),
    END_ACT_ID_ varchar(255),
    SUPER_PROCESS_INSTANCE_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    SUPER_CASE_INSTANCE_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(64),
    STATE_ varchar(255),
    primary key (ID_),
    unique (PROC_INST_ID_)
);

create table ACT_HI_ACTINST (
    ID_ varchar(64) not null,
    PARENT_ACT_INST_ID_ varchar(64),
    PROC_DEF_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64) not null,
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64) not null,
    EXECUTION_ID_ varchar(64) not null,
    ACT_ID_ varchar(255) not null,
    TASK_ID_ varchar(64),
    CALL_PROC_INST_ID_ varchar(64),
    CALL_CASE_INST_ID_ varchar(64),
    ACT_NAME_ varchar(255),
    ACT_TYPE_ varchar(255) not null,
    ASSIGNEE_ varchar(64),
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    ACT_INST_STATE_ integer,
    SEQUENCE_COUNTER_ integer,
    TENANT_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_TASKINST (
    ID_ varchar(64) not null,
    TASK_DEF_KEY_ varchar(255),
    PROC_DEF_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    CASE_DEF_KEY_ varchar(255),
    CASE_DEF_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    CASE_EXECUTION_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    PRIORITY_ integer,
    DUE_DATE_ timestamp,
    FOLLOW_UP_DATE_ timestamp,
    TENANT_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_VARINST (
    ID_ varchar(64) not null,
    PROC_DEF_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    CASE_DEF_KEY_ varchar(255),
    CASE_DEF_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    CASE_EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    NAME_ varchar(255) not null,
    VAR_TYPE_ varchar(100),
    CREATE_TIME_ timestamp,
    REV_ integer,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ DOUBLE PRECISION,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    TENANT_ID_ varchar(64),
    STATE_ varchar(20),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_DETAIL (
    ID_ varchar(64) not null,
    TYPE_ varchar(255) not null,
    TIME_ timestamp not null,
    NAME_ varchar(255) NOT null,
    PROC_DEF_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    CASE_DEF_KEY_ varchar(255),
    CASE_DEF_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    CASE_EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    VAR_INST_ID_ varchar(64),
    VAR_TYPE_ varchar(255),
    REV_ integer,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ DOUBLE PRECISION,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    SEQUENCE_COUNTER_ integer,
    TENANT_ID_ varchar(64),
    OPERATION_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_IDENTITYLINK (
    ID_ varchar(64) not null,
    TIMESTAMP_ timestamp not null,
    TYPE_ varchar(255),
    USER_ID_ varchar(255),
    GROUP_ID_ varchar(255),
    TASK_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    OPERATION_TYPE_ varchar(64),
    ASSIGNER_ID_ varchar(64),
    PROC_DEF_KEY_ varchar(255),
    TENANT_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_COMMENT (
    ID_ varchar(64) not null,
    TYPE_ varchar(255),
    TIME_ timestamp not null,
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTION_ varchar(255),
    MESSAGE_ varchar(4000),
    FULL_MSG_ longvarbinary,
    TENANT_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_ATTACHMENT (
    ID_ varchar(64) not null,
    REV_ integer,
    USER_ID_ varchar(255),
    NAME_ varchar(255),
    DESCRIPTION_ varchar(4000),
    TYPE_ varchar(255),
    TASK_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    URL_ varchar(4000),
    CONTENT_ID_ varchar(64),
    TENANT_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_OP_LOG (
    ID_ varchar(64) not null,
    DEPLOYMENT_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    PROC_DEF_KEY_ varchar(255),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    CASE_DEF_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    CASE_EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    JOB_ID_ varchar(64),
    JOB_DEF_ID_ varchar(64),
    BATCH_ID_ varchar(64),
    USER_ID_ varchar(255),
    TIMESTAMP_ timestamp not null,
    OPERATION_TYPE_ varchar(64),
    OPERATION_ID_ varchar(64),
    ENTITY_TYPE_ varchar(30),
    PROPERTY_ varchar(64),
    ORG_VALUE_ varchar(4000),
    NEW_VALUE_ varchar(4000),
    TENANT_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_INCIDENT (
    ID_ varchar(64) not null,
    PROC_DEF_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    CREATE_TIME_ timestamp not null,
    END_TIME_ timestamp,
    INCIDENT_MSG_ varchar(4000),
    INCIDENT_TYPE_ varchar(255) not null,
    ACTIVITY_ID_ varchar(255),
    CAUSE_INCIDENT_ID_ varchar(64),
    ROOT_CAUSE_INCIDENT_ID_ varchar(64),
    CONFIGURATION_ varchar(255),
    INCIDENT_STATE_ integer,
    TENANT_ID_ varchar(64),
    JOB_DEF_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_JOB_LOG (
    ID_ varchar(64) not null,
    TIMESTAMP_ timestamp not null,
    JOB_ID_ varchar(64) not null,
    JOB_DUEDATE_ timestamp,
    JOB_RETRIES_ integer,
    JOB_PRIORITY_ bigint not null default 0,
    JOB_EXCEPTION_MSG_ varchar(4000),
    JOB_EXCEPTION_STACK_ID_ varchar(64),
    JOB_STATE_ integer,
    JOB_DEF_ID_ varchar(64),
    JOB_DEF_TYPE_ varchar(255),
    JOB_DEF_CONFIGURATION_ varchar(255),
    ACT_ID_ varchar(255),
    EXECUTION_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROCESS_DEF_ID_ varchar(64),
    PROCESS_DEF_KEY_ varchar(255),
    DEPLOYMENT_ID_ varchar(64),
    SEQUENCE_COUNTER_ integer,
    TENANT_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_BATCH (
    ID_ varchar(64) not null,
    TYPE_ varchar(255),
    TOTAL_JOBS_ integer,
    JOBS_PER_SEED_ integer,
    INVOCATIONS_PER_JOB_ integer,
    SEED_JOB_DEF_ID_ varchar(64),
    MONITOR_JOB_DEF_ID_ varchar(64),
    BATCH_JOB_DEF_ID_ varchar(64),
    TENANT_ID_ varchar(64),
    CREATE_USER_ID_ varchar(255),
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_EXT_TASK_LOG (
    ID_ varchar(64) not null,
    TIMESTAMP_ timestamp not null,
    EXT_TASK_ID_ varchar(64) not null,
    RETRIES_ integer,
    TOPIC_NAME_ varchar(255),
    WORKER_ID_ varchar(255),
    PRIORITY_ bigint not null default 0,
    ERROR_MSG_ varchar(4000),
    ERROR_DETAILS_ID_ varchar(64),
    ACT_ID_ varchar(255),
    ACT_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    PROC_DEF_KEY_ varchar(255),
    TENANT_ID_ varchar(64),
    STATE_ integer,
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_CASEINST (
    ID_ varchar(64) not null,
    CASE_INST_ID_ varchar(64) not null,
    BUSINESS_KEY_ varchar(255),
    CASE_DEF_ID_ varchar(64) not null,
    CREATE_TIME_ timestamp not null,
    CLOSE_TIME_ timestamp,
    DURATION_ bigint,
    STATE_ integer,
    CREATE_USER_ID_ varchar(255),
    SUPER_CASE_INSTANCE_ID_ varchar(64),
    SUPER_PROCESS_INSTANCE_ID_ varchar(64),
    TENANT_ID_ varchar(64),
    primary key (ID_),
    unique (CASE_INST_ID_)
);

create table ACT_HI_CASEACTINST (
    ID_ varchar(64) not null,
    PARENT_ACT_INST_ID_ varchar(64),
    CASE_DEF_ID_ varchar(64) not null,
    CASE_INST_ID_ varchar(64) not null,
    CASE_ACT_ID_ varchar(255) not null,
    TASK_ID_ varchar(64),
    CALL_PROC_INST_ID_ varchar(64),
    CALL_CASE_INST_ID_ varchar(64),
    CASE_ACT_NAME_ varchar(255),
    CASE_ACT_TYPE_ varchar(255),
    CREATE_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    STATE_ integer,
    REQUIRED_ bit,
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_HI_DECINST (
    ID_ varchar(64) NOT NULL,
    DEC_DEF_ID_ varchar(64) NOT NULL,
    DEC_DEF_KEY_ varchar(255) NOT NULL,
    DEC_DEF_NAME_ varchar(255),
    PROC_DEF_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    CASE_DEF_KEY_ varchar(255),
    CASE_DEF_ID_ varchar(64),
    CASE_INST_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    ACT_ID_ varchar(255),
    EVAL_TIME_ timestamp not null,
    REMOVAL_TIME_ timestamp,
    COLLECT_VALUE_ DOUBLE PRECISION,
    USER_ID_ varchar(255),
    ROOT_DEC_INST_ID_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    DEC_REQ_ID_ varchar(64),
    DEC_REQ_KEY_ varchar(255),
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_HI_DEC_IN (
    ID_ varchar(64) NOT NULL,
    DEC_INST_ID_ varchar(64) NOT NULL,
    CLAUSE_ID_ varchar(64),
    CLAUSE_NAME_ varchar(255),
    VAR_TYPE_ varchar(100),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ DOUBLE PRECISION,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    TENANT_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    ROOT_PROC_INST_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_DEC_OUT (
    ID_ varchar(64) NOT NULL,
    DEC_INST_ID_ varchar(64) NOT NULL,
    CLAUSE_ID_ varchar(64),
    CLAUSE_NAME_ varchar(255),
    RULE_ID_ varchar(64),
    RULE_ORDER_ integer,
    VAR_NAME_ varchar(255),
    VAR_TYPE_ varchar(100),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ DOUBLE PRECISION,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    TENANT_ID_ varchar(64),
    CREATE_TIME_ timestamp,
    ROOT_PROC_INST_ID_ varchar(64),
    REMOVAL_TIME_ timestamp,
    primary key (ID_)
);


                         

alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL
    foreign key (DEPLOYMENT_ID_)
    references ACT_RE_DEPLOYMENT;

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT
    foreign key (PARENT_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER
    foreign key (SUPER_EXEC_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF (ID_);

alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK
    foreign key (TASK_ID_)
    references ACT_RU_TASK;

alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF;

alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF
  foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF;

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_BYTEARRAY
    foreign key (BYTEARRAY_ID_)
    references ACT_GE_BYTEARRAY;

alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY;

alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION;

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_PROCDEF
    foreign key (PROC_DEF_ID_)
    references ACT_RE_PROCDEF (ID_);

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_CAUSE
    foreign key (CAUSE_INCIDENT_ID_)
    references ACT_RU_INCIDENT (ID_);

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_RCAUSE
    foreign key (ROOT_CAUSE_INCIDENT_ID_)
    references ACT_RU_INCIDENT (ID_);

alter table ACT_RU_EXT_TASK
    add constraint ACT_FK_EXT_TASK_ERROR_DETAILS
    foreign key (ERROR_DETAILS_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_INCIDENT
    add constraint ACT_FK_INC_JOB_DEF
    foreign key (JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);

alter table ACT_RU_EXT_TASK
    add constraint ACT_FK_EXT_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_BATCH
    add constraint ACT_FK_BATCH_SEED_JOB_DEF
    foreign key (SEED_JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);

alter table ACT_RU_BATCH
    add constraint ACT_FK_BATCH_MONITOR_JOB_DEF
    foreign key (MONITOR_JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);

alter table ACT_RU_BATCH
    add constraint ACT_FK_BATCH_JOB_DEF
    foreign key (BATCH_JOB_DEF_ID_)
    references ACT_RU_JOBDEF (ID_);

alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION;

alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_PARENT
    foreign key (PARENT_ID_)
    references ACT_RU_CASE_EXECUTION;

alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_CASE_DEF
    foreign key (CASE_DEF_ID_)
    references ACT_RE_CASE_DEF;

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_CASE_EXE
    foreign key (CASE_EXECUTION_ID_)
    references ACT_RU_CASE_EXECUTION;

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION;

alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_CASE_EXE
    foreign key (CASE_EXECUTION_ID_)
    references ACT_RU_CASE_EXECUTION;

alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_CASE_DEF
  foreign key (CASE_DEF_ID_)
  references ACT_RE_CASE_DEF;

alter table ACT_RU_CASE_SENTRY_PART
    add constraint ACT_FK_CASE_SENTRY_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION;

alter table ACT_RU_CASE_SENTRY_PART
    add constraint ACT_FK_CASE_SENTRY_CASE_EXEC
    foreign key (CASE_EXEC_ID_)
    references ACT_RU_CASE_EXECUTION;

alter table ACT_RE_DECISION_DEF
    add constraint ACT_FK_DEC_REQ
    foreign key (DEC_REQ_ID_)
    references ACT_RE_DECISION_REQ_DEF(ID_);
