-- Source: https://github.com/jacobstryker93/sql-challenge/blob/09f718c4d4cbb844768c33e8a32e7e642b5b5f4d/SchemaScript.sql?raw=true
-- Tables detected: 6 | FK constraints: 6
CREATE TABLE Title (
    Title_ID varchar   NOT NULL,
    Title varchar   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (
        Title_ID
     )
);
CREATE TABLE Salaries (
    Emp_no int   NOT NULL,
    Salary money   NOT NULL
);
CREATE TABLE Employees (
    Emp_no int   NOT NULL,
    Emp_title varchar   NOT NULL,
    Birth_date date   NOT NULL,
    First_name varchar   NOT NULL,
    Last_name varchar   NOT NULL,
    Sex varchar   NOT NULL,
    Hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_no
     )
);
CREATE TABLE Dept_Manager (
    Dept_no varchar   NOT NULL,
    Emp_no int   NOT NULL
);
CREATE TABLE Dept_Emp (
    Emp_no int   NOT NULL,
    Dept_no varchar   NOT NULL
);
CREATE TABLE Departments (
    Dept_no varchar   NOT NULL,
    Dept_name varchar   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no )
);
ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Emp_title FOREIGN KEY(Emp_title)
REFERENCES Title (Title_ID);
ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);
ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);
ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);
ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);
ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);
