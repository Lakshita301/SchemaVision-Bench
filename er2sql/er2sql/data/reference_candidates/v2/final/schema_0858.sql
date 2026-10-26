-- Source: https://github.com/Samadmemon991/WholeSale-market-App/blob/58a83c17c42d68a07d26cc03929284932550440b/Database/db_project.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 4
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "category" (
    "CatId" int NOT NULL,
    "CategoryName" varchar(255) CHARACTER SET latin1 NOT NULL,
    "image" varchar(300) CHARACTER SET latin1 DEFAULT NULL
);

CREATE TABLE "customer" (
    "id" int NOT NULL,
    "C_Name" varchar(255) CHARACTER SET latin1 DEFAULT NULL,
    "username" varchar(50) CHARACTER SET latin1 NOT NULL,
    "C_Phone" varchar(255) CHARACTER SET latin1 DEFAULT NULL,
    "C_Cnic" varchar(13) CHARACTER SET latin1 DEFAULT NULL,
    "C_Debtcard" varchar(20) CHARACTER SET latin1 DEFAULT NULL,
    "Address" varchar(40) CHARACTER SET latin1 DEFAULT NULL,
    "C_Pass" varchar(8) CHARACTER SET latin1 DEFAULT NULL,
    "Status" varchar(5) CHARACTER SET latin1 DEFAULT NULL
);

CREATE TABLE "orders" (
    "id" int NOT NULL,
    "Customer_Id" int NOT NULL,
    "OrderDate" date NOT NULL
);

CREATE TABLE "order_details" (
    "id" int NOT NULL,
    "order_id" int NOT NULL,
    "product_id" int NOT NULL
);

CREATE TABLE "products" (
    "id" int NOT NULL,
    "CategoryId" int NOT NULL,
    "Product_name" varchar(255) CHARACTER SET latin1 NOT NULL,
    "Product_SPrice" int NOT NULL,
    "Product_BPrice" varchar(20) CHARACTER SET latin1 NOT NULL,
    "Product_Qty" int NOT NULL,
    "min_qty" int NOT NULL,
    "Shipment_Date" date DEFAULT NULL
);


                          

ALTER TABLE "orders"
  ADD CONSTRAINT "orders_ibfk_1" FOREIGN KEY ("Customer_Id") REFERENCES "customer" ("id");

ALTER TABLE "order_details"
  ADD CONSTRAINT "order_details_ibfk_1" FOREIGN KEY ("order_id") REFERENCES "orders" ("id"),
  ADD CONSTRAINT "order_details_ibfk_2" FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "products"
  ADD CONSTRAINT "products_ibfk_1" FOREIGN KEY ("CategoryId") REFERENCES "category" ("CatId");
