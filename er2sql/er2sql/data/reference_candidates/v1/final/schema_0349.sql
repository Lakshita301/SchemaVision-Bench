-- Source: https://github.com/xutao6936/helloWorle/blob/9d8c28886fb03141ea9d331b6995da3e0f23243e/myexample/target/generated-sources/archetype/src/main/resources/archetype-resources/src/main/resources/sql/oracle/create.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6
-- Foreign keys added via ALTER TABLE:
create table ACCT_AUTHIRITY 
(
    ID NUMBER(19)           not null,
    AUTH_NAME VARCHAR(30)         not null,
    AUTH_CODE VARCHAR(30)         not null
);

create table ACCT_ROLE 
(
    ID NUMBER(19)           not null,
    ROLE_NAME VARCHAR(20)         not null
);

create table ACC_USER 
(
    ID NUMBER(19)           not null,
    LOG_NAME VARCHAR(20)         not null,
    PWD VARCHAR(30),
    NAME VARCHAR(20),
    SALT VARCHAR(40),
    CARETE_DATE TIMESTAMP,
    ROLE_ID NUMBER(19)
);

create table ROLE_AUTH_MIDDLE 
(
    ID NUMBER(19)           not null,
    ROLE_ID NUMBER(19),
    AUTH_ID NUMBER(19)
);


                         

alter table ACC_USER
   add constraint FK_ACC_USER_REFERENCE_ACCT_ROL foreign key (ROLE_ID)
      references ACCT_ROLE (ID);

alter table ROLE_AUTH_MIDDLE
   add constraint FK_ROLE_AUT_REFERENCE_ACCT_ROL foreign key (ROLE_ID)
      references ACCT_ROLE (ID);

alter table ROLE_AUTH_MIDDLE
   add constraint FK_ROLE_AUT_REFERENCE_ACCT_AUT foreign key (AUTH_ID)
      references ACCT_AUTHIRITY (ID);
