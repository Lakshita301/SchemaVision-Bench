-- Source: https://github.com/Usede/springbootProject/blob/51eb166db72831577b0aa3cf4b8a6d72a6558257/h2-create-all.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 16

create table o_address (
  id                            bigint not null,
  line1                         varchar(100),
  line2                         varchar(100),
  city                          varchar(100),
  country_code                  varchar(2),
  version                       bigint not null,
  when_created                  timestamp not null,
  when_updated                  timestamp not null,
  constraint pk_o_address primary key (id)
);

create table be_contact (
  id                            bigint not null,
  first_name                    varchar(50),
  last_name                     varchar(50),
  email                         varchar(200),
  phone                         varchar(20),
  customer_id                   bigint not null,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_updated                  timestamp not null,
  constraint pk_be_contact primary key (id)
);

create table o_country (
  code                          varchar(2) not null,
  name                          varchar(60),
  constraint pk_o_country primary key (code)
);

create table be_customer (
  id                            bigint not null,
  inactive                      boolean,
  name                          varchar(100),
  registered                    date,
  comments                      varchar(1000),
  billing_address_id            bigint,
  shipping_address_id           bigint,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_updated                  timestamp not null,
  constraint pk_be_customer primary key (id)
);

create table o_order (
  id                            bigint not null,
  status                        integer,
  order_date                    date,
  ship_date                     date,
  customer_id                   bigint not null,
  shipping_address_id           bigint,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_updated                  timestamp not null,
  constraint ck_o_order_status check (status in (0,1,2,3)),
  constraint pk_o_order primary key (id)
);

create table o_order_detail (
  id                            bigint not null,
  order_id                      bigint,
  order_qty                     integer,
  ship_qty                      integer,
  unit_price                    double,
  product_id                    bigint,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_updated                  timestamp not null,
  constraint pk_o_order_detail primary key (id)
);

create table o_product (
  id                            bigint not null,
  sku                           varchar(20),
  name                          varchar(255),
  version                       bigint not null,
  when_created                  timestamp not null,
  when_updated                  timestamp not null,
  constraint pk_o_product primary key (id)
);

-- Foreign keys added via ALTER TABLE:
alter table o_address add constraint fk_o_address_country_code foreign key (country_code) references o_country (code) on delete restrict on update restrict;

alter table be_contact add constraint fk_be_contact_customer_id foreign key (customer_id) references be_customer (id) on delete restrict on update restrict;

alter table be_customer add constraint fk_be_customer_billing_address_id foreign key (billing_address_id) references o_address (id) on delete restrict on update restrict;

alter table be_customer add constraint fk_be_customer_shipping_address_id foreign key (shipping_address_id) references o_address (id) on delete restrict on update restrict;

alter table o_order add constraint fk_o_order_customer_id foreign key (customer_id) references be_customer (id) on delete restrict on update restrict;

alter table o_order add constraint fk_o_order_shipping_address_id foreign key (shipping_address_id) references o_address (id) on delete restrict on update restrict;

alter table o_order_detail add constraint fk_o_order_detail_order_id foreign key (order_id) references o_order (id) on delete restrict on update restrict;

alter table o_order_detail add constraint fk_o_order_detail_product_id foreign key (product_id) references o_product (id) on delete restrict on update restrict;

