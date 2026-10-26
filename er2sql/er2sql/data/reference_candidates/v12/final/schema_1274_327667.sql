-- Source: https://github.com/Niharika-1BM19CS100/DBMS-LAB/blob/07abe9636022c16460a808933f5e1076cea69ec7/DBMS%20Lab-4(Banking%20Database)/BankingDatabase.sql?raw=true
-- Tables detected: 6 | FK constraints: 6

create table branch(
branch_name varchar(30) primary key,
branch_city varchar(30),
assets real);

create table accounts(
accno int primary key,
branch_name varchar(30),
balance real,
foreign key (branch_name) references branch(branch_name) on delete cascade on update cascade);

create table customer(
customer_name varchar(30) primary key,
customer_street varchar(20),
customer_city varchar(20));

create table depositor(
customer_name varchar(30),
accno int,
primary key(customer_name ,accno),
foreign key (accno) references accounts(accno) on delete cascade on update cascade,
foreign key (customer_name) references customer(customer_name) on delete cascade on update
cascade);

create table loan(
loan_number int primary key,
branch_name varchar(30),
amount real,
foreign key (branch_name) references branch(branch_name)
);

create table borrower (
customer_name varchar(30),
loan_number int,
primary key(customer_name, loan_number),
foreign key (customer_name) references customer(customer_name) on delete cascade on update cascade,
foreign key (loan_number) references loan(loan_number) on delete cascade on update cascade);

