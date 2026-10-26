-- Source: https://github.com/mi89325/DataVizClass/blob/db68555ed40bfcd8a3e0aab141baa26e98fca722/SQL-Challenge/Schema/EmployeeSQL.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 12

CREATE TABLE employees (
    emp_no      INT,
    birth_date  DATE,
    first_name  VARCHAR(14),
    last_name   VARCHAR(16),
    gender      VARCHAR(1),
    hire_date   DATE,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     VARCHAR(4),
    dept_name   VARCHAR(40),
    PRIMARY KEY (dept_no),
    UNIQUE   	(dept_name)
);

CREATE TABLE dept_manager (
   dept_no      VARCHAR(4),
   emp_no       INT,
   from_date    DATE,
   to_date      DATE,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
   PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_emp (
    emp_no      INT,
    dept_no     VARCHAR(4),
    from_date   DATE,
    to_date     DATE,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE titles (
    emp_no      INT,
    title       VARCHAR(50),
    from_date   DATE,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no,title, from_date)
);

CREATE TABLE salaries (
    emp_no      INT,
    salary      INT,
    from_date   DATE,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, from_date)
);

