-- Source: https://github.com/alexander-waite/IS211_Assignment10/blob/c5cad53b012f2adcd36a22540eb5fe4434dd28a8/music.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE artist(
  artist_id INT PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE album (
  album_id integer PRIMARY KEY,
  album_name TEXT NOT NULL,
  artist_name TEXT NOT NULL,
  FOREIGN KEY (artist_name)
  	REFERENCES artist (artist_name)
);

CREATE TABLE song(
  song_id INT PRIMARY KEY,
  song_name TEXT NOT NULL,
  track_number INTEGER NOT NULL,
  song_length INTEGER NOT NULL,
  album_name TEXT NOT NULL,
  FOREIGN KEY (album_name)
  	REFERENCES album (album_name)

);

