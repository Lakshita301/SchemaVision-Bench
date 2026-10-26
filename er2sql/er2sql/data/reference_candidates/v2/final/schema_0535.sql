-- Source: https://github.com/AAJoelle/designproject/blob/1bb3ea62352ca3967762944721cbec56d1c2ddc5/eduplus%20(1).sql?raw=true
-- Tables detected: 21 | FK/REFERENCES mentions: 10
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "categories" (
    "id" int UNSIGNED NOT NULL,
    "parent_id" int UNSIGNED DEFAULT NULL,
    "order" int NOT NULL DEFAULT '1',
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "courses" (
    "id" int UNSIGNED NOT NULL,
    "course_code" varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
    "course_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "level_id" int UNSIGNED NOT NULL,
    "faculty_id" int UNSIGNED NOT NULL,
    "department_id" int UNSIGNED DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "data_rows" (
    "id" int UNSIGNED NOT NULL,
    "data_type_id" int UNSIGNED NOT NULL,
    "field" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "required" SMALLINT NOT NULL DEFAULT '0',
    "browse" SMALLINT NOT NULL DEFAULT '1',
    "read" SMALLINT NOT NULL DEFAULT '1',
    "edit" SMALLINT NOT NULL DEFAULT '1',
    "add" SMALLINT NOT NULL DEFAULT '1',
    "delete" SMALLINT NOT NULL DEFAULT '1',
    "details" text COLLATE utf8mb4_unicode_ci,
    "order" int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "data_types" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name_singular" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name_plural" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "icon" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "model_name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "policy_name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "controller" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "description" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "generate_permissions" SMALLINT NOT NULL DEFAULT '0',
    "server_side" SMALLINT NOT NULL DEFAULT '0',
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "departments" (
    "id" int UNSIGNED NOT NULL,
    "faculty_id" int UNSIGNED NOT NULL,
    "department_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "faculties" (
    "id" int UNSIGNED NOT NULL,
    "faculty_abbreviation" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "faculty_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "levels" (
    "id" int UNSIGNED NOT NULL,
    "level" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "materials" (
    "id" int UNSIGNED NOT NULL,
    "material_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "menus" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "menu_items" (
    "id" int UNSIGNED NOT NULL,
    "menu_id" int UNSIGNED DEFAULT NULL,
    "title" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "url" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "target" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
    "icon_class" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "color" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "parent_id" int DEFAULT NULL,
    "order" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "route" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "parameters" text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "migrations" (
    "id" int UNSIGNED NOT NULL,
    "migration" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "pages" (
    "id" int UNSIGNED NOT NULL,
    "author_id" int NOT NULL,
    "title" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "excerpt" text COLLATE utf8mb4_unicode_ci,
    "body" text COLLATE utf8mb4_unicode_ci,
    "image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "meta_description" text COLLATE utf8mb4_unicode_ci,
    "meta_keywords" text COLLATE utf8mb4_unicode_ci,
    "status" enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_resets" (
    "email" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permissions" (
    "id" int UNSIGNED NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "table_name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "permission_group_id" int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permission_groups" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permission_role" (
    "permission_id" int UNSIGNED NOT NULL,
    "role_id" int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "posts" (
    "id" int UNSIGNED NOT NULL,
    "author_id" int NOT NULL,
    "category_id" int DEFAULT NULL,
    "course_id" int UNSIGNED NOT NULL,
    "material_id" int UNSIGNED NOT NULL,
    "academic_year" varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
    "title" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "seo_title" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "excerpt" text COLLATE utf8mb4_unicode_ci,
    "body" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "meta_description" text COLLATE utf8mb4_unicode_ci,
    "meta_keywords" text COLLATE utf8mb4_unicode_ci,
    "status" enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
    "featured" SMALLINT NOT NULL DEFAULT '0',
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "roles" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "settings" (
    "id" int UNSIGNED NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "display_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "details" text COLLATE utf8mb4_unicode_ci,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "order" int NOT NULL DEFAULT '1',
    "group" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "translations" (
    "id" int UNSIGNED NOT NULL,
    "table_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "column_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "foreign_key" int UNSIGNED NOT NULL,
    "locale" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" int UNSIGNED NOT NULL,
    "role_id" int DEFAULT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "avatar" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
    "password" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                           

ALTER TABLE "categories"
  ADD CONSTRAINT "categories_parent_id_foreign" FOREIGN KEY ("parent_id") REFERENCES "categories" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "courses"
  ADD CONSTRAINT "courses_department_id_foreign" FOREIGN KEY ("department_id") REFERENCES "departments" ("id"),
  ADD CONSTRAINT "courses_faculty_id_foreign" FOREIGN KEY ("faculty_id") REFERENCES "faculties" ("id"),
  ADD CONSTRAINT "courses_level_id_foreign" FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "data_rows"
  ADD CONSTRAINT "data_rows_data_type_id_foreign" FOREIGN KEY ("data_type_id") REFERENCES "data_types" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "departments"
  ADD CONSTRAINT "departments_faculty_id_foreign" FOREIGN KEY ("faculty_id") REFERENCES "faculties" ("id");

ALTER TABLE "menu_items"
  ADD CONSTRAINT "menu_items_menu_id_foreign" FOREIGN KEY ("menu_id") REFERENCES "menus" ("id") ON DELETE CASCADE;

ALTER TABLE "permission_role"
  ADD CONSTRAINT "permission_role_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "permission_role_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "posts"
  ADD CONSTRAINT "posts_ibfk_1" FOREIGN KEY ("course_id") REFERENCES "courses" ("id");
