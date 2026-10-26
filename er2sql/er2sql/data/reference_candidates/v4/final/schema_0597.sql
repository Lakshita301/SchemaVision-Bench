-- Source: https://github.com/AntonKJ/mgk-yii-advanced/blob/4b5de82b04e76ae1d65865970a92cc9ada3e8653/yii2advanced_db.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 5
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "auth_assignment" (
    "item_name" varchar(64) COLLATE utf8_unicode_ci NOT NULL,
    "user_id" varchar(64) COLLATE utf8_unicode_ci NOT NULL,
    "created_at" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "auth_item" (
    "name" varchar(64) COLLATE utf8_unicode_ci NOT NULL,
    "type" smallint NOT NULL,
    "description" text COLLATE utf8_unicode_ci DEFAULT NULL,
    "rule_name" varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
    "data" BYTEA DEFAULT NULL,
    "created_at" int DEFAULT NULL,
    "updated_at" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "auth_item_child" (
    "parent" varchar(64) COLLATE utf8_unicode_ci NOT NULL,
    "child" varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "auth_rule" (
    "name" varchar(64) COLLATE utf8_unicode_ci NOT NULL,
    "data" BYTEA DEFAULT NULL,
    "created_at" int DEFAULT NULL,
    "updated_at" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "menu" (
    "id" int NOT NULL,
    "name" varchar(128) NOT NULL,
    "parent" int DEFAULT NULL,
    "route" varchar(255) DEFAULT NULL,
    "order" int DEFAULT NULL,
    "data" BYTEA DEFAULT NULL
);

CREATE TABLE "migration" (
    "version" varchar(180) NOT NULL,
    "apply_time" int DEFAULT NULL
);

CREATE TABLE "url_status" (
    "hash_string" varchar(32) COLLATE utf8_unicode_ci NOT NULL,
    "created_at" int NOT NULL,
    "updated_at" int NOT NULL,
    "url" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    "status_code" int NOT NULL,
    "query_count" int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "user" (
    "id" int NOT NULL,
    "username" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    "auth_key" varchar(32) COLLATE utf8_unicode_ci NOT NULL,
    "password_hash" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    "password_reset_token" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    "email" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    "status" smallint NOT NULL DEFAULT 10,
    "created_at" int NOT NULL,
    "updated_at" int NOT NULL,
    "verification_token" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


                          

ALTER TABLE "auth_assignment"
  ADD CONSTRAINT "auth_assignment_ibfk_1" FOREIGN KEY ("item_name") REFERENCES "auth_item" ("name") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "auth_item"
  ADD CONSTRAINT "auth_item_ibfk_1" FOREIGN KEY ("rule_name") REFERENCES "auth_rule" ("name") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "auth_item_child"
  ADD CONSTRAINT "auth_item_child_ibfk_1" FOREIGN KEY ("parent") REFERENCES "auth_item" ("name") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "auth_item_child_ibfk_2" FOREIGN KEY ("child") REFERENCES "auth_item" ("name") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "menu"
  ADD CONSTRAINT "menu_ibfk_1" FOREIGN KEY ("parent") REFERENCES "menu" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
