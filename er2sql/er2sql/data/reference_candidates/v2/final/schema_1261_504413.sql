-- Source: https://github.com/ozluuh/devops-cp-dimdim-atm/blob/bd03e081d84d3a4f12bd6bf887c051029b1bd045/src/main/resources/schema.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE account (
    id int NOT NULL PRIMARY KEY,
    agency VARCHAR(10) NOT NULL,
    account_number VARCHAR(10) NOT NULL,
    balance DECIMAL(15, 2) NOT NULL,
    account_limit DECIMAL(7, 2) NOT NULL DEFAULT 0,
    account_type VARCHAR(10) NOT NULL
);

CREATE TABLE customer(
    id int PRIMARY KEY,
    name VARCHAR(25) not null,
    surname varchar(100) not null,
    sex char(1) null default 'X',
    account_id int NOT NULL,
    foreign key(account_id) references account(id)
);

CREATE TABLE bankstatement(
    id int NOT NULL primary key,
    transaction_type CHAR(1) NOT NULL,
    VALUE DECIMAL(15, 2) NOT NULL,
    balance DECIMAL(15, 2) NOT NULL,
    history VARCHAR(50),
    movement_date DATE,
    customer_id int NOT NULL,
    foreign key(customer_id) references customer(id)
);

