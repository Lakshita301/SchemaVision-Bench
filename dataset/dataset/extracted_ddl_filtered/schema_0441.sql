-- Source: https://github.com/Hbrown16/Employee-Tracker/blob/44a7728349d5d66ed952a10345b2477e7916df0c/db/schema.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 6

CREATE TABLE department (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

Create table for role
-- table of employees parent

CREATE TABLE employeeRole (
    id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department_id INTEGER NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_department_id FOREIGN KEY (department_id)
    REFERENCES department(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE employee (
    id INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    lats_name VARCHAR(30) NOT NULL,
    role_id INTEGER NULL,
    manager_id INTEGER NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_role_id FOREIGN KEY (role_id)
    REFERENCES employeeRole(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT FK_manager_id FOREIGN KEY (manager_id)
    REFERENCES employeeRole(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

