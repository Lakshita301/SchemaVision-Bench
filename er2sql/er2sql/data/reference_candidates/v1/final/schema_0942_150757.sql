-- Source: https://github.com/Parrysidhu/Cloud-Computing/blob/764d10ca19f07cd8a3c0f5fe8464d2da1affe311/COVID_19_Home_Care_Kit/COVID-19-Home-Care-Kit-Implementations/covid.sql?raw=true
-- Tables detected: 4 | FK constraints: 1
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "area" (
    "a_id" int NOT NULL,
    "a_name" varchar(100) NOT NULL
);

CREATE TABLE "assistant" (
    "asid" int NOT NULL,
    "aname" varchar(30) NOT NULL,
    "apassword" varchar(30) NOT NULL
);

CREATE TABLE "patients" (
    "patients_id" int NOT NULL,
    "name" varchar(100) NOT NULL,
    "patients_add" varchar(100) NOT NULL,
    "lat" float DEFAULT NULL,
    "lng" float DEFAULT NULL,
    "temp" float DEFAULT NULL,
    "bpm" float DEFAULT NULL,
    "blood oxygen" int DEFAULT NULL,
    "a_id" int NOT NULL,
    "Date-Time" timestamp NOT NULL DEFAULT current_timestamp()
);

CREATE TABLE "users" (
    "uid" int NOT NULL,
    "uname" varchar(100) NOT NULL,
    "upassword" varchar(30) NOT NULL
);


                          

ALTER TABLE "patients"
  ADD CONSTRAINT "patients_ibfk_2" FOREIGN KEY ("a_id") REFERENCES "area" ("a_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
