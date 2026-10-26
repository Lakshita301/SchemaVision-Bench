-- Source: https://github.com/xo-Natsumi-ox/db_lab/blob/b0ad331c20905f72a593905785dd68894798b445/src/main/resources/db.sql?raw=true
-- Tables detected: 6 | FK constraints: 5
CREATE TABLE adress
(
    id INT         NOT NULL AUTO_INCREMENT,
    city_or_village VARCHAR(45) NULL,
    street VARCHAR(45) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE hospital
(
    id INT          NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NULL,
    number INT          NULL,
    adress_id INT          NOT NULL,
    PRIMARY KEY (id),
    INDEX fk_hospital_adress1_idx (adress_id ASC) VISIBLE,
    CONSTRAINT fk_hospital_adress1
        FOREIGN KEY (adress_id)
            REFERENCES adress (id)
);

CREATE TABLE patient
(
    id INT         NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    age INT         NULL,
    hospital_id INT         NOT NULL,
    PRIMARY KEY (id),
    INDEX fk_patient_hospital1_idx (hospital_id ASC) VISIBLE,
    CONSTRAINT fk_patient_hospital1
        FOREIGN KEY (hospital_id)
            REFERENCES hospital (id)
);

CREATE TABLE doctor
(
    id INT         NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NULL,
    surname VARCHAR(45) NULL,
    hospital_id INT         NOT NULL,
    PRIMARY KEY (id),
    INDEX fk_doctor_hospital1_idx (hospital_id ASC) VISIBLE,
    CONSTRAINT fk_doctor_hospital1
        FOREIGN KEY (hospital_id)
            REFERENCES hospital (id)
);

CREATE TABLE tracker
(
    id INT         NOT NULL AUTO_INCREMENT,
    pressure INT         NULL,
    temperature FLOAT       NULL,
    palpitation INT         NULL,
    diagnos VARCHAR(45) NULL,
    patient_id INT         NOT NULL,
    PRIMARY KEY (id),
    INDEX fk_tracker_patient1_idx (patient_id ASC) VISIBLE,
    CONSTRAINT fk_tracker_patient1
        FOREIGN KEY (patient_id)
            REFERENCES patient (id)
);

CREATE TABLE shedule
(
    id INT         NOT NULL AUTO_INCREMENT,
    data INT        NULL,
    time VARCHAR(45) NULL,
    additional_info VARCHAR(45) NULL,
    doctor_id INT         NOT NULL,
    PRIMARY KEY (id),
    INDEX fk_shedule_doctor1_idx (doctor_id ASC) VISIBLE,
    CONSTRAINT fk_shedule_doctor1
        FOREIGN KEY (doctor_id)
            REFERENCES doctor (id)
);
