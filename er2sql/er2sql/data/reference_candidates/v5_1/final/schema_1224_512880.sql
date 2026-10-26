-- Source: https://github.com/gordon-xie/COMP1511/blob/be3d8f0a5afbdd507a49f3d4ba41aa814906b85a/COMP3311/Pracs/Week03/schema.sql?raw=true
-- Tables detected: 4 | FK constraints: 2
create table Employees (
    tfn char(11),
    givenName varchar(30) NOT NULL,
    familyName varchar(30),
    hoursPweek REAL,
    CHECK (hoursPweek <=168),
    CHECK (hoursPweek > 0),
    PRIMARY KEY (tfn),
    CHECK (tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]')
);

create table Departments (
    id char(3),
    name varchar(100) UNIQUE,
    manager char(11) UNIQUE,
    PRIMARY KEY (id),
    CHECK (id LIKE '[0-9][0-9][0-9]')
);

create table DeptMissions (
    department char(3),
    keyword varchar(20) NOT NULL,
    FOREIGN KEY (department) REFERENCES Departments(id)
);

create table WorksFor (
    employee char(11) NOT NULL,
    department char(3) NOT NULL,
    percentage REAL,
    CHECK (percentage > 0),
    CHECK (percentage <= 100),
    FOREIGN KEY (department) REFERENCES Departments(id)
);
