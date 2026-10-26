-- Source: https://github.com/Nikhilkansliwal1101/online-shopping-system-php/blob/843ecb3325e4e199d8090db480a3b473d66df8f6/Sql%20for%20Database.sql?raw=true
-- Tables detected: 10 | FK constraints: 5
CREATE TABLE admin (
    adminid int NOT NULL,
    name varchar(50) NOT NULL,
    mobile varchar(12) NOT NULL,
    email varchar(50) NOT NULL,
    password varchar(255) NOT NULL
);
CREATE TABLE carousel (
    id int NOT NULL,
    clable varchar(150) NOT NULL,
    cdisc varchar(250) NOT NULL,
    image varchar(150) NOT NULL
);
CREATE TABLE category (
    catid int NOT NULL,
    catname varchar(40) NOT NULL,
    catdesc text NOT NULL,
    image varchar(40) NOT NULL
);
CREATE TABLE customer (
    custid int NOT NULL,
    name varchar(30) NOT NULL,
    email varchar(40) NOT NULL,
    password varchar(250) NOT NULL,
    mobile varchar(12) NOT NULL,
    address varchar(80) NOT NULL,
    city varchar(20) NOT NULL,
    state varchar(20) NOT NULL,
    pincode int NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT current_timestamp()
);
CREATE TABLE orderdiscription (
    orderid int NOT NULL,
    productno int NOT NULL,
    pname varchar(250) NOT NULL,
    quantity int NOT NULL,
    cgst int NOT NULL,
    sgst int NOT NULL,
    mrp int NOT NULL,
    sellprice int NOT NULL,
    purchaseprice int NOT NULL,
    supplierid int NOT NULL,
    paymentid int DEFAULT NULL
);
CREATE TABLE orders (
    orderid int NOT NULL,
    custid int NOT NULL,
    orderdate TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    status varchar(10) NOT NULL,
    deliverydate date DEFAULT NULL,
    amount int NOT NULL DEFAULT 0
);
CREATE TABLE payment (
    paymentid int NOT NULL,
    supplierid int NOT NULL,
    amount int NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    paid TIMESTAMP DEFAULT NULL,
    collected TIMESTAMP DEFAULT NULL
);
CREATE TABLE product (
    productno int NOT NULL,
    productid varchar(250) NOT NULL,
    image varchar(80) NOT NULL,
    subcatid int DEFAULT NULL,
    available int NOT NULL,
    purchaseprice REAL NOT NULL,
    mrp REAL NOT NULL,
    sellprice REAL NOT NULL,
    offer varchar(250) NOT NULL,
    cgst REAL NOT NULL,
    sgst REAL NOT NULL,
    sold int NOT NULL DEFAULT 0,
    supplierid int NOT NULL
);
CREATE TABLE subcategory (
    subcatid int NOT NULL,
    name varchar(40) NOT NULL,
    catid int DEFAULT NULL,
    image varchar(40) NOT NULL
);
CREATE TABLE supplier (
    supplierid int NOT NULL,
    name varchar(60) NOT NULL,
    mobile varchar(12) NOT NULL,
    email varchar(60) NOT NULL,
    password varchar(255) NOT NULL
);
ALTER TABLE orderdiscription ADD CONSTRAINT orderdiscription_ibfk_1 FOREIGN KEY (orderid) REFERENCES orders (orderid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE orders ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (custid) REFERENCES customer (custid);
ALTER TABLE payment ADD CONSTRAINT payment_ibfk_1 FOREIGN KEY (supplierid) REFERENCES supplier (supplierid);
ALTER TABLE product ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (subcatid) REFERENCES subcategory (subcatid) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE subcategory ADD CONSTRAINT subcategory_ibfk_1 FOREIGN KEY (catid) REFERENCES category (catid) ON DELETE SET NULL ON UPDATE SET NULL;
