-- Source: https://github.com/livieee/Hospital-Database-Assignment/blob/88926b1fc6f331d097ab6394ca6563b60fd3eeb5/script1.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 8
CREATE TABLE doctor(
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    specialty VARCHAR(20),
    licensed_date DATE,
    license_number CHAR(4) NOT NULL,
    hospital_code CHAR (3),
    PRIMARY KEY (license_number)
);
CREATE TABLE patient(
    patient_ohip CHAR (9) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    PRIMARY KEY (patient_ohip)
);
CREATE TABLE hospital(
    hospital_name VARCHAR(20),
    city VARCHAR(20),
    province VARCHAR(20),
    number_beds INT,
    hospital_code CHAR(3) NOT NULL,
    current_head CHAR(4),
    start_date DATE,
    PRIMARY KEY (hospital_code)
);
CREATE TABLE treat(
    license_number CHAR(4) NOT NULL,
    patient_ohip CHAR(9) NOT NULL,
    PRIMARY KEY(license_number, patient_ohip)
);
ALTER TABLE doctor ADD FOREIGN KEY (hospital_code) REFERENCES hospital (hospital_code);
ALTER TABLE hospital ADD FOREIGN KEY (current_head) REFERENCES doctor (license_number) ON DELETE CASCADE;
ALTER TABLE treat ADD FOREIGN KEY(license_number) REFERENCES doctor(license_number);
ALTER TABLE treat ADD FOREIGN KEY(patient_ohip) REFERENCES patient(patient_ohip) ON DELETE CASCADE;
