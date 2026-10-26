-- Source: https://github.com/xutao6936/helloWorle/blob/9d8c28886fb03141ea9d331b6995da3e0f23243e/myexample/target/generated-sources/archetype/src/main/resources/archetype-resources/src/main/resources/sql/oracle/create.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6
create table ACCT_AUTHIRITY 
(
    ID NUMERIC(19)           not null,
    AUTH_NAME VARCHAR(30)         not null,
    AUTH_CODE VARCHAR(30)         not null
);
create table ACCT_ROLE 
(
    ID NUMERIC(19)           not null,
    ROLE_NAME VARCHAR(20)         not null
);
create table ACC_USER 
(
    ID NUMERIC(19)           not null,
    LOG_NAME VARCHAR(20)         not null,
    PWD VARCHAR(30),
    NAME VARCHAR(20),
    SALT VARCHAR(40),
    CARETE_DATE TIMESTAMP,
    ROLE_ID NUMERIC(19),
    constraint FK_ACC_USER_REFERENCE_ACCT_ROL foreign key (ROLE_ID)
      references ACCT_ROLE (ID)
);
create table ROLE_AUTH_MIDDLE 
(
    ID NUMERIC(19)           not null,
    ROLE_ID NUMERIC(19),
    AUTH_ID NUMERIC(19),
    constraint FK_ROLE_AUT_REFERENCE_ACCT_ROL foreign key (ROLE_ID)
      references ACCT_ROLE (ID),
    constraint FK_ROLE_AUT_REFERENCE_ACCT_AUT foreign key (AUTH_ID)
      references ACCT_AUTHIRITY (ID)
);
