-- Source: https://github.com/kikosikera/mailtrain/blob/0daf8d586f46372b99defe23d8bcbb985ef9f08e/setup/sql/base.sql?raw=true
-- Tables detected: 14 | FK constraints: 6
CREATE TABLE "campaign" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "list" int unsigned NOT NULL,
    "segment" int unsigned NOT NULL,
    "subscription" int unsigned NOT NULL,
    "status" SMALLINT unsigned NOT NULL DEFAULT '0',
    "response" varchar(255) DEFAULT NULL,
    "response_id" varchar(255) CHARACTER SET ascii DEFAULT NULL,
    "updated" timestamp NULL DEFAULT NULL,
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "list" UNIQUE ("list","segment","subscription")
);

CREATE TABLE "campaign_tracker" (
    "list" int unsigned NOT NULL,
    "subscriber" int unsigned NOT NULL,
    "link" int NOT NULL,
    "ip" varchar(100) CHARACTER SET ascii DEFAULT NULL,
    "country" varchar(2) CHARACTER SET ascii DEFAULT NULL,
    "count" int unsigned NOT NULL DEFAULT '1',
    PRIMARY KEY ("list","subscriber","link")
);

CREATE TABLE "campaigns" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "cid" varchar(255) CHARACTER SET ascii NOT NULL,
    "name" varchar(255) NOT NULL DEFAULT '',
    "description" text,
    "list" int unsigned NOT NULL,
    "segment" int unsigned DEFAULT NULL,
    "template" int unsigned NOT NULL,
    "from" varchar(255) DEFAULT '',
    "address" varchar(255) DEFAULT '',
    "subject" varchar(255) DEFAULT '',
    "html" text,
    "text" text,
    "status" SMALLINT unsigned NOT NULL DEFAULT '1',
    "status_change" timestamp NULL DEFAULT NULL,
    "delivered" int unsigned NOT NULL DEFAULT '0',
    "opened" int unsigned NOT NULL DEFAULT '0',
    "clicks" int unsigned NOT NULL DEFAULT '0',
    "unsubscribed" int unsigned NOT NULL DEFAULT '0',
    "bounced" int unsigned NOT NULL DEFAULT '0',
    "complained" int unsigned NOT NULL DEFAULT '0',
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "cid" UNIQUE ("cid"),
    KEY "name" ("name"(191))
);

CREATE TABLE "confirmations" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "cid" varchar(255) CHARACTER SET ascii NOT NULL,
    "list" int unsigned NOT NULL,
    "email" varchar(255) NOT NULL,
    "data" text NOT NULL,
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "cid" UNIQUE ("cid")
);

CREATE TABLE "custom_fields" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "list" int unsigned NOT NULL,
    "name" varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
    "key" varchar(100) CHARACTER SET ascii NOT NULL,
    "default_value" varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
    "type" varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
    "group" int unsigned DEFAULT NULL,
    "column" varchar(255) CHARACTER SET ascii DEFAULT NULL,
    "visible" SMALLINT unsigned NOT NULL DEFAULT '1',
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "list" UNIQUE ("list","column")
);

CREATE TABLE "importer" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "list" int unsigned NOT NULL,
    "type" SMALLINT unsigned NOT NULL DEFAULT '1',
    "path" varchar(255) NOT NULL DEFAULT '',
    "size" int unsigned NOT NULL DEFAULT '0',
    "delimiter" varchar(1) CHARACTER SET ascii NOT NULL DEFAULT ',',
    "status" SMALLINT unsigned NOT NULL DEFAULT '0',
    "error" varchar(255) DEFAULT NULL,
    "processed" int unsigned NOT NULL DEFAULT '0',
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "mapping" text CHARACTER SET utf8mb4 NOT NULL,
    "finished" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "links" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "cid" varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
    "campaign" int unsigned NOT NULL,
    "url" varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
    "clicks" int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY ("id"),
    CONSTRAINT "cid" UNIQUE ("cid"),
    CONSTRAINT "campaign_2" UNIQUE ("campaign","url")
);

CREATE TABLE "lists" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "cid" varchar(255) CHARACTER SET ascii NOT NULL,
    "name" varchar(255) NOT NULL DEFAULT '',
    "description" text,
    "subscribers" int unsigned DEFAULT '0',
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "cid" UNIQUE ("cid"),
    KEY "name" ("name"(191))
);

CREATE TABLE "segment_rules" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "segment" int unsigned NOT NULL,
    "column" varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
    "value" varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY ("id")
);

CREATE TABLE "segments" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "list" int unsigned NOT NULL,
    "name" varchar(255) NOT NULL DEFAULT '',
    "type" SMALLINT unsigned NOT NULL,
    "created" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE TABLE "settings" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "key" varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
    "value" text NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "key" UNIQUE ("key")
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

CREATE TABLE "subscription" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "cid" varchar(255) CHARACTER SET ascii NOT NULL,
    "email" varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
    "opt_in_ip" varchar(100) DEFAULT NULL,
    "opt_in_country" varchar(2) DEFAULT NULL,
    "imported" int unsigned DEFAULT NULL,
    "status" SMALLINT unsigned NOT NULL DEFAULT '1',
    "status_change" timestamp NULL DEFAULT NULL,
    "latest_open" timestamp NULL DEFAULT NULL,
    "latest_click" timestamp NULL DEFAULT NULL,
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "first_name" varchar(255) DEFAULT NULL,
    "last_name" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "email" UNIQUE ("email"),
    CONSTRAINT "cid" UNIQUE ("cid"),
    KEY "first_name" ("first_name"(191)),
    KEY "last_name" ("last_name"(191))
);

CREATE TABLE "templates" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL DEFAULT '',
    "description" text,
    "html" text,
    "text" text,
    "created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    KEY "name" ("name"(191))
);

CREATE TABLE "users" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "username" varchar(255) NOT NULL DEFAULT '',
    "password" varchar(255) NOT NULL DEFAULT '',
    "email" varchar(255) CHARACTER SET utf8 DEFAULT NULL,
    "reset_token" varchar(255) CHARACTER SET ascii DEFAULT NULL,
    "reset_expire" timestamp NULL DEFAULT NULL,
    "created" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "email" UNIQUE ("email"),
    KEY "username" ("username"(191)),
    KEY "check_reset" ("username"(191),"reset_token","reset_expire")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
ALTER TABLE "confirmations" ADD CONSTRAINT "confirmations_ibfk_1" FOREIGN KEY ("list") REFERENCES "lists" ("id") ON DELETE CASCADE;
ALTER TABLE "custom_fields" ADD CONSTRAINT "custom_fields_ibfk_1" FOREIGN KEY ("list") REFERENCES "lists" ("id") ON DELETE CASCADE;
ALTER TABLE "importer" ADD CONSTRAINT "importer_ibfk_1" FOREIGN KEY ("list") REFERENCES "lists" ("id") ON DELETE CASCADE;
ALTER TABLE "links" ADD CONSTRAINT "links_ibfk_1" FOREIGN KEY ("campaign") REFERENCES "campaigns" ("id") ON DELETE CASCADE;
ALTER TABLE "segment_rules" ADD CONSTRAINT "segment_rules_ibfk_1" FOREIGN KEY ("segment") REFERENCES "segments" ("id") ON DELETE CASCADE;
ALTER TABLE "segments" ADD CONSTRAINT "segments_ibfk_1" FOREIGN KEY ("list") REFERENCES "lists" ("id") ON DELETE CASCADE;
CREATE INDEX ON "campaign" ("created");
CREATE INDEX ON "campaign" ("response_id");
CREATE INDEX ON "campaigns" ("status");
CREATE INDEX ON "confirmations" ("list");
CREATE INDEX ON "custom_fields" ("list");
CREATE INDEX ON "importer" ("list");
CREATE INDEX ON "links" ("campaign");
CREATE INDEX ON "segment_rules" ("segment");
CREATE INDEX ON "segments" ("list");
CREATE INDEX ON "segments" ("name");
CREATE INDEX ON "subscription" ("status");
CREATE INDEX ON "users" ("reset_token");
