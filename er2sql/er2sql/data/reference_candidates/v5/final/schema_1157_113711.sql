-- Source: https://github.com/PeterNguyen-BK/assignment2/blob/6c798ab29d031c82ab9cf542040914d25f84ba42/bk_cleanly.sql?raw=true
-- Tables detected: 5 | FK constraints: 4
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "payment" (
    "UID" int NOT NULL,
    "service" varchar(26) NOT NULL,
    "money" int NOT NULL,
    "package" int NOT NULL
);

CREATE TABLE "price" (
    "SID" int NOT NULL,
    "package_in_time" int NOT NULL,
    "package_in_month" int NOT NULL,
    "package_in_year" int NOT NULL,
    "unit" varchar(10) NOT NULL
);

CREATE TABLE "rating" (
    "RID" int NOT NULL,
    "star_rating" int NOT NULL,
    "comment" varchar(200) NOT NULL,
    "time" varchar(20) NOT NULL,
    "SID" int NOT NULL,
    "UID" int NOT NULL
);

CREATE TABLE "service" (
    "SID" int NOT NULL,
    "name" varchar(26) NOT NULL,
    "description" varchar(1000) NOT NULL,
    "image" varchar(100) NOT NULL,
    "task" varchar(200) NOT NULL
);

CREATE TABLE "user" (
    "UID" int NOT NULL,
    "first_name" varchar(100) NOT NULL,
    "last_name" varchar(100) NOT NULL,
    "address" varchar(100) NOT NULL,
    "phone" varchar(10) NOT NULL,
    "email" varchar(100) NOT NULL,
    "password" varchar(100) NOT NULL,
    "active" int NOT NULL,
    "image" varchar(10000) DEFAULT NULL,
    "admin" int NOT NULL
);


                          

ALTER TABLE "payment"
  ADD CONSTRAINT "payment_ibfk_1" FOREIGN KEY ("UID") REFERENCES "user" ("UID");

ALTER TABLE "price"
  ADD CONSTRAINT "price_ibfk_1" FOREIGN KEY ("SID") REFERENCES "service" ("SID");

ALTER TABLE "rating"
  ADD CONSTRAINT "rating_ibfk_1" FOREIGN KEY ("SID") REFERENCES "service" ("SID"),
  ADD CONSTRAINT "rating_ibfk_2" FOREIGN KEY ("UID") REFERENCES "user" ("UID");
