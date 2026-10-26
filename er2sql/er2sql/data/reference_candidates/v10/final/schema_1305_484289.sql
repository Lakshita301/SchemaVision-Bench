-- Source: https://github.com/adelwebdev/VuePhpMySQL_Final/blob/9a2f43faf71eecb3c88c118f1cd0cdfd2fb3f3ab/assets/data/vivino.sql?raw=true
-- Tables detected: 3 | FK constraints: 3
-- Foreign keys added via ALTER TABLE:
CREATE TABLE countries (
    country_id int NOT NULL,
    country_name varchar(70) NOT NULL,
    region_name varchar(80) NOT NULL,
    flag varchar(100) NOT NULL
);

CREATE TABLE users (
    user_id int NOT NULL,
    admin int NOT NULL DEFAULT 0,
    email varchar(60) NOT NULL,
    password varchar(255) NOT NULL
);

CREATE TABLE wines (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    year int NOT NULL,
    grapes varchar(100) NOT NULL,
    country varchar(70) NOT NULL,
    region varchar(70) NOT NULL,
    description text NOT NULL,
    picture varchar(255) DEFAULT NULL,
    author int NOT NULL,
    publish_date timestamp NOT NULL DEFAULT current_timestamp()
);


                          

ALTER TABLE countries
  ADD CONSTRAINT countries_ibfk_1 FOREIGN KEY (country_name) REFERENCES wines (country),
  ADD CONSTRAINT countries_ibfk_2 FOREIGN KEY (region_name) REFERENCES wines (region);

ALTER TABLE wines
  ADD CONSTRAINT wines_ibfk_1 FOREIGN KEY (author) REFERENCES users (user_id);
