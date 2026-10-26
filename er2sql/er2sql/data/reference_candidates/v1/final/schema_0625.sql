-- Source: https://github.com/am1n7/setram/blob/ff6468b5949aa0acc36f9628d3a32ac0860d166a/ticket.sql?raw=true
-- Tables detected: 20 | FK/REFERENCES mentions: 10
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "categories" (
    "id" int UNSIGNED NOT NULL,
    "parent_id" int UNSIGNED DEFAULT NULL,
    "order" int NOT NULL DEFAULT 1,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "data_rows" (
    "id" int UNSIGNED NOT NULL,
    "data_type_id" int UNSIGNED NOT NULL,
    "field" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "required" SMALLINT NOT NULL DEFAULT 0,
    "browse" SMALLINT NOT NULL DEFAULT 1,
    "read" SMALLINT NOT NULL DEFAULT 1,
    "edit" SMALLINT NOT NULL DEFAULT 1,
    "add" SMALLINT NOT NULL DEFAULT 1,
    "delete" SMALLINT NOT NULL DEFAULT 1,
    "details" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "order" int NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "data_types" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name_singular" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name_plural" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "icon" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "model_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "policy_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "controller" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "description" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "generate_permissions" SMALLINT NOT NULL DEFAULT 0,
    "server_side" SMALLINT NOT NULL DEFAULT 0,
    "details" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "failed_jobs" (
    "id" bigint UNSIGNED NOT NULL,
    "connection" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "queue" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "payload" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "exception" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "failed_at" timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "menus" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "menu_items" (
    "id" int UNSIGNED NOT NULL,
    "menu_id" int UNSIGNED DEFAULT NULL,
    "title" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "url" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "target" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
    "icon_class" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "color" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "parent_id" int DEFAULT NULL,
    "order" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "route" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "parameters" text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "migrations" (
    "id" int UNSIGNED NOT NULL,
    "migration" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "orders" (
    "id" bigint UNSIGNED NOT NULL,
    "ticket_id" bigint UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "quantity" int NOT NULL,
    "payment" enum('pending','success','error') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
    "paypal_token" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "total" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "invoice" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "duration" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "pages" (
    "id" int UNSIGNED NOT NULL,
    "author_id" int NOT NULL,
    "title" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "excerpt" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "body" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "image" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "slug" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "meta_description" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_keywords" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "status" enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_resets" (
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permissions" (
    "id" bigint UNSIGNED NOT NULL,
    "key" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "table_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permission_role" (
    "permission_id" bigint UNSIGNED NOT NULL,
    "role_id" bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "plans" (
    "id" bigint UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "price" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "duration" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "posts" (
    "id" int UNSIGNED NOT NULL,
    "author_id" int NOT NULL,
    "category_id" int DEFAULT NULL,
    "title" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "seo_title" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "excerpt" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "body" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "image" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "slug" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "meta_description" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_keywords" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "status" enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
    "featured" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "roles" (
    "id" bigint UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "settings" (
    "id" int UNSIGNED NOT NULL,
    "key" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "details" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "type" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "order" int NOT NULL DEFAULT 1,
    "group" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "tickets" (
    "id" bigint UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "price" DOUBLE PRECISION(8,2) NOT NULL,
    "description" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "stock" int DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "translations" (
    "id" int UNSIGNED NOT NULL,
    "table_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "column_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "foreign_key" int UNSIGNED NOT NULL,
    "locale" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" bigint UNSIGNED NOT NULL,
    "role_id" bigint UNSIGNED DEFAULT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "avatar" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "settings" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "plan_id" bigint UNSIGNED DEFAULT NULL,
    "subscription" date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user_roles" (
    "user_id" bigint UNSIGNED NOT NULL,
    "role_id" bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                           

ALTER TABLE "categories"
  ADD CONSTRAINT "categories_parent_id_foreign" FOREIGN KEY ("parent_id") REFERENCES "categories" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "data_rows"
  ADD CONSTRAINT "data_rows_data_type_id_foreign" FOREIGN KEY ("data_type_id") REFERENCES "data_types" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "menu_items"
  ADD CONSTRAINT "menu_items_menu_id_foreign" FOREIGN KEY ("menu_id") REFERENCES "menus" ("id") ON DELETE CASCADE;

ALTER TABLE "orders"
  ADD CONSTRAINT "orders_ticket_id_foreign" FOREIGN KEY ("ticket_id") REFERENCES "tickets" ("id") ON DELETE CASCADE;

ALTER TABLE "permission_role"
  ADD CONSTRAINT "permission_role_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "permission_role_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "users"
  ADD CONSTRAINT "users_plan_id_foreign" FOREIGN KEY ("plan_id") REFERENCES "plans" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "users_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "user_roles"
  ADD CONSTRAINT "user_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "user_roles_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;
