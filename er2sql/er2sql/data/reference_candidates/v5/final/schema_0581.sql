-- Source: https://github.com/kcomalley14/sql-challenge/blob/84db2a4a9439a8798d5d09ef636aa43818656944/tableschema.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 12

CREATE TABLE Departments (
    dept_no VARCHAR(30)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Titles (
    title_id VARCHAR(30)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    	PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(30)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(30)   NOT NULL,
    hire_date DATE   NOT NULL,
    	PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Dept_employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(30)   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Dept_managers (
    dept_no VARCHAR(30)   NOT NULL,
    emp_no INT   NOT NULL,
    	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

