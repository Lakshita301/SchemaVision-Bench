-- Source: https://github.com/arpannln/aA-projects/blob/c6efb0be546a018b4ea6394375240073eb1b9c24/a03-prep-master-unsolvedrun2/sql-skeleton/data/import_db.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  yr INTEGER NOT NULL,
  director INTEGER NOT NULL
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE castings (
  movie_id INTEGER NOT NULL,
  actor_id INTEGER NOT NULL,
  ord INTEGER NOT NULL,

  FOREIGN KEY(movie_id) REFERENCES movies(id),
  FOREIGN KEY(actor_id) REFERENCES actors(id)
);

