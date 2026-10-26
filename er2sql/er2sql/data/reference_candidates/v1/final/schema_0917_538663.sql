-- Source: https://github.com/BrianHenryIE/bh-wc-gateway-load-balancer/blob/7f3efc04b0998b44786f6edf2aaf3300663e7de8/tests/_data/dump.sql?raw=true
-- Tables detected: 43 | FK constraints: 1
CREATE TABLE "wp_actionscheduler_actions" (
    "action_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "hook" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    "status" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "scheduled_date_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "scheduled_date_local" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "args" varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "schedule" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "group_id" bigint unsigned NOT NULL DEFAULT 0,
    "attempts" int NOT NULL DEFAULT 0,
    "last_attempt_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "last_attempt_local" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "claim_id" bigint unsigned NOT NULL DEFAULT 0,
    "extended_args" varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("action_id"),
    KEY "hook" ("hook"),
    KEY "status" ("status"),
    KEY "scheduled_date_gmt" ("scheduled_date_gmt"),
    KEY "args" ("args"),
    KEY "group_id" ("group_id"),
    KEY "last_attempt_gmt" ("last_attempt_gmt"),
    KEY "claim_id" ("claim_id")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_actionscheduler_claims" (
    "claim_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "date_created_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("claim_id"),
    KEY "date_created_gmt" ("date_created_gmt")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_actionscheduler_groups" (
    "group_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "slug" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY ("group_id"),
    KEY "slug" ("slug"(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_actionscheduler_logs" (
    "log_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "action_id" bigint unsigned NOT NULL,
    "message" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "log_date_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "log_date_local" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("log_id"),
    KEY "action_id" ("action_id"),
    KEY "log_date_gmt" ("log_date_gmt")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_commentmeta" (
    "meta_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "comment_id" bigint unsigned NOT NULL DEFAULT 0,
    "meta_key" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_value" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("meta_id"),
    KEY "comment_id" ("comment_id"),
    KEY "meta_key" ("meta_key"(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_comments" (
    "comment_ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "comment_post_ID" bigint unsigned NOT NULL DEFAULT 0,
    "comment_author" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "comment_author_email" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "comment_author_url" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "comment_author_IP" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "comment_date" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "comment_date_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "comment_content" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "comment_karma" int NOT NULL DEFAULT 0,
    "comment_approved" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
    "comment_agent" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "comment_type" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
    "comment_parent" bigint unsigned NOT NULL DEFAULT 0,
    "user_id" bigint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY ("comment_ID"),
    KEY "comment_post_ID" ("comment_post_ID"),
    KEY "comment_approved_date_gmt" ("comment_approved","comment_date_gmt"),
    KEY "comment_date_gmt" ("comment_date_gmt"),
    KEY "comment_parent" ("comment_parent"),
    KEY "comment_author_email" ("comment_author_email"(10)),
    KEY "woo_idx_comment_type" ("comment_type")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_links" (
    "link_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "link_url" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "link_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "link_image" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "link_target" varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "link_description" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "link_visible" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
    "link_owner" bigint unsigned NOT NULL DEFAULT 1,
    "link_rating" int NOT NULL DEFAULT 0,
    "link_updated" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "link_rel" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "link_notes" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "link_rss" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    PRIMARY KEY ("link_id"),
    KEY "link_visible" ("link_visible")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_options" (
    "option_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "option_name" varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "option_value" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "autoload" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
    PRIMARY KEY ("option_id"),
    UNIQUE KEY "option_name" ("option_name"),
    KEY "autoload" ("autoload")
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_postmeta" (
    "meta_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "post_id" bigint unsigned NOT NULL DEFAULT 0,
    "meta_key" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_value" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("meta_id"),
    KEY "post_id" ("post_id"),
    KEY "meta_key" ("meta_key"(191))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_posts" (
    "ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "post_author" bigint unsigned NOT NULL DEFAULT 0,
    "post_date" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "post_date_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "post_content" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "post_title" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "post_excerpt" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "post_status" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
    "comment_status" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
    "ping_status" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
    "post_password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "post_name" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "to_ping" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "pinged" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "post_modified" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "post_modified_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "post_content_filtered" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "post_parent" bigint unsigned NOT NULL DEFAULT 0,
    "guid" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "menu_order" int NOT NULL DEFAULT 0,
    "post_type" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
    "post_mime_type" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "comment_count" bigint NOT NULL DEFAULT 0,
    PRIMARY KEY ("ID"),
    KEY "post_name" ("post_name"(191)),
    KEY "type_status_date" ("post_type","post_status","post_date","ID"),
    KEY "post_parent" ("post_parent"),
    KEY "post_author" ("post_author")
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_term_relationships" (
    "object_id" bigint unsigned NOT NULL DEFAULT 0,
    "term_taxonomy_id" bigint unsigned NOT NULL DEFAULT 0,
    "term_order" int NOT NULL DEFAULT 0,
    PRIMARY KEY ("object_id","term_taxonomy_id"),
    KEY "term_taxonomy_id" ("term_taxonomy_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_term_taxonomy" (
    "term_taxonomy_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "term_id" bigint unsigned NOT NULL DEFAULT 0,
    "taxonomy" varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "description" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "parent" bigint unsigned NOT NULL DEFAULT 0,
    "count" bigint NOT NULL DEFAULT 0,
    PRIMARY KEY ("term_taxonomy_id"),
    UNIQUE KEY "term_id_taxonomy" ("term_id","taxonomy"),
    KEY "taxonomy" ("taxonomy")
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_termmeta" (
    "meta_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "term_id" bigint unsigned NOT NULL DEFAULT 0,
    "meta_key" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_value" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("meta_id"),
    KEY "term_id" ("term_id"),
    KEY "meta_key" ("meta_key"(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_terms" (
    "term_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "slug" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "term_group" bigint NOT NULL DEFAULT 0,
    PRIMARY KEY ("term_id"),
    KEY "slug" ("slug"(191)),
    KEY "name" ("name"(191))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_usermeta" (
    "umeta_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_id" bigint unsigned NOT NULL DEFAULT 0,
    "meta_key" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_value" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("umeta_id"),
    KEY "user_id" ("user_id"),
    KEY "meta_key" ("meta_key"(191))
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_users" (
    "ID" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_login" varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "user_pass" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "user_nicename" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "user_email" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "user_url" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "user_registered" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "user_activation_key" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "user_status" int NOT NULL DEFAULT 0,
    "display_name" varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    PRIMARY KEY ("ID"),
    KEY "user_login_key" ("user_login"),
    KEY "user_nicename" ("user_nicename"),
    KEY "user_email" ("user_email")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_admin_note_actions" (
    "action_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "note_id" bigint unsigned NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "label" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "query" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "status" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_primary" SMALLINT NOT NULL DEFAULT 0,
    "actioned_text" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY ("action_id"),
    KEY "note_id" ("note_id")
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_admin_notes" (
    "note_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "locale" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "title" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "content" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "content_data" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "status" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "source" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "date_created" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "date_reminder" TIMESTAMP DEFAULT NULL,
    "is_snoozable" SMALLINT NOT NULL DEFAULT 0,
    "layout" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "image" varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "is_deleted" SMALLINT NOT NULL DEFAULT 0,
    "icon" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
    PRIMARY KEY ("note_id")
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_category_lookup" (
    "category_tree_id" bigint unsigned NOT NULL,
    "category_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("category_tree_id","category_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_customer_lookup" (
    "customer_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_id" bigint unsigned DEFAULT NULL,
    "username" varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "first_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "date_last_active" timestamp NULL DEFAULT NULL,
    "date_registered" timestamp NULL DEFAULT NULL,
    "country" char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "postcode" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "city" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "state" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    PRIMARY KEY ("customer_id"),
    UNIQUE KEY "user_id" ("user_id"),
    KEY "email" ("email")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_download_log" (
    "download_log_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "timestamp" TIMESTAMP NOT NULL,
    "permission_id" bigint unsigned NOT NULL,
    "user_id" bigint unsigned DEFAULT NULL,
    "user_ip_address" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
    PRIMARY KEY ("download_log_id"),
    KEY "permission_id" ("permission_id"),
    KEY "timestamp" ("timestamp"),
    CONSTRAINT "fk_wp_wc_download_log_permission_id" FOREIGN KEY ("permission_id") REFERENCES "wp_woocommerce_downloadable_product_permissions" ("permission_id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_order_coupon_lookup" (
    "order_id" bigint unsigned NOT NULL,
    "coupon_id" bigint NOT NULL,
    "date_created" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "discount_amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    PRIMARY KEY ("order_id","coupon_id"),
    KEY "coupon_id" ("coupon_id"),
    KEY "date_created" ("date_created")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_order_product_lookup" (
    "order_item_id" bigint unsigned NOT NULL,
    "order_id" bigint unsigned NOT NULL,
    "product_id" bigint unsigned NOT NULL,
    "variation_id" bigint unsigned NOT NULL,
    "customer_id" bigint unsigned DEFAULT NULL,
    "date_created" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "product_qty" int NOT NULL,
    "product_net_revenue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "product_gross_revenue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "coupon_amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "tax_amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "shipping_amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "shipping_tax_amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    PRIMARY KEY ("order_item_id"),
    KEY "order_id" ("order_id"),
    KEY "product_id" ("product_id"),
    KEY "customer_id" ("customer_id"),
    KEY "date_created" ("date_created")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_order_stats" (
    "order_id" bigint unsigned NOT NULL,
    "parent_id" bigint unsigned NOT NULL DEFAULT 0,
    "date_created" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "date_created_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "num_items_sold" int NOT NULL DEFAULT 0,
    "total_sales" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "tax_total" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "shipping_total" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "net_total" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "returning_customer" SMALLINT DEFAULT NULL,
    "status" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "customer_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("order_id"),
    KEY "date_created" ("date_created"),
    KEY "customer_id" ("customer_id"),
    KEY "status" ("status"(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_order_tax_lookup" (
    "order_id" bigint unsigned NOT NULL,
    "tax_rate_id" bigint unsigned NOT NULL,
    "date_created" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "shipping_tax" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "order_tax" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "total_tax" DOUBLE PRECISION NOT NULL DEFAULT 0,
    PRIMARY KEY ("order_id","tax_rate_id"),
    KEY "tax_rate_id" ("tax_rate_id"),
    KEY "date_created" ("date_created")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_product_meta_lookup" (
    "product_id" bigint NOT NULL,
    "sku" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
    "virtual" SMALLINT DEFAULT 0,
    "downloadable" SMALLINT DEFAULT 0,
    "min_price" decimal(19,4) DEFAULT NULL,
    "max_price" decimal(19,4) DEFAULT NULL,
    "onsale" SMALLINT DEFAULT 0,
    "stock_quantity" DOUBLE PRECISION DEFAULT NULL,
    "stock_status" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'instock',
    "rating_count" bigint DEFAULT 0,
    "average_rating" decimal(3,2) DEFAULT 0.00,
    "total_sales" bigint DEFAULT 0,
    "tax_status" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'taxable',
    "tax_class" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
    PRIMARY KEY ("product_id"),
    KEY "virtual" ("virtual"),
    KEY "downloadable" ("downloadable"),
    KEY "stock_status" ("stock_status"),
    KEY "stock_quantity" ("stock_quantity"),
    KEY "onsale" ("onsale"),
    KEY "min_max_price" ("min_price","max_price")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_reserved_stock" (
    "order_id" bigint NOT NULL,
    "product_id" bigint NOT NULL,
    "stock_quantity" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "timestamp" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "expires" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("order_id","product_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_tax_rate_classes" (
    "tax_rate_class_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "slug" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    PRIMARY KEY ("tax_rate_class_id"),
    UNIQUE KEY "slug" ("slug"(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_wc_webhooks" (
    "webhook_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "status" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "name" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" bigint unsigned NOT NULL,
    "delivery_url" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "secret" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "topic" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "date_created" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "date_created_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "date_modified" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "date_modified_gmt" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "api_version" smallint NOT NULL,
    "failure_count" smallint NOT NULL DEFAULT 0,
    "pending_delivery" SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY ("webhook_id"),
    KEY "user_id" ("user_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_api_keys" (
    "key_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_id" bigint unsigned NOT NULL,
    "description" varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "permissions" varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    "consumer_key" char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
    "consumer_secret" char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
    "nonces" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "truncated_key" char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_access" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("key_id"),
    KEY "consumer_key" ("consumer_key"),
    KEY "consumer_secret" ("consumer_secret")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_attribute_taxonomies" (
    "attribute_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "attribute_name" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "attribute_label" varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "attribute_type" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "attribute_orderby" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "attribute_public" int NOT NULL DEFAULT 1,
    PRIMARY KEY ("attribute_id"),
    KEY "attribute_name" ("attribute_name"(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_downloadable_product_permissions" (
    "permission_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "download_id" varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "product_id" bigint unsigned NOT NULL,
    "order_id" bigint unsigned NOT NULL DEFAULT 0,
    "order_key" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_email" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" bigint unsigned DEFAULT NULL,
    "downloads_remaining" varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "access_granted" TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    "access_expires" TIMESTAMP DEFAULT NULL,
    "download_count" bigint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY ("permission_id"),
    KEY "download_order_key_product" ("product_id","order_id","order_key"(16),"download_id"),
    KEY "download_order_product" ("download_id","order_id","product_id"),
    KEY "order_id" ("order_id"),
    KEY "user_order_remaining_expires" ("user_id","order_id","downloads_remaining","access_expires")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_log" (
    "log_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "timestamp" TIMESTAMP NOT NULL,
    "level" smallint NOT NULL,
    "source" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "message" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "context" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("log_id"),
    KEY "level" ("level")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_order_itemmeta" (
    "meta_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "order_item_id" bigint unsigned NOT NULL,
    "meta_key" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_value" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("meta_id"),
    KEY "order_item_id" ("order_item_id"),
    KEY "meta_key" ("meta_key"(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_order_items" (
    "order_item_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "order_item_name" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "order_item_type" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "order_id" bigint unsigned NOT NULL,
    PRIMARY KEY ("order_item_id"),
    KEY "order_id" ("order_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_payment_tokenmeta" (
    "meta_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "payment_token_id" bigint unsigned NOT NULL,
    "meta_key" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "meta_value" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("meta_id"),
    KEY "payment_token_id" ("payment_token_id"),
    KEY "meta_key" ("meta_key"(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_payment_tokens" (
    "token_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "gateway_id" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" bigint unsigned NOT NULL DEFAULT 0,
    "type" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "is_default" SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY ("token_id"),
    KEY "user_id" ("user_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_sessions" (
    "session_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "session_key" char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
    "session_value" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "session_expiry" bigint unsigned NOT NULL,
    PRIMARY KEY ("session_id"),
    UNIQUE KEY "session_key" ("session_key")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_shipping_zone_locations" (
    "location_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "zone_id" bigint unsigned NOT NULL,
    "location_code" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "location_type" varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY ("location_id"),
    KEY "location_id" ("location_id"),
    KEY "location_type_code" ("location_type"(10),"location_code"(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_shipping_zone_methods" (
    "zone_id" bigint unsigned NOT NULL,
    "instance_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "method_id" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "method_order" bigint unsigned NOT NULL,
    "is_enabled" SMALLINT NOT NULL DEFAULT 1,
    PRIMARY KEY ("instance_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_shipping_zones" (
    "zone_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "zone_name" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "zone_order" bigint unsigned NOT NULL,
    PRIMARY KEY ("zone_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_tax_rate_locations" (
    "location_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "location_code" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tax_rate_id" bigint unsigned NOT NULL,
    "location_type" varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY ("location_id"),
    KEY "tax_rate_id" ("tax_rate_id"),
    KEY "location_type_code" ("location_type"(10),"location_code"(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "wp_woocommerce_tax_rates" (
    "tax_rate_id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "tax_rate_country" varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "tax_rate_state" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "tax_rate" varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "tax_rate_name" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    "tax_rate_priority" bigint unsigned NOT NULL,
    "tax_rate_compound" int NOT NULL DEFAULT 0,
    "tax_rate_shipping" int NOT NULL DEFAULT 1,
    "tax_rate_order" bigint unsigned NOT NULL,
    "tax_rate_class" varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    PRIMARY KEY ("tax_rate_id"),
    KEY "tax_rate_country" ("tax_rate_country"),
    KEY "tax_rate_state" ("tax_rate_state"(2)),
    KEY "tax_rate_class" ("tax_rate_class"(10)),
    KEY "tax_rate_priority" ("tax_rate_priority")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
