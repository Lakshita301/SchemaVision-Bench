-- Source: https://github.com/LakiCode/MyEmployeeTracker/blob/88d55958c495e6d64b9df78e924afec02863195d/db/schema.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE department (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  depName VARCHAR(30) NOT NULL
);

CREATE TABLE role (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INTEGER,
  CONSTRAINT fk_department FOREIGN KEY(department_id)
  REFERENCES department(id)
  ON DELETE SET NULL
);

CREATE TABLE employee (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  manager_id INTEGER,
  role_id INTEGER ,
  CONSTRAINT fk_Role FOREIGN KEY(role_id)
  REFERENCES role(id)
  ON DELETE SET NULL
);

