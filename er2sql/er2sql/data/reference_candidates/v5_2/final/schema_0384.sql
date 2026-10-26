-- Source: https://github.com/TeddyTeddy/java-how-to-program-eleventh-edition/blob/8c74e875ae9618e4dae466d103f39e204155dcf3/ch29/SQLScipts_forExercises/employees.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 8
CREATE TABLE employees (
    socialSecurityNumber varchar (30) NOT NULL,
    firstName varchar (30) NOT NULL,
    lastName varchar (30) NOT NULL,
    birthday date NOT NULL,
    employeeType varchar (30) NOT NULL,
    departmentName varchar (30) NOT NULL,
    PRIMARY KEY (socialSecurityNumber)
) ;

CREATE TABLE salariedEmployees (
    socialsecurityNumber varchar (30) NOT NULL,
    weeklySalary real NOT NULL,
    bonus real,
    FOREIGN KEY (socialSecurityNumber) REFERENCES employees (socialSecurityNumber)
) ;

CREATE TABLE commissionEmployees (
    socialSecurityNumber varchar (30) NOT NULL,
    grossSales int NOT NULL,
    commissionRate real NOT NULL,
    bonus real,
    FOREIGN KEY (socialSecurityNumber) REFERENCES employees (socialSecurityNumber)
) ;

CREATE TABLE basePlusCommissionEmployees (
    socialSecurityNumber varchar (30) NOT NULL,
    grossSales int NOT NULL,
    commissionRate real NOT NULL,
    baseSalary real NOT NULL,
    bonus real,
    FOREIGN KEY (socialSecurityNumber) REFERENCES employees (socialSecurityNumber)
) ;

CREATE TABLE hourlyEmployees (
    socialSecurityNumber varchar (30) NOT NULL,
    hours int NOT NULL,
    wage real NOT NULL,
    bonus real,
    FOREIGN KEY (socialSecurityNumber) REFERENCES employees (socialSecurityNumber)
) ;
CREATE INDEX ON salariedEmployees (socialSecurityNumber);
CREATE INDEX ON commissionEmployees (socialSecurityNumber);
CREATE INDEX ON basePlusCommissionEmployees (socialSecurityNumber);
CREATE INDEX ON hourlyEmployees (socialSecurityNumber);
