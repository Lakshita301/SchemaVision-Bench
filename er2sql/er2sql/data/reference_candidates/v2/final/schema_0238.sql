-- Source: https://github.com/sudeep-katiar/MySql-Database/blob/f81ccdf57353b608b679b560965ff567632ab3c9/googlekeepfinal.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 5
CREATE TABLE "collaborator" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "note_id" int DEFAULT NULL,
    "collab_email" varchar(200) DEFAULT NULL,
    "is_email_verified" SMALLINT DEFAULT NULL,
    "creator_stamp" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "creator_user" int DEFAULT NULL,
    PRIMARY KEY ("Id"),
    KEY "creator_user" ("creator_user"),
    KEY "note_id" ("note_id"),
    CONSTRAINT "collaborator_ibfk_1" FOREIGN KEY ("creator_user") REFERENCES "user_details" ("Id"),
    CONSTRAINT "collaborator_ibfk_2" FOREIGN KEY ("note_id") REFERENCES "note" ("id")
);

CREATE TABLE "label" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "notes_id" int DEFAULT NULL,
    "label_name" varchar(100) DEFAULT NULL,
    "creator_stamp" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "creator_user" int DEFAULT NULL,
    "edited_stamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("Id"),
    KEY "creator_user" ("creator_user"),
    KEY "notes_id" ("notes_id"),
    CONSTRAINT "label_ibfk_1" FOREIGN KEY ("creator_user") REFERENCES "user_details" ("Id"),
    CONSTRAINT "label_ibfk_2" FOREIGN KEY ("notes_id") REFERENCES "note" ("id")
);

CREATE TABLE "note" (
    "id" int NOT NULL AUTO_INCREMENT,
    "creator_user" int DEFAULT NULL,
    "title" varchar(100) DEFAULT NULL,
    "take_a_note" varchar(4000) DEFAULT NULL,
    "is_pin" SMALLINT DEFAULT NULL,
    "bgcolor" varchar(10) DEFAULT '#ffffff',
    "is_archived" SMALLINT DEFAULT NULL,
    "creator_stamp" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "edited_user_stamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    "is_delete" SMALLINT DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "creator_user" ("creator_user"),
    CONSTRAINT "note_ibfk_1" FOREIGN KEY ("creator_user") REFERENCES "user_details" ("Id")
);

CREATE TABLE "user_details" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(200) NOT NULL,
    "emailId" varchar(200) NOT NULL,
    "is_email_verified" SMALLINT DEFAULT NULL,
    "mobile" bigint NOT NULL,
    "is_mobile_verified" SMALLINT DEFAULT NULL,
    "account_created_datetime" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "last_login_time" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("Id"),
    UNIQUE KEY "emailId" ("emailId"),
    UNIQUE KEY "mobile" ("mobile")
);
