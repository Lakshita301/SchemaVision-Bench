-- Source: https://github.com/mingliee/asgn_usmers/blob/b25bafc6dfdd9e807a441bbff1ec5d5cf1510cbc/sql/usmers.sql?raw=true
-- Tables detected: 25 | FK/REFERENCES mentions: 11
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "abbr" (
    "ABBR_ID" int NOT NULL,
    "ABBR_VALUE" varchar(11) NOT NULL,
    "ABBR_NAME" varchar(30) NOT NULL
);

CREATE TABLE "admin" (
    "ADMIN_ID" varchar(20) NOT NULL,
    "USER_EMAIL" varchar(255) NOT NULL,
    "ADDED_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "ads_accom" (
    "ADS_ID" varchar(20) NOT NULL,
    "ADS_STATUS" varchar(50) NOT NULL,
    "ADS_TITLE" text NOT NULL,
    "ADS_CAT" varchar(50) NOT NULL,
    "ADS_PRICE" decimal(9,2) NOT NULL,
    "ADS_DESCP" text NOT NULL,
    "ADS_LOC" varchar(50) NOT NULL,
    "ADS_AREA" varchar(50) DEFAULT NULL,
    "ADS_PUBLISH_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "ADS_LATEST_UPDATE_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "USER_ID" int NOT NULL,
    "ACCM_TENET_PREF" varchar(11) NOT NULL,
    "PRIVATE_STATUS" varchar(11) DEFAULT NULL,
    "ADMIN_UPDATE_DATE" timestamp NULL DEFAULT NULL
);

CREATE TABLE "ads_item" (
    "ADS_ID" varchar(20) NOT NULL,
    "ADS_STATUS" varchar(50) DEFAULT NULL,
    "ADS_TITLE" text NOT NULL,
    "ADS_CAT" varchar(50) NOT NULL,
    "ADS_PRICE" decimal(9,2) NOT NULL,
    "ADS_DESCP" text NOT NULL,
    "ADS_LOC" varchar(50) NOT NULL,
    "ADS_AREA" varchar(50) DEFAULT NULL,
    "ADS_PUBLISH_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ADS_LATEST_UPDATE_DATE" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    "USER_ID" int NOT NULL,
    "ITEM_CONDITION" varchar(11) DEFAULT NULL,
    "ITEM_DEAL_METHOD" varchar(11) DEFAULT NULL,
    "PRIVATE_STATUS" varchar(11) DEFAULT NULL,
    "ADMIN_UPDATE_DATE" timestamp NULL DEFAULT NULL
);

CREATE TABLE "ads_job" (
    "ADS_ID" varchar(20) NOT NULL,
    "ADS_STATUS" varchar(50) NOT NULL,
    "ADS_TITLE" text NOT NULL,
    "ADS_CAT" varchar(50) NOT NULL,
    "ADS_PRICE" decimal(9,2) NOT NULL,
    "ADS_DESCP" text NOT NULL,
    "ADS_LOC" varchar(50) NOT NULL,
    "ADS_AREA" varchar(50) NOT NULL,
    "ADS_PUBLISH_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ADS_LATEST_UPDATE_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "USER_ID" int NOT NULL,
    "JOB_CONTRACT_TYPE" varchar(11) DEFAULT NULL,
    "JOB_SALARY_TYPE" varchar(11) DEFAULT NULL,
    "PRIVATE_STATUS" varchar(11) DEFAULT NULL,
    "ADMIN_UPDATE_DATE" timestamp NULL DEFAULT NULL
);

CREATE TABLE "ads_management" (
    "ID" int NOT NULL,
    "ADS_ID" varchar(20) DEFAULT NULL,
    "ACTION" varchar(11) DEFAULT NULL,
    "DESCP" varchar(255) DEFAULT NULL,
    "TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "PIC" int DEFAULT NULL
);

CREATE TABLE "ads_status" (
    "STATUS_ID" int NOT NULL,
    "STATUS_VALUE" varchar(50) NOT NULL,
    "STATUS_NAME" varchar(50) NOT NULL
);

CREATE TABLE "avatar" (
    "AVATAR_ID" varchar(20) NOT NULL,
    "AVATAR_NAME" varchar(255) NOT NULL,
    "AVATAR_FILE" BYTEA NOT NULL
);

CREATE TABLE "category" (
    "CAT_ID" int NOT NULL,
    "CAT_VALUE" varchar(50) NOT NULL,
    "CAT_NAME" varchar(255) NOT NULL
);

CREATE TABLE "deleted_ads" (
    "DELETED_ADS_ID" varchar(20) NOT NULL,
    "ADS_ID" varchar(20) NOT NULL,
    "ADS_STATUS" varchar(50) NOT NULL,
    "ADS_TITLE" text NOT NULL,
    "ADS_CAT" varchar(50) NOT NULL,
    "ADS_PRICE" decimal(9,2) NOT NULL,
    "ADS_DESCP" text NOT NULL,
    "ADS_LOC" varchar(50) NOT NULL,
    "ADS_AREA" varchar(50) NOT NULL,
    "ADS_PUBLISH_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "ADS_LATEST_UPDATE_DATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    "USER_ID" int NOT NULL,
    "SUB_INFO_1" varchar(11) NOT NULL,
    "SUB_INFO_2" varchar(11) NOT NULL,
    "PRIVATE_STATUS" varchar(11) NOT NULL,
    "DELETED_DATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

CREATE TABLE "deleted_image" (
    "DELETED_IMAGE_ID" varchar(20) NOT NULL,
    "IMAGE_ID" varchar(20) NOT NULL,
    "IMAGE_NAME" varchar(255) NOT NULL,
    "IMAGE_FILE" BYTEA NOT NULL,
    "ADS_ID" varchar(20) NOT NULL,
    "IMAGE_STATUS" varchar(50) NOT NULL
);

CREATE TABLE "favourite" (
    "USER_ID" int NOT NULL,
    "ADS_ID" varchar(20) NOT NULL,
    "FAV_ADDED_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "image_accom" (
    "IMAGE_ID" varchar(20) NOT NULL,
    "IMAGE_NAME" varchar(255) DEFAULT NULL,
    "IMAGE_FILE" BYTEA,
    "ADS_ID" varchar(20) NOT NULL,
    "IMAGE_STATUS" varchar(50) NOT NULL
);

CREATE TABLE "image_item" (
    "IMAGE_ID" varchar(20) NOT NULL,
    "IMAGE_NAME" varchar(255) DEFAULT NULL,
    "IMAGE_FILE" BYTEA,
    "IMAGE_LABEL" varchar(255) DEFAULT NULL,
    "IMAGE_OCR" varchar(500) DEFAULT NULL,
    "ADS_ID" varchar(20) NOT NULL,
    "IMAGE_STATUS" varchar(50) NOT NULL
);

CREATE TABLE "image_job" (
    "IMAGE_ID" varchar(20) NOT NULL,
    "IMAGE_NAME" varchar(255) DEFAULT NULL,
    "IMAGE_FILE" BYTEA,
    "ADS_ID" varchar(20) NOT NULL,
    "IMAGE_STATUS" varchar(50) DEFAULT NULL
);

CREATE TABLE "location" (
    "LOC_ID" int NOT NULL,
    "LOC_VALUE" varchar(50) NOT NULL,
    "LOC_NAME" varchar(255) NOT NULL,
    "LAT" decimal(10,8) DEFAULT NULL,
    "LNG" decimal(11,8) DEFAULT NULL
);

CREATE TABLE "message" (
    "MSG_ID" int NOT NULL,
    "SENDER_ID" int NOT NULL,
    "RECEIVER_ID" int NOT NULL,
    "CONTENT" text NOT NULL,
    "TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "STATUS" int NOT NULL
);

CREATE TABLE "report" (
    "REPORT_ID" varchar(20) NOT NULL,
    "REPORT_TYPE" varchar(10) DEFAULT NULL,
    "REPORTED_BY_USER_ID" int NOT NULL,
    "REASON" varchar(255) NOT NULL,
    "REPORT_DESCP" text,
    "REPORT_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "STATUS" varchar(20) DEFAULT NULL,
    "COMMENT" varchar(255) DEFAULT NULL,
    "UPDATE_DATE" timestamp NULL DEFAULT NULL
);

CREATE TABLE "report_ads" (
    "REPORT_ID" varchar(20) NOT NULL,
    "ADS_ID" varchar(20) NOT NULL
);

CREATE TABLE "report_reason" (
    "REASON_ID" int NOT NULL,
    "REASON_VALUE" varchar(20) DEFAULT NULL,
    "REASON_NAME" varchar(255) DEFAULT NULL
);

CREATE TABLE "school" (
    "SCHOOL_ID" varchar(20) NOT NULL,
    "SCHOOL_VALUE" varchar(20) NOT NULL,
    "SCHOOL_NAME" varchar(50) NOT NULL
);

CREATE TABLE "support" (
    "SUPPORT_ID" varchar(20) NOT NULL,
    "USER_ID" int DEFAULT NULL,
    "SUPPORT_SUBJECT" varchar(255) NOT NULL,
    "SUPPORT_DESCP" text,
    "SUPPORT_DATE" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    "STATUS" varchar(20) DEFAULT NULL,
    "COMMENT" varchar(255) DEFAULT NULL,
    "UPDATE_DATE" timestamp NULL DEFAULT NULL
);

CREATE TABLE "ticket_status" (
    "STATUS_ID" int NOT NULL,
    "STATUS_VALUE" varchar(20) DEFAULT NULL,
    "STATUS_NAME" varchar(20) DEFAULT NULL
);

CREATE TABLE "user" (
    "USER_ID" int NOT NULL,
    "USER_EMAIL" varchar(255) NOT NULL,
    "USER_PSWD" varchar(200) NOT NULL,
    "USER_NAME" varchar(255) NOT NULL,
    "WHATSAPP" text,
    "USER_GENDER" varchar(200) DEFAULT NULL,
    "SCHOOL" varchar(10) DEFAULT NULL,
    "ADDRESS" varchar(50) DEFAULT NULL,
    "AREA" varchar(50) DEFAULT NULL,
    "AVATAR_ID" varchar(20) NOT NULL,
    "USER_STATUS" varchar(1) NOT NULL DEFAULT 'P',
    "CREATE_AT" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "TOKEN" varchar(255) DEFAULT NULL,
    "ADMIN_UPDATE_DATE" date DEFAULT NULL
);

CREATE TABLE "user_management" (
    "ID" int NOT NULL,
    "USER_ID" int DEFAULT NULL,
    "ACTION" varchar(11) DEFAULT NULL,
    "DESCP" varchar(255) DEFAULT NULL,
    "TIME" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    "PIC" int DEFAULT NULL
);


                           

ALTER TABLE "ads_accom"
  ADD CONSTRAINT "FK_ACCOM_USER_ID" FOREIGN KEY ("USER_ID") REFERENCES "user" ("USER_ID");

ALTER TABLE "ads_item"
  ADD CONSTRAINT "ads_item_ibfk_1" FOREIGN KEY ("USER_ID") REFERENCES "user" ("USER_ID");

ALTER TABLE "ads_job"
  ADD CONSTRAINT "FK_JOB_USER_ID" FOREIGN KEY ("USER_ID") REFERENCES "user" ("USER_ID");

ALTER TABLE "favourite"
  ADD CONSTRAINT "FK_user_id" FOREIGN KEY ("USER_ID") REFERENCES "user" ("USER_ID");

ALTER TABLE "image_accom"
  ADD CONSTRAINT "FK_ADS_ID" FOREIGN KEY ("ADS_ID") REFERENCES "ads_accom" ("ADS_ID");

ALTER TABLE "image_item"
  ADD CONSTRAINT "fk_image_item" FOREIGN KEY ("ADS_ID") REFERENCES "ads_item" ("ADS_ID");

ALTER TABLE "image_job"
  ADD CONSTRAINT "fk_image_id" FOREIGN KEY ("ADS_ID") REFERENCES "ads_job" ("ADS_ID"),
  ADD CONSTRAINT "fk_image_job_id" FOREIGN KEY ("ADS_ID") REFERENCES "ads_job" ("ADS_ID");

ALTER TABLE "report_ads"
  ADD CONSTRAINT "FK_Report_ID" FOREIGN KEY ("REPORT_ID") REFERENCES "report" ("REPORT_ID"),
  ADD CONSTRAINT "report_ads_ibfk_1" FOREIGN KEY ("REPORT_ID") REFERENCES "report" ("REPORT_ID"),
  ADD CONSTRAINT "report_ads_ibfk_2" FOREIGN KEY ("REPORT_ID") REFERENCES "report" ("REPORT_ID");
