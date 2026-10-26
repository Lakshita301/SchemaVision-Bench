-- Source: https://github.com/egemenalan/flowable-training/blob/ac15d546507c533102e100111f99b438973fe718/modules/flowable-idm-engine/src/main/resources/org/flowable/idm/db/create/flowable.db2.create.identity.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 6
-- Foreign keys added via ALTER TABLE:
create table ACT_ID_PROPERTY (
    NAME_ varchar(64) not null,
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
);

create table ACT_ID_BYTEARRAY (
    ID_ varchar(64) not null,
    REV_ integer,
    NAME_ varchar(255),
    BYTES_ BYTEA,
    primary key (ID_)
);

create table ACT_ID_GROUP (
    ID_ varchar(64) not null,
    REV_ integer,
    NAME_ varchar(255),
    TYPE_ varchar(255),
    primary key (ID_)
);

create table ACT_ID_MEMBERSHIP (
    USER_ID_ varchar(64) not null,
    GROUP_ID_ varchar(64) not null,
    primary key (USER_ID_, GROUP_ID_)
);

create table ACT_ID_USER (
    ID_ varchar(64) not null,
    REV_ integer,
    FIRST_ varchar(255),
    LAST_ varchar(255),
    DISPLAY_NAME_ varchar(255),
    EMAIL_ varchar(255),
    PWD_ varchar(255),
    PICTURE_ID_ varchar(64),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create table ACT_ID_INFO (
    ID_ varchar(64) not null,
    REV_ integer,
    USER_ID_ varchar(64),
    TYPE_ varchar(64),
    KEY_ varchar(255),
    VALUE_ varchar(255),
    PASSWORD_ BYTEA,
    PARENT_ID_ varchar(255),
    primary key (ID_)
);

create table ACT_ID_TOKEN (
    ID_ varchar(64) not null,
    REV_ integer,
    TOKEN_VALUE_ varchar(255),
    TOKEN_DATE_ timestamp,
    IP_ADDRESS_ varchar(255),
    USER_AGENT_ varchar(255),
    USER_ID_ varchar(255),
    TOKEN_DATA_ varchar(2000),
    primary key (ID_)
);

create table ACT_ID_PRIV (
    ID_ varchar(64) not null,
    NAME_ varchar(255) not null,
    primary key (ID_)
);

create table ACT_ID_PRIV_MAPPING (
    ID_ varchar(64) not null,
    PRIV_ID_ varchar(64) not null,
    USER_ID_ varchar(255),
    GROUP_ID_ varchar(255),
    primary key (ID_)
);


                         

alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_GROUP
    foreign key (GROUP_ID_)
    references ACT_ID_GROUP (ID_);

alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_)
    references ACT_ID_USER (ID_);

alter table ACT_ID_PRIV_MAPPING
    add constraint ACT_FK_PRIV_MAPPING
    foreign key (PRIV_ID_)
    references ACT_ID_PRIV (ID_);
