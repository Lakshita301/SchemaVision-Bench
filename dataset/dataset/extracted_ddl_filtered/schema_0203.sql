-- Source: https://github.com/danielbohnrs/projeto-sd3/blob/685a9d30ebbec0bf2e4946497a6fad43a81439bd/backend/create.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4

create table tb_sales (id  bigserial not null, amount float8, date date, deals int4, visited int4, seller_id int8, primary key (id));

create table tb_sellers (id  bigserial not null, name varchar(255), primary key (id));

create table tb_sales (id  bigserial not null, amount float8, date date, deals int4, visited int4, seller_id int8, primary key (id));

create table tb_sellers (id  bigserial not null, name varchar(255), primary key (id));

-- Foreign keys added via ALTER TABLE:
alter table tb_sales add constraint FKp0nn0oixeiw2fq3jivj6vnsu foreign key (seller_id) references tb_sellers;

alter table tb_sales add constraint FKp0nn0oixeiw2fq3jivj6vnsu foreign key (seller_id) references tb_sellers;

