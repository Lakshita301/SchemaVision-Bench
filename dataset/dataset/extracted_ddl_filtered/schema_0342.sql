-- Source: https://github.com/nerooc/Databases-1-PL/blob/b3aa99bcd267ecbaf31211b161c53077116ccff0/Lab%201%20-%20Power%20Architect/Lab-1.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 10

CREATE TABLE University (
                University_ID INTEGER NOT NULL DEFAULT nextval('university_university_id_seq'),
                Name VARCHAR NOT NULL,
                Rector VARCHAR NOT NULL,
                CONSTRAINT university_id PRIMARY KEY (University_ID)
);

CREATE TABLE Department (
                Department_ID INTEGER NOT NULL DEFAULT nextval('department_department_id_seq'),
                University_ID INTEGER NOT NULL,
                Name VARCHAR NOT NULL,
                Address VARCHAR NOT NULL,
                Dean VARCHAR NOT NULL,
                CONSTRAINT department_id PRIMARY KEY (Department_ID)
);

CREATE TABLE Room (
                Room_ID INTEGER NOT NULL DEFAULT nextval('room_room_id_seq'),
                Department_ID INTEGER NOT NULL,
                Number VARCHAR NOT NULL,
                Building VARCHAR NOT NULL,
                CONSTRAINT room_id PRIMARY KEY (Room_ID)
);

CREATE TABLE Subject (
                Subject_ID INTEGER NOT NULL DEFAULT nextval('subject_subject_id_seq'),
                Room_ID INTEGER NOT NULL,
                Name VARCHAR NOT NULL,
                CONSTRAINT subject_id PRIMARY KEY (Subject_ID)
);

CREATE TABLE Student (
                Student_ID INTEGER NOT NULL DEFAULT nextval('student_student_id_seq'),
                Name VARCHAR NOT NULL,
                Surname VARCHAR NOT NULL,
                CONSTRAINT student_id PRIMARY KEY (Student_ID)
);

CREATE TABLE Student_subject (
                ID INTEGER NOT NULL DEFAULT nextval('student_subject_id_seq'),
                Subject_ID INTEGER NOT NULL,
                Student_ID INTEGER NOT NULL,
                CONSTRAINT id PRIMARY KEY (ID)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE Department ADD CONSTRAINT university_department_fk
FOREIGN KEY (University_ID)
REFERENCES University (University_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Room ADD CONSTRAINT department_room_fk
FOREIGN KEY (Department_ID)
REFERENCES Department (Department_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Subject ADD CONSTRAINT room_subject_fk
FOREIGN KEY (Room_ID)
REFERENCES Room (Room_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Student_subject ADD CONSTRAINT subject_student_subject_fk
FOREIGN KEY (Subject_ID)
REFERENCES Subject (Subject_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Student_subject ADD CONSTRAINT student_student_subject_fk
FOREIGN KEY (Student_ID)
REFERENCES Student (Student_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

