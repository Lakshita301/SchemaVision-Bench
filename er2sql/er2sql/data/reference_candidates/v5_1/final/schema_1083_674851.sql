-- Source: https://github.com/mastermindharsh/Food-Ordering-System/blob/a6d74773d858726d979a474ab4fe1d029ca68f40/sql/food.sql?raw=true
-- Tables detected: 8 | FK constraints: 8
CREATE TABLE items (
    id int NOT NULL,
    name varchar(20) NOT NULL,
    price int NOT NULL,
    deleted SMALLINT NOT NULL DEFAULT '0'
);
CREATE TABLE orders (
    id int NOT NULL,
    customer_id int NOT NULL,
    address varchar(300) NOT NULL,
    description varchar(300) NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_type varchar(16) NOT NULL DEFAULT 'Wallet',
    total int NOT NULL,
    status varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
    deleted SMALLINT NOT NULL DEFAULT '0'
);
CREATE TABLE order_details (
    id int NOT NULL,
    order_id int NOT NULL,
    item_id int NOT NULL,
    quantity int NOT NULL,
    price int NOT NULL
);
CREATE TABLE tickets (
    id int NOT NULL,
    poster_id int NOT NULL,
    subject varchar(100) NOT NULL,
    description varchar(3000) NOT NULL,
    status varchar(8) NOT NULL DEFAULT 'Open',
    type varchar(30) NOT NULL DEFAULT 'Others',
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted SMALLINT NOT NULL DEFAULT '0'
);
CREATE TABLE ticket_details (
    id int NOT NULL,
    ticket_id int NOT NULL,
    user_id int NOT NULL,
    description varchar(1000) NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE users (
    id int NOT NULL,
    role varchar(15) NOT NULL DEFAULT 'Customer',
    name varchar(15) NOT NULL,
    username varchar(10) NOT NULL,
    password varchar(16) NOT NULL,
    email varchar(35) NULL,
    address varchar(300) NULL,
    contact bigint NOT NULL,
    verified SMALLINT NOT NULL DEFAULT '0',
    deleted SMALLINT NOT NULL DEFAULT '0'
);
CREATE TABLE wallet (
    id int NOT NULL,
    customer_id int NOT NULL
);
CREATE TABLE wallet_details (
    id int NOT NULL,
    wallet_id int NOT NULL,
    number varchar(16) NOT NULL,
    cvv int NOT NULL,
    balance int NOT NULL DEFAULT '2000'
);
ALTER TABLE orders ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (customer_id) REFERENCES users (id);
ALTER TABLE order_details ADD CONSTRAINT order_details_ibfk_1 FOREIGN KEY (item_id) REFERENCES items (id);
ALTER TABLE order_details ADD CONSTRAINT order_details_ibfk_2 FOREIGN KEY (order_id) REFERENCES orders (id);
ALTER TABLE tickets ADD CONSTRAINT tickets_ibfk_1 FOREIGN KEY (poster_id) REFERENCES users (id);
ALTER TABLE ticket_details ADD CONSTRAINT ticket_details_ibfk_1 FOREIGN KEY (ticket_id) REFERENCES tickets (id);
ALTER TABLE ticket_details ADD CONSTRAINT ticket_details_ibfk_2 FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE wallet ADD CONSTRAINT wallet_ibfk_1 FOREIGN KEY (customer_id) REFERENCES users (id);
ALTER TABLE wallet_details ADD CONSTRAINT wallet_details_ibfk_1 FOREIGN KEY (wallet_id) REFERENCES wallet (id);
