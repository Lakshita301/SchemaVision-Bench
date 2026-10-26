-- Source: https://github.com/C1120G1-HoangLeQuang/C1120G1-HoangLeQuang/blob/74d860cd4b0dc02b2d790e1bae4aee08fd4b9bf2/module3/ngay_2_ERD/bai_tap/bai_tap_2.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 16

create table productlines(
product_line varchar(50) not null primary key,
text_description varchar(50),
image varchar(50)
);

create table offices(
office_code varchar(10) not null primary key,
city varchar(50) not null,
phone varchar(50) not null,
address_lines1 varchar(50) not null,
address_line2 varchar(50),
states varchar(50),
country varchar(50) not null,
postal_code varchar(50) not null
);

create table employees(
employee_number int not null primary key,
lastname varchar(50) not null,
firstname varchar(50) not null,
email varchar(100) not null,
job_title varchar(50) not null,
report_to int,
foreign key(report_to) references employees(employee_number),
office_code varchar(10) not null,
foreign key(office_code) references offices(office_code)
);

create table customers(
customer_number int Not null auto_increment primary key,
customer_name varchar(50) not null,
contact_lastname varchar(50) not null,
contact_firstname varchar(50) not null,
phone varchar(50) not null,
address_line1 varchar(50) not null,
address_line2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
postal_code varchar(15) not null,
country varchar(50) not null,
credit_limit float not null,
salesRepEmployeeNumber int not null,
foreign key(salesRepEmployeeNumber) references employees(employee_number)
);

create table payments(
customer_number int not null, 
foreign key (customer_number) references customers(customer_number),
check_number varchar(50) not null,
payment_date date not null,
amount float not null
);

create table orders(
order_number int not null auto_increment primary key,
order_date date not null,
require_date date not null,
shipped_date date not null,
status varchar(15) not null,
commments text,
quantity_order int not null,
price_each float not null,
customer_number int Not null,
foreign key(customer_number) references customers(customer_number)
);

create table products(
product_code varchar(15) not null primary key,
product_name varchar(70) not null,
product_scale varchar(10) not null,
product_vender varchar(50) not null,
product_description text not null, 
quantity_stock int not null,
buy_price float not null,
MSRP float not null,
product_line varchar(50) not null,
foreign key(product_line) references productlines(product_line)
);

create table orderdetail(
product_code varchar(15) not null,
order_number int not null auto_increment,
primary key(product_code,order_number),
foreign key(product_code) references products(product_code),
foreign key(order_number) references orders(order_number)
);

