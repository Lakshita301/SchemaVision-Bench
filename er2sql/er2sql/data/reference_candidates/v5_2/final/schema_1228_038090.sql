-- Source: https://github.com/Es-Di-Bee/Online-Mechanic-Appointment-System/blob/46236ac45d9ad8463e0ec78aabbdbedf0ce1706a/Car_service-main/Database/car_service.sql?raw=true
-- Tables detected: 4 | FK constraints: 3
CREATE TABLE appointments (
    appointment_id int NOT NULL,
    date date NOT NULL,
    user_id int NOT NULL,
    mechanic_id int NOT NULL,
    time_from time NOT NULL,
    time_to time NOT NULL
);
CREATE TABLE mechanics (
    mechanic_id int NOT NULL,
    mechanic_name varchar(255) NOT NULL,
    mech_username varchar(255) NOT NULL,
    mech_password varchar(255) NOT NULL,
    mech_speacility varchar(255) NOT NULL
);
CREATE TABLE mechanics_schedule (
    schedule_id int NOT NULL,
    mechanic_id int NOT NULL,
    day date NOT NULL,
    time_from time NOT NULL,
    time_to time NOT NULL,
    appoint_id int NOT NULL
);
CREATE TABLE users (
    user_id int NOT NULL,
    username varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    phone_no int NOT NULL,
    car_license_no varchar(255) NOT NULL,
    car_engine_no varchar(255) NOT NULL,
    user_type int NOT NULL DEFAULT 0
);
ALTER TABLE appointments ADD CONSTRAINT appointments_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE appointments ADD CONSTRAINT appointments_ibfk_2 FOREIGN KEY (mechanic_id) REFERENCES mechanics (mechanic_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mechanics_schedule ADD CONSTRAINT mechanics_schedule_ibfk_1 FOREIGN KEY (mechanic_id) REFERENCES mechanics (mechanic_id);
