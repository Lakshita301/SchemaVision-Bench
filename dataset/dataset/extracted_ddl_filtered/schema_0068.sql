-- Source: https://github.com/mz0/u57/blob/a61418984de255ae261a5a34a8037b6821169916/upstream.src/mysql-test/suite/ndb/t/ndb_fk_is.inc?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 18

create table product (
  category int not null,
  id int not null,
  price decimal,
  primary key(category, id))
engine=$engine;

create table customer (
  id int not null,
  primary key (id))
engine=$engine;

create table product_order (
  no int not null auto_increment,
  product_category int not null,
  product_id int not null,
  customer_id int not null,
  primary key(no),
  index (product_category, product_id),
  foreign key fk1 (product_category, product_id) references product(category, id)
    on update restrict on delete cascade,
  index (customer_id),
  foreign key fk2 (customer_id) references customer(id))
engine=$engine;

create table emp (
  id int primary key auto_increment,
  manager int,
  key (manager),
  foreign key fk1 (manager) references emp (id))
engine=$engine;

create table mydb1.t1 (
  a1 int not null,
  b1 int not null,
  primary key using hash (a1),
  unique key xb1 (b1)
) engine=$engine;

create table mydb2.t2 (
  a2 int not null,
  b2 int not null,
  primary key using hash (a2),
  unique key xb2 (b2)
) engine=$engine;

-- Foreign keys added via ALTER TABLE:
alter table mydb1.t1
  add constraint fk_b1a1 foreign key (b1) references mydb1.t1 (a1),
  add constraint fk_b1b2 foreign key (b1) references mydb2.t2 (b2);

alter table mydb2.t2
  add constraint fk_b2a2 foreign key (b2) references mydb2.t2 (a2),
  add constraint fk_b2b1 foreign key (b2) references mydb1.t1 (b1);

alter table mydb1.t1
  drop foreign key fk_b1a1,
  drop foreign key fk_b1b2;

alter table mydb2.t2
  drop foreign key fk_b2a2,
  drop foreign key fk_b2b1;

