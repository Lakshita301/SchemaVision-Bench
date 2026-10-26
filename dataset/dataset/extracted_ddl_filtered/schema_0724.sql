-- Source: https://github.com/myLongGit/jeesite/blob/c91d2fe67972a0e5db50b808d3bd731ed76221e4/jeesite/db/act/create/activiti.db2.create.identity.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4

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
    EMAIL_ varchar(255),
    PWD_ varchar(255),
    PICTURE_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_ID_INFO (
    ID_ varchar(64) not null,
    REV_ integer,
    USER_ID_ varchar(64),
    TYPE_ varchar(64),
    KEY_ varchar(255),
    VALUE_ varchar(255),
    PASSWORD_ BLOB,
    PARENT_ID_ varchar(255),
    primary key (ID_)
);

-- Foreign keys added via ALTER TABLE:
alter table ACT_ID_MEMBERSHIP 
    add constraint ACT_FK_MEMB_GROUP 
    foreign key (GROUP_ID_) 
    references ACT_ID_GROUP (ID_);

alter table ACT_ID_MEMBERSHIP 
    add constraint ACT_FK_MEMB_USER 
    foreign key (USER_ID_) 
    references ACT_ID_USER (ID_);

