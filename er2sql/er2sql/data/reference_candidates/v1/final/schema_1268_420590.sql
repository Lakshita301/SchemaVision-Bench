-- Source: https://github.com/melancn/tieba_sign/blob/d915ad368ec53e541efcf42703e356cfd173c0f1/create.sql?raw=true
-- Tables detected: 4 | FK constraints: 3
CREATE TABLE "tieba_sign_user" (
    "uid" int unsigned NOT NULL AUTO_INCREMENT,
    "username" char(10) CHARACTER SET latin1 NOT NULL,
    "salt" char(10) CHARACTER SET latin1 NOT NULL,
    "password" char(40) CHARACTER SET latin1 NOT NULL,
    "email" varchar(255) CHARACTER SET latin1 NOT NULL,
    "status" SMALLINT DEFAULT '0' COMMENT '1已验证 0未验证 -1删除',
    PRIMARY KEY ("uid"),
    UNIQUE KEY "username" ("username"),
    KEY "username_2" ("username","status"),
    KEY "email" ("email","status")
);

CREATE TABLE "tieba_sign_cookies" (
    "cid" int unsigned NOT NULL AUTO_INCREMENT,
    "uid" int unsigned NOT NULL DEFAULT '0',
    "uname" varchar(50) NOT NULL,
    "cookie" text NOT NULL,
    "last_sign" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "end_sign" date NOT NULL,
    "forum_num" int unsigned NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT '1' COMMENT '1有效 0无效 -1删除',
    PRIMARY KEY ("cid"),
    KEY "status" ("status","uid","end_sign"),
    KEY "uid" ("uid"),
    CONSTRAINT "tieba_sign_cookies_ibfk_1" FOREIGN KEY ("uid") REFERENCES "tieba_sign_user" ("uid")
);

CREATE TABLE "tieba_sign_history" (
    "hid" int unsigned NOT NULL AUTO_INCREMENT,
    "uid" int unsigned NOT NULL,
    "cid" int unsigned NOT NULL,
    "kw" varchar(64) NOT NULL,
    "type" SMALLINT unsigned NOT NULL DEFAULT '1' COMMENT '0、等等1、已签2、之前已签3、不支持',
    "time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY ("hid"),
    KEY "uid" ("uid"),
    KEY "cid" ("time","type","cid"),
    CONSTRAINT "tieba_sign_history_ibfk_1" FOREIGN KEY ("uid") REFERENCES "tieba_sign_user" ("uid"),
    CONSTRAINT "tieba_sign_history_ibfk_2" FOREIGN KEY ("cid") REFERENCES "tieba_sign_cookies" ("cid")
);

CREATE TABLE "tieba_sign_error_code" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "code" int NOT NULL,
    "usermsg" TEXT NOT NULL,
    "errmsg" TEXT NOT NULL,
    PRIMARY KEY ("id")
);
