-- Source: https://github.com/vernonwmk/pal-tracker-distributed/blob/62b766e5146c7a26e83d5e13ed089fc32c6b1566/databases/registration-database/migrations/V1__initial_schema.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

create table users (
  id   bigint(20) not null auto_increment,
  name VARCHAR(255),

  primary key (id),
  unique key name (name)
)
engine = innodb
default charset = utf8;

create table accounts (
  id       bigint(20) not null auto_increment,
  owner_id bigint(20),
  name     VARCHAR(255),

  primary key (id),
  unique key name (name),
  constraint foreign key (owner_id) references users (id)
)
engine = innodb
default charset = utf8;

create table projects (
  id         bigint(20) not null auto_increment,
  account_id bigint(20),
  name       VARCHAR(255),
  active     bit(1) not null default b'1',

  primary key (id),
  unique key name (name),
  constraint foreign key (account_id) references accounts (id)
)
engine = innodb
default charset = utf8;

