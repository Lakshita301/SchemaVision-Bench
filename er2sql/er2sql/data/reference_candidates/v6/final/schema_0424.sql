-- Source: https://github.com/guguguaiguai/hlsoa/blob/26f6fbc8c712856740adbd8e73cc4b8289257ea1/hls-oa/db/act/create/activiti.postgres.create.identity.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4
create table ACT_ID_GROUP (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    TYPE_ varchar(255),
    primary key (ID_)
);
create table ACT_ID_MEMBERSHIP (
    USER_ID_ varchar(64),
    GROUP_ID_ varchar(64),
    primary key (USER_ID_, GROUP_ID_),
    constraint ACT_FK_MEMB_GROUP
    foreign key (GROUP_ID_) 
    references ACT_ID_GROUP (ID_)
);
create table ACT_ID_USER (
    ID_ varchar(64),
    REV_ integer,
    FIRST_ varchar(255),
    LAST_ varchar(255),
    EMAIL_ varchar(255),
    PWD_ varchar(255),
    PICTURE_ID_ varchar(64),
    primary key (ID_)
);
create table ACT_ID_INFO (
    ID_ varchar(64),
    REV_ integer,
    USER_ID_ varchar(64),
    TYPE_ varchar(64),
    KEY_ varchar(255),
    VALUE_ varchar(255),
    PASSWORD_ bytea,
    PARENT_ID_ varchar(255),
    primary key (ID_)
);
alter table ACT_ID_MEMBERSHIP 
    add constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_) 
    references ACT_ID_USER (ID_);
