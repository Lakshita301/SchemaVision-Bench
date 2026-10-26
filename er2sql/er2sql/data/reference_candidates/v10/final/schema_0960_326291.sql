-- Source: https://github.com/lnusfaumer/mercadoLiebreApi/blob/a994c35e03ef169063cbff966cc94e861dc08b29/mercadoliebre.sql?raw=true
-- Tables detected: 7 | FK constraints: 7
-- Foreign keys added via ALTER TABLE:
CREATE TABLE brands (
    id BIGINT NOT NULL,
    name varchar(255) NOT NULL,
    phone varchar(255) DEFAULT NULL,
    address varchar(255) DEFAULT NULL,
    createdat TIMESTAMP DEFAULT current_timestamp(),
    updatedat TIMESTAMP DEFAULT NULL(),
    deletedat TIMESTAMP DEFAULT NULL
);

CREATE TABLE carts (
    id BIGINT NOT NULL,
    ordernumber int NOT NULL,
    total decimal(10,0) NOT NULL,
    userid BIGINT NOT NULL,
    createdat TIMESTAMP DEFAULT current_timestamp(),
    updatedat TIMESTAMP DEFAULT NULL(),
    deletedat TIMESTAMP DEFAULT NULL
);

CREATE TABLE categories (
    id BIGINT NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(500) DEFAULT NULL,
    createdat TIMESTAMP DEFAULT current_timestamp(),
    updatedat TIMESTAMP DEFAULT NULL(),
    deletedat TIMESTAMP DEFAULT NULL
);

CREATE TABLE items (
    id BIGINT NOT NULL,
    saleprice decimal(10,0) NOT NULL,
    quantity int NOT NULL DEFAULT 1,
    subtotal int NOT NULL,
    state SMALLINT NOT NULL DEFAULT 1,
    productid BIGINT NOT NULL,
    userid BIGINT NOT NULL,
    sellerid int NOT NULL,
    cartid BIGINT DEFAULT NULL,
    createdat TIMESTAMP DEFAULT current_timestamp(),
    updatedat TIMESTAMP DEFAULT NULL(),
    deletedat TIMESTAMP DEFAULT NULL
);

CREATE TABLE products (
    id BIGINT NOT NULL,
    name varchar(255) NOT NULL,
    price decimal(10,0) NOT NULL,
    discount BIGINT DEFAULT 0,
    image varchar(255) NOT NULL,
    description TEXT NOT NULL,
    categoryid BIGINT NOT NULL,
    userid BIGINT NOT NULL,
    brandid BIGINT NOT NULL,
    createdat TIMESTAMP DEFAULT current_timestamp(),
    updatedat TIMESTAMP DEFAULT NULL(),
    deletedat TIMESTAMP DEFAULT NULL
);

CREATE TABLE tokens (
    id BIGINT NOT NULL,
    token varchar(255) NOT NULL,
    userid BIGINT NOT NULL,
    createdat TIMESTAMP DEFAULT current_timestamp(),
    updatedat TIMESTAMP DEFAULT NULL(),
    deletedat TIMESTAMP DEFAULT NULL
);

CREATE TABLE users (
    id BIGINT NOT NULL,
    admin SMALLINT NOT NULL DEFAULT 0,
    username varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    image varchar(255) DEFAULT NULL,
    createdat TIMESTAMP DEFAULT current_timestamp(),
    updatedat TIMESTAMP DEFAULT NULL(),
    deletedat TIMESTAMP DEFAULT NULL
);


                          

ALTER TABLE carts
  ADD CONSTRAINT carts_ibfk_1 FOREIGN KEY (userid) REFERENCES users (id);

ALTER TABLE items
  ADD CONSTRAINT items_ibfk_1 FOREIGN KEY (userid) REFERENCES users (id),
  ADD CONSTRAINT items_ibfk_2 FOREIGN KEY (cartid) REFERENCES carts (id);

ALTER TABLE products
  ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (userid) REFERENCES users (id),
  ADD CONSTRAINT products_ibfk_2 FOREIGN KEY (brandid) REFERENCES brands (id),
  ADD CONSTRAINT products_ibfk_3 FOREIGN KEY (categoryid) REFERENCES categories (id);

ALTER TABLE tokens
  ADD CONSTRAINT tokens_ibfk_1 FOREIGN KEY (userid) REFERENCES users (id);
