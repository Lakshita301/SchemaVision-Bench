-- Source: https://github.com/Warlokk/Aqa3.2.2/blob/b5f24d867b2f394976e5653ab1dd00d2d7dc2908/src/test/resources/schema.sql?raw=true
-- Tables detected: 4 | FK constraints: 2

CREATE TABLE users
(
    id       CHAR(36) PRIMARY KEY,
    login    VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255)        NOT NULL,
    status   VARCHAR(255)        NOT NULL DEFAULT 'active'
);

CREATE TABLE cards
(
    id                 CHAR(36) PRIMARY KEY,
    user_id            CHAR(36)           NOT NULL,
    number             VARCHAR(19) UNIQUE NOT NULL,
    balance_in_kopecks INT                NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE auth_codes
(
    id      CHAR(36) PRIMARY KEY,
    user_id CHAR(36)   NOT NULL,
    code    VARCHAR(6) NOT NULL,
    created TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE card_transactions
(
    id                CHAR(36) PRIMARY KEY,
    source            VARCHAR(19) NOT NULL,
    target            VARCHAR(19) NOT NULL,
    amount_in_kopecks INT         NOT NULL,
    created           TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

