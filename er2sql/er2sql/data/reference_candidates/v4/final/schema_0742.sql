-- Source: https://github.com/WebExpertProDev/Laravel-React-Germany-project/blob/bcc9f09a5d6e450f8f54cb04f95741937e662a40/app2.5.2.sql?raw=true
-- Tables detected: 52 | FK/REFERENCES mentions: 8
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "accept_deliveries" (
    "id" int UNSIGNED NOT NULL,
    "order_id" int NOT NULL,
    "user_id" int NOT NULL,
    "customer_id" int NOT NULL,
    "is_complete" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "activity_log" (
    "id" bigint UNSIGNED NOT NULL,
    "log_name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "description" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "subject_id" bigint UNSIGNED DEFAULT NULL,
    "subject_type" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "causer_id" bigint UNSIGNED DEFAULT NULL,
    "causer_type" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "properties" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "addons" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "price" decimal(20,2) NOT NULL,
    "addon_category_id" int NOT NULL,
    "user_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "addon_categories" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "description" text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "addon_category_item" (
    "id" int UNSIGNED NOT NULL,
    "addon_category_id" int UNSIGNED NOT NULL,
    "item_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "addresses" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int NOT NULL,
    "address" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "house" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "landmark" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "tag" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "latitude" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "longitude" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "alerts" (
    "id" bigint UNSIGNED NOT NULL,
    "data" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "user_id" bigint DEFAULT NULL,
    "is_read" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "coupons" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "description" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "code" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "discount_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "discount" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "expiry_date" TIMESTAMP DEFAULT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "restaurant_id" int DEFAULT NULL,
    "count" int NOT NULL DEFAULT 0,
    "max_count" int NOT NULL DEFAULT 1,
    "min_subtotal" decimal(20,2) NOT NULL DEFAULT 0.00,
    "max_discount" decimal(20,2) DEFAULT NULL,
    "subtotal_message" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "user_type" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'ALL',
    "max_count_per_user" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "coupon_restaurant" (
    "id" int UNSIGNED NOT NULL,
    "coupon_id" int NOT NULL,
    "restaurant_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "delivery_collections" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int NOT NULL,
    "amount" decimal(20,2) NOT NULL DEFAULT 0.00,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "delivery_collection_logs" (
    "id" int UNSIGNED NOT NULL,
    "delivery_collection_id" int NOT NULL,
    "amount" decimal(20,2) NOT NULL DEFAULT 0.00,
    "type" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "message" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "delivery_guy_details" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "age" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "gender" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "photo" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "description" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "vehicle_number" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "commission_rate" decimal(8,2) NOT NULL DEFAULT 5.00,
    "is_notifiable" SMALLINT DEFAULT 0,
    "max_accept_delivery_limit" int NOT NULL DEFAULT 100,
    "delivery_lat" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "delivery_long" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "heading" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "tip_commission_rate" decimal(8,2) NOT NULL DEFAULT 100.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "items" (
    "id" int UNSIGNED NOT NULL,
    "restaurant_id" int NOT NULL,
    "item_category_id" int NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "price" decimal(20,2) NOT NULL,
    "old_price" decimal(20,2) NOT NULL DEFAULT 0.00,
    "image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_recommended" SMALLINT NOT NULL,
    "is_popular" SMALLINT NOT NULL,
    "is_new" SMALLINT NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "desc" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "placeholder_image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 1,
    "is_veg" SMALLINT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "item_categories" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_enabled" SMALLINT NOT NULL DEFAULT 1,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "user_id" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "locations" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_popular" SMALLINT NOT NULL DEFAULT 0,
    "is_active" SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "migrations" (
    "id" int UNSIGNED NOT NULL,
    "migration" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "model_has_permissions" (
    "permission_id" int UNSIGNED NOT NULL,
    "model_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "model_id" bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "model_has_roles" (
    "role_id" int UNSIGNED NOT NULL,
    "model_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "model_id" bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "modules" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "version" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 0,
    "is_installed" SMALLINT NOT NULL DEFAULT 1,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "short_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "code" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "settings_path" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "update_date" TIMESTAMP NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "orderitems" (
    "id" int UNSIGNED NOT NULL,
    "order_id" int NOT NULL,
    "item_id" int NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "quantity" int NOT NULL,
    "price" decimal(20,2) NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "orders" (
    "id" int UNSIGNED NOT NULL,
    "unique_order_id" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "orderstatus_id" int NOT NULL DEFAULT 1,
    "user_id" int NOT NULL,
    "coupon_name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "location" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "address" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tax" decimal(20,2) DEFAULT NULL,
    "restaurant_charge" decimal(20,2) DEFAULT NULL,
    "delivery_charge" decimal(20,2) DEFAULT NULL,
    "total" decimal(20,2) NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "payment_mode" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "order_comment" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "restaurant_id" int DEFAULT NULL,
    "transaction_id" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "delivery_type" int NOT NULL DEFAULT 1,
    "payable" decimal(20,2) NOT NULL DEFAULT 0.00,
    "wallet_amount" decimal(8,2) DEFAULT NULL,
    "tip_amount" decimal(8,2) DEFAULT NULL,
    "tax_amount" decimal(8,2) DEFAULT NULL,
    "coupon_amount" decimal(8,2) DEFAULT NULL,
    "sub_total" decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "orderstatuses" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "order_item_addons" (
    "id" int UNSIGNED NOT NULL,
    "orderitem_id" int NOT NULL,
    "addon_category_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "addon_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "addon_price" decimal(20,2) NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "pages" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "body" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_resets" (
    "email" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_reset_otps" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int NOT NULL,
    "code" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "payment_gateways" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "logo" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "payment_gateway_restaurant" (
    "id" int UNSIGNED NOT NULL,
    "payment_gateway_id" int NOT NULL,
    "restaurant_id" int NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "permissions" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "guard_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "popular_geo_places" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "latitude" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "longitude" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 1,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "promo_sliders" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "location_id" int DEFAULT NULL,
    "position_id" int NOT NULL DEFAULT 0,
    "size" int NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "push_tokens" (
    "id" bigint UNSIGNED NOT NULL,
    "token" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT 0,
    "is_sent" SMALLINT NOT NULL DEFAULT 0,
    "is_active" SMALLINT NOT NULL DEFAULT 1,
    "user_id" int DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "ratings" (
    "id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "rating" int NOT NULL,
    "order_id" int NOT NULL,
    "comment" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "rateable_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "rateable_id" bigint UNSIGNED NOT NULL,
    "user_id" int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "restaurants" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "location_id" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "rating" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "delivery_time" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "price_range" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_pureveg" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "placeholder_image" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "latitude" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "longitude" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "certificate" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "restaurant_charges" decimal(20,2) DEFAULT NULL,
    "delivery_charges" decimal(20,2) DEFAULT NULL,
    "address" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "pincode" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "landmark" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "sku" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 0,
    "is_accepted" SMALLINT NOT NULL DEFAULT 0,
    "is_featured" SMALLINT NOT NULL DEFAULT 0,
    "commission_rate" decimal(8,2) NOT NULL DEFAULT 0.00,
    "delivery_type" int NOT NULL DEFAULT 1,
    "delivery_radius" decimal(8,2) NOT NULL DEFAULT 10.00,
    "delivery_charge_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FIXED',
    "base_delivery_charge" decimal(20,2) DEFAULT NULL,
    "base_delivery_distance" int DEFAULT NULL,
    "extra_delivery_charge" decimal(20,2) DEFAULT NULL,
    "extra_delivery_distance" int DEFAULT NULL,
    "min_order_price" decimal(20,2) NOT NULL DEFAULT 0.00,
    "is_notifiable" SMALLINT DEFAULT 0,
    "auto_acceptable" SMALLINT NOT NULL DEFAULT 0,
    "schedule_data" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_schedulable" SMALLINT NOT NULL DEFAULT 0,
    "order_column" int DEFAULT NULL,
    "custom_message" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "restaurant_categories" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 1,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "restaurant_category_restaurant" (
    "id" int UNSIGNED NOT NULL,
    "restaurant_category_id" int UNSIGNED NOT NULL,
    "restaurant_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "restaurant_category_sliders" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "image" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "image_placeholder" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "categories_ids" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 1,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "order_column" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "restaurant_earnings" (
    "id" int UNSIGNED NOT NULL,
    "restaurant_id" int NOT NULL,
    "user_id" int DEFAULT NULL,
    "amount" decimal(20,2) NOT NULL DEFAULT 0.00,
    "is_requested" SMALLINT NOT NULL DEFAULT 0,
    "is_processed" SMALLINT NOT NULL DEFAULT 0,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "restaurant_payout_id" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "restaurant_payouts" (
    "id" int UNSIGNED NOT NULL,
    "restaurant_id" int NOT NULL,
    "restaurant_earning_id" int NOT NULL,
    "amount" decimal(20,2) NOT NULL,
    "status" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "transaction_mode" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "transaction_id" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "message" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "restaurant_user" (
    "id" int UNSIGNED NOT NULL,
    "user_id" int UNSIGNED NOT NULL,
    "restaurant_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "roles" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "guard_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "role_has_permissions" (
    "permission_id" int UNSIGNED NOT NULL,
    "role_id" int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "settings" (
    "id" int UNSIGNED NOT NULL,
    "key" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "value" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "slides" (
    "id" int UNSIGNED NOT NULL,
    "promo_slider_id" int NOT NULL,
    "unique_id" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "image" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "image_placeholder" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "url" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 1,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "order_column" int DEFAULT NULL,
    "model" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "item_id" int DEFAULT NULL,
    "restaurant_id" int DEFAULT NULL,
    "is_locationset" SMALLINT NOT NULL DEFAULT 0,
    "latitude" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "longitude" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "radius" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "sms_gateways" (
    "id" bigint UNSIGNED NOT NULL,
    "gateway_name" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "sms_otps" (
    "id" bigint UNSIGNED NOT NULL,
    "otp" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "phone" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "store_payout_details" (
    "id" int UNSIGNED NOT NULL,
    "restaurant_id" int NOT NULL,
    "data" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "transactions" (
    "id" int UNSIGNED NOT NULL,
    "payable_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "payable_id" bigint UNSIGNED NOT NULL,
    "wallet_id" int UNSIGNED DEFAULT NULL,
    "type" enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
    "amount" bigint NOT NULL,
    "confirmed" SMALLINT NOT NULL,
    "meta" TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid("meta")),
    "uuid" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "transfers" (
    "id" int UNSIGNED NOT NULL,
    "from_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "from_id" bigint UNSIGNED NOT NULL,
    "to_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "to_id" bigint UNSIGNED NOT NULL,
    "status" enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
    "status_last" enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "deposit_id" int UNSIGNED NOT NULL,
    "withdraw_id" int UNSIGNED NOT NULL,
    "discount" bigint NOT NULL DEFAULT 0,
    "fee" bigint NOT NULL DEFAULT 0,
    "uuid" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "translations" (
    "id" int UNSIGNED NOT NULL,
    "language_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "data" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "is_default" SMALLINT NOT NULL DEFAULT 0,
    "is_active" SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "auth_token" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "phone" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "default_address_id" int DEFAULT 0,
    "delivery_pin" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "delivery_guy_detail_id" int DEFAULT NULL,
    "avatar" text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_active" SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wallets" (
    "id" int UNSIGNED NOT NULL,
    "holder_type" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "holder_id" bigint UNSIGNED NOT NULL,
    "name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "slug" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "balance" bigint NOT NULL DEFAULT 0,
    "decimal_places" smallint NOT NULL DEFAULT 2,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                           

ALTER TABLE "model_has_permissions"
  ADD CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE;

ALTER TABLE "model_has_roles"
  ADD CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "ratings"
  ADD CONSTRAINT "ratings_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "role_has_permissions"
  ADD CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "transactions"
  ADD CONSTRAINT "transactions_wallet_id_foreign" FOREIGN KEY ("wallet_id") REFERENCES "wallets" ("id") ON DELETE CASCADE;

ALTER TABLE "transfers"
  ADD CONSTRAINT "transfers_deposit_id_foreign" FOREIGN KEY ("deposit_id") REFERENCES "transactions" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "transfers_withdraw_id_foreign" FOREIGN KEY ("withdraw_id") REFERENCES "transactions" ("id") ON DELETE CASCADE;
