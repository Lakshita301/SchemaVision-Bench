-- Source: https://github.com/lomahs/A0121I1---BuiThanhBao/blob/e46ae96358718b7ff51f45b29e1cfba4a1698a62/Module%203/3.%20Thao%20t%C3%A1c%20v%E1%BB%9Bi%20CSDL/Th%E1%BB%B1c%20h%C3%A0nh/Truy%20v%E1%BA%A5n%20d%E1%BB%AF%20li%E1%BB%87u%20t%E1%BB%AB%20nhi%E1%BB%81u%20b%E1%BA%A3ng/car_shop_management.sql?raw=true
-- Tables detected: 7 | FK constraints: 6
CREATE TABLE customer (
    cusnumber int NOT NULL,
    cusname varchar(50) NOT NULL,
    contactlastname varchar(50) NOT NULL,
    contactfirstname varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressline1 varchar(50) NOT NULL,
    addressline2 varchar(50) DEFAULT NULL,
    city varchar(50) NOT NULL,
    state varchar(50) NOT NULL,
    postalcode varchar(15) NOT NULL,
    country varchar(50) NOT NULL,
    creditlimit DOUBLE PRECISION DEFAULT NULL,
    salesrepemployeenumber int NOT NULL,
    PRIMARY KEY (cusnumber)
);

CREATE TABLE employee (
    employeenumber int NOT NULL,
    lastname varchar(50) NOT NULL,
    firstname varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    jobtitle varchar(50) NOT NULL,
    reportto int NOT NULL,
    officecode varchar(10) NOT NULL,
    PRIMARY KEY (employeenumber)
);

CREATE TABLE office (
    officecode varchar(10) NOT NULL,
    city varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressline1 varchar(50) NOT NULL,
    addressline2 varchar(50) DEFAULT NULL,
    state varchar(50) DEFAULT NULL,
    country varchar(50) NOT NULL,
    postalcode varchar(15) NOT NULL,
    PRIMARY KEY (officecode)
);

CREATE TABLE "order" (
    ordernumber int NOT NULL,
    orderdate date NOT NULL,
    requireddate date NOT NULL,
    shippeddate date DEFAULT NULL,
    status varchar(15) NOT NULL,
    comments text,
    quantityordered int NOT NULL,
    priceeach DOUBLE PRECISION NOT NULL,
    cusnumber int NOT NULL,
    PRIMARY KEY (ordernumber)
);

CREATE TABLE payment (
    cusnumber int NOT NULL,
    checknumber varchar(50) NOT NULL,
    paymentdate date NOT NULL,
    amount DOUBLE PRECISION NOT NULL
);

CREATE TABLE product (
    productcode varchar(15) NOT NULL,
    productname varchar(70) NOT NULL,
    productscale varchar(10) NOT NULL,
    productline varchar(50) NOT NULL,
    productvendor varchar(50) NOT NULL,
    productdescription text NOT NULL,
    quantityinstock int NOT NULL,
    buyprice DOUBLE PRECISION NOT NULL,
    msrp DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (productcode)
);

CREATE TABLE productline (
    productline varchar(50) NOT NULL,
    textdescription text,
    image text,
    PRIMARY KEY (productline)
);
ALTER TABLE customer ADD CONSTRAINT customer_ibfk_1 FOREIGN KEY (salesrepemployeenumber) REFERENCES employee (employeenumber);
ALTER TABLE employee ADD CONSTRAINT employee_ibfk_1 FOREIGN KEY (reportto) REFERENCES employee (employeenumber);
ALTER TABLE employee ADD CONSTRAINT employee_ibfk_2 FOREIGN KEY (officecode) REFERENCES office (officecode);
ALTER TABLE "order" ADD CONSTRAINT order_ibfk_1 FOREIGN KEY (cusnumber) REFERENCES customer (cusnumber);
ALTER TABLE payment ADD CONSTRAINT payment_ibfk_1 FOREIGN KEY (cusnumber) REFERENCES customer (cusnumber);
ALTER TABLE product ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (productline) REFERENCES productline (productline);
CREATE INDEX ON customer (salesrepemployeenumber);
CREATE INDEX ON employee (reportto);
CREATE INDEX ON employee (officecode);
CREATE INDEX ON "order" (cusnumber);
CREATE INDEX ON payment (cusnumber);
CREATE INDEX ON product (productline);
