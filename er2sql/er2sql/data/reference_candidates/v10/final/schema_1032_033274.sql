-- Source: https://github.com/CameliaStinga/BDD/blob/d3ad49536cc473ddadea19b5686a6425989788de/results/database/dump.sql?raw=true
-- Tables detected: 5 | FK constraints: 4
-- Foreign keys added via ALTER TABLE:
CREATE TABLE categories (
    id int NOT NULL,
    name varchar(45) NOT NULL,
    description varchar(255) NOT NULL
);

CREATE TABLE customers (
    id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    postcode varchar(5) NOT NULL,
    city varchar(70) NOT NULL
);

CREATE TABLE orders (
    id int NOT NULL,
    date date NOT NULL,
    number varchar(10) NOT NULL,
    customer_id int NOT NULL
);

CREATE TABLE order_product (
    id int NOT NULL,
    product_id int NOT NULL,
    order_id int NOT NULL,
    quantity int NOT NULL
);

CREATE TABLE products (
    id int NOT NULL,
    name varchar(70) NOT NULL,
    price int NOT NULL,
    picture varchar(255) NOT NULL,
    weight int NOT NULL,
    quantity int NOT NULL,
    available SMALLINT NOT NULL,
    size int NOT NULL,
    categories_id int NOT NULL
);


                          

ALTER TABLE orders
  ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customers (id);

ALTER TABLE order_product
  ADD CONSTRAINT order_product_ibfk_1 FOREIGN KEY (products_id) REFERENCES products (id),
  ADD CONSTRAINT order_product_ibfk_2 FOREIGN KEY (orders_id) REFERENCES orders (id);

ALTER TABLE products
  ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (categories_id) REFERENCES categories (id);
