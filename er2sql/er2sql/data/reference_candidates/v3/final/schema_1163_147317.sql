-- Source: https://github.com/gkademane/mobgate-demo-assignment/blob/ebb177be604bda078bd4b614cd34ec62473c8972/external-resources/MobGate-Database-Create-MySQL.sql?raw=true
-- Tables detected: 6 | FK constraints: 2
CREATE TABLE "mg_role" (
    "role_id" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "tenant_id" varchar(50) DEFAULT NULL,
    PRIMARY KEY ("role_id")
);

CREATE TABLE "mg_user" (
    "username" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    "firstname" varchar(50) DEFAULT NULL,
    "lastname" varchar(50) DEFAULT NULL,
    "email" varchar(50) DEFAULT NULL,
    "mobile" varchar(15) DEFAULT NULL,
    "enabled" varchar(1) DEFAULT NULL,
    "locked" int DEFAULT NULL,
    PRIMARY KEY ("username")
);

CREATE TABLE "mg_user_authorities" (
    "username" varchar(255) NOT NULL,
    "authority" varchar(255) NOT NULL,
    CONSTRAINT "role" FOREIGN KEY ("authority") REFERENCES "mg_role" ("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "username" FOREIGN KEY ("username") REFERENCES "mg_user" ("username") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE mg_oauth_refresh_token (
    TOKEN_ID VARCHAR(64) NOT NULL PRIMARY KEY,
    TOKEN BYTEA NOT NULL,
    authentication BYTEA NOT NULL
);

create table mg_oauth_access_token (
    token_id VARCHAR(256),
    token BYTEA,
    authentication_id VARCHAR(256),
    user_name VARCHAR(256),
    client_id VARCHAR(256),
    authentication BYTEA,
    refresh_token VARCHAR(256)
);

create table mg_oauth_client_details (
    client_id VARCHAR(100) PRIMARY KEY,
    resource_ids VARCHAR(256),
    client_secret VARCHAR(256),
    scope VARCHAR(256),
    authorized_grant_types VARCHAR(256),
    web_server_redirect_uri VARCHAR(256),
    authorities VARCHAR(256),
    access_token_validity INTEGER,
    refresh_token_validity INTEGER,
    additional_information VARCHAR(255),
    autoapprove VARCHAR(256)
);
CREATE INDEX ON "mg_role" ("role_id");
CREATE INDEX ON "mg_user" ("username");
CREATE INDEX ON "mg_user_authorities" ("username");
CREATE INDEX ON "mg_user_authorities" ("authority");
