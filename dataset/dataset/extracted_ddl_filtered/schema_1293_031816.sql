-- Source: https://github.com/raphaelfeng/benerator/blob/68a0489ceaa55f475cb62367b8a2d8e92e2aea4d/src/org/databene/benerator/archetype/shopdb/sql/oracle/create_tables.oracle.sql?raw=true
-- Tables detected: 7 | FK constraints: 7

CREATE TABLE db_category (
  id        varchar2(9)  NOT NULL,
  name      varchar2(30) NOT NULL,
  parent_id varchar2(9)  default NULL,
  PRIMARY KEY  (id),
  CONSTRAINT db_category_parent_fk FOREIGN KEY (parent_id) REFERENCES db_category (id)
);

CREATE TABLE db_product (
  ean_code     varchar2(13)  NOT NULL,
  name         varchar2(30)  NOT NULL,
  category_id  varchar2(9)   NOT NULL,
  price        number(8,2)   NOT NULL,
  manufacturer varchar2(30)  NOT NULL,
  notes        varchar2(256)     NULL,
  description  clob              NULL,
  image        blob              NULL,
  PRIMARY KEY  (ean_code),
  CONSTRAINT db_product_category_fk FOREIGN KEY (category_id) REFERENCES db_category (id)
);

CREATE TABLE db_role (
  name varchar2(16) NOT NULL,
  PRIMARY KEY  (name)
);

CREATE TABLE db_user (
  id       number(10)   NOT NULL,
  name     varchar2(30) NOT NULL,
  email    varchar2(50) NOT NULL,
  password varchar2(16) NOT NULL,
  role_id  varchar2(16) NOT NULL,
  active   number(1)    default 1 NOT NULL,
  PRIMARY KEY  (id),
  CONSTRAINT db_user_role_fk FOREIGN KEY (role_id) REFERENCES db_role (name),
  constraint active_flag check (active in (0,1))
);

CREATE TABLE db_customer (
  id         number(10)   default 0 NOT NULL,
  category   char(1)      NOT NULL,
  salutation varchar2(10) NULL,
  first_name varchar2(30) NOT NULL,
  last_name  varchar2(30) NOT NULL,
  birth_date date,
  PRIMARY KEY  (id),
  CONSTRAINT db_customer_user_fk FOREIGN KEY (id) REFERENCES db_user (id)
);

CREATE TABLE db_order (
  id          number(10) NOT NULL,
  customer_id number(10) NOT NULL,
  total_price number(8,2)  NOT NULL,
  created_at  timestamp with time zone NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT db_order_customer_fk FOREIGN KEY (customer_id) REFERENCES db_customer (id)
);

CREATE TABLE db_order_item (
  id              number(10)   NOT NULL,
  order_id        number(10)   NOT NULL,
  number_of_items number(10)   default 1 NOT NULL,
  product_ean_code      varchar2(13) NOT NULL,
  total_price     number(8,2)  NOT NULL,
  PRIMARY KEY  (id),
  CONSTRAINT db_order_item_order_fk FOREIGN KEY (order_id) REFERENCES db_order (id),
  CONSTRAINT db_order_item_product_fk FOREIGN KEY (product_ean_code) REFERENCES db_product (ean_code)
);

