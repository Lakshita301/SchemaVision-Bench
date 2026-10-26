-- Source: https://github.com/AdrianE-Gonzalez/The_Tutors-Homes_Needs_Service_Project/blob/f423914b114c3f203ce1dace310f318417a0087f/Code/sql_code/Database_HNS.sql?raw=true
-- Tables detected: 10 | FK constraints: 9
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "appointments" (
    "Appointment_ID" int NOT NULL,
    "Client_ID" int NOT NULL,
    "Servicer_ID" int NOT NULL,
    "Special_Instructions" varchar(255) NOT NULL,
    "Date" date NOT NULL,
    "Time" time NOT NULL,
    "Service" varchar(255) NOT NULL,
    "Address_Number" int NOT NULL,
    "Street" varchar(255) NOT NULL,
    "Zip_Code" int NOT NULL,
    "City" varchar(255) NOT NULL,
    "State" varchar(255) NOT NULL
);

CREATE TABLE "clients" (
    "Client_ID" int NOT NULL,
    "User_ID" int NOT NULL
);

CREATE TABLE "payments" (
    "Payment_ID" int NOT NULL,
    "Client_ID" int NOT NULL,
    "Servicer_ID" int NOT NULL,
    "Service" varchar(255) NOT NULL,
    "DateTime" TIMESTAMP NOT NULL,
    "Amount" float NOT NULL
);

CREATE TABLE "providesservice" (
    "ID" int NOT NULL,
    "Servicer_ID" int NOT NULL,
    "Service" varchar(255) NOT NULL
);

CREATE TABLE "reviews" (
    "Review_ID" int NOT NULL,
    "Client_ID" int NOT NULL,
    "Servicer_ID" int NOT NULL,
    "Written_Review" varchar(255) NOT NULL,
    "Rating" int NOT NULL,
    "Service" varchar(255) NOT NULL,
    "Date" date NOT NULL
);

CREATE TABLE "servicers" (
    "Servicer_ID" int NOT NULL,
    "User_ID" int NOT NULL,
    "Distance_From_Address" int NOT NULL,
    "Average_Rating" int NOT NULL
);

CREATE TABLE "services" (
    "Service_ID" int NOT NULL,
    "Service" varchar(255) NOT NULL
);

CREATE TABLE "sessiontimeout" (
    "Timeout" int NOT NULL
);

CREATE TABLE "users" (
    "User_ID" int NOT NULL,
    "Name" varchar(255) NOT NULL,
    "Phone_Number" varchar(255) NOT NULL,
    "Email" varchar(255) NOT NULL,
    "Password" varchar(255) NOT NULL,
    "Address_Number" int NOT NULL,
    "Street" varchar(255) NOT NULL,
    "Zip_Code" int NOT NULL,
    "City" varchar(255) NOT NULL,
    "State" varchar(255) NOT NULL,
    "Driver_License_Number" varchar(255) NOT NULL,
    "Driver_License_Picture" BYTEA NOT NULL
);

CREATE TABLE "usersession" (
    "User_ID" int NOT NULL,
    "Session_ID" int NOT NULL,
    "Session_Time" timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    "Session_IP" varchar(255) NOT NULL
);


                          

ALTER TABLE "appointments"
  ADD CONSTRAINT "appointments_ibfk_1" FOREIGN KEY ("Client_ID") REFERENCES "clients" ("Client_ID"),
  ADD CONSTRAINT "appointments_ibfk_2" FOREIGN KEY ("Servicer_ID") REFERENCES "servicers" ("Servicer_ID");

ALTER TABLE "clients"
  ADD CONSTRAINT "clients_ibfk_1" FOREIGN KEY ("User_ID") REFERENCES "users" ("User_ID");

ALTER TABLE "payments"
  ADD CONSTRAINT "payments_ibfk_1" FOREIGN KEY ("Client_ID") REFERENCES "clients" ("Client_ID"),
  ADD CONSTRAINT "payments_ibfk_2" FOREIGN KEY ("Servicer_ID") REFERENCES "servicers" ("Servicer_ID");

ALTER TABLE "providesservice"
  ADD CONSTRAINT "providesservice_ibfk_1" FOREIGN KEY ("Servicer_ID") REFERENCES "servicers" ("Servicer_ID");

ALTER TABLE "reviews"
  ADD CONSTRAINT "reviews_ibfk_1" FOREIGN KEY ("Client_ID") REFERENCES "clients" ("Client_ID"),
  ADD CONSTRAINT "reviews_ibfk_2" FOREIGN KEY ("Servicer_ID") REFERENCES "servicers" ("Servicer_ID");

ALTER TABLE "servicers"
  ADD CONSTRAINT "servicers_ibfk_1" FOREIGN KEY ("User_ID") REFERENCES "users" ("User_ID");
