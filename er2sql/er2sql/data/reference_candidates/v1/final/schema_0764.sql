-- Source: https://github.com/mesinkasir/coolpos/blob/9ca9382695c36ea9bdf45f59d63b7fafec85815b/database/coolpos.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 3
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "categories" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(60) NOT NULL
);

CREATE TABLE "media" (
    "id" int UNSIGNED NOT NULL,
    "file_name" varchar(255) NOT NULL,
    "file_type" varchar(100) NOT NULL
);

CREATE TABLE "products" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) NOT NULL,
    "quantity" varchar(50) DEFAULT NULL,
    "buy_price" decimal(25,2) DEFAULT NULL,
    "sale_price" decimal(25,2) NOT NULL,
    "categorie_id" int UNSIGNED NOT NULL,
    "media_id" int DEFAULT 0,
    "date" TIMESTAMP NOT NULL
);

CREATE TABLE "sales" (
    "id" int UNSIGNED NOT NULL,
    "product_id" int UNSIGNED NOT NULL,
    "qty" int NOT NULL,
    "price" decimal(25,2) NOT NULL,
    "date" date NOT NULL
);

CREATE TABLE "users" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(60) NOT NULL,
    "username" varchar(50) NOT NULL,
    "password" varchar(255) NOT NULL,
    "user_level" int NOT NULL,
    "image" varchar(255) DEFAULT 'no_image.jpg',
    "status" int NOT NULL,
    "last_login" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "user_groups" (
    "id" int NOT NULL,
    "group_name" varchar(150) NOT NULL,
    "group_level" int NOT NULL,
    "group_status" int NOT NULL
);


                          

ALTER TABLE "products"
  ADD CONSTRAINT "FK_products" FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "sales"
  ADD CONSTRAINT "SK" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "users"
  ADD CONSTRAINT "FK_user" FOREIGN KEY ("user_level") REFERENCES "user_groups" ("group_level") ON DELETE CASCADE ON UPDATE CASCADE;
