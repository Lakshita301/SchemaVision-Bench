-- Source: https://github.com/pranavkhuranaa/Brute-Force-Attack-Security/blob/0abfd4969269e6d1499124aec6d3e7a4dd7e6071/code-bank-management-system/Extra/new_db.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 14
create table Accounts (
    Account_No varchar(25) not null,
    customer_ID int not null,
    acc_status varchar(25) not null,
    acc_open_date date not null,
    account_type varchar(25) not null,
    account_balance decimal(10,2) not null,
    primary key(Account_No)
);
create table Branch(
    IFS_code varchar(25) not null,
    Branch_Name varchar(25) not null,
    City varchar(25) not null,
    Branch_Address varchar(25) not null,
    State varchar(25) not null,
    Country varchar(25) not null,
    PIN_Code varchar(25) not null,
    primary key(IFS_code)
);
create table Account_Master (
    Account_Type varchar(25) not null,
    prefix varchar(25) not null,
    Min_balance decimal(10,2) not null,
    interest decimal(10,2) not null,
    primary key (Account_Type)
);
create table Customer (
    CustomerID int not null,
    IFS_Code varchar(25) not null,
    F_Name varchar(25) not null,
    L_Name varchar(25) not null,
    Login_ID varchar(25) not null,
    Acc_Pass varchar(25) not null,
    Trans_Pass varchar(25) not null,
    Acc_Status varchar(25) not null,
    City varchar(25) not null,
    State varchar(25) not null,
    Country varchar(25) not null,
    Acc_Open_Date date not null,
    Last_Login TIMESTAMP not null,
    primary key(CustomerID)
);
create table Employee (
    Emp_ID int not null,
    Emp_Name varchar(25) not null,
    Login_ID varchar(25) not null,
    password varchar(25) not null,
    Email_ID varchar(25) not null,
    Contact_No varchar(25) not null,
    Create_Date date not null,
    Last_Login TIMESTAMP not null,
    primary key(Emp_ID)
);
create table Loan (
    Loan_ID int not null,
    Loan_Type varchar(25) not null,
    Loan_Amount varchar(25) not null,
    Customer_ID int not null,
    Interest REAL not null,
    Start_Date date not null,
    primary key(Loan_ID)
);
create table Loan_Payment (
    Payment_ID int not null,
    Date date not null,
    Paid_Amount REAL not null,
    Principle_Amount REAL not null,
    Balance REAL not null,
    primary key(Payment_ID)
);
create table Loan_Type (
    Loan_Type varchar(25) not null,
    prefix varchar(25) not null,
    Max_Amount REAL not null,
    Min_Amount REAL not null,
    Interest REAL not null,
    status varchar(25) not null
);
create table Register_Payee (
    SL_No decimal(11,0) not null,
    Payee_Name varchar(25) not null,
    Account_No varchar(25) not null,
    Account_Type varchar(25) not null,
    Bank_Name varchar(25) not null,
    IFS_Code varchar(25) not null,
    primary key(SL_No)
);
create table Transactions (
    Transaction_ID int not null,
    Payment_Date TIMESTAMP not null,
    Payee_ID int not null,
    Recieve_ID int not null,
    Amount decimal(10,0) not null,
    Payment_State text not null,
    primary key(Transaction_ID)
);
ALTER TABLE Accounts ADD constraint fk1_Accounts foreign key (Customer_ID) references Customer(CustomerID);
ALTER TABLE Customer ADD constraint fk1_Customer foreign key (IFS_Code) references Branch(IFS_code);
ALTER TABLE Loan ADD constraint fk1_Loan foreign key (Customer_ID) references Customer(CustomerID);
ALTER TABLE Register_Payee ADD constraint fk1_Register_Payee foreign key (Account_No) references Accounts(Account_No);
ALTER TABLE Register_Payee ADD constraint fk2_Register_Payee foreign key (IFS_Code) references Branch(IFS_Code);
ALTER TABLE Transactions ADD constraint fk1_Transactions foreign key (Payee_ID) references Customer(CustomerID);
ALTER TABLE Transactions ADD constraint fk2_Transactions foreign key (Recieve_ID) references Customer(CustomerID);
