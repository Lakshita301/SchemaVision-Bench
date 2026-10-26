-- Source: https://github.com/Swapdev/supplier/blob/96bb0c542b53eeec7a7d607346429f9901e88afc/test_jumla.sql?raw=true
-- Tables detected: 35 | FK constraints: 13
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "attributes" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "brands" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
    "slug" varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
    "image" varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
    "featured" int DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "categories" (
    "id" int UNSIGNED NOT NULL,
    "parent_id" int UNSIGNED DEFAULT NULL,
    "order" int NOT NULL DEFAULT '1',
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "category" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "parent" int DEFAULT NULL,
    "featured" int DEFAULT NULL,
    "image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "category_product" (
    "id" int UNSIGNED NOT NULL,
    "product_id" int UNSIGNED DEFAULT NULL,
    "category_id" int UNSIGNED DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "coupons" (
    "id" int UNSIGNED NOT NULL,
    "code" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" int DEFAULT NULL,
    "percent_off" int DEFAULT NULL,
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
    "details" text COLLATE utf8mb4_unicode_ci,
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

CREATE TABLE "orders" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int UNSIGNED DEFAULT NULL,
    "billing_email" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_address" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_city" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_province" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_postalcode" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_phone" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_name_on_card" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "billing_discount" int NOT NULL DEFAULT '0',
    "billing_discount_code" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "billing_subtotal" int NOT NULL,
    "billing_tax" int NOT NULL,
    "billing_total" int NOT NULL,
    "payment_gateway" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
    "shipped" SMALLINT NOT NULL DEFAULT '0',
    "error" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "order_product" (
    "id" int UNSIGNED NOT NULL,
    "order_id" int UNSIGNED DEFAULT NULL,
    "product_id" int UNSIGNED DEFAULT NULL,
    "quantity" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
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

CREATE TABLE "products" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "brand" int DEFAULT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "details" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "description" text COLLATE utf8mb4_unicode_ci,
    "featured" SMALLINT NOT NULL DEFAULT '0',
    "image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "images" text COLLATE utf8mb4_unicode_ci,
    "created_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "product_attributes" (
    "id" int UNSIGNED NOT NULL,
    "product_id" int NOT NULL,
    "attribute_key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "attribute_value" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "product_fields" (
    "id" int UNSIGNED NOT NULL,
    "product-type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "label" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "product_metas" (
    "id" int UNSIGNED NOT NULL,
    "product_id" int NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "product_variations" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "quantity" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "product" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "profile_verifications" (
    "id" int UNSIGNED NOT NULL,
    "user" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "code" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "verified" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
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
    "value" text COLLATE utf8mb4_unicode_ci,
    "details" text COLLATE utf8mb4_unicode_ci,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "order" int NOT NULL DEFAULT '1',
    "group" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "suggested_bussinesses" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "owned" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "status" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "additional_information" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "suppliers" (
    "id" int UNSIGNED NOT NULL,
    "uid" int NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "supplier_fields" (
    "id" int UNSIGNED NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "label" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "supplier_metas" (
    "id" int UNSIGNED NOT NULL,
    "supplier" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "template_parts" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "content" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
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
    "role_id" int UNSIGNED DEFAULT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "phone" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "avatar" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
    "password" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "settings" text COLLATE utf8mb4_unicode_ci,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user_roles" (
    "user_id" int UNSIGNED NOT NULL,
    "role_id" int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                           

ALTER TABLE "categories"
  ADD CONSTRAINT "categories_parent_id_foreign" FOREIGN KEY ("parent_id") REFERENCES "categories" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "category_product"
  ADD CONSTRAINT "category_product_category_id_foreign" FOREIGN KEY ("category_id") REFERENCES "category" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "category_product_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE CASCADE;

ALTER TABLE "data_rows"
  ADD CONSTRAINT "data_rows_data_type_id_foreign" FOREIGN KEY ("data_type_id") REFERENCES "data_types" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "menu_items"
  ADD CONSTRAINT "menu_items_menu_id_foreign" FOREIGN KEY ("menu_id") REFERENCES "menus" ("id") ON DELETE CASCADE;

ALTER TABLE "orders"
  ADD CONSTRAINT "orders_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "order_product"
  ADD CONSTRAINT "order_product_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "orders" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT "order_product_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "permission_role"
  ADD CONSTRAINT "permission_role_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "permission_role_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "users"
  ADD CONSTRAINT "users_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "user_roles"
  ADD CONSTRAINT "user_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "user_roles_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;
