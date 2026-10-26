-- Source: https://github.com/DarrylB32/SQL-Employee_Database_Queries/blob/96060a9a7baf924a109e4e2a7e3bf09493dc07ac/Data_Analysis/data_analysis.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 12

CREATE TABLE departments (
    dept_no varchar(10),
    dept_name varchar(30),
    primary key (dept_no)
);

CREATE TABLE titles (
    title_id varchar(10),
    title varchar(30),
    primary key (title_id)
);

CREATE TABLE employees (
    emp_no int,
    emp_title_id varchar(10),
    birth_date varchar(10),
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(1),
    hire_date varchar(10),
    primary key (emp_no),
    foreign key (emp_title_id) references titles(title_id)
);

CREATE TABLE salaries (
    emp_no int,
    salary money,
    primary key (emp_no),
    foreign key (emp_no) references employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no int,
    dept_no varchar(10),
    primary key (emp_no,dept_no),
    foreign key (emp_no) references employees(emp_no),
    foreign key (dept_no) references departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no varchar(10),
    emp_no int,
    primary key (emp_no),
    foreign key (dept_no) references departments(dept_no),
    foreign key (emp_no) references employees(emp_no)
);

