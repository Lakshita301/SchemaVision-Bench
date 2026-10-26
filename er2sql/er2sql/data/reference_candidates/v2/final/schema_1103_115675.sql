-- Source: https://github.com/talk2amareswaran/hackerearth-challenge/blob/11c7d9c79b501cfb589edad18997c4cfe5498744/hotel-booking-web-app/sql-scripts.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

create table hotel (id int primary key auto_increment, address varchar(1000),
categories varchar(1000),city varchar(500),country varchar(20),latitude varchar(50),
longitude varchar(50), name varchar(1000),postalcode varchar(20), province varchar(50),
ratings float,review_text varchar(2000),review_title varchar(1000),review_username varchar(100));

create table users (id int primary key auto_increment, first_name varchar(50) not null, last_name varchar(50),
email_id varchar(50) not null unique key, password varchar(1000));

create table booking (id int primary key auto_increment, user_id int,foreign key(user_id) references 
users (id), hotel_id int, foreign key(hotel_id) references hotel(id), rooms varchar(10),
selectdate varchar(20));

