-- Source: https://github.com/davaz11/modelatge-BBDD/blob/2ea57c986bc89efd19766d0aa88c3e54d4178dcb/practica_6/cul_ampolla_db.sql?raw=true
-- Tables detected: 12 | FK constraints: 14
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "address" (
    "id_address" int NOT NULL,
    "street" varchar(45) DEFAULT NULL,
    "number" varchar(5) DEFAULT NULL,
    "flat" varchar(5) DEFAULT NULL,
    "door" varchar(5) DEFAULT NULL,
    "postal_code" varchar(5) DEFAULT NULL,
    "id_country" int NOT NULL,
    "id_city" int NOT NULL
);

CREATE TABLE "brand" (
    "id_brand" int NOT NULL,
    "brand_name" varchar(45) NOT NULL,
    "id_provider" int NOT NULL
);

CREATE TABLE "city" (
    "id_city" int NOT NULL,
    "name" varchar(45) NOT NULL
);

CREATE TABLE "client" (
    "id_client" int NOT NULL,
    "name" varchar(45) NOT NULL,
    "email" varchar(320) NOT NULL,
    "register_date" date NOT NULL,
    "id_address" int NOT NULL,
    "id_client_adviser" int DEFAULT NULL
);

CREATE TABLE "color" (
    "id_color" int NOT NULL,
    "color" varchar(45) NOT NULL
);

CREATE TABLE "country" (
    "id_country" int NOT NULL,
    "name" varchar(45) NOT NULL
);

CREATE TABLE "employee" (
    "id_employee" int NOT NULL,
    "name" varchar(45) NOT NULL
);

CREATE TABLE "frametype" (
    "id_frame_type" int NOT NULL,
    "frame_type" varchar(45) NOT NULL
);

CREATE TABLE "glasses" (
    "id_glasses" int NOT NULL,
    "calibration_right" float NOT NULL,
    "calibtration_left" float NOT NULL,
    "price" float NOT NULL,
    "id_frame_type" int NOT NULL,
    "id_brand" int NOT NULL,
    "id_color_right" int NOT NULL,
    "id_color_left" int NOT NULL
);

CREATE TABLE "provider" (
    "id_provider" int NOT NULL,
    "name" varchar(45) NOT NULL,
    "telephone" varchar(15) NOT NULL,
    "fax" varchar(45) DEFAULT NULL,
    "nif" varchar(9) NOT NULL,
    "id_address" int NOT NULL
);

CREATE TABLE "sale" (
    "id_sale" int NOT NULL,
    "total_price" float NOT NULL,
    "sale_date" date NOT NULL,
    "id_client" int NOT NULL,
    "id_employee" int NOT NULL
);

CREATE TABLE "saledetail" (
    "id_sale" int NOT NULL,
    "id_glasses" int NOT NULL,
    "amount" int NOT NULL
);


                          

ALTER TABLE "address"
  ADD CONSTRAINT "fk_Address_City1" FOREIGN KEY ("id_city") REFERENCES "city" ("id_city") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_Address_Country" FOREIGN KEY ("id_country") REFERENCES "country" ("id_country") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "brand"
  ADD CONSTRAINT "fk_Brand_Provider1" FOREIGN KEY ("id_provider") REFERENCES "provider" ("id_provider") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "client"
  ADD CONSTRAINT "fk_Client_Address1" FOREIGN KEY ("id_address") REFERENCES "address" ("id_address") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_Client_Client1" FOREIGN KEY ("id_client_adviser") REFERENCES "client" ("id_client") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "glasses"
  ADD CONSTRAINT "fk_Glasses_Brand1" FOREIGN KEY ("id_brand") REFERENCES "brand" ("id_brand") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_Glasses_Colors1" FOREIGN KEY ("id_color_right") REFERENCES "color" ("id_color") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_Glasses_Colors2" FOREIGN KEY ("id_color_left") REFERENCES "color" ("id_color") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_Glasses_FrameType1" FOREIGN KEY ("id_frame_type") REFERENCES "frametype" ("id_frame_type") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "provider"
  ADD CONSTRAINT "fk_Provider_Address1" FOREIGN KEY ("id_address") REFERENCES "address" ("id_address") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "sale"
  ADD CONSTRAINT "fk_Sale_Client1" FOREIGN KEY ("id_client") REFERENCES "client" ("id_client") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_Sale_Employee1" FOREIGN KEY ("id_employee") REFERENCES "employee" ("id_employee") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "saledetail"
  ADD CONSTRAINT "fk_SaleDetail_Glasses1" FOREIGN KEY ("id_glasses") REFERENCES "glasses" ("id_glasses") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_SaleDetail_Sale1" FOREIGN KEY ("id_sale") REFERENCES "sale" ("id_sale") ON DELETE NO ACTION ON UPDATE NO ACTION;
