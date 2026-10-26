-- Source: https://github.com/henry0hai/flowable-k8s/blob/6a17d331bfe73611538a07289725cb1c24d77f5f/modules/flowable-idm-engine/src/main/resources/org/flowable/idm/db/upgrade/flowable.oracle.upgradestep.59900.to.6000.identity.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 2
-- Foreign keys added via ALTER TABLE:
create table ACT_ID_PROPERTY (
    NAME_ VARCHAR(64),
    VALUE_ VARCHAR(300),
    REV_ INTEGER,
    primary key (NAME_)
);

create table ACT_ID_BYTEARRAY (
    ID_ VARCHAR(64),
    REV_ INTEGER,
    NAME_ VARCHAR(255),
    BYTES_ BYTEA,
    primary key (ID_)
);

create table ACT_ID_TOKEN (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER,
    TOKEN_VALUE_ VARCHAR(255),
    TOKEN_DATE_ TIMESTAMP(6),
    IP_ADDRESS_ VARCHAR(255),
    USER_AGENT_ VARCHAR(255),
    USER_ID_ VARCHAR(255),
    TOKEN_DATA_ VARCHAR(2000),
    primary key (ID_)
);

create table ACT_ID_PRIV (
    ID_ VARCHAR(64) not null,
    NAME_ VARCHAR(255),
    primary key (ID_)
);

create table ACT_ID_PRIV_MAPPING (
    ID_ VARCHAR(64) not null,
    PRIV_ID_ VARCHAR(64) not null,
    USER_ID_ VARCHAR(255),
    GROUP_ID_ VARCHAR(255),
    primary key (ID_)
);


                         

alter table ACT_ID_PRIV_MAPPING 
    add constraint ACT_FK_PRIV_MAPPING 
    foreign key (PRIV_ID_) 
    references ACT_ID_PRIV (ID_);
