-- Source: https://github.com/anadabrowska/software-design-practices/blob/caf134cb8f753a55e5a31c7d81c00e42e9488d9f/lista8/zad5.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE workplace_v2 (
    id BIGSERIAL NOT NULL PRIMARY KEY ,
    company_name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    office_location VARCHAR(100) NOT NULL
);

CREATE TABLE employee_v2 (
    id BIGSERIAL NOT NULL PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender varchar(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(150),
    salary NUMERIC(19,2) NOT NULL
);

CREATE TABLE workplaces_employees (
  worklace_id BIGINT NOT NULL,
  employee_id BIGINT NOT NULL,
  PRIMARY KEY (worklace_id, employee_id),
  FOREIGN KEY (worklace_id) REFERENCES workplace_v2(id),
  FOREIGN KEY (employee_id) REFERENCES employee_v2(id)
);

