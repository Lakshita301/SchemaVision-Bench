-- Source: https://github.com/Noshuas/sdc/blob/771ff22a212247c0d261e1e7313d6341874b7359/init.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 12

create table products (
    id int primary key,
    name varchar not null,
    slogan varchar not null,
    description varchar not null,
    category varchar not null,
    default_price int not null
  );

create table styles (
    id int primary key,
    "productId" int not null,
    name varchar not null,
    original_price int not null,
    sale_price int,
    default_style int not null,
    foreign key ("productId")
      references products (id)
  );

create table features (
    id int primary key,
    "productId" int not null,
    feature varchar not null,
    value varchar,
    foreign key ("productId")
      references products (id)
  );

create table related (
    id serial primary key,
    "currentProductId" int not null,
    "relatedProductId" int not null,
    foreign key ("currentProductId")
      references products (id),
    foreign key ("relatedProductId")
      references products (id)
  );

create table photos (
    id int primary key,
    "styleId" int not null,
    thumbnail_url varchar not null,
    url varchar not null,
    foreign key ("styleId")
      references styles (id)
  );

create table skus (
    id int primary key,
    "styleId" int not null,
    quantity int not null,
    size varchar not null,
    foreign key ("styleId")
      references styles (id)
  );

