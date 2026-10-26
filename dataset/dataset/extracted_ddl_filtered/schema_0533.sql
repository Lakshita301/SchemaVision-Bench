-- Source: https://github.com/poojaakgw/PoojaderleE-DAC2020/blob/0a3193b700e9df08e9d631ae0e0aa57ae489de45/DBT_Assigment3.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

create table Department(dept_id int(255),dept_name varchar(50) ,primary key(dept_id));

create table employee(emp_id int(255),emp_name varchar(200),dept_id int(255),salary int(255),manager int(255),primary key(emp_id),constraint employee foreign key(dept_id) references Department(dept_id));

create table Publishers(pubid numeric(7),
pname varchar(25),
phone varchar(30),
email varchar(100) UNIQUE,
primary key(pubid));

create table Authors1(auid numeric(7),aname varchar(25),email varchar(50) UNIQUE,phone varchar(20),primary key(auid));

