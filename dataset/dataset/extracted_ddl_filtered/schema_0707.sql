-- Source: https://github.com/lvazquez-r3dh4t/test-grafana-prometheus/blob/39c9b0402ab3fda21d7ea1afa49fed5879f6b7af/monolith/src/main/resources/db/migration/V1_1__CreateSchema.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

create table INVENTORY (
    itemId varchar(255) not null,
    link varchar(255),
    location varchar(255),
    quantity int4,
    primary key (itemId)
);

create table ORDERS (
    orderId int8 not null,
    customerEmail varchar(255),
    customerName varchar(255),
    discount float8 not null,
    orderValue float8 not null,
    retailPrice float8 not null,
    shippingDiscount float8 not null,
    shippingFee float8 not null,
    primary key (orderId)
);

create table ORDER_ITEMS (
    ID int8 not null,
    productId varchar(255),
    quantity int4 not null,
    ORDER_ID int8,
    primary key (ID)
);

create table PRODUCT_CATALOG (
    itemId varchar(255) not null,
    description text,
    name varchar(80),
    price float8,
    primary key (itemId)
);

-- Foreign keys added via ALTER TABLE:
alter table ORDER_ITEMS
    add constraint FK2BFF474F65938E8
    foreign key (ORDER_ID)
    references ORDERS;

