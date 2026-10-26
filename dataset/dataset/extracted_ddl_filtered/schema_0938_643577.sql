-- Source: https://github.com/paulaCoelhoo/sql/blob/7df29573c973c46657f4eef5671261944aa407f1/curso_join.sql?raw=true
-- Tables detected: 5 | FK constraints: 2

CREATE TABLE videos(
    id_video int AUTO_INCREMENT PRIMARY KEY,
    author varchar (30),
    title varchar (30),
    likes int (10),
    dislikes int (10)
);

CREATE TABLE author (
    id_author int  AUTO_INCREMENT PRIMARY KEY,
    name varchar (30),
    born date
);

CREATE TABLE seo (
    id_seo int AUTO_INCREMENT PRIMARY KEY,
    category varchar (20)
);

CREATE TABLE playlist (
    id_playlist int AUTO_INCREMENT PRIMARY KEY,
    name_pl varchar (30)
);

CREATE TABLE videos_playlist (
    id_vp int AUTO_INCREMENT PRIMARY KEY,
    fk_video int, 
    fk_playlist int
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE videos ADD CONSTRAINT fk_author FOREIGN KEY (id_author) REFERENCES author(id_author)
 ON DELETE CASCADE
 ON UPDATE CASCADE AFTER ;

ALTER TABLE videos ADD CONSTRAINT fk_seo int FOREIGN KEY (id_seo)
 REFERENCES seo(id_seo)
 ON DELETE CASCADE
 ON UPDATE CASCADE;

