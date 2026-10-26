-- Source: https://github.com/Nikhilkansliwal1101/online-shopping-system-php/blob/843ecb3325e4e199d8090db480a3b473d66df8f6/Sql%20for%20Database.sql?raw=true
-- Tables detected: 10 | FK constraints: 5

CREATE TABLE `admin` (
  adminid int(11) NOT NULL,
  name varchar(50) NOT NULL,
  mobile varchar(12) NOT NULL,
  email varchar(50) NOT NULL,
  password varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE carousel (
  id int(11) NOT NULL,
  clable varchar(150) NOT NULL,
  cdisc varchar(250) NOT NULL,
  image varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE category (
  catid int(10) NOT NULL,
  catname varchar(40) NOT NULL,
  catdesc text NOT NULL,
  image varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE customer (
  custid int(11) NOT NULL,
  name varchar(30) NOT NULL,
  email varchar(40) NOT NULL,
  password varchar(250) NOT NULL,
  mobile varchar(12) NOT NULL,
  address varchar(80) NOT NULL,
  city varchar(20) NOT NULL,
  state varchar(20) NOT NULL,
  pincode int(10) NOT NULL,
  date datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE orderdiscription (
  orderid int(10) NOT NULL,
  productno int(10) NOT NULL,
  pname varchar(250) NOT NULL,
  quantity int(5) NOT NULL,
  cgst int(3) NOT NULL,
  sgst int(3) NOT NULL,
  mrp int(10) NOT NULL,
  sellprice int(10) NOT NULL,
  purchaseprice int(10) NOT NULL,
  supplierid int(11) NOT NULL,
  paymentid int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE orders (
  orderid int(10) NOT NULL,
  custid int(10) NOT NULL,
  orderdate datetime NOT NULL DEFAULT current_timestamp(),
  status varchar(10) NOT NULL,
  deliverydate date DEFAULT NULL,
  amount int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE payment (
  paymentid int(11) NOT NULL,
  supplierid int(11) NOT NULL,
  amount int(11) NOT NULL,
  date datetime NOT NULL DEFAULT current_timestamp(),
  paid datetime DEFAULT NULL,
  collected datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE product (
  productno int(10) NOT NULL,
  productid varchar(250) NOT NULL,
  image varchar(80) NOT NULL,
  subcatid int(10) DEFAULT NULL,
  available int(10) NOT NULL,
  purchaseprice float NOT NULL,
  mrp float NOT NULL,
  sellprice float NOT NULL,
  offer varchar(250) NOT NULL,
  cgst float NOT NULL,
  sgst float NOT NULL,
  sold int(11) NOT NULL DEFAULT 0,
  supplierid int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE subcategory (
  subcatid int(10) NOT NULL,
  name varchar(40) NOT NULL,
  catid int(10) DEFAULT NULL,
  image varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE supplier (
  supplierid int(11) NOT NULL,
  name varchar(60) NOT NULL,
  mobile varchar(12) NOT NULL,
  email varchar(60) NOT NULL,
  password varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE orderdiscription
  ADD CONSTRAINT orderdiscription_ibfk_1 FOREIGN KEY (orderid) REFERENCES `orders` (orderid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE orders
  ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (custid) REFERENCES customer (custid);

ALTER TABLE payment
  ADD CONSTRAINT payment_ibfk_1 FOREIGN KEY (supplierid) REFERENCES supplier (supplierid);

ALTER TABLE product
  ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (subcatid) REFERENCES subcategory (subcatid) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE subcategory
  ADD CONSTRAINT subcategory_ibfk_1 FOREIGN KEY (catid) REFERENCES category (catid) ON DELETE SET NULL ON UPDATE SET NULL;

