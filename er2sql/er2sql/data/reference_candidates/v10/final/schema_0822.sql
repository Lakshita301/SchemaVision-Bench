-- Source: https://github.com/frescoraja/ruby_road/blob/7f395948b2f350cee1ee0fddb36557ad2633adb3/appacademy/assessment-prep-master/a03-practice-sql/data/import_db.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE movie (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  yr INTEGER NOT NULL,
  director INTEGER NOT NULL
);

CREATE TABLE actor (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE casting (
  movieid INTEGER NOT NULL,
  actorid INTEGER NOT NULL,
  ord INTEGER NOT NULL,
  
  FOREIGN KEY(movieid) REFERENCES movie(id),
  FOREIGN KEY(actorid) REFERENCES actor(id)
);

