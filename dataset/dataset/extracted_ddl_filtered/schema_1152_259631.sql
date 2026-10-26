-- Source: https://github.com/uzhAndy/UnusedDependencies_BSC/blob/24e8d4d1ca457e7f63ea03415e10e0cb0bc3b529/Projects/camunda-bpm-platform-master/engine/src/main/resources/org/camunda/bpm/engine/db/upgrade/oracle_engine_7.1_to_7.2.sql?raw=true
-- Tables detected: 6 | FK constraints: 9

create table ACT_RE_CASE_DEF (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CATEGORY_ NVARCHAR2(255),
    NAME_ NVARCHAR2(255),
    KEY_ NVARCHAR2(255) NOT NULL,
    VERSION_ INTEGER NOT NULL,
    DEPLOYMENT_ID_ NVARCHAR2(64),
    RESOURCE_NAME_ NVARCHAR2(2000),
    DGRM_RESOURCE_NAME_ NVARCHAR2(2000),
    primary key (ID_)
);

create table ACT_RU_CASE_EXECUTION (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CASE_INST_ID_ NVARCHAR2(64),
    SUPER_CASE_EXEC_ NVARCHAR2(64),
    BUSINESS_KEY_ NVARCHAR2(255),
    PARENT_ID_ NVARCHAR2(64),
    CASE_DEF_ID_ NVARCHAR2(64),
    ACT_ID_ NVARCHAR2(255),
    PREV_STATE_ INTEGER,
    CURRENT_STATE_ INTEGER,
    primary key (ID_)
);

create table ACT_RU_CASE_SENTRY_PART (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CASE_INST_ID_ NVARCHAR2(64),
    CASE_EXEC_ID_ NVARCHAR2(64),
    SENTRY_ID_ NVARCHAR2(255),
    TYPE_ NVARCHAR2(255),
    SOURCE_CASE_EXEC_ID_ NVARCHAR2(64),
    STANDARD_EVENT_ NVARCHAR2(255),
    SATISFIED_ NUMBER(1,0) CHECK (SATISFIED_ IN (1,0)),
    primary key (ID_)
);

create table ACT_RU_FILTER (
  ID_ NVARCHAR2(64) not null,
  REV_ integer not null,
  RESOURCE_TYPE_ NVARCHAR2(255) not null,
  NAME_ NVARCHAR2(255) not null,
  OWNER_ NVARCHAR2(255),
  QUERY_ NCLOB not null,
  PROPERTIES_ NCLOB,
  primary key (ID_)
);

create table ACT_HI_CASEINST (
    ID_ NVARCHAR2(64) not null,
    CASE_INST_ID_ NVARCHAR2(64) not null,
    BUSINESS_KEY_ NVARCHAR2(255),
    CASE_DEF_ID_ NVARCHAR2(64) not null,
    CREATE_TIME_ TIMESTAMP(6) not null,
    CLOSE_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    STATE_ INTEGER,
    CREATE_USER_ID_ NVARCHAR2(255),
    SUPER_CASE_INSTANCE_ID_ NVARCHAR2(64),
    primary key (ID_),
    unique (CASE_INST_ID_)
);

create table ACT_HI_CASEACTINST (
    ID_ NVARCHAR2(64) not null,
    PARENT_ACT_INST_ID_ NVARCHAR2(64),
    CASE_DEF_ID_ NVARCHAR2(64) not null,
    CASE_INST_ID_ NVARCHAR2(64) not null,
    CASE_ACT_ID_ NVARCHAR2(255) not null,
    TASK_ID_ NVARCHAR2(64),
    CALL_PROC_INST_ID_ NVARCHAR2(64),
    CALL_CASE_INST_ID_ NVARCHAR2(64),
    CASE_ACT_NAME_ NVARCHAR2(255),
    CASE_ACT_TYPE_ NVARCHAR2(255),
    CREATE_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    STATE_ INTEGER,
    primary key (ID_)
);

-- Foreign keys added via ALTER TABLE:
alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_PARENT
    foreign key (PARENT_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

alter table ACT_RU_CASE_EXECUTION
    add constraint ACT_FK_CASE_EXE_CASE_DEF
    foreign key (CASE_DEF_ID_)
    references ACT_RE_CASE_DEF(ID_);

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_CASE_EXE
    foreign key (CASE_EXECUTION_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_CASE_EXE
    foreign key (CASE_EXECUTION_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_CASE_DEF
  foreign key (CASE_DEF_ID_)
  references ACT_RE_CASE_DEF(ID_);

alter table ACT_RU_CASE_SENTRY_PART
    add constraint ACT_FK_CASE_SENTRY_CASE_INST
    foreign key (CASE_INST_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

alter table ACT_RU_CASE_SENTRY_PART
    add constraint ACT_FK_CASE_SENTRY_CASE_EXEC
    foreign key (CASE_EXEC_ID_)
    references ACT_RU_CASE_EXECUTION(ID_);

