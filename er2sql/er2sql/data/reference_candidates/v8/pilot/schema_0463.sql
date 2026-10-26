-- Source: https://github.com/nimishbongale/5th-Sem-ISE/blob/1c2456792bc34ba326332a6f91095ad7d9bb8155/sem5DBMS/final/plsql/partBinit.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

create table branch(
code varchar(5) primary key,
name varchar(10),
assets int);

create table customer(
ssn int primary key,
custname varchar(10),
place varchar(10));

create table account(
accno varchar(5),
ssn int,
code varchar(5),
balance int,
primary key(accno),
foreign key(ssn) references customer(ssn) on delete cascade,
foreign key(code) references branch(code) on delete cascade
);

