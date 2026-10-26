-- Source: https://github.com/oleguch/supershop.ru/blob/17417933317f0be05fdca31f6568036cc5e05010/bd/bk_db_2017.04.06.sql?raw=true
-- Tables detected: 8 | FK constraints: 3
CREATE TABLE cart (
    id integer NOT NULL,
    id_user integer,
    id_good integer[],
    number integer[],
    delivery integer,
    city text,
    street text,
    house text,
    app integer,
    comment text
);
CREATE TABLE cats (
    id integer NOT NULL,
    name text NOT NULL,
    descript text
);
CREATE TABLE goods (
    id integer DEFAULT nextval('goods_id_seq'::regclass) NOT NULL,
    id_cat integer NOT NULL,
    descript text,
    price integer NOT NULL,
    badge badge DEFAULT 'none'::badge,
    name text NOT NULL,
    CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id)
);
CREATE TABLE images (
    id integer NOT NULL,
    id_good integer NOT NULL,
    img_path text NOT NULL,
    CONSTRAINT id_good FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE
);
CREATE TABLE users (
    id integer NOT NULL,
    name text,
    email text,
    pass text,
    address_city text,
    address_street text,
    address_house text,
    address_app integer,
    phone text
);
CREATE TABLE orders (
    id integer NOT NULL,
    email text NOT NULL,
    name text,
    phone text,
    comment text,
    city text,
    street text,
    house text,
    app integer,
    delivery integer,
    id_user integer,
    "time" timestamp with time zone
);
CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer,
    id_good integer,
    number integer
);
CREATE TABLE var_good (
    id integer NOT NULL,
    id_good integer NOT NULL,
    variant text,
    CONSTRAINT id_good_var FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE
);
