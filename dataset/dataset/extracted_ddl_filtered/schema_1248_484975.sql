-- Source: https://github.com/Lizaveta-CR/finalProjectJava_ST_2020/blob/20c40f6f0fdea01e39107c5462318e160d32e015/sql/3_create_tables.sql?raw=true
-- Tables detected: 11 | FK constraints: 10

CREATE TABLE users
(
    id       INTEGER                     NOT NULL AUTO_INCREMENT,
    login    VARCHAR(255)                NOT NULL,
    name     VARCHAR(255) DEFAULT 'user' NOT NULL,
    surname  VARCHAR(255) DEFAULT ''     NOT NULL,
    password CHAR(36)                    NOT NULL,
    /*
     * 0 - администратор (Role.ADMINISTRATOR)
     * 1 - менеджер (Role.MANAGER)
     * 2 - покупатель (Role.BUYER)
     */
    role     TINYINT                     NOT NULL CHECK (role IN (0, 1, 2)),
    CONSTRAINT UC_User UNIQUE (login),
    CONSTRAINT PK_User PRIMARY KEY (id)
);

CREATE TABLE buyers
(
    buyer_id  INTEGER                     NOT NULL,
    email     VARCHAR(255)                NOT NULL,
    telephone BIGINT(15)                  NOT NULL UNIQUE,
    balance   DECIMAL(10, 2),
    bonus     DECIMAL(10, 2) DEFAULT 0    NOT NULL,
#     for blocking
    enabled   BOOLEAN        DEFAULT true NOT NULL,
    CONSTRAINT PK_Buyer PRIMARY KEY (buyer_id),
    CONSTRAINT UC_User UNIQUE (email),
    CONSTRAINT FK_Buyer FOREIGN KEY (buyer_id) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE addresses
(
    buyer_id         INTEGER      NOT NULL,
    country_id       INTEGER      NOT NULL,
    city             VARCHAR(30)  NOT NULL,
    zip_code         INTEGER(10)  NOT NULL,
    street           VARCHAR(30)  NOT NULL,
    apartment_number INTEGER(100) NOT NULL,
    house_number     INTEGER(100),
    CONSTRAINT PK_Address PRIMARY KEY (buyer_id),
    CONSTRAINT FK_Address_Country FOREIGN KEY (country_id) REFERENCES countries (id)
        ON UPDATE CASCADE,
    CONSTRAINT FK_Address_Buyer FOREIGN KEY (buyer_id)
        REFERENCES buyers (buyer_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE products
(
    id          INTEGER                    NOT NULL AUTO_INCREMENT,
    category_id INTEGER                    NOT NULL,
    model       VARCHAR(50)                NOT NULL,
    available   BOOLEAN       DEFAULT TRUE NOT NULL,
    description VARCHAR(5000) DEFAULT '',
    img         VARCHAR(2083),
    price       DECIMAL(10, 2)             NOT NULL,
    CONSTRAINT PK_Product PRIMARY KEY (id),
    CONSTRAINT UNX_Product UNIQUE (model),
    CONSTRAINT FK_Product_Category
        FOREIGN KEY (category_id) REFERENCES categories (id)
            ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE producers
(
    id         INTEGER      NOT NULL AUTO_INCREMENT,
    name       VARCHAR(255) NOT NULL,
    country_id INTEGER      NOT NULL,
    CONSTRAINT PK_Producer PRIMARY KEY (id),
    CONSTRAINT UNX_Producer UNIQUE (name, country_id),
    CONSTRAINT FK_Producer_Country FOREIGN KEY (country_id) REFERENCES countries (id)
        ON UPDATE CASCADE
) ENGINE = INNODB
  DEFAULT CHARACTER
      SET utf8;

CREATE table orders
(
    id       INTEGER        NOT NULL AUTO_INCREMENT,
    buyer_id INTEGER        NOT NULL,
    date     DATE,
    price    DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_Order PRIMARY KEY (id),
    CONSTRAINT UC_Order UNIQUE (id, buyer_id),
    CONSTRAINT FK_Order_Buyer FOREIGN KEY (buyer_id) REFERENCES buyers (buyer_id)
);

CREATE TABLE order_items
(
    id         INTEGER        NOT NULL,
    product_id INTEGER        NOT NULL,
    price      DECIMAL(10, 2) NOT NULL,
    amount     TINYINT        NOT NULL,
    CONSTRAINT PK_OrderItem PRIMARY KEY (id, product_id),
    CONSTRAINT CHK_OrderItems_Amount CHECK ( amount > 0 ),
    CONSTRAINT FK_OrderItem_Order
        FOREIGN KEY FK_Order (id) REFERENCES orders (id)
            ON
                UPDATE CASCADE
            ON
                DELETE CASCADE,
    CONSTRAINT FK_OrderItem_Product
        FOREIGN KEY (product_id) REFERENCES products (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE producer_items
(
    producer_id INTEGER NOT NULL,
    product_id  INTEGER NOT NULL,
    CONSTRAINT PK_ProducerItem PRIMARY KEY (producer_id, product_id),
    CONSTRAINT FK_ProducerItem_Producer
        FOREIGN KEY FK_Order (producer_id) REFERENCES producers (id)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    CONSTRAINT FK_ProducerItem_Product
        FOREIGN KEY FK_Product (product_id) REFERENCES products (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE product_rates
(
    id         INTEGER AUTO_INCREMENT NOT NULL,
    mark       TINYINT                NOT NULL,
    product_id INTEGER                NOT NULL,
    buyer_id   INTEGER                NOT NULL,
    CONSTRAINT PK_ProductRates PRIMARY KEY (id),
    CONSTRAINT FK_ProductRates_Product
        FOREIGN KEY (product_id) references products (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT FK_ProductRates_Buyer
        FOREIGN KEY (buyer_id) references buyers (buyer_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT CK_Constrain_Mark CHECK ( mark <= 10 AND mark > 0)
);

CREATE TABLE countries
(
    id   INTEGER     NOT NULL AUTO_INCREMENT,
    code CHAR(2)     NOT NULL,
    name VARCHAR(20) NOT NULL,
    CONSTRAINT UNx_Countries UNIQUE (code, name),
    CONSTRAINT PK_Countries PRIMARY KEY (id)
);

CREATE TABLE categories
(
    id        INTEGER     NOT NULL AUTO_INCREMENT,
    name      VARCHAR(20) NOT NULL,
    parent_id INT DEFAULT NULL,
    CONSTRAINT PK_category PRIMARY KEY (id),
    CONSTRAINT `FK_category` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

