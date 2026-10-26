-- Source: https://github.com/svn2github/sakai-kernel/blob/2b97c9b7ad53becc8de57a5233c7d35873edd10d/branches/KNL-276/kernel-impl/src/main/sql/oracle/sakai_user.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

CREATE TABLE SAKAI_USER_PROPERTY
(
       USER_ID             VARCHAR2(99) NOT NULL,
       NAME                 VARCHAR2(99) NOT NULL,
       VALUE                CLOB NULL
);

CREATE TABLE SAKAI_USER
(
       USER_ID              VARCHAR2(99) NOT NULL,
       EMAIL                VARCHAR2(255) NULL,
       EMAIL_LC             VARCHAR2(255) NULL,
       FIRST_NAME           VARCHAR2(255) NULL,
       LAST_NAME            VARCHAR2(255) NULL,
       TYPE                 VARCHAR2(255) NULL,
       PW                   VARCHAR2(255) NULL,
       CREATEDBY            VARCHAR2(99) NOT NULL,
       MODIFIEDBY           VARCHAR2(99) NOT NULL,
       CREATEDON            TIMESTAMP NOT NULL,
       MODIFIEDON           TIMESTAMP NOT NULL
);

CREATE TABLE SAKAI_USER_ID_MAP
(
       USER_ID             VARCHAR2(99) NOT NULL,
       EID                 VARCHAR2(255) NOT NULL
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE SAKAI_USER_PROPERTY
       ADD  ( FOREIGN KEY (USER_ID)
                             REFERENCES SAKAI_USER ) ;

