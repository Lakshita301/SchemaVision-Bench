-- Source: https://github.com/egemenalan/flowable-training/blob/ac15d546507c533102e100111f99b438973fe718/modules/flowable-idm-engine/src/main/resources/org/flowable/idm/db/create/flowable.mssql.create.identity.sql?raw=true
-- Tables detected: 9 | FK constraints: 3

create table ACT_ID_PROPERTY (
    NAME_ nvarchar(64),
    VALUE_ nvarchar(300),
    REV_ int,
    primary key (NAME_)
);

create table ACT_ID_BYTEARRAY (
    ID_ nvarchar(64),
    REV_ int,
    NAME_ nvarchar(255),
    BYTES_  varbinary(max),
    primary key (ID_)
);

create table ACT_ID_GROUP (
    ID_ nvarchar(64),
    REV_ int,
    NAME_ nvarchar(255),
    TYPE_ nvarchar(255),
    primary key (ID_)
);

create table ACT_ID_MEMBERSHIP (
    USER_ID_ nvarchar(64),
    GROUP_ID_ nvarchar(64),
    primary key (USER_ID_, GROUP_ID_)
);

create table ACT_ID_USER (
    ID_ nvarchar(64),
    REV_ int,
    FIRST_ nvarchar(255),
    LAST_ nvarchar(255),
    DISPLAY_NAME_ nvarchar(255),
    EMAIL_ nvarchar(255),
    PWD_ nvarchar(255),
    PICTURE_ID_ nvarchar(64),
    TENANT_ID_ nvarchar(255) default '',
    primary key (ID_)
);

create table ACT_ID_INFO (
    ID_ nvarchar(64),
    REV_ int,
    USER_ID_ nvarchar(64),
    TYPE_ nvarchar(64),
    KEY_ nvarchar(255),
    VALUE_ nvarchar(255),
    PASSWORD_ varbinary(max),
    PARENT_ID_ nvarchar(255),
    primary key (ID_)
);

create table ACT_ID_TOKEN (
    ID_ nvarchar(64) not null,
    REV_ int,
    TOKEN_VALUE_ nvarchar(255),
    TOKEN_DATE_ datetime,
    IP_ADDRESS_ nvarchar(255),
    USER_AGENT_ nvarchar(255),
    USER_ID_ nvarchar(255),
    TOKEN_DATA_ nvarchar(2000),
    primary key (ID_)
);

create table ACT_ID_PRIV (
    ID_ nvarchar(64) not null,
    NAME_ nvarchar(255) not null,
    primary key (ID_)
);

create table ACT_ID_PRIV_MAPPING (
    ID_ nvarchar(64) not null,
    PRIV_ID_ nvarchar(64) not null,
    USER_ID_ nvarchar(255),
    GROUP_ID_ nvarchar(255),
    primary key (ID_)
);

-- Foreign keys added via ALTER TABLE:
alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_GROUP
    foreign key (GROUP_ID_)
    references ACT_ID_GROUP;

alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_)
    references ACT_ID_USER (ID_);

alter table ACT_ID_PRIV_MAPPING
    add constraint ACT_FK_PRIV_MAPPING
    foreign key (PRIV_ID_)
    references ACT_ID_PRIV (ID_);

