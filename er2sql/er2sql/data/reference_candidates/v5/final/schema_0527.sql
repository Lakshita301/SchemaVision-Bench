-- Source: https://github.com/Cafe-Variome/CafeVariome/blob/890471a9c74bdc825749aa51f866ea60b1740588/Install/MySql/cafevariome.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 10
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "eavs" (
    "id" int NOT NULL,
    "uid" char(36) NOT NULL,
    "source_id" int NOT NULL,
    "fileName" INTEGER UNSIGNED NOT NULL,
    "subject_id" varchar(36) NOT NULL,
    "attribute" varchar(50) NOT NULL,
    "value" varchar(200) DEFAULT NULL,
    "elastic" bit(1) NOT NULL DEFAULT b'0'
);

CREATE TABLE "groups" (
    "id" INTEGER UNSIGNED NOT NULL,
    "name" varchar(20) NOT NULL,
    "description" varchar(100) NOT NULL
);

CREATE TABLE "login_attempts" (
    "id" int UNSIGNED NOT NULL,
    "ip_address" varchar(45) NOT NULL,
    "login" varchar(100) NOT NULL,
    "time" int UNSIGNED DEFAULT NULL
);

CREATE TABLE "menu_items" (
    "id" int NOT NULL,
    "position" int NOT NULL,
    "title" varchar(64) NOT NULL,
    "url" varchar(256) DEFAULT NULL,
    "page_id" int DEFAULT NULL
);

CREATE TABLE "networks" (
    "network_key" int NOT NULL,
    "network_name" TEXT NOT NULL,
    "network_type" varchar(50) NOT NULL
);

CREATE TABLE "network_groups" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(100) NOT NULL,
    "description" varchar(100) NOT NULL,
    "network_key" int NOT NULL,
    "group_type" varchar(50) NOT NULL,
    "url" varchar(256) NOT NULL
);

CREATE TABLE "network_groups_sources" (
    "id" int UNSIGNED NOT NULL,
    "source_id" int UNSIGNED NOT NULL,
    "group_id" int UNSIGNED NOT NULL,
    "installation_key" varchar(32) CHARACTER SET latin1 NOT NULL,
    "network_key" int NOT NULL
);

CREATE TABLE "network_requests" (
    "id" int NOT NULL,
    "network_key" int NOT NULL,
    "installation_key" varchar(100) NOT NULL,
    "url" TEXT NOT NULL,
    "justification" TEXT NOT NULL,
    "email" varchar(50) NOT NULL,
    "ip" TEXT NOT NULL,
    "token" varchar(32) NOT NULL,
    "status" SMALLINT NOT NULL
);

CREATE TABLE "pages" (
    "id" int NOT NULL,
    "Title" varchar(50) NOT NULL,
    "Content" TEXT NOT NULL,
    "Author" int UNSIGNED NOT NULL,
    "Active" bit(1) NOT NULL,
    "Removable" bit(1) NOT NULL
);

CREATE TABLE "pipeline" (
    "id" int NOT NULL,
    "name" varchar(50) NOT NULL,
    "subject_id_location" SMALLINT NOT NULL DEFAULT '0',
    "subject_id_attribute_name" varchar(100) NOT NULL,
    "grouping" SMALLINT NOT NULL DEFAULT '0',
    "group_columns" varchar(200) DEFAULT NULL,
    "dateformat" SMALLINT DEFAULT NULL,
    "hpo_attribute_name" varchar(100) DEFAULT NULL,
    "negated_hpo_attribute_name" varchar(100) DEFAULT NULL,
    "orpha_attribute_name" varchar(100) DEFAULT NULL,
    "internal_delimiter" char(1) DEFAULT NULL
);

CREATE TABLE "settings" (
    "setting_id" int NOT NULL,
    "setting_key" varchar(50) NOT NULL,
    "value" varchar(100) NOT NULL,
    "setting_name" varchar(50) DEFAULT NULL,
    "info" TEXT NOT NULL,
    "setting_group" varchar(50) DEFAULT NULL,
    "validation_rules" varchar(100) NOT NULL DEFAULT 'required|xss_clean'
);

CREATE TABLE "sources" (
    "source_id" int UNSIGNED NOT NULL,
    "owner_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" varchar(30) NOT NULL,
    "uri" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "long_description" TEXT NOT NULL,
    "status" varchar(15) NOT NULL,
    "date_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "username" varchar(100) NOT NULL,
    "password" varchar(100) NOT NULL,
    "record_count" bigint NOT NULL DEFAULT '0',
    "elastic_status" SMALLINT DEFAULT '0',
    "elastic_lock" SMALLINT DEFAULT '0'
);

CREATE TABLE "uploaddatastatus" (
    "FileName" varchar(100) NOT NULL,
    "uploadStart" TIMESTAMP NOT NULL,
    "uploadEnd" TIMESTAMP DEFAULT NULL,
    "Status" varchar(20) NOT NULL,
    "elasticStatus" varchar(20) NOT NULL,
    "source_id" int NOT NULL,
    "user_id" int UNSIGNED NOT NULL,
    "ID" int UNSIGNED NOT NULL,
    "patient" varchar(50) DEFAULT NULL,
    "tissue" varchar(50) DEFAULT NULL,
    "pipeline_id" int DEFAULT NULL,
    "setting_file" varchar(50) DEFAULT NULL
);

CREATE TABLE "upload_error" (
    "ID" INTEGER UNSIGNED NOT NULL,
    "error_id" INTEGER UNSIGNED NOT NULL,
    "message" varchar(500) NOT NULL,
    "error_code" int NOT NULL,
    "source_id" int NOT NULL
);

CREATE TABLE "upload_jobs" (
    "ID" int NOT NULL,
    "source_id" int NOT NULL,
    "user_id" INTEGER UNSIGNED NOT NULL,
    "linking_id" varchar(50) NOT NULL
);

CREATE TABLE "users" (
    "id" int UNSIGNED NOT NULL,
    "ip_address" varchar(45) NOT NULL,
    "username" varchar(100) DEFAULT NULL,
    "password" varchar(255) NOT NULL,
    "email" varchar(254) NOT NULL,
    "activation_selector" varchar(255) DEFAULT NULL,
    "activation_code" varchar(255) DEFAULT NULL,
    "forgotten_password_selector" varchar(255) DEFAULT NULL,
    "forgotten_password_code" varchar(255) DEFAULT NULL,
    "forgotten_password_time" int UNSIGNED DEFAULT NULL,
    "remember_selector" varchar(255) DEFAULT NULL,
    "remember_code" varchar(255) DEFAULT NULL,
    "created_on" int UNSIGNED NOT NULL,
    "last_login" int UNSIGNED DEFAULT NULL,
    "active" SMALLINT UNSIGNED DEFAULT NULL,
    "first_name" varchar(50) DEFAULT NULL,
    "last_name" varchar(50) DEFAULT NULL,
    "company" varchar(100) DEFAULT NULL,
    "phone" varchar(20) DEFAULT NULL,
    "is_admin" SMALLINT NOT NULL DEFAULT '0',
    "token" varchar(50) DEFAULT NULL,
    "remote" SMALLINT UNSIGNED NOT NULL DEFAULT '0'
);

CREATE TABLE "users_groups" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int UNSIGNED NOT NULL,
    "group_id" INTEGER UNSIGNED NOT NULL
);

CREATE TABLE "users_groups_networks" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int UNSIGNED NOT NULL,
    "group_id" int UNSIGNED NOT NULL,
    "installation_key" varchar(100) NOT NULL,
    "network_key" int NOT NULL
);


                           

ALTER TABLE "menu_items"
  ADD CONSTRAINT "Page_FK" FOREIGN KEY ("page_id") REFERENCES "pages" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "network_groups_sources"
  ADD CONSTRAINT "NetworkGroupIDFK" FOREIGN KEY ("group_id") REFERENCES "network_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "SourceIDFK" FOREIGN KEY ("source_id") REFERENCES "sources" ("source_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "network_requests"
  ADD CONSTRAINT "NetworkRequest_NetworkKey_FK" FOREIGN KEY ("network_key") REFERENCES "networks" ("network_key") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "pages"
  ADD CONSTRAINT "Author_FK" FOREIGN KEY ("Author") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "uploaddatastatus"
  ADD CONSTRAINT "Pipeline_Id_FK" FOREIGN KEY ("pipeline_id") REFERENCES "pipeline" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "users_groups"
  ADD CONSTRAINT "fk_users_groups_groups1" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_users_groups_users1" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE "users_groups_networks"
  ADD CONSTRAINT "GroupIDFK" FOREIGN KEY ("group_id") REFERENCES "network_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "UserFK" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
