-- Source: https://github.com/egemenalan/flowable-training/blob/ac15d546507c533102e100111f99b438973fe718/modules/flowable-idm-engine/src/main/resources/org/flowable/idm/db/create/flowable.mssql.create.identity.sql?raw=true
-- Tables detected: 9 | FK constraints: 3
create table ACT_ID_PROPERTY (
    NAME_ VARCHAR(64),
    VALUE_ VARCHAR(300),
    REV_ int,
    primary key (NAME_)
);
create table ACT_ID_BYTEARRAY (
    ID_ VARCHAR(64),
    REV_ int,
    NAME_ VARCHAR(255),
    BYTES_ BYTEA(max),
    primary key (ID_)
);
create table ACT_ID_GROUP (
    ID_ VARCHAR(64),
    REV_ int,
    NAME_ VARCHAR(255),
    TYPE_ VARCHAR(255),
    primary key (ID_)
);
create table ACT_ID_MEMBERSHIP (
    USER_ID_ VARCHAR(64),
    GROUP_ID_ VARCHAR(64),
    primary key (USER_ID_, GROUP_ID_),
    constraint ACT_FK_MEMB_GROUP
    foreign key (GROUP_ID_)
    references ACT_ID_GROUP
);
create table ACT_ID_USER (
    ID_ VARCHAR(64),
    REV_ int,
    FIRST_ VARCHAR(255),
    LAST_ VARCHAR(255),
    DISPLAY_NAME_ VARCHAR(255),
    EMAIL_ VARCHAR(255),
    PWD_ VARCHAR(255),
    PICTURE_ID_ VARCHAR(64),
    TENANT_ID_ VARCHAR(255) default '',
    primary key (ID_)
);
create table ACT_ID_INFO (
    ID_ VARCHAR(64),
    REV_ int,
    USER_ID_ VARCHAR(64),
    TYPE_ VARCHAR(64),
    KEY_ VARCHAR(255),
    VALUE_ VARCHAR(255),
    PASSWORD_ BYTEA(max),
    PARENT_ID_ VARCHAR(255),
    primary key (ID_)
);
create table ACT_ID_TOKEN (
    ID_ VARCHAR(64) not null,
    REV_ int,
    TOKEN_VALUE_ VARCHAR(255),
    TOKEN_DATE_ TIMESTAMP,
    IP_ADDRESS_ VARCHAR(255),
    USER_AGENT_ VARCHAR(255),
    USER_ID_ VARCHAR(255),
    TOKEN_DATA_ VARCHAR(2000),
    primary key (ID_)
);
create table ACT_ID_PRIV (
    ID_ VARCHAR(64) not null,
    NAME_ VARCHAR(255) not null,
    primary key (ID_)
);
create table ACT_ID_PRIV_MAPPING (
    ID_ VARCHAR(64) not null,
    PRIV_ID_ VARCHAR(64) not null,
    USER_ID_ VARCHAR(255),
    GROUP_ID_ VARCHAR(255),
    primary key (ID_),
    constraint ACT_FK_PRIV_MAPPING
    foreign key (PRIV_ID_)
    references ACT_ID_PRIV (ID_)
);
alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_)
    references ACT_ID_USER (ID_);
