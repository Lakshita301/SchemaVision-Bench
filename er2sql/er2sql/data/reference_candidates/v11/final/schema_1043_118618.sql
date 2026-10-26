-- Source: https://github.com/wrifai/wrifai_era_training/blob/2f2df394780f4380699f61055d7992105ff2bfbe/CourseRegistrationDemo/target/classes/schema.sql?raw=true
-- Tables detected: 4 | FK constraints: 3
CREATE TABLE student (
    u_id NUMERIC(9) NOT NULL,
    ssn VARCHAR(11),
    lastname VARCHAR(40)  NOT NULL,
    firstname VARCHAR(20)  NOT NULL,
    phone VARCHAR(12),
    address VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(2),
    zip VARCHAR(5),
    PRIMARY KEY (u_id)
) ;

CREATE TABLE  teacher (
    teacher_id NUMERIC(9) NOT NULL,
    ssn VARCHAR(11),
    lastname VARCHAR(40)  NOT NULL,
    firstname VARCHAR(20)  NOT NULL,
    phone VARCHAR(12),
    office VARCHAR(7),
    address VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(2),
    zip VARCHAR(5),
    PRIMARY KEY (teacher_id)
) ;

CREATE TABLE  course (
    course_id VARCHAR(8) NOT NULL,
    title VARCHAR(80)  NOT NULL,
    credit_count NUMERIC(1),
    category VARCHAR(4),
    semester VARCHAR(6),
    teacher_id NUMERIC(9) NOT NULL,
    PRIMARY KEY (course_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id) ON DELETE CASCADE
) ;

CREATE TABLE  studentcourse (
    u_id NUMERIC(9) NOT NULL,
    course_id VARCHAR(8)  NOT NULL,
    PRIMARY KEY (u_id,course_id),
    FOREIGN KEY (u_id) REFERENCES student(u_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE
) ;
