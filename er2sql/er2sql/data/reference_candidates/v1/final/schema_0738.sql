-- Source: https://github.com/Suvres/cwp_bazy_danych/blob/d464552ccf5353fa94cfe78353950787dcdf1d2e/oracle/dziekanat_scheme.ddl?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 24
-- Foreign keys added via ALTER TABLE:
CREATE TABLE cathedral (
    id NUMBER(10) NOT NULL,
    cathedral_name VARCHAR(100),
    faculty_id NUMBER(10) NOT NULL
);

CREATE TABLE classes (
    id NUMBER(10) NOT NULL,
    classes_type VARCHAR(40),
    work_group_id NUMBER(38) NOT NULL,
    subject_id NUMBER(38) NOT NULL,
    employee_id NUMBER(38) NOT NULL
);

CREATE TABLE employee (
    id NUMBER(10) NOT NULL,
    first_name VARCHAR(49),
    last_name VARCHAR(40),
    pesel VARCHAR(11),
    locality VARCHAR(50),
    postal_code VARCHAR(50),
    phone VARCHAR(12),
    email VARCHAR(50),
    date_of_employment DATE,
    date_of_release DATE,
    position_id NUMBER(7) NOT NULL,
    faculty_id NUMBER(38) NOT NULL,
    cathedral_id NUMBER(10)
);

CREATE TABLE faculty (
    id NUMBER(10) NOT NULL,
    faculty_name VARCHAR(200),
    abbreviation VARCHAR(20)
);

CREATE TABLE mark (
    id NUMBER(38) NOT NULL,
    mark NUMBER(4, 1),
    classes_id NUMBER(38) NOT NULL,
    student_index NUMBER(38) NOT NULL
);

CREATE TABLE position (
    id NUMBER(10) NOT NULL,
    name_of_position VARCHAR(50)
);

CREATE TABLE student (
    "index" NUMBER(10) NOT NULL,
    first_name VARCHAR(49),
    last_name VARCHAR(40),
    pesel VARCHAR(11),
    locality VARCHAR(50),
    postal_code VARCHAR(50),
    phone VARCHAR(12),
    email VARCHAR(50),
    date_of_enrollment DATE,
    date_of_discharge DATE,
    faculty_id NUMBER(38) NOT NULL
);

CREATE TABLE student_work_group (
    student_index NUMBER(38) NOT NULL,
    work_group_id NUMBER(38) NOT NULL
);

CREATE TABLE subject (
    id NUMBER(10) NOT NULL,
    subject_name VARCHAR(255)
);

CREATE TABLE work_group (
    id NUMBER(10) NOT NULL,
    group_code VARCHAR(30)
);


                         

ALTER TABLE cathedral
    ADD CONSTRAINT cathedral_faculty_fk FOREIGN KEY ( faculty_id )
        REFERENCES faculty ( id );

ALTER TABLE classes
    ADD CONSTRAINT classes_employee_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( id );

ALTER TABLE classes
    ADD CONSTRAINT classes_subject_fk FOREIGN KEY ( subject_id )
        REFERENCES subject ( id );

ALTER TABLE classes
    ADD CONSTRAINT classes_work_group_fk FOREIGN KEY ( work_group_id )
        REFERENCES work_group ( id );

ALTER TABLE employee
    ADD CONSTRAINT employee_cathedral_fk FOREIGN KEY ( cathedral_id )
        REFERENCES cathedral ( id );

ALTER TABLE employee
    ADD CONSTRAINT employee_faculty_fk FOREIGN KEY ( faculty_id )
        REFERENCES faculty ( id );

ALTER TABLE employee
    ADD CONSTRAINT employee_position_fk FOREIGN KEY ( position_id )
        REFERENCES position ( id );

ALTER TABLE mark
    ADD CONSTRAINT mark_classes_fk FOREIGN KEY ( classes_id )
        REFERENCES classes ( id );

ALTER TABLE mark
    ADD CONSTRAINT mark_student_fk FOREIGN KEY ( student_index )
        REFERENCES student ( "index" );

ALTER TABLE student
    ADD CONSTRAINT student_faculty_fk FOREIGN KEY ( faculty_id )
        REFERENCES faculty ( id );

ALTER TABLE student_work_group
    ADD CONSTRAINT student_work_group_student_fk FOREIGN KEY ( student_index )
        REFERENCES student ( "index" );

ALTER TABLE student_work_group
    ADD CONSTRAINT student_work_group_fk FOREIGN KEY ( work_group_id )
        REFERENCES work_group ( id );
