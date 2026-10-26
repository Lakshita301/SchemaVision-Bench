-- Source: https://github.com/Joshua-Enrico/holbertonschool-higher_level_programming/blob/77c9545c0c77b0ebda5efb6d71e2e1ce83d26ce1/0x0E-SQL_more_queries/dbase_dump/hbtn_0d_tvshows.sql?raw=true
-- Tables detected: 3 | FK constraints: 2
CREATE TABLE "tv_genres" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(256) NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE "tv_show_genres" (
    "show_id" int NOT NULL,
    "genre_id" int NOT NULL,
    KEY "show_id" ("show_id"),
    KEY "genre_id" ("genre_id"),
    CONSTRAINT "tv_show_genres_ibfk_1" FOREIGN KEY ("show_id") REFERENCES "tv_shows" ("id"),
    CONSTRAINT "tv_show_genres_ibfk_2" FOREIGN KEY ("genre_id") REFERENCES "tv_genres" ("id")
);

CREATE TABLE "tv_shows" (
    "id" int NOT NULL AUTO_INCREMENT,
    "title" varchar(256) NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
