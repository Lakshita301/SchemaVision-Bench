-- Source: https://github.com/icesernia/CSCMU-SQLgrader-backend/blob/f1695130421ad9b6640faec44958536121918e45/databases/companythailand2560/original-companythailand2560.sql?raw=true
-- Tables detected: 6 | FK constraints: 7
-- not null,
CREATE TABLE department (
    dname varchar(15) not null,
    dnumber integer not null,
    mgr_ssn char(9) not null,
    mgr_start_date date,
    primary key (dnumber),
    unique (dname)
);
CREATE TABLE dept_locations (
    dnumber integer not null,
    dlocation varchar(15) not null,
    primary key (dnumber,dlocation)
);
CREATE TABLE employee (
    fname varchar(15) not null,
    minit char,
    lname varchar(15) not null,
    ssn char(9),
    bdate date,
    address varchar(30),
    sex char,
    salary decimal(10,2),
    super_ssn char(9),
    dno integer,
    primary key (ssn)
);
CREATE TABLE dependent (
    essn char(9) not null,
    dependent_name varchar(15) not null,
    sex char,
    bdate date,
    relationship varchar(8),
    primary key (essn,dependent_name)
);
CREATE TABLE project (
    pname varchar(15) not null,
    pnumber integer not null,
    plocation varchar(15),
    dnum integer not null,
    primary key (pnumber),
    unique (pname)
);
CREATE TABLE works_on (
    essn char(9) not null,
    pno integer not null,
    hours decimal(4,1) not null,
    primary key (essn,pno)
);
ALTER TABLE employee ADD foreign key (super_ssn) references employee (ssn);
ALTER TABLE department ADD foreign key (mgr_ssn) references employee (ssn);
ALTER TABLE dept_locations ADD foreign key (dnumber) references department(dnumber);
ALTER TABLE employee ADD foreign key (dno) references department (dnumber);
ALTER TABLE dependent ADD foreign key (essn) references employee(ssn);
ALTER TABLE project ADD foreign key (dnum) references department(dnumber);
ALTER TABLE works_on ADD foreign key (essn) references employee(ssn);
ALTER TABLE works_on ADD foreign key (pno) references project(pnumber);
