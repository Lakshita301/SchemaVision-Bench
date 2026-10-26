-- Source: https://github.com/gmeurant/benerator/blob/a2cc4ab5bee15d464b76bf5c1db706dd97d7636d/benerator/tags/release-0.9.2/src/demo/resources/demo/shop/oracle/create_tables.oracle.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 14
CREATE TABLE db_category (
    id VARCHAR(9)  NOT NULL,
    name VARCHAR(30) NOT NULL,
    parent_id VARCHAR(9)  default NULL,
    PRIMARY KEY  (id),
    CONSTRAINT db_category_parent_fk FOREIGN KEY (parent_id) REFERENCES db_category (id)
);

CREATE TABLE db_product (
    ean_code VARCHAR(13)  NOT NULL,
    name VARCHAR(30)  NOT NULL,
    category_id VARCHAR(9)   NOT NULL,
    price NUMERIC(8,2)   NOT NULL,
    manufacturer VARCHAR(30)  NOT NULL,
    notes VARCHAR(256)     NULL,
    description TEXT              NULL,
    image BYTEA              NULL,
    PRIMARY KEY  (ean_code),
    CONSTRAINT db_product_category_fk FOREIGN KEY (category_id) REFERENCES db_category (id)
);

CREATE TABLE db_role (
    name VARCHAR(16) NOT NULL,
    PRIMARY KEY  (name)
);

CREATE TABLE db_user (
    id NUMERIC(10)   NOT NULL,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(16) NOT NULL,
    role_id VARCHAR(16) NOT NULL,
    active NUMERIC(1)    default 1 NOT NULL,
    PRIMARY KEY  (id),
    CONSTRAINT db_user_role_fk FOREIGN KEY (role_id) REFERENCES db_role (name),
    constraint active_flag check (active in (0,1))
);

CREATE TABLE db_customer (
    id NUMERIC(10)   default 0 NOT NULL,
    category char(1)      NOT NULL,
    salutation VARCHAR(10) NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date date,
    PRIMARY KEY  (id),
    CONSTRAINT db_customer_user_fk FOREIGN KEY (id) REFERENCES db_user (id)
);

CREATE TABLE db_order (
    id NUMERIC(10) NOT NULL,
    customer_id NUMERIC(10) NOT NULL,
    total_price NUMERIC(8,2)  NOT NULL,
    created_at timestamp with time zone NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT db_order_customer_fk FOREIGN KEY (customer_id) REFERENCES db_customer (id)
);

CREATE TABLE db_order_item (
    id NUMERIC(10)   NOT NULL,
    order_id NUMERIC(10)   NOT NULL,
    number_of_items NUMERIC(10)   default 1 NOT NULL,
    product_ean_code VARCHAR(13) NOT NULL,
    total_price NUMERIC(8,2)  NOT NULL,
    PRIMARY KEY  (id),
    CONSTRAINT db_order_item_order_fk FOREIGN KEY (order_id) REFERENCES db_order (id),
    CONSTRAINT db_order_item_product_fk FOREIGN KEY (product_ean_code) REFERENCES db_product (ean_code)
);
