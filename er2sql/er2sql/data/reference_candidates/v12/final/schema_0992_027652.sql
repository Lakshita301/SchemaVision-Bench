-- Source: https://github.com/SanjeevKumar018/DBMS/blob/c1a1ab593279a577a1a7d060748bdae93b92a79a/order%20processing.sql?raw=true
-- Tables detected: 3 | FK constraints: 3

create table salesman(
salesman_id int,
sname varchar(15), 
city varchar(15),
commission  int,
primary key(salesman_id));

create table CUSTOMER (Customer_id int,
 Cust_Name varchar(15),
 City varchar(15),
 Grade int,
 Salesman_id int,
 primary key(Customer_id),
 foreign key (Salesman_id) references salesman(Salesman_id) on delete cascade);

create table ORDERS (Ord_No int,
Purchase_Amt int,
Ord_Date varchar(15), 
Customer_id int, 
Salesman_id int,
primary key(Ord_No),
foreign key (Salesman_id) references salesman(Salesman_id) on delete cascade,
foreign key (Customer_id) references CUSTOMER(Customer_id) on delete cascade);

