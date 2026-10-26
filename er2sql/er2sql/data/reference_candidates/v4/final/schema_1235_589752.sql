-- Source: https://github.com/dragonfly123/ffzl/blob/9251d1570d2247da7f89063e542b3041bc375e32/src/main/resources/security-schema.sql?raw=true
-- Tables detected: 6 | FK constraints: 1

create table users(
        username varchar(256) not null primary key,
        password varchar(256) not null,
        enabled boolean not null,
        salt VARCHAR(25) not null
    );

create table authorities (
        username varchar(256) not null,
        authority varchar(256) not null,
        constraint fk_authorities_users foreign key(username) references users(username)
    );

CREATE TABLE groups (
      id  int,
      group_name VARCHAR(256)
    );

CREATE TABLE group_authorities(
        group_id  int,
        authority VARCHAR(255)
    );

CREATE TABLE group_members(
        group_id int,
        username  varchar(255)
    );

create table persistent_logins(
    username varchar(50) not null,
    series varchar(64) PRIMARY key,
    token varchar(64) not null,
    last_used TIMESTAMP not null
    );

