-- Source: https://github.com/simenfuglestad/school/blob/b9b169caf09477a988dc04b3fe6c72d51d016c81/archive/essex/ce154_web_dev/assignment/MySQL/script.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 12
CREATE TABLE inventory_group (
    group_code INT NOT NULL AUTO_INCREMENT,
    group_name VARCHAR(20),
    PRIMARY KEY(group_code)
);

CREATE TABLE inventory (
    item_code CHAR(8) NOT NULL,
    item_name VARCHAR(40),
    item_description VARCHAR(140),
    item_author VARCHAR (60),
    item_image_loc VARCHAR(140),
    item_group INT,
    item_price DECIMAL(10,2),
    item_stock_location VARCHAR (10),
    item_stock_count INT,
    item_order_count INT,
    PRIMARY KEY(item_code),
    FOREIGN KEY(item_group) REFERENCES inventory_group(group_code) ON DELETE SET NULL
);

CREATE TABLE customer (
    customer_number INT NOT NULL AUTO_INCREMENT,
    surname VARCHAR(40),
    initials VARCHAR(10),
    firstname VARCHAR(40),
    title ENUM('Mr', 'Mrs', 'Miss', 'Ms', 'Dr', 'Prof', 'Rev'),
    address1 VARCHAR(60),
    address2 VARCHAR(60),
    city VARCHAR(30),
    county VARCHAR(30),
    postcode VARCHAR(8),
    passwd VARCHAR(128),
    passphrase VARCHAR(128),
    PRIMARY KEY(customer_number)
);

CREATE TABLE customer_order (
    order_number INT NOT NULL AUTO_INCREMENT,
    order_date TIMESTAMP NOT NULL,
    delivered BOOLEAN,
    shipping_date TIMESTAMP,
    customer_number INT NOT NULL,
    PRIMARY KEY(order_number),
    FOREIGN KEY(customer_number) REFERENCES customer(customer_number) ON DELETE CASCADE
);

CREATE TABLE order_item (
    item_code CHAR(8) NOT NULL,
    value DECIMAL(10,2),
    order_number INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(item_code, order_number),
    FOREIGN KEY(order_number) REFERENCES customer_order(order_number) ON DELETE CASCADE,
    FOREIGN KEY(item_code) REFERENCES inventory(item_code)
);

CREATE TABLE manager (
    manager_number INT NOT NULL,
    surname VARCHAR(40),
    initials VARCHAR(10),
    firstname VARCHAR(40),
    passwd VARCHAR(128),
    passphrase VARCHAR(128),
    PRIMARY KEY(manager_number)
);

CREATE TABLE review (
    review_number INT NOT NULL AUTO_INCREMENT,
    customer_number INT,
    item_code CHAR(8),
    rating INT NOT NULL DEFAULT 3,
    PRIMARY KEY(review_number),
    UNIQUE(customer_number,item_code),
    FOREIGN KEY(customer_number) REFERENCES customer(customer_number) ON DELETE SET NULL,
    FOREIGN KEY(item_code) REFERENCES inventory(item_code) ON DELETE CASCADE
);

CREATE TABLE promotion_code (
    code VARCHAR(20),
    discount INT NOT NULL DEFAULT 0,
    PRIMARY KEY(code)
);
