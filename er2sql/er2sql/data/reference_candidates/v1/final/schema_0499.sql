-- Source: https://github.com/CCC-GH/sql-challenge/blob/e2b0102176dcf18b8bda656a134b8ecc7fa13995/Full_Script_pgAdmin4.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 13

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date VARCHAR(10) NULL,
	first_name VARCHAR(30) NULL,
	last_name VARCHAR(30) NULL,
	sex VARCHAR(1) NULL,
	hire_date VARCHAR(10) NULL,
	PRIMARY KEY(emp_no)
);

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NULL,
	PRIMARY KEY(title_id)
);

CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(30) NULL,
	PRIMARY KEY(dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NULL,
	primary key(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	primary key(emp_no, dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	primary KEY(dept_no, emp_no)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE employees ADD FOREIGN KEY(emp_title_id) REFERENCES titles(title_id);

ALTER TABLE salaries ADD FOREIGN KEY(emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD FOREIGN KEY(emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD FOREIGN KEY(dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD FOREIGN KEY(dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD FOREIGN KEY(emp_no) REFERENCES employees(emp_no);

