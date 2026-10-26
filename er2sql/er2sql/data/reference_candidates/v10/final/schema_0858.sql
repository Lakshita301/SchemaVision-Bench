-- Source: https://github.com/Samadmemon991/WholeSale-market-App/blob/58a83c17c42d68a07d26cc03929284932550440b/Database/db_project.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 4
-- Foreign keys added via ALTER TABLE:
CREATE TABLE category (
    catid int NOT NULL,
    categoryname varchar(255) CHARACTER SET latin1 NOT NULL,
    image varchar(300) CHARACTER SET latin1 DEFAULT NULL
);

CREATE TABLE customer (
    id int NOT NULL,
    c_name varchar(255) CHARACTER SET latin1 DEFAULT NULL,
    username varchar(50) CHARACTER SET latin1 NOT NULL,
    c_phone varchar(255) CHARACTER SET latin1 DEFAULT NULL,
    c_cnic varchar(13) CHARACTER SET latin1 DEFAULT NULL,
    c_debtcard varchar(20) CHARACTER SET latin1 DEFAULT NULL,
    address varchar(40) CHARACTER SET latin1 DEFAULT NULL,
    c_pass varchar(8) CHARACTER SET latin1 DEFAULT NULL,
    status varchar(5) CHARACTER SET latin1 DEFAULT NULL
);

CREATE TABLE orders (
    id int NOT NULL,
    customer_id int NOT NULL,
    orderdate date NOT NULL
);

CREATE TABLE order_details (
    id int NOT NULL,
    order_id int NOT NULL,
    product_id int NOT NULL
);

CREATE TABLE products (
    id int NOT NULL,
    categoryid int NOT NULL,
    product_name varchar(255) CHARACTER SET latin1 NOT NULL,
    product_sprice int NOT NULL,
    product_bprice varchar(20) CHARACTER SET latin1 NOT NULL,
    product_qty int NOT NULL,
    min_qty int NOT NULL,
    shipment_date date DEFAULT NULL
);


                          

ALTER TABLE orders
  ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE order_details
  ADD CONSTRAINT order_details_ibfk_1 FOREIGN KEY (order_id) REFERENCES orders (id),
  ADD CONSTRAINT order_details_ibfk_2 FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE products
  ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (categoryid) REFERENCES category (catid);
