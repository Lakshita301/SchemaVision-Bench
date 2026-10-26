-- Source: https://github.com/lenamh00/corona/blob/5a50f952123660423fbd35a15d029dab897a3d4b/patient_doctor(2).sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 5
CREATE TABLE bed (
    bed_id int NOT NULL,
    recource_id int NOT NULL,
    bed_name text NOT NULL,
    number_validate int NOT NULL
);
CREATE TABLE chat (
    "chat-id" int NOT NULL,
    name varchar(155) NOT NULL,
    msg varchar(155) NOT NULL,
    date date NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE doctor (
    "doctor-id" int NOT NULL,
    "doctor-name" varchar(255) NOT NULL,
    jurisdiction varchar(255) NOT NULL,
    university varchar(255) NOT NULL,
    availabel_number int DEFAULT NULL,
    recource_id int DEFAULT NULL
);
CREATE TABLE images (
    image_id int NOT NULL,
    patient_id int NOT NULL,
    title varchar(255) NOT NULL,
    image varchar(255) NOT NULL
);
CREATE TABLE medicine (
    medicin_id int NOT NULL,
    recource_id int NOT NULL,
    medicin_name text NOT NULL,
    number_validate int NOT NULL
);
CREATE TABLE oxogen (
    oxogen_id int NOT NULL,
    recource_id int NOT NULL,
    oxogen_name text NOT NULL,
    number_validate int NOT NULL
);
CREATE TABLE patient (
    patient_id int NOT NULL,
    patient_name varchar(155) NOT NULL,
    mobile text NOT NULL,
    password text NOT NULL,
    age int NOT NULL,
    oxygenation int NOT NULL
);
CREATE TABLE resource (
    recource_id int NOT NULL,
    recource_name text NOT NULL
);
ALTER TABLE bed ADD CONSTRAINT bed_ibfk_1 FOREIGN KEY (recource_id) REFERENCES resource (recource_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE doctor ADD CONSTRAINT doctor_ibfk_1 FOREIGN KEY (recource_id) REFERENCES resource (recource_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE images ADD CONSTRAINT images_ibfk_1 FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE medicine ADD CONSTRAINT medicine_ibfk_1 FOREIGN KEY (recource_id) REFERENCES resource (recource_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE oxogen ADD CONSTRAINT oxogen_ibfk_1 FOREIGN KEY (recource_id) REFERENCES resource (recource_id) ON DELETE CASCADE ON UPDATE CASCADE;
