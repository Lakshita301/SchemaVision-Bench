-- Source: https://github.com/zuidianbo/laravel-shop-advanced/blob/3ff702febb50b507a8526cb619117faad6b83e22/2021%E5%B9%B44%E6%9C%8823%E6%97%A5163241%20L05%20%E7%AC%AC%E5%9B%9B%E7%AB%A0%E7%BB%93%E6%9D%9F%20laravel-shop.sql?raw=true
-- Tables detected: 14 | FK/REFERENCES mentions: 1
CREATE TABLE "admin_menu" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "parent_id" int NOT NULL DEFAULT '0',
    "order" int NOT NULL DEFAULT '0',
    "title" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "icon" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "uri" varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "permission" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_operation_log" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "user_id" int NOT NULL,
    "path" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "method" varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    "ip" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "input" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_permissions" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "http_method" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "http_path" text COLLATE utf8mb4_unicode_ci,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "admin_permissions_name_unique" UNIQUE ("name"),
    CONSTRAINT "admin_permissions_slug_unique" UNIQUE ("slug")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_role_menu" (
    "role_id" int NOT NULL,
    "menu_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_role_permissions" (
    "role_id" int NOT NULL,
    "permission_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_role_users" (
    "role_id" int NOT NULL,
    "user_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_roles" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "admin_roles_name_unique" UNIQUE ("name"),
    CONSTRAINT "admin_roles_slug_unique" UNIQUE ("slug")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_user_permissions" (
    "user_id" int NOT NULL,
    "permission_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "admin_users" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "username" varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
    "password" varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "avatar" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "admin_users_username_unique" UNIQUE ("username")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "failed_jobs" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "connection" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "queue" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "payload" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "exception" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "failed_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "migrations" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "migration" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_resets" (
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user_addresses" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_id" bigint unsigned NOT NULL,
    "province" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "city" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "district" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "address" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "zip" int unsigned NOT NULL,
    "contact_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "contact_phone" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_used_at" TIMESTAMP DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "users_email_unique" UNIQUE ("email")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE "user_addresses" ADD CONSTRAINT "user_addresses_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;
CREATE INDEX ON "admin_operation_log" ("user_id");
CREATE INDEX ON "admin_role_menu" ("role_id","menu_id");
CREATE INDEX ON "admin_role_permissions" ("role_id","permission_id");
CREATE INDEX ON "admin_role_users" ("role_id","user_id");
CREATE INDEX ON "admin_user_permissions" ("user_id","permission_id");
CREATE INDEX ON "password_resets" ("email");
CREATE INDEX ON "user_addresses" ("user_id");
