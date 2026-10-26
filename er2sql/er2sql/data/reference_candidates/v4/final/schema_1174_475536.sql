-- Source: https://github.com/AdityaJ97/event_calendar/blob/781d960232335c4b6d43cfa4e61892a866c7844e/Schema/event_calendar.sql?raw=true
-- Tables detected: 7 | FK constraints: 4
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "mrbs_area" (
    "id" int NOT NULL,
    "disabled" SMALLINT NOT NULL DEFAULT '0',
    "area_name" varchar(30) DEFAULT NULL,
    "sort_key" varchar(30) NOT NULL DEFAULT '',
    "timezone" varchar(50) DEFAULT NULL,
    "area_admin_email" text,
    "resolution" int DEFAULT NULL,
    "default_duration" int DEFAULT NULL,
    "default_duration_all_day" SMALLINT NOT NULL DEFAULT '0',
    "morningstarts" int DEFAULT NULL,
    "morningstarts_minutes" int DEFAULT NULL,
    "eveningends" int DEFAULT NULL,
    "eveningends_minutes" int DEFAULT NULL,
    "private_enabled" SMALLINT DEFAULT NULL,
    "private_default" SMALLINT DEFAULT NULL,
    "private_mandatory" SMALLINT DEFAULT NULL,
    "private_override" varchar(32) DEFAULT NULL,
    "min_create_ahead_enabled" SMALLINT DEFAULT NULL,
    "min_create_ahead_secs" int DEFAULT NULL,
    "max_create_ahead_enabled" SMALLINT DEFAULT NULL,
    "max_create_ahead_secs" int DEFAULT NULL,
    "min_delete_ahead_enabled" SMALLINT DEFAULT NULL,
    "min_delete_ahead_secs" int DEFAULT NULL,
    "max_delete_ahead_enabled" SMALLINT DEFAULT NULL,
    "max_delete_ahead_secs" int DEFAULT NULL,
    "max_per_day_enabled" SMALLINT NOT NULL DEFAULT '0',
    "max_per_day" int NOT NULL DEFAULT '0',
    "max_per_week_enabled" SMALLINT NOT NULL DEFAULT '0',
    "max_per_week" int NOT NULL DEFAULT '0',
    "max_per_month_enabled" SMALLINT NOT NULL DEFAULT '0',
    "max_per_month" int NOT NULL DEFAULT '0',
    "max_per_year_enabled" SMALLINT NOT NULL DEFAULT '0',
    "max_per_year" int NOT NULL DEFAULT '0',
    "max_per_future_enabled" SMALLINT NOT NULL DEFAULT '0',
    "max_per_future" int NOT NULL DEFAULT '0',
    "max_duration_enabled" SMALLINT NOT NULL DEFAULT '0',
    "max_duration_secs" int NOT NULL DEFAULT '0',
    "max_duration_periods" int NOT NULL DEFAULT '0',
    "custom_html" text,
    "approval_enabled" SMALLINT DEFAULT NULL,
    "reminders_enabled" SMALLINT DEFAULT NULL,
    "enable_periods" SMALLINT DEFAULT NULL,
    "confirmation_enabled" SMALLINT DEFAULT NULL,
    "confirmed_default" SMALLINT DEFAULT NULL
);

CREATE TABLE "mrbs_entry" (
    "id" int NOT NULL,
    "start_time" int NOT NULL DEFAULT '0',
    "end_time" int NOT NULL DEFAULT '0',
    "entry_type" int NOT NULL DEFAULT '0',
    "repeat_id" int DEFAULT NULL,
    "room_id" int NOT NULL DEFAULT '1',
    "timestamp" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "create_by" varchar(80) NOT NULL DEFAULT '',
    "modified_by" varchar(80) NOT NULL DEFAULT '',
    "name" varchar(80) NOT NULL DEFAULT '',
    "type" char(1) NOT NULL DEFAULT 'E',
    "description" text,
    "speakers" TEXT,
    "status" SMALLINT UNSIGNED NOT NULL DEFAULT '0',
    "reminded" int DEFAULT NULL,
    "info_time" int DEFAULT NULL,
    "info_user" varchar(80) DEFAULT NULL,
    "info_text" text,
    "ical_uid" varchar(255) NOT NULL DEFAULT '',
    "ical_sequence" smallint NOT NULL DEFAULT '0',
    "ical_recur_id" varchar(16) DEFAULT NULL,
    "students_attended" int DEFAULT NULL,
    "event_report" text,
    "image_path" varchar(200) DEFAULT NULL,
    "club_name" varchar(64) DEFAULT NULL,
    "club_secretary" varchar(64) DEFAULT NULL,
    "secretary_contact" bigint DEFAULT NULL,
    "secretary_email" varchar(50) DEFAULT NULL,
    "contact_details" bigint DEFAULT NULL,
    "user_email" varchar(50) DEFAULT NULL,
    "facad_contact" bigint DEFAULT NULL,
    "approved_facad" smallint DEFAULT NULL
);

CREATE TABLE "mrbs_repeat" (
    "id" int NOT NULL,
    "start_time" int NOT NULL DEFAULT '0',
    "end_time" int NOT NULL DEFAULT '0',
    "rep_type" int NOT NULL DEFAULT '0',
    "end_date" int NOT NULL DEFAULT '0',
    "rep_opt" varchar(32) NOT NULL DEFAULT '',
    "room_id" int NOT NULL DEFAULT '1',
    "timestamp" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "create_by" varchar(80) NOT NULL DEFAULT '',
    "modified_by" varchar(80) NOT NULL DEFAULT '',
    "name" varchar(80) NOT NULL DEFAULT '',
    "type" char(1) NOT NULL DEFAULT 'E',
    "description" text,
    "speakers" TEXT,
    "rep_num_weeks" smallint DEFAULT NULL,
    "month_absolute" smallint DEFAULT NULL,
    "month_relative" varchar(4) DEFAULT NULL,
    "status" SMALLINT UNSIGNED NOT NULL DEFAULT '0',
    "reminded" int DEFAULT NULL,
    "info_time" int DEFAULT NULL,
    "info_user" varchar(80) DEFAULT NULL,
    "info_text" text,
    "ical_uid" varchar(255) NOT NULL DEFAULT '',
    "ical_sequence" smallint NOT NULL DEFAULT '0',
    "students_attended" int DEFAULT NULL,
    "event_report" text,
    "image_path" varchar(200) DEFAULT NULL,
    "club_name" varchar(64) DEFAULT NULL,
    "club_secretary" varchar(64) DEFAULT NULL,
    "secretary_contact" bigint DEFAULT NULL,
    "secretary_email" varchar(50) DEFAULT NULL,
    "contact_details" bigint DEFAULT NULL,
    "user_email" varchar(50) DEFAULT NULL,
    "facad_contact" bigint DEFAULT NULL,
    "approved_facad" smallint DEFAULT NULL
);

CREATE TABLE "mrbs_room" (
    "id" int NOT NULL,
    "disabled" SMALLINT NOT NULL DEFAULT '0',
    "area_id" int NOT NULL DEFAULT '0',
    "room_name" varchar(25) NOT NULL DEFAULT '',
    "sort_key" varchar(25) NOT NULL DEFAULT '',
    "description" varchar(60) DEFAULT NULL,
    "capacity" int NOT NULL DEFAULT '0',
    "room_admin_email" text,
    "custom_html" text
);

CREATE TABLE "mrbs_users" (
    "id" int NOT NULL,
    "level" smallint NOT NULL DEFAULT '0',
    "name" varchar(30) DEFAULT NULL,
    "password_hash" varchar(255) DEFAULT NULL,
    "email" varchar(75) DEFAULT NULL
);

CREATE TABLE "mrbs_variables" (
    "id" int NOT NULL,
    "variable_name" varchar(80) DEFAULT NULL,
    "variable_content" text
);

CREATE TABLE "mrbs_zoneinfo" (
    "id" int NOT NULL,
    "timezone" varchar(255) NOT NULL DEFAULT '',
    "outlook_compatible" SMALLINT UNSIGNED NOT NULL DEFAULT '0',
    "vtimezone" text,
    "last_updated" int NOT NULL DEFAULT '0'
);


                           

ALTER TABLE "mrbs_entry"
  ADD CONSTRAINT "mrbs_entry_ibfk_1" FOREIGN KEY ("room_id") REFERENCES "mrbs_room" ("id") ON UPDATE CASCADE,
  ADD CONSTRAINT "mrbs_entry_ibfk_2" FOREIGN KEY ("repeat_id") REFERENCES "mrbs_repeat" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "mrbs_repeat"
  ADD CONSTRAINT "mrbs_repeat_ibfk_1" FOREIGN KEY ("room_id") REFERENCES "mrbs_room" ("id") ON UPDATE CASCADE;

ALTER TABLE "mrbs_room"
  ADD CONSTRAINT "mrbs_room_ibfk_1" FOREIGN KEY ("area_id") REFERENCES "mrbs_area" ("id") ON UPDATE CASCADE;
