-- Source: https://github.com/klay824/employee-tracker/blob/e4ba1a68106073312cb462b47c064f6959589b58/sql/schemas.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30),
    salary DECIMAL(10,4),
    PRIMARY KEY (id),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    PRIMARY KEY (id),
    role_id INT NOT NULL,
    manager_id INT references employee,
    FOREIGN KEY (role_id) REFERENCES role(id)
);

