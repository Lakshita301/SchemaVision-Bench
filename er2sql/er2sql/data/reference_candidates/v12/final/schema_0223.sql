-- Source: https://github.com/PhuongBland/HeQTCSDL/blob/1791dca8d86d0222c4354ee363f3ce52e4015878/Lab03/1812828_Lab03.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 8
CREATE TABLE offices (
    officecode varchar(10) NOT NULL,
    city varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressline1 varchar(50) NOT NULL,
    addressline2 varchar(50) DEFAULT NULL,
    state varchar(50) DEFAULT NULL,
    country varchar(50) NOT NULL,
    postalcode varchar(15) NOT NULL,
    territory varchar(10) NOT NULL,
    PRIMARY KEY (officecode)
);

CREATE TABLE employees (
    employeenumber int NOT NULL,
    lastname varchar(50) NOT NULL,
    firstname varchar(50) NOT NULL,
    extension varchar(10) NOT NULL,
    email varchar(100) NOT NULL,
    officecode varchar(10) NOT NULL,
    reportsto int DEFAULT NULL,
    jobtitle varchar(50) NOT NULL,
    PRIMARY KEY (employeenumber),
    CONSTRAINT employees_ibfk_1 FOREIGN KEY (reportsto) REFERENCES employees (employeenumber),
    CONSTRAINT employees_ibfk_2 FOREIGN KEY (officecode) REFERENCES offices (officecode)
);

CREATE TABLE productlines (
    productline varchar(50) NOT NULL,
    textdescription varchar(4000) DEFAULT NULL,
    htmldescription TEXT,
    image BYTEA,
    PRIMARY KEY (productline)
);

CREATE TABLE products (
    productcode varchar(15) NOT NULL,
    productname varchar(70) NOT NULL,
    productline varchar(50) NOT NULL,
    productscale varchar(10) NOT NULL,
    productvendor varchar(50) NOT NULL,
    productdescription text NOT NULL,
    quantityinstock smallint NOT NULL,
    buyprice decimal(10,2) NOT NULL,
    msrp decimal(10,2) NOT NULL,
    PRIMARY KEY (productcode),
    CONSTRAINT products_ibfk_1 FOREIGN KEY (productline) REFERENCES productlines (productline)
);

CREATE TABLE customers (
    customernumber int NOT NULL,
    customername varchar(50) NOT NULL,
    contactlastname varchar(50) NOT NULL,
    contactfirstname varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressline1 varchar(50) NOT NULL,
    addressline2 varchar(50) DEFAULT NULL,
    city varchar(50) NOT NULL,
    state varchar(50) DEFAULT NULL,
    postalcode varchar(15) DEFAULT NULL,
    country varchar(50) NOT NULL,
    salesrepemployeenumber int DEFAULT NULL,
    creditlimit decimal(10,2) DEFAULT NULL,
    PRIMARY KEY (customernumber),
    CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesrepemployeenumber) REFERENCES employees (employeenumber)
);

CREATE TABLE orders (
    ordernumber int NOT NULL,
    orderdate date NOT NULL,
    requireddate date NOT NULL,
    shippeddate date DEFAULT NULL,
    status varchar(15) NOT NULL,
    comments text,
    customernumber int NOT NULL,
    PRIMARY KEY (ordernumber),
    CONSTRAINT orders_ibfk_1 FOREIGN KEY (customernumber) REFERENCES customers (customernumber)
);

CREATE TABLE orderdetails (
    ordernumber int NOT NULL,
    productcode varchar(15) NOT NULL,
    quantityordered int NOT NULL,
    priceeach decimal(10,2) NOT NULL,
    orderlinenumber smallint NOT NULL,
    PRIMARY KEY (ordernumber,productcode),
    CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (ordernumber) REFERENCES orders (ordernumber),
    CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (productcode) REFERENCES products (productcode)
);

CREATE TABLE payments (
    customernumber int NOT NULL,
    checknumber varchar(50) NOT NULL,
    paymentdate date NOT NULL,
    amount decimal(10,2) NOT NULL,
    PRIMARY KEY (customernumber,checknumber),
    CONSTRAINT payments_ibfk_1 FOREIGN KEY (customernumber) REFERENCES customers (customernumber)
);
CREATE INDEX ON employees (reportsto);
CREATE INDEX ON employees (officecode);
CREATE INDEX ON products (productline);
CREATE INDEX ON customers (salesrepemployeenumber);
CREATE INDEX ON orders (customernumber);
CREATE INDEX ON orderdetails (productcode);
