-- Source: https://github.com/rohithdot/OnlineMusicStore/blob/e833e67d6ab7854c71b7319e6f1be9e14cd5c1f3/musicstore_2018-04-25.sql?raw=true
-- Tables detected: 3 | FK constraints: 2
CREATE TABLE "songs" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(100) NOT NULL DEFAULT '',
    "artist" varchar(100) NOT NULL DEFAULT '',
    "album" varchar(100) NOT NULL DEFAULT '',
    "latest" SMALLINT NOT NULL,
    "Genre" varchar(20) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "userinfo" (
    "firstname" varchar(30) NOT NULL,
    "lastname" varchar(30) NOT NULL,
    "username" varchar(30) NOT NULL,
    "email" varchar(30) NOT NULL,
    "password" varchar(200) NOT NULL,
    "salt" varchar(200) NOT NULL,
    "userid" int NOT NULL AUTO_INCREMENT,
    "admin" SMALLINT NOT NULL,
    PRIMARY KEY ("userid")
);

CREATE TABLE "usermusic" (
    "userid" int NOT NULL,
    "songid" int unsigned NOT NULL,
    "favourite" SMALLINT NOT NULL,
    KEY "useridconstraint" ("userid"),
    KEY "songidconstraint" ("songid"),
    CONSTRAINT "songidconstraint" FOREIGN KEY ("songid") REFERENCES "songs" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "useridconstraint" FOREIGN KEY ("userid") REFERENCES "userinfo" ("userid") ON DELETE CASCADE ON UPDATE CASCADE
);
