-- Source: https://github.com/cheney505/dnf-vue.js/blob/912d57c5d7856074e829e15add3282d649589565/gameshare.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 9
CREATE TABLE "recruit" (
    "id" int NOT NULL AUTO_INCREMENT,
    "user_id" int NOT NULL,
    "add_date" TIMESTAMP NOT NULL,
    "add_title" varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    "add_content" text COLLATE utf8_unicode_ci,
    "area" varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "user_id" ("user_id"),
    CONSTRAINT "recruit_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "role" (
    "role_id" int NOT NULL AUTO_INCREMENT,
    "role_name" varchar(255) NOT NULL,
    "role_icon" varchar(255) NOT NULL,
    "role_bg" varchar(255) NOT NULL DEFAULT 'http://localhost:2333/img/roleBg/魔皇.png',
    "role_res" varchar(255) NOT NULL,
    "role_depart" varchar(255) NOT NULL,
    PRIMARY KEY ("role_id"),
    KEY "role_name" ("role_name")
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

CREATE TABLE "team" (
    "id" int NOT NULL AUTO_INCREMENT,
    "team_name" varchar(255) NOT NULL,
    "team_brief" varchar(255) DEFAULT NULL,
    "team_founder" varchar(255) NOT NULL,
    "team_data" TIMESTAMP NOT NULL,
    "team_pw" varchar(255) NOT NULL,
    "team_join" int NOT NULL,
    "admin_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "team_founder" ("team_founder"),
    CONSTRAINT "team_ibfk_1" FOREIGN KEY ("team_founder") REFERENCES "user" ("username") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE "team_note" (
    "id" int NOT NULL AUTO_INCREMENT,
    "team_id" int NOT NULL,
    "user_id" int NOT NULL,
    "content" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    "pub_date" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "team_id" ("team_id"),
    KEY "user_id" ("user_id"),
    CONSTRAINT "team_note_ibfk_1" FOREIGN KEY ("team_id") REFERENCES "team" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "team_note_ibfk_2" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "team_notice" (
    "id" int NOT NULL AUTO_INCREMENT,
    "team_id" int NOT NULL,
    "content" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    "pub_date" TIMESTAMP DEFAULT NULL,
    "title" varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    "is_top" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("id"),
    KEY "team_id" ("team_id"),
    CONSTRAINT "team_notice_ibfk_1" FOREIGN KEY ("team_id") REFERENCES "team" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "user" (
    "id" int NOT NULL AUTO_INCREMENT,
    "username" varchar(30) NOT NULL,
    "password" varchar(255) NOT NULL,
    "icon" varchar(255) DEFAULT '/img/userImg/default.png',
    "nickname" varchar(30) NOT NULL,
    "riskname" varchar(30) NOT NULL,
    "res_data" TIMESTAMP DEFAULT NULL,
    "email" varchar(255) NOT NULL,
    "server" varchar(255) NOT NULL,
    "area" varchar(255) NOT NULL,
    PRIMARY KEY ("id"),
    KEY "username" ("username")
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

CREATE TABLE "user_role" (
    "id" int NOT NULL AUTO_INCREMENT,
    "role_name" varchar(255) NOT NULL,
    "user_name" varchar(255) NOT NULL,
    "time_20" int DEFAULT NULL,
    "time_25" int DEFAULT NULL,
    "res_power" int DEFAULT NULL,
    "res_atk" int DEFAULT NULL,
    "sun_power" int DEFAULT NULL,
    "user_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "role_name" ("role_name"),
    KEY "user_id" ("user_id"),
    CONSTRAINT "user_role_ibfk_1" FOREIGN KEY ("role_name") REFERENCES "role" ("role_name") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "user_role_ibfk_2" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

CREATE TABLE "user_team" (
    "team_id" int NOT NULL,
    "user_id" int NOT NULL,
    KEY "team_id" ("team_id"),
    KEY "user_id" ("user_id"),
    CONSTRAINT "user_team_ibfk_1" FOREIGN KEY ("team_id") REFERENCES "team" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "user_team_ibfk_2" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
