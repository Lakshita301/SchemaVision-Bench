-- Source: https://github.com/RayhanZaman333/laravel-inventory-pos-system/blob/c21148709b066202a52efec9c931fbd6cde7f71e/lara_posinventory.sql?raw=true
-- Tables detected: 15 | FK constraints: 8
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "accounts" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "acc_no" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "bank_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "balance" decimal(8,2) NOT NULL,
    "opening_balance" decimal(8,2) NOT NULL,
    "bank_address" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "carts" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int UNSIGNED NOT NULL,
    "item_id" int UNSIGNED NOT NULL,
    "quantity" decimal(10,2) NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "categories" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "category_item" (
    "category_id" int UNSIGNED NOT NULL,
    "item_id" int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "customers" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "phone" varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
    "address" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "tin_number" varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "employees" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "phone" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "designation" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "nid" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "present_address" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "permanent_address" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "invoices" (
    "id" int UNSIGNED NOT NULL,
    "invoice_no" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "from" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "to" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "invoice_type" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "total_amount" decimal(8,2) NOT NULL,
    "amount_paid" decimal(8,2) NOT NULL,
    "amount_due" decimal(8,2) NOT NULL,
    "status" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "invoice_sell" (
    "id" int UNSIGNED NOT NULL,
    "invoice_id" int UNSIGNED NOT NULL,
    "sell_id" int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "items" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "item_code" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "purchase_price" DOUBLE PRECISION(8,2) NOT NULL,
    "retail_price" DOUBLE PRECISION(8,2) NOT NULL,
    "quantity" DOUBLE PRECISION(8,2) NOT NULL,
    "vat" DOUBLE PRECISION(4,2) NOT NULL,
    "image" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
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

CREATE TABLE "payments" (
    "id" int UNSIGNED NOT NULL,
    "invoice_id" int UNSIGNED NOT NULL,
    "account_id" int UNSIGNED NOT NULL,
    "amount_payable" decimal(8,2) NOT NULL,
    "amount_paid" decimal(8,2) NOT NULL,
    "note" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "sells" (
    "id" int UNSIGNED NOT NULL,
    "item_id" int UNSIGNED NOT NULL,
    "quantity" int NOT NULL,
    "total_price" decimal(8,2) NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "suppliers" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "phone" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "company" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tin_number" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "address" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "image" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "business_name" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                           

ALTER TABLE "carts"
  ADD CONSTRAINT "carts_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "category_item"
  ADD CONSTRAINT "category_item_category_id_foreign" FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "category_item_item_id_foreign" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE CASCADE;

ALTER TABLE "invoice_sell"
  ADD CONSTRAINT "invoice_sell_invoice_id_foreign" FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "invoice_sell_sell_id_foreign" FOREIGN KEY ("sell_id") REFERENCES "sells" ("id") ON DELETE CASCADE;

ALTER TABLE "payments"
  ADD CONSTRAINT "payments_account_id_foreign" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id"),
  ADD CONSTRAINT "payments_invoice_id_foreign" FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id");

ALTER TABLE "sells"
  ADD CONSTRAINT "sells_item_id_foreign" FOREIGN KEY ("item_id") REFERENCES "items" ("id");
