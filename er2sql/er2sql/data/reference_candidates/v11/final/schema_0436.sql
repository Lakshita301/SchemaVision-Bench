-- Source: https://github.com/ansariawais1/online-shoppping-site/blob/f545ca2bf94dde98d929908f88b19c2a832562bc/database/onlineshop.sql?raw=true
-- Tables detected: 12 | FK/REFERENCES mentions: 3
CREATE TABLE admin_info (
    admin_id int NOT NULL,
    admin_name varchar(100) NOT NULL,
    admin_email varchar(300) NOT NULL,
    admin_password varchar(300) NOT NULL
);
CREATE TABLE brands (
    brand_id int NOT NULL,
    brand_title text NOT NULL
);
CREATE TABLE cart (
    id int NOT NULL,
    p_id int NOT NULL,
    ip_add varchar(250) NOT NULL,
    user_id int DEFAULT NULL,
    qty int NOT NULL
);
CREATE TABLE categories (
    cat_id int NOT NULL,
    cat_title text NOT NULL
);
CREATE TABLE email_info (
    email_id int NOT NULL,
    email text NOT NULL
);
CREATE TABLE logs (
    id int NOT NULL,
    user_id varchar(50) NOT NULL,
    action varchar(50) NOT NULL,
    date TIMESTAMP NOT NULL
);
CREATE TABLE orders (
    order_id int NOT NULL,
    user_id int NOT NULL,
    product_id int NOT NULL,
    qty int NOT NULL,
    trx_id varchar(255) NOT NULL,
    p_status varchar(20) NOT NULL
);
CREATE TABLE orders_info (
    order_id int NOT NULL,
    user_id int NOT NULL,
    f_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    city varchar(255) NOT NULL,
    state varchar(255) NOT NULL,
    zip int NOT NULL,
    cardname varchar(255) NOT NULL,
    cardnumber varchar(20) NOT NULL,
    expdate varchar(255) NOT NULL,
    prod_count int DEFAULT NULL,
    total_amt int DEFAULT NULL,
    cvv int NOT NULL
);
CREATE TABLE order_products (
    order_pro_id int NOT NULL,
    order_id int NOT NULL,
    product_id int NOT NULL,
    qty int DEFAULT NULL,
    amt int DEFAULT NULL
);
CREATE TABLE products (
    product_id int NOT NULL,
    product_cat int NOT NULL,
    product_brand int NOT NULL,
    product_title varchar(255) NOT NULL,
    product_price int NOT NULL,
    product_desc text NOT NULL,
    product_image text NOT NULL,
    product_keywords text NOT NULL
);
CREATE TABLE user_info (
    user_id int NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(300) NOT NULL,
    password varchar(300) NOT NULL,
    mobile varchar(10) NOT NULL,
    address1 varchar(300) NOT NULL,
    address2 varchar(11) NOT NULL
);
CREATE TABLE user_info_backup (
    user_id int NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(300) NOT NULL,
    password varchar(300) NOT NULL,
    mobile varchar(10) NOT NULL,
    address1 varchar(300) NOT NULL,
    address2 varchar(11) NOT NULL
);
ALTER TABLE orders_info ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES user_info (user_id);
ALTER TABLE order_products ADD CONSTRAINT order_products FOREIGN KEY (order_id) REFERENCES orders_info (order_id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE order_products ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES products (product_id);
