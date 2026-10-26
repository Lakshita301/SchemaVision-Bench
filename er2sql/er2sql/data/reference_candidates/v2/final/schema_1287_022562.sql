-- Source: https://github.com/nobody5607/yii2_demo/blob/8ac869dd8186e9cb76c7b951b4e8f9abcdb99aac/vendor/codeception/base/tests/data/dumps/mysql.sql?raw=true
-- Tables detected: 8 | FK constraints: 2
CREATE TABLE "groups" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(100) DEFAULT NULL,
    "enabled" boolean DEFAULT NULL,
    "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE TABLE "users" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(30) DEFAULT NULL,
    "email" varchar(255) DEFAULT NULL,
    "is_active" bit(1) DEFAULT b'1',
    "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE TABLE "permissions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "user_id" int DEFAULT NULL,
    "group_id" int DEFAULT NULL,
    "role" varchar(30) DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "FK_permissions" ("group_id"),
    KEY "FK_users" ("user_id"),
    CONSTRAINT "FK_users" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE,
    CONSTRAINT "FK_permissions" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE
);

CREATE TABLE "order" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "table_with_reserved_primary_key" (
    "unique" int NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL,
    PRIMARY KEY ("unique")
);

CREATE TABLE "composite_pk" (
    "group_id" int NOT NULL,
    "id" int NOT NULL,
    "status" varchar(255) NOT NULL,
    PRIMARY KEY ("group_id", "id")
);

CREATE TABLE "no_pk" (
    "status" varchar(255) NOT NULL
);

CREATE TABLE "empty_table" (
    "id" int NOT NULL AUTO_INCREMENT,
    "field" varchar(255),
    PRIMARY KEY("id")
);
