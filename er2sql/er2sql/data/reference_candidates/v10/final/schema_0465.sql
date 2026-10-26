-- Source: https://github.com/LChan63/cs166_project/blob/2e88fb6de2acf14c7696c9f1902f5b4fca64b6b8/code/sql/create.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 24

CREATE TABLE Patient
(
	patient_ID INTEGER NOT NULL,
	name VARCHAR(128) NOT NULL,	
	gtype _GENDER NOT NULL,
	age INTEGER NOT NULL,
	address VARCHAR(256),
	number_of_appts INTEGER,
	PRIMARY KEY (patient_ID)
);

CREATE TABLE Hospital
(
	hospital_ID INTEGER NOT NULL,
	name VARCHAR(64) NOT NULL,	
	PRIMARY KEY (hospital_ID)
);

CREATE TABLE Department
(
	dept_ID INTEGER NOT NULL,
	name VARCHAR(32) NOT NULL,
	hid INTEGER NOT NULL,
	PRIMARY KEY (dept_ID),
	FOREIGN KEY (hid) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Staff
(
	staff_ID INTEGER NOT NULL,
	name VARCHAR(128) NOT NULL,	
	hid INTEGER NOT NULL,
	PRIMARY KEY (staff_ID),
	FOREIGN KEY (hid) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Doctor
(
	doctor_ID INTEGER NOT NULL,
	name VARCHAR(128),
	specialty VARCHAR(24),
	did INTEGER NOT NULL,
	PRIMARY KEY (doctor_ID),
	FOREIGN KEY (did) REFERENCES Department(dept_ID)
);

CREATE TABLE Appointment
(	
	appnt_ID INTEGER NOT NULL,	
	adate DATE NOT NULL,
	time_slot VARCHAR(11),
	status _STATUS,
	PRIMARY KEY (appnt_ID)
);

CREATE TABLE request_maintenance
(
	patient_per_hour INTEGER NOT NULL,
	dept_name VARCHAR(32) NOT NULL,
	time_slot VARCHAR(11) NOT NULL,
	did INTEGER NOT NULL,	
	sid INTEGER NOT NULL,	
	PRIMARY KEY (did,sid),
	FOREIGN KEY (did) REFERENCES Doctor(doctor_ID),
	FOREIGN KEY (sid) REFERENCES Staff(staff_ID)	
);

CREATE TABLE searches
(
	hid INTEGER NOT NULL,	
	pid INTEGER NOT NULL,
	aid INTEGER NOT NULL,
	PRIMARY KEY (hid,pid,aid),
	FOREIGN KEY (hid) REFERENCES Hospital(hospital_ID),
	FOREIGN KEY (pid) REFERENCES Patient(patient_ID),
	FOREIGN KEY (aid) REFERENCES Appointment(appnt_ID)
);

CREATE TABLE schedules
(
	appt_id INTEGER NOT NULL,
	staff_id INTEGER NOT NULL,	
	PRIMARY KEY (appt_id,staff_id),
	FOREIGN KEY (appt_id) REFERENCES Appointment(appnt_ID),
	FOREIGN KEY (staff_id) REFERENCES Staff(staff_ID)
);

CREATE TABLE has_appointment
(
	appt_id INTEGER NOT NULL,
	doctor_id INTEGER NOT NULL,	
	PRIMARY KEY (appt_id,doctor_id),
	FOREIGN KEY (appt_id) REFERENCES Appointment(appnt_ID),
	FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_ID)
);

