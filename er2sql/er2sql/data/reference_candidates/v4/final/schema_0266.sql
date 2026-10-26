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
    CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid")
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
    PRIMARY KEY ("permission_id","model_id","model_type")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "model_has_roles" (
    "role_id" bigint unsigned NOT NULL,
    "model_type" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "model_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("role_id","model_id","model_type")
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
    "created_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permissions" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "guard_name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "permissions_name_guard_name_unique" UNIQUE ("name","guard_name")
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
    CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "role_has_permissions" (
    "permission_id" bigint unsigned NOT NULL,
    "role_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("permission_id","role_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "roles" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "guard_name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "roles_name_guard_name_unique" UNIQUE ("name","guard_name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "sessions" (
    "id" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" bigint unsigned DEFAULT NULL,
    "ip_address" varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "user_agent" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "payload" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_activity" int NOT NULL,
    PRIMARY KEY ("id")
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
    CONSTRAINT "tags_name_unique" UNIQUE ("name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "team_invitations" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "team_id" bigint unsigned NOT NULL,
    "email" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "role" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "team_invitations_email_unique" UNIQUE ("email")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "team_user" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "team_id" bigint unsigned NOT NULL,
    "user_id" bigint unsigned NOT NULL,
    "role" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "team_user_team_id_user_id_unique" UNIQUE ("team_id","user_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "teams" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_id" bigint unsigned NOT NULL,
    "name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "personal_team" SMALLINT NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
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
    "user_active" SMALLINT NOT NULL DEFAULT '0',
    "user_roles" varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    "two_factor_secret" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "two_factor_recovery_codes" text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    "remember_token" varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "current_team_id" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "users_name_unique" UNIQUE ("name"),
    CONSTRAINT "users_email_unique" UNIQUE ("email"),
    CONSTRAINT "patientid" UNIQUE ("patientid")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE "model_has_permissions" ADD CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE;
ALTER TABLE "model_has_roles" ADD CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;
ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE;
ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;
ALTER TABLE "team_invitations" ADD CONSTRAINT "team_invitations_team_id_foreign" FOREIGN KEY ("team_id") REFERENCES "teams" ("id") ON DELETE CASCADE;
CREATE INDEX ON "model_has_permissions" ("model_id","model_type");
CREATE INDEX ON "model_has_roles" ("model_id","model_type");
CREATE INDEX ON "password_resets" ("email");
CREATE INDEX ON "personal_access_tokens" ("tokenable_type","tokenable_id");
CREATE INDEX ON "role_has_permissions" ("role_id");
CREATE INDEX ON "sessions" ("user_id");
CREATE INDEX ON "sessions" ("last_activity");
CREATE INDEX ON "team_invitations" ("team_id");
CREATE INDEX ON "teams" ("user_id");
COMMENT ON COLUMN "users"."user_active" IS 'user''s activation status';
COMMENT ON COLUMN "users"."user_roles" IS 'user''s account type (basic, premium, etc)';
