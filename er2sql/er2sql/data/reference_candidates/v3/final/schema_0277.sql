-- Source: https://github.com/sunidhi1999-c/Restaurant_Website/blob/b61eadd6f3952181a288eea9bedec8393ef3045a/foodorder.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 5
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "contact" (
    "Name" varchar(250) NOT NULL,
    "Email" varchar(250) NOT NULL,
    "Mobile" varchar(250) NOT NULL,
    "Subject" varchar(250) NOT NULL,
    "Message" varchar(250) NOT NULL
);

CREATE TABLE "customer" (
    "username" varchar(30) NOT NULL,
    "fullname" varchar(30) NOT NULL,
    "email" varchar(30) NOT NULL,
    "contact" varchar(30) NOT NULL,
    "address" varchar(50) NOT NULL,
    "password" varchar(30) NOT NULL
);

CREATE TABLE "food" (
    "F_ID" int NOT NULL,
    "name" varchar(30) NOT NULL,
    "price" int NOT NULL,
    "description" varchar(200) NOT NULL,
    "R_ID" int NOT NULL,
    "images_path" varchar(200) NOT NULL,
    "options" varchar(10) NOT NULL DEFAULT 'ENABLE'
);

CREATE TABLE "manager" (
    "username" varchar(30) NOT NULL,
    "fullname" varchar(30) NOT NULL,
    "email" varchar(30) NOT NULL,
    "contact" varchar(30) NOT NULL,
    "address" varchar(50) NOT NULL,
    "password" varchar(30) NOT NULL
);

CREATE TABLE "orders" (
    "order_ID" int NOT NULL,
    "F_ID" int NOT NULL,
    "foodname" varchar(30) NOT NULL,
    "price" int NOT NULL,
    "quantity" int NOT NULL,
    "order_date" date NOT NULL,
    "username" varchar(30) NOT NULL,
    "R_ID" int NOT NULL
);

CREATE TABLE "restaurants" (
    "R_ID" int NOT NULL,
    "name" varchar(30) NOT NULL,
    "email" varchar(30) NOT NULL,
    "contact" varchar(30) NOT NULL,
    "address" varchar(50) NOT NULL,
    "M_ID" varchar(30) NOT NULL
);


                          

ALTER TABLE "food"
  ADD CONSTRAINT "food_ibfk_1" FOREIGN KEY ("R_ID") REFERENCES "restaurants" ("R_ID");

ALTER TABLE "orders"
  ADD CONSTRAINT "orders_ibfk_1" FOREIGN KEY ("F_ID") REFERENCES "food" ("F_ID"),
  ADD CONSTRAINT "orders_ibfk_2" FOREIGN KEY ("username") REFERENCES "customer" ("username"),
  ADD CONSTRAINT "orders_ibfk_3" FOREIGN KEY ("R_ID") REFERENCES "restaurants" ("R_ID");

ALTER TABLE "restaurants"
  ADD CONSTRAINT "restaurants_ibfk_1" FOREIGN KEY ("M_ID") REFERENCES "manager" ("username");
