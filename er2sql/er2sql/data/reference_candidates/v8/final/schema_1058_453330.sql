-- Source: https://github.com/peteremiller/Pewlett-Hackard-Analysis/blob/faf01ac28607ec5042396314935aceac8d460278/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Employee_Challenge_starter_code.sql?raw=true
-- Tables detected: 6 | FK constraints: 5

CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries (
  	emp_no INT NOT NULL,
  	salary INT NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
  	dept_no VARCHAR(4) NOT NULL,
  	emp_no INT NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE titles (
  	emp_no INT NOT NULL,
  	title VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	PRIMARY KEY (emp_no, title, from_date)
);

