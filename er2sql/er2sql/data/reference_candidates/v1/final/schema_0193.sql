-- Source: https://github.com/FationSH/EvolutionChartExporter/blob/f85d3fb8e84f2b57ecfd1279f4c1a08c1f7a9cfa/SCHEMA_EVO_2019/Attendly__maillist/schemata/1449725911.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 7
CREATE TABLE "account" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "first_name" varchar(255) NOT NULL,
    "last_name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "status" enum('active',
'deleted') NOT NULL,
    "create_time" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "email" ("email",
"status")
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

CREATE TABLE "campaign" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "account_id" bigint NOT NULL,
    "subject" varchar(255) NOT NULL,
    "body" TEXT NOT NULL,
    "status" enum('scheduled',
'pending',
'sent',
'deleted',
'failed') NOT NULL,
    "scheduled" bigint NOT NULL,
    "list_ids" varchar(255) NOT NULL,
    "event_ids" varchar(255) NOT NULL,
    "create_time" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "account_id" ("account_id"),
    CONSTRAINT "campaign_ibfk_1" FOREIGN KEY ("account_id") REFERENCES "account" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

CREATE TABLE "list" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "account_id" bigint NOT NULL,
    "name" varchar(255) NOT NULL,
    "status" enum('active',
'deleted') NOT NULL,
    "create_time" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "list_ibfk_1" ("account_id"),
    CONSTRAINT "list_ibfk_1" FOREIGN KEY ("account_id") REFERENCES "account" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

CREATE TABLE "list_subscriber" (
    "list_id" bigint NOT NULL,
    "subscriber_id" bigint NOT NULL,
    "status" enum('active',
'deleted') NOT NULL,
    "create_time" bigint NOT NULL,
    PRIMARY KEY ("list_id",
"subscriber_id"),
    KEY "subscriber_id" ("subscriber_id"),
    CONSTRAINT "list_subscriber_ibfk_1" FOREIGN KEY ("list_id") REFERENCES "list" ("id"),
    CONSTRAINT "list_subscriber_ibfk_2" FOREIGN KEY ("subscriber_id") REFERENCES "subscriber" ("id")
);

CREATE TABLE "message" (
    "subscriber_id" bigint NOT NULL,
    "campaign_id" bigint NOT NULL,
    "status" enum('pending',
'sent') NOT NULL,
    "create_time" bigint NOT NULL,
    PRIMARY KEY ("subscriber_id",
"campaign_id"),
    KEY "campaign_id" ("campaign_id"),
    CONSTRAINT "message_ibfk_1" FOREIGN KEY ("subscriber_id") REFERENCES "subscriber" ("id"),
    CONSTRAINT "message_ibfk_2" FOREIGN KEY ("campaign_id") REFERENCES "campaign" ("id")
);

CREATE TABLE "subscriber" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "account_id" bigint NOT NULL,
    "first_name" varchar(255) NOT NULL,
    "last_name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "status" enum('active',
'deleted',
'unsubscribed') NOT NULL,
    "create_time" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "account_id" ("account_id"),
    CONSTRAINT "subscriber_ibfk_1" FOREIGN KEY ("account_id") REFERENCES "account" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE "variable" (
    "name" varchar(255) NOT NULL,
    "value" varchar(255) NOT NULL,
    PRIMARY KEY ("name")
);
