-- Source: https://github.com/mariusandrian/teacher-app/blob/1e0564923bda66436525679c9df7ad4ed7bd987f/sql/teacher_app_test.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE student (
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(255) NOT NULL,
suspend CHAR(1) DEFAULT 'N',
PRIMARY KEY (id)
);

CREATE TABLE teacher (
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE teacher_has_student (
teacher_id INT,
student_id INT,
FOREIGN KEY (teacher_id) REFERENCES teacher(id),
FOREIGN KEY (student_id) REFERENCES student(id),
UNIQUE (teacher_id, student_id)
);

