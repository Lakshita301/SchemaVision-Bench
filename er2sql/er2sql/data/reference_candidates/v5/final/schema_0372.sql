-- Source: https://github.com/endrinatoledo/citas_medicas/blob/e81417cf84bc9ceec5634c519084714c6bf803a5/db/medicalappointments.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 7
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "doctors" (
    "doc_id" int NOT NULL,
    "uro_id" int NOT NULL,
    "spe_id" int NOT NULL,
    "doc_first_name" varchar(100) NOT NULL,
    "doc_last_name" varchar(100) NOT NULL,
    "doc_status" int NOT NULL
);

CREATE TABLE "medical_appointments" (
    "map_id" int NOT NULL,
    "pat_id" int NOT NULL,
    "doc_id" int NOT NULL,
    "map_date" date NOT NULL,
    "map_status" int DEFAULT NULL
);

CREATE TABLE "patients" (
    "pat_id" int NOT NULL,
    "uro_id" int NOT NULL,
    "pat_first_name" varchar(100) NOT NULL,
    "pat_last_name" varchar(100) NOT NULL,
    "pat_date" date NOT NULL,
    "pat_status" int NOT NULL
);

CREATE TABLE "roles" (
    "rol_id" int NOT NULL,
    "rol_name" varchar(50) NOT NULL,
    "rol_status" int NOT NULL
);

CREATE TABLE "specialties" (
    "spe_id" int NOT NULL,
    "spe_name" varchar(150) NOT NULL,
    "spe_status" int NOT NULL
);

CREATE TABLE "users" (
    "use_id" int NOT NULL,
    "use_email" varchar(200) NOT NULL,
    "use_password" varchar(200) NOT NULL,
    "use_status" int NOT NULL
);

CREATE TABLE "user_rol" (
    "uro_id" int NOT NULL,
    "use_id" int NOT NULL,
    "rol_id" int NOT NULL
);


                          

ALTER TABLE "doctors"
  ADD CONSTRAINT "doc_esp" FOREIGN KEY ("spe_id") REFERENCES "specialties" ("spe_id"),
  ADD CONSTRAINT "doc_userrol" FOREIGN KEY ("uro_id") REFERENCES "user_rol" ("uro_id");

ALTER TABLE "medical_appointments"
  ADD CONSTRAINT "doc_fk" FOREIGN KEY ("doc_id") REFERENCES "doctors" ("doc_id"),
  ADD CONSTRAINT "pat_fk" FOREIGN KEY ("pat_id") REFERENCES "patients" ("pat_id");

ALTER TABLE "patients"
  ADD CONSTRAINT "pact_userrol_fk" FOREIGN KEY ("uro_id") REFERENCES "user_rol" ("uro_id");

ALTER TABLE "user_rol"
  ADD CONSTRAINT "rol_fk" FOREIGN KEY ("rol_id") REFERENCES "roles" ("rol_id"),
  ADD CONSTRAINT "user_fk" FOREIGN KEY ("use_id") REFERENCES "users" ("use_id");
