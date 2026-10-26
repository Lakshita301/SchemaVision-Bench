-- Source: https://github.com/sunilcmd/mini-CRM/blob/d4fc4fa700651501103e0c30936bc85b2a74dfe6/mini_crm.sql?raw=true
-- Tables detected: 6 | FK constraints: 1
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "companies" (
    "id" bigint UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "logo" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "website" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "employes" (
    "id" bigint UNSIGNED NOT NULL,
    "company_id" bigint UNSIGNED NOT NULL,
    "first_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "phone" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "failed_jobs" (
    "id" bigint UNSIGNED NOT NULL,
    "uuid" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "connection" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "queue" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "payload" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "exception" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "failed_at" timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "migrations" (
    "id" int UNSIGNED NOT NULL,
    "migration" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_resets" (
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" bigint UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                          

ALTER TABLE "employes"
  ADD CONSTRAINT "employes_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "companies" ("id");
