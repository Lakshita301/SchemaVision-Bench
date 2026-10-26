-- Source: https://github.com/Obsss1111/basic/blob/af028f924b143e3b8bad69c8800a1a1ee9bc4c47/assets/yii2basic.sql?raw=true
-- Tables detected: 14 | FK constraints: 10
-- Foreign keys added via ALTER TABLE:
CREATE TABLE albums (
    id_album int NOT NULL,
    name_album varchar(45) NOT NULL,
    img varchar(64) CHARACTER SET utf8 DEFAULT NULL,
    autor_id int DEFAULT NULL
);
CREATE TABLE albums_music (
    am_id int NOT NULL,
    album_id int NOT NULL,
    ahm_id int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE autor (
    id int NOT NULL,
    name varchar(45) CHARACTER SET utf8 NOT NULL,
    img text CHARACTER SET utf8
);
CREATE TABLE autor_has_music (
    id_ahm int NOT NULL,
    id_autor int NOT NULL,
    id_music int NOT NULL
);
CREATE TABLE country (
    code char(2) NOT NULL,
    name char(52) NOT NULL,
    population int NOT NULL DEFAULT '0'
);
CREATE TABLE favorite_albums (
    id_fav_album int NOT NULL,
    user_id int NOT NULL,
    albums_id_album int NOT NULL
);
CREATE TABLE favorite_authors (
    id int NOT NULL,
    name varchar(20) NOT NULL,
    user_id int NOT NULL,
    autor_id int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE favorite_music (
    music_id_music int NOT NULL,
    user_id int NOT NULL
);
CREATE TABLE favorite_style (
    music_style_id_style int NOT NULL,
    user_id int NOT NULL
);
CREATE TABLE music (
    id_music int NOT NULL,
    name_music varchar(64) CHARACTER SET utf8 NOT NULL,
    path_music_id_path int DEFAULT NULL,
    music_style_id_style int DEFAULT NULL
);
CREATE TABLE music_style (
    id_style int NOT NULL,
    name_style varchar(45) NOT NULL
);
CREATE TABLE path_music (
    id_path int NOT NULL,
    path varchar(128) NOT NULL
);
CREATE TABLE playlists (
    id int NOT NULL,
    name varchar(32) NOT NULL,
    owner text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE "user" (
    id int NOT NULL,
    username varchar(32) NOT NULL,
    auth_key varchar(64) NOT NULL,
    password_hash varchar(64) NOT NULL,
    passwork_reset_token varchar(64) DEFAULT NULL,
    email varchar(32) DEFAULT NULL,
    status smallint NOT NULL DEFAULT '10',
    created_at varchar(64) NOT NULL,
    updated_at varchar(64) NOT NULL,
    access int NOT NULL DEFAULT '0'
);

                          

ALTER TABLE albums_music
  ADD CONSTRAINT albums_music_ibfk_1 FOREIGN KEY (ahm_id) REFERENCES autor_has_music (id_ahm),
  ADD CONSTRAINT albums_music_ibfk_2 FOREIGN KEY (album_id) REFERENCES albums (id_album);
ALTER TABLE autor_has_music
  ADD CONSTRAINT autor_has_music_ibfk_1 FOREIGN KEY (id_autor) REFERENCES autor (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT autor_has_music_ibfk_2 FOREIGN KEY (id_music) REFERENCES music (id_music) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorite_albums
  ADD CONSTRAINT favorite_albums_ibfk_1 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT favorite_albums_ibfk_2 FOREIGN KEY (albums_id_album) REFERENCES albums (id_album) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorite_music
  ADD CONSTRAINT favorite_music_ibfk_1 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT favorite_music_ibfk_2 FOREIGN KEY (music_id_music) REFERENCES music (id_music) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE albums_music ADD CONSTRAINT albums_music_ibfk_1 FOREIGN KEY (ahm_id) REFERENCES autor_has_music (id_ahm);
ALTER TABLE autor_has_music ADD CONSTRAINT autor_has_music_ibfk_1 FOREIGN KEY (id_autor) REFERENCES autor (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorite_albums ADD CONSTRAINT favorite_albums_ibfk_1 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorite_music ADD CONSTRAINT favorite_music_ibfk_1 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorite_style ADD CONSTRAINT favorite_style_ibfk_1 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE music ADD CONSTRAINT music_ibfk_1 FOREIGN KEY (path_music_id_path) REFERENCES path_music (id_path) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON COLUMN playlists.id IS 'Id плейлиста';
COMMENT ON COLUMN playlists.name IS 'Название плейлиста';
COMMENT ON COLUMN playlists.owner IS 'Владелец плейлиста';
