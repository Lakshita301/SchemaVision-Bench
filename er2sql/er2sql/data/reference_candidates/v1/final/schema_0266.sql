-- Source: https://github.com/sscotti/PACS_Integration/blob/83cebe6c3a507877ceca7864f3b230bc8902bca0/mysql_init/laravel.sql?raw=true
-- Tables detected: 17 | FK/REFERENCES mentions: 5
CREATE TABLE "failed_jobs" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "uuid" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "connection" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "queue" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "payload" TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "exception" TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "failed_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    UNIQUE KEY "failed_jobs_uuid_unique" ("uuid")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "migrations" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "migration" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "model_has_permissions" (
    "permission_id" bigint unsigned NOT NULL,
    "model_type" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "model_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("permission_id","model_id","model_type"),
    KEY "model_has_permissions_model_id_model_type_index" ("model_id","model_type"),
    CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "model_has_roles" (
    "role_id" bigint unsigned NOT NULL,
    "model_type" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "model_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("role_id","model_id","model_type"),
    KEY "model_has_roles_model_id_model_type_index" ("model_id","model_type"),
    CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "orthanc_hosts" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "AET" varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "nginx_admin_url" varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "api_url" varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "proxy_url" varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "osimis_viewer_link" varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "server_check" varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "server_name" varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "osimis_viewer_name" varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "domain" varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "comment" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_resets" (
    "email" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    KEY "password_resets_email_index" ("email")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permissions" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "guard_name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "permissions_name_guard_name_unique" ("name","guard_name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "personal_access_tokens" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "tokenable_type" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "tokenable_id" bigint unsigned NOT NULL,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "abilities" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "last_used_at" timestamp NULL DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "personal_access_tokens_token_unique" ("token"),
    KEY "personal_access_tokens_tokenable_type_tokenable_id_index" ("tokenable_type","tokenable_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "role_has_permissions" (
    "permission_id" bigint unsigned NOT NULL,
    "role_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("permission_id","role_id"),
    KEY "role_has_permissions_role_id_foreign" ("role_id"),
    CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE,
    CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "roles" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "guard_name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "roles_name_guard_name_unique" ("name","guard_name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "sessions" (
    "id" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" bigint unsigned DEFAULT NULL,
    "ip_address" varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "user_agent" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "payload" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_activity" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "sessions_user_id_index" ("user_id"),
    KEY "sessions_last_activity_index" ("last_activity")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "shared_studies" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "shared_by" char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "shared_with" char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "share_note" varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "uuid" varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "server" json DEFAULT NULL,
    "study_json" json DEFAULT NULL,
    "created_at" TIMESTAMP DEFAULT NULL,
    "updated_at" TIMESTAMP DEFAULT NULL,
    "patient_name" varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "study_description" varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "study_date" varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "tags" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "tags_name_unique" ("name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "team_invitations" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "team_id" bigint unsigned NOT NULL,
    "email" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "role" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "team_invitations_email_unique" ("email"),
    KEY "team_invitations_team_id_foreign" ("team_id"),
    CONSTRAINT "team_invitations_team_id_foreign" FOREIGN KEY ("team_id") REFERENCES "teams" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "team_user" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "team_id" bigint unsigned NOT NULL,
    "user_id" bigint unsigned NOT NULL,
    "role" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "team_user_team_id_user_id_unique" ("team_id","user_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "teams" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_id" bigint unsigned NOT NULL,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "personal_team" SMALLINT NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "teams_user_id_index" ("user_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "profile_photo_path" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "fname" varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "lname" varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "mname" varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "email" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "dob" date DEFAULT NULL,
    "patientid" varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "doctor_id" varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "reader_id" varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "user_active" SMALLINT NOT NULL DEFAULT '0' COMMENT 'user''s activation status',
    "user_roles" varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]' COMMENT 'user''s account type (basic, premium, etc)',
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "two_factor_secret" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "two_factor_recovery_codes" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "remember_token" varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "current_team_id" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "users_name_unique" ("name"),
    UNIQUE KEY "users_email_unique" ("email"),
    UNIQUE KEY "patientid" ("patientid")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
