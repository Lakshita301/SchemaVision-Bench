-- Source: https://github.com/crcrawfo1/Homework/blob/7f628673431d91d2ca0f865f280156fe3a26e9d3/Unit%207%20SQL/Schema.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 8
CREATE TABLE card_holder(
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE credit_card(
    card VARCHAR(20) PRIMARY KEY NOT NULL,
    id_card_holder INT,
    FOREIGN KEY (id_card_holder) REFERENCES card_holder(id)
);

CREATE TABLE merchant_category(
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE merchant(
    id int PRIMARY KEY NOT NULL,
    name VARCHAR(50),
    id_merchant_category INT,
    FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

CREATE TABLE transaction(
    id INT,
    date TIMESTAMP,
    amount REAL,
    card VARCHAR(20),
    FOREIGN KEY (card) REFERENCES credit_card(card),
    id_merchant INT,
    FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);
