-- Source: https://github.com/lnusfaumer/mercadoLiebreApi/blob/a994c35e03ef169063cbff966cc94e861dc08b29/mercadoliebre.sql?raw=true
-- Tables detected: 7 | FK constraints: 7
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "brands" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) NOT NULL,
    "phone" varchar(255) DEFAULT NULL,
    "address" varchar(255) DEFAULT NULL,
    "createdAt" TIMESTAMP DEFAULT current_timestamp(),
    "updatedAt" TIMESTAMP DEFAULT NULL ON UPDATE current_timestamp(),
    "deletedAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "carts" (
    "id" int UNSIGNED NOT NULL,
    "orderNumber" int NOT NULL,
    "total" decimal(10,0) NOT NULL,
    "userId" int UNSIGNED NOT NULL,
    "createdAt" TIMESTAMP DEFAULT current_timestamp(),
    "updatedAt" TIMESTAMP DEFAULT NULL ON UPDATE current_timestamp(),
    "deletedAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "categories" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" varchar(500) DEFAULT NULL,
    "createdAt" TIMESTAMP DEFAULT current_timestamp(),
    "updatedAt" TIMESTAMP DEFAULT NULL ON UPDATE current_timestamp(),
    "deletedAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "items" (
    "id" int UNSIGNED NOT NULL,
    "salePrice" decimal(10,0) NOT NULL,
    "quantity" int NOT NULL DEFAULT 1,
    "subTotal" int NOT NULL,
    "state" SMALLINT NOT NULL DEFAULT 1,
    "productId" int UNSIGNED NOT NULL,
    "userId" int UNSIGNED NOT NULL,
    "sellerId" int NOT NULL,
    "cartId" int UNSIGNED DEFAULT NULL,
    "createdAt" TIMESTAMP DEFAULT current_timestamp(),
    "updatedAt" TIMESTAMP DEFAULT NULL ON UPDATE current_timestamp(),
    "deletedAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "products" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) NOT NULL,
    "price" decimal(10,0) UNSIGNED NOT NULL,
    "discount" int UNSIGNED DEFAULT 0,
    "image" varchar(255) NOT NULL,
    "description" TEXT NOT NULL,
    "categoryId" int UNSIGNED NOT NULL,
    "userId" int UNSIGNED NOT NULL,
    "brandId" int UNSIGNED NOT NULL,
    "createdAt" TIMESTAMP DEFAULT current_timestamp(),
    "updatedAt" TIMESTAMP DEFAULT NULL ON UPDATE current_timestamp(),
    "deletedAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "tokens" (
    "id" int UNSIGNED NOT NULL,
    "token" varchar(255) NOT NULL,
    "userId" int UNSIGNED NOT NULL,
    "createdAt" TIMESTAMP DEFAULT current_timestamp(),
    "updatedAt" TIMESTAMP DEFAULT NULL ON UPDATE current_timestamp(),
    "deletedAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "users" (
    "id" int UNSIGNED NOT NULL,
    "admin" SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    "username" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    "image" varchar(255) DEFAULT NULL,
    "createdAt" TIMESTAMP DEFAULT current_timestamp(),
    "updatedAt" TIMESTAMP DEFAULT NULL ON UPDATE current_timestamp(),
    "deletedAt" TIMESTAMP DEFAULT NULL
);


                          

ALTER TABLE "carts"
  ADD CONSTRAINT "carts_ibfk_1" FOREIGN KEY ("userId") REFERENCES "users" ("id");

ALTER TABLE "items"
  ADD CONSTRAINT "items_ibfk_1" FOREIGN KEY ("userId") REFERENCES "users" ("id"),
  ADD CONSTRAINT "items_ibfk_2" FOREIGN KEY ("cartId") REFERENCES "carts" ("id");

ALTER TABLE "products"
  ADD CONSTRAINT "products_ibfk_1" FOREIGN KEY ("userId") REFERENCES "users" ("id"),
  ADD CONSTRAINT "products_ibfk_2" FOREIGN KEY ("brandId") REFERENCES "brands" ("id"),
  ADD CONSTRAINT "products_ibfk_3" FOREIGN KEY ("categoryId") REFERENCES "categories" ("id");

ALTER TABLE "tokens"
  ADD CONSTRAINT "tokens_ibfk_1" FOREIGN KEY ("userId") REFERENCES "users" ("id");
