-- Source: https://github.com/JUEZ80/front-and-movies/blob/ca118d9a60f5a99b367d8302facba88ad7b6af44/films.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2
-- Foreign keys added via ALTER TABLE:
CREATE TABLE gender (
    gender_id int NOT NULL,
    name varchar(500) DEFAULT NULL
);

CREATE TABLE movie (
    movie_id int NOT NULL,
    name varchar(500) NOT NULL,
    description TEXT DEFAULT NULL,
    image varchar(500) NOT NULL,
    create_at TIMESTAMP NOT NULL,
    release_date date DEFAULT NULL,
    actors varchar(500) DEFAULT NULL,
    gender_id int NOT NULL,
    rating int DEFAULT NULL
);

CREATE TABLE profile (
    profile_id int NOT NULL,
    name varchar(500) DEFAULT NULL
);

CREATE TABLE "user" (
    user_id int NOT NULL,
    name varchar(500) NOT NULL,
    email varchar(100) NOT NULL,
    password varchar(500) NOT NULL,
    create_at TIMESTAMP NOT NULL,
    profile_id int NOT NULL
);


                          

ALTER TABLE movie
  ADD CONSTRAINT movie_ibfk_1 FOREIGN KEY (gender_id) REFERENCES gender (gender_id);

ALTER TABLE "user"
  ADD CONSTRAINT user_ibfk_1 FOREIGN KEY (profile_id) REFERENCES profile (profile_id);
