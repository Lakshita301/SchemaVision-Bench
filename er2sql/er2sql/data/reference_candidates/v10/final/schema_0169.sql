-- Source: https://github.com/JasonAngela/dna/blob/662c42d69821e7e6334e5cf398c88c42f3dc900e/db/act/create/activiti.oracle.create.identity.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4
create table ACT_ID_GROUP (
    ID_ VARCHAR(64),
    REV_ INTEGER,
    NAME_ VARCHAR(255),
    TYPE_ VARCHAR(255),
    primary key (ID_)
);
create table ACT_ID_MEMBERSHIP (
    USER_ID_ VARCHAR(64),
    GROUP_ID_ VARCHAR(64),
    primary key (USER_ID_, GROUP_ID_)
);
create table ACT_ID_USER (
    ID_ VARCHAR(64),
    REV_ INTEGER,
    FIRST_ VARCHAR(255),
    LAST_ VARCHAR(255),
    EMAIL_ VARCHAR(255),
    PWD_ VARCHAR(255),
    PICTURE_ID_ VARCHAR(64),
    primary key (ID_)
);
create table ACT_ID_INFO (
    ID_ VARCHAR(64),
    REV_ INTEGER,
    USER_ID_ VARCHAR(64),
    TYPE_ VARCHAR(64),
    KEY_ VARCHAR(255),
    VALUE_ VARCHAR(255),
    PASSWORD_ BYTEA,
    PARENT_ID_ VARCHAR(255),
    primary key (ID_)
);
ALTER TABLE ACT_ID_MEMBERSHIP ADD constraint ACT_FK_MEMB_GROUP 
    foreign key (GROUP_ID_) 
    references ACT_ID_GROUP (ID_);
ALTER TABLE ACT_ID_MEMBERSHIP ADD constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_) 
    references ACT_ID_USER (ID_);
