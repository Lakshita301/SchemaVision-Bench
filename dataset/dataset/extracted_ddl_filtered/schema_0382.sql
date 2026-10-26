-- Source: https://github.com/alexaandrov/oraclesql-homework/blob/48ab8a0400a27348d74b87935c92cec1daf2abe3/09-ddl.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

CREATE TABLE dept80
  AS
    SELECT employee_id, last_name,
           salary * 12 ANNSAL,
           hire_date
    FROM   hr.employees
    WHERE department_id = 80;

CREATE TABLE departments (
  id    NUMBER(7),
  name  VARCHAR2(25),
  CONSTRAINT id_pk PRIMARY KEY (id);

CREATE TABLE emp (
  id NUMBER(7),
  last_name VARCHAR2(25),
  first_name VARCHAR2(25),
  dept_id NUMBER(7),
  CONSTRAINT emp_id_pk PRIMARY KEY (id),
  CONSTRAINT emp_dept_id_fk FOREIGN KEY (dept_id)
    REFERENCES departments(id) ON DELETE CASCADE
);

CREATE TABLE employees2
  AS
    SELECT employee_id id, first_name,
           last_name, salary, department_id dept_id
    FROM hr.employees;

