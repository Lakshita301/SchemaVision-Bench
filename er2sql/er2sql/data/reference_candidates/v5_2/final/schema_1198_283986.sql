-- Source: https://github.com/nguyennguyen410/C0321G1_NguyenHuynhNhatNguyen_Module3/blob/6bc1b2302bc65eaf2c19ad2e3cb7a24a88ffadea/03_thao_tac_voi_csdl/bai_tap/csdl_quan_ly_ban_hang/csdl_quan_ly_ban_hang.sql?raw=true
-- Tables detected: 4 | FK constraints: 3
create table customer(
    customer_id int not null primary key,
    customer_name varchar(50),
    customer_age int not null
);

create table order1(
    order_id int not null primary key,
    customer_id int not null,
    order_date TIMESTAMP,
    order_totalprice DOUBLE PRECISION check(order_totalprice>0),
    foreign key (customer_id) references customer(customer_id)
);

create table product(
    product_id int not null primary key,
    product_name varchar(50),
    product_price DOUBLE PRECISION not null
);

create table orderdetail(
    order_id int not null,
    product_id int not null,
    orderdetail_qty int not null,
    primary key (order_id, product_id),
    foreign key (product_id) references product(product_id),
    foreign key (order_id) references order1(order_id)
);
