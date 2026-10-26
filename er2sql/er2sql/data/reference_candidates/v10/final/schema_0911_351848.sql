-- Source: https://github.com/BASLABZ/SPK-BEASISWA-SMA/blob/47c29f5a99362578e9918d52e280aa5ae1e03a42/db_spk_beasiswa.sql?raw=true
-- Tables detected: 6 | FK constraints: 3
-- Foreign keys added via ALTER TABLE:
CREATE TABLE access (
    access_id smallint NOT NULL,
    access_username varchar(10) NOT NULL,
    access_password varchar(100) NOT NULL,
    access_control varchar(7) NOT NULL
);

CREATE TABLE criteria (
    criteria_id smallint NOT NULL,
    criteria_name varchar(100) NOT NULL,
    criteria_initial varchar(5) NOT NULL
);

CREATE TABLE criteriavalue (
    criteriavalue_id smallint NOT NULL,
    criteria_id smallint NOT NULL,
    criteriavalue_value DOUBLE PRECISION NOT NULL
);

CREATE TABLE students (
    students_id smallint NOT NULL,
    students_name varchar(30) NOT NULL,
    students_dateofborn date NOT NULL,
    students_address varchar(100) NOT NULL,
    students_phonenumber char(15) NOT NULL,
    students_email varchar(50) NOT NULL,
    students_class varchar(5) NOT NULL,
    students_majors varchar(10) NOT NULL
);

CREATE TABLE subcriteria (
    subriteria_id smallint NOT NULL,
    subcriteria_name varchar(100) NOT NULL,
    subcriteria_initial varchar(5) NOT NULL,
    criteria_id smallint NOT NULL
);

CREATE TABLE value (
    value_id smallint NOT NULL,
    students_id smallint NOT NULL,
    value_value DOUBLE PRECISION NOT NULL
);


                          

ALTER TABLE criteriavalue
  ADD CONSTRAINT criteriavalue_ibfk_1 FOREIGN KEY (criteria_id) REFERENCES criteria (criteria_id);

ALTER TABLE subcriteria
  ADD CONSTRAINT subcriteria_ibfk_1 FOREIGN KEY (criteria_id) REFERENCES criteria (criteria_id);

ALTER TABLE value
  ADD CONSTRAINT value_ibfk_1 FOREIGN KEY (students_id) REFERENCES students (students_id);
