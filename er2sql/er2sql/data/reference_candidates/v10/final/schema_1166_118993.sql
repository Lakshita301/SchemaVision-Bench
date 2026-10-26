-- Source: https://github.com/Modul-153/NotenVerwaltung-Backend/blob/8e3e8ac2bb01194306becbbc359f84a10e23244d/Notenverwaltung/src/main/resources/dump_02_10_19_19_43.sql?raw=true
-- Tables detected: 12 | FK constraints: 15
-- Foreign keys added via ALTER TABLE:
CREATE TABLE administrator (
    administrator_id NUMERIC NOT NULL,
    user_id NUMERIC NOT NULL
);

CREATE TABLE city (
    city_id NUMERIC NOT NULL,
    name varchar(45) NOT NULL,
    zipcode int NOT NULL
);

CREATE TABLE class (
    class_id NUMERIC NOT NULL,
    name varchar(45) NOT NULL,
    school_id NUMERIC NOT NULL,
    primary_teacher NUMERIC NOT NULL
);

CREATE TABLE class_member (
    student_id NUMERIC NOT NULL,
    class_id NUMERIC NOT NULL
);

CREATE TABLE exam (
    exam_id NUMERIC NOT NULL,
    date date NOT NULL,
    tcs_id NUMERIC NOT NULL
);

CREATE TABLE exam_result (
    exam_id NUMERIC NOT NULL,
    student_id NUMERIC NOT NULL,
    mark decimal(3,2) NOT NULL
);

CREATE TABLE school (
    school_id NUMERIC NOT NULL,
    schoolname varchar(45) NOT NULL,
    number int NOT NULL,
    street varchar(45) NOT NULL,
    city_id NUMERIC NOT NULL
);

CREATE TABLE student (
    student_id NUMERIC NOT NULL,
    user_id NUMERIC NOT NULL
);

CREATE TABLE subject (
    subject_id NUMERIC NOT NULL,
    name varchar(50) NOT NULL
);

CREATE TABLE teacher (
    teacher_id NUMERIC NOT NULL,
    user_id NUMERIC NOT NULL
);

CREATE TABLE teacher_class_subject (
    tcs_id NUMERIC NOT NULL,
    teacher_id NUMERIC NOT NULL,
    class_id NUMERIC NOT NULL,
    subject_id NUMERIC NOT NULL
);

CREATE TABLE "user" (
    user_id NUMERIC NOT NULL,
    firstname varchar(45) NOT NULL,
    lastname varchar(45) NOT NULL,
    username varchar(45) NOT NULL,
    number int NOT NULL,
    street varchar(45) NOT NULL,
    city_id NUMERIC NOT NULL,
    password varchar(1000) NOT NULL
);


                          

ALTER TABLE administrator
  ADD CONSTRAINT fk_administrator_user_id FOREIGN KEY (user_id) REFERENCES "user" (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE class
  ADD CONSTRAINT fk_class_primary_teacher FOREIGN KEY (primary_teacher) REFERENCES teacher (teacher_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_school_id_class FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE class_member
  ADD CONSTRAINT fk_class_id_class_member FOREIGN KEY (class_id) REFERENCES class (class_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_student_id_class_member FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE exam
  ADD CONSTRAINT fk_exam_tcs_id FOREIGN KEY (tcs_id) REFERENCES teacher_class_subject (tcs_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE exam_result
  ADD CONSTRAINT fk_exam_result_exam FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
  ADD CONSTRAINT fk_exam_result_student FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE school
  ADD CONSTRAINT fk_city_id_school FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE student
  ADD CONSTRAINT fk_user_id_student FOREIGN KEY (user_id) REFERENCES "user" (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE teacher
  ADD CONSTRAINT fk_user_id_teacher FOREIGN KEY (user_id) REFERENCES "user" (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE teacher_class_subject
  ADD CONSTRAINT fk_tcs_class_id FOREIGN KEY (class_id) REFERENCES class (class_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_tcs_subject_id FOREIGN KEY (subject_id) REFERENCES subject (subject_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_tcs_teacher_id FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "user"
  ADD CONSTRAINT fk_city_id_user FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE NO ACTION ON UPDATE NO ACTION;
