-- Source: https://github.com/JDavid337/MySQL-Homework/blob/b8c1f8d44f41b3c05b63fbbb8856340e807f259d/department.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 6

CREATE TABLE departments (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(25) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE roles (
    id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(30),
    salary DECIMAL(10,2),
    department_id INT(10),
    FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(15),
    last_name VARCHAR(20),
    manager_id INT(20),
    FOREIGN KEY (manager_id) REFERENCES employees (id) ON DELETE SET NULL,
    role_id VARCHAR(10),
    FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

