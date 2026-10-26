-- Source: https://github.com/Stranger-BuddyNav/BuddyNav/blob/358edab592c4fd2eeee828a9e291c8316b597414/data/schema.sql?raw=true
-- Tables detected: 5 | FK constraints: 3

CREATE TABLE city (
  id SERIAL PRIMARY KEY,
  city VARCHAR(1000)
);

CREATE TABLE locationdata (
  id SERIAL PRIMARY KEY,
  city_id int,
  map_url VARCHAR(1000),
  city_url VARCHAR(1000),
  FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE hoteldata (
  id SERIAL PRIMARY KEY,
  city_id int,
  hotel_image VARCHAR(1000),
  hotel_name VARCHAR(1000),
  hotel_price VARCHAR(1000),
  hotel_rate VARCHAR(1000),
  FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE transportdata (
  id SERIAL PRIMARY KEY,
  city_id int,
  station_name VARCHAR(1000),
  station_type VARCHAR(1000),
  transport_price VARCHAR(1000),
  FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE booking (
  id SERIAL PRIMARY KEY,
  city VARCHAR(1000),
  map_url VARCHAR(1000),
  city_url VARCHAR(1000),
  time VARCHAR(1000),
  hotel_name VARCHAR(1000),
  hotel_price VARCHAR(1000),
  hotel_rate VARCHAR(1000),
  hotel_img VARCHAR(1000),
  station_name VARCHAR(1000),
  station_type VARCHAR(1000),
  transport_price VARCHAR(1000)
);

