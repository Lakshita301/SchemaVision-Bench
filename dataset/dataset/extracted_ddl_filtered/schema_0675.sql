-- Source: https://github.com/jesard/HospitalApp/blob/337e99540a30a7528cb9a43ea56b75dfa339ce58/sql/hospital.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 24

CREATE TABLE user (
id INT(11) NOT NULL AUTO_INCREMENT,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
patronymic VARCHAR(50) DEFAULT NULL,
login VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
descriptor ENUM('admin','doctor','patient') NOT NULL,
PRIMARY KEY (id),
KEY firstName (firstName),
KEY lastName (lastName),
KEY patronymic (patronymic),
UNIQUE KEY login (login)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE session (
id INT(11) NOT NULL AUTO_INCREMENT,
user_id INT(11) NOT NULL,
token VARCHAR(50) NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY token (token),
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE speciality (
id INT(11) NOT NULL AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY title (title)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE room (
id INT(11) NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY name (name)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE admin (
id INT(11) NOT NULL AUTO_INCREMENT,
position VARCHAR(50) NOT NULL,
user_id INT(11) NOT NULL,
PRIMARY KEY (id),
KEY position (position),
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE doctor (
id INT(11) NOT NULL AUTO_INCREMENT,
speciality_id INT(11) DEFAULT NULL,
room_id INT(11) DEFAULT NULL,
user_id INT(11) NOT NULL,
termination_date DATE DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (room_id) REFERENCES room (id) ON DELETE SET NULL,
FOREIGN KEY (speciality_id) REFERENCES speciality (id) ON DELETE SET NULL,
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE patient (
id INT(11) NOT NULL AUTO_INCREMENT,
email VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
user_id INT(11) NOT NULL,
PRIMARY KEY (id),
KEY email (email),
KEY address (address),
KEY phone (phone),
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE date_schedule (
id INT(11) NOT NULL AUTO_INCREMENT,
date DATE NOT NULL,
doctor_id INT(11) NOT NULL,
PRIMARY KEY (id),
KEY date (date),
FOREIGN KEY (doctor_id) REFERENCES doctor (id) ON DELETE CASCADE,
UNIQUE KEY date_doctor_id (date, doctor_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE slot_schedule (
id INT(11) NOT NULL AUTO_INCREMENT, 
slot_start TIME NOT NULL,
slot_end TIME NOT NULL,
date_id INT(11) NOT NULL,
ticket_number VARCHAR(50) DEFAULT NULL,
patient_id INT(11) DEFAULT NULL,
PRIMARY KEY (id),
KEY ticket_number (ticket_number),
FOREIGN KEY (patient_id) REFERENCES patient (id) ON DELETE SET NULL,
FOREIGN KEY (date_id) REFERENCES date_schedule (id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE room_occupation (
id INT(11) NOT NULL AUTO_INCREMENT,
date DATE NOT NULL,
time_start TIME NOT NULL,
time_end TIME NOT NULL,
doctor_id INT(11) NOT NULL,
room_id INT(11) NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY date_doctor_id (date, doctor_id),
FOREIGN KEY (doctor_id) REFERENCES doctor (id) ON DELETE CASCADE,
FOREIGN KEY (room_id) REFERENCES room (id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE commission (
id INT(11) NOT NULL AUTO_INCREMENT,
time_start TIME NOT NULL,
time_end TIME NOT NULL,
room VARCHAR(50) NOT NULL,
ticket_number VARCHAR(50) NOT NULL,
patient_id INT(11) DEFAULT NULL,
PRIMARY KEY (id),
UNIQUE ticket_number (ticket_number),
FOREIGN KEY (patient_id) REFERENCES patient (id) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

