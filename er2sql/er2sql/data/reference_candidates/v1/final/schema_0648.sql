-- Source: https://github.com/SHGgo/gobig-serve/blob/05d3313dfaa7db4d912d9799141970f6829003d0/gobig.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 8
CREATE TABLE "admin" (
    "aid" int unsigned NOT NULL AUTO_INCREMENT COMMENT '管理者id',
    "admin_account" varchar(10) NOT NULL DEFAULT '' COMMENT '管理员账号',
    "admin_password" varchar(15) NOT NULL COMMENT '管理员密码',
    PRIMARY KEY ("aid")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "admincontent" (
    "aid" int unsigned NOT NULL AUTO_INCREMENT COMMENT '管理者id',
    "roles" varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    "introduction" varchar(50) DEFAULT NULL,
    "avatar" varchar(255) DEFAULT NULL,
    "name" varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY ("aid"),
    CONSTRAINT "aid" FOREIGN KEY ("aid") REFERENCES "admin" ("aid") ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "comment" (
    "cid" int unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
    "vid" int unsigned DEFAULT NULL COMMENT '评论视频vid',
    "from_uid" int unsigned DEFAULT NULL COMMENT '评论人vid',
    "from_uid_name" varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'root' COMMENT '评论人昵称',
    "content" varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '哈哈哈' COMMENT '评论内容',
    "release_date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
    "like_count" int unsigned NOT NULL DEFAULT '1' COMMENT '点赞数',
    "from_uid_figure" varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/img/telegram.png' COMMENT '评论者头像',
    PRIMARY KEY ("cid"),
    KEY "uid4" ("from_uid") USING BTREE,
    KEY "vid1" ("vid") USING BTREE,
    CONSTRAINT "comment_ibfk_1" FOREIGN KEY ("from_uid") REFERENCES "usercontent" ("uid") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "comment_ibfk_2" FOREIGN KEY ("vid") REFERENCES "video" ("vid") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

CREATE TABLE "sort" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "sortName" varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "sortName" ("sortName")
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

CREATE TABLE "test" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(10) DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE "user" (
    "uid" int unsigned NOT NULL AUTO_INCREMENT,
    "userAccount" varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    "pwd" varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1234',
    PRIMARY KEY ("uid"),
    UNIQUE KEY "userName" ("userAccount")
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

CREATE TABLE "usercontent" (
    "uid" int unsigned NOT NULL COMMENT '主键',
    "nick_name" varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'gobig' COMMENT '昵称',
    "gender" varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '性别',
    "signature" varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'gobigtonight' COMMENT '签名',
    "figure" varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/gobig/img/ninja.png' COMMENT '头像',
    "birth_date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出生日期',
    "attention_count" int unsigned NOT NULL DEFAULT '0' COMMENT '关注数',
    "fan_count" int unsigned NOT NULL DEFAULT '0' COMMENT '粉丝数',
    "like_count" int unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
    "view_count" int unsigned NOT NULL DEFAULT '0' COMMENT '播放数',
    PRIMARY KEY ("uid"),
    KEY "nick_name" ("nick_name"),
    CONSTRAINT "uid1" FOREIGN KEY ("uid") REFERENCES "user" ("uid") ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE "uservideocollect" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "uid" int unsigned DEFAULT NULL,
    "vid" int unsigned DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "c_uid" ("uid"),
    KEY "c_vid" ("vid"),
    CONSTRAINT "c_uid" FOREIGN KEY ("uid") REFERENCES "usercontent" ("uid") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "c_vid" FOREIGN KEY ("vid") REFERENCES "video" ("vid") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE "video" (
    "vid" int unsigned NOT NULL AUTO_INCREMENT COMMENT '评论视频uid',
    "title" varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '我是标题，最多两行，最多30个字我是标题' COMMENT '题目',
    "uid" int unsigned NOT NULL DEFAULT '1' COMMENT '作者id',
    "author" varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'root' COMMENT '作者昵称',
    "introduction" varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '介绍',
    "sort_name" varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '动画' COMMENT '分类',
    "release_date" timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
    "view_count" int unsigned DEFAULT '1' COMMENT '观看数',
    "comment_count" int unsigned DEFAULT '1' COMMENT '评论数',
    "collect_count" int unsigned DEFAULT '1' COMMENT '收藏数',
    "pic" varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/img/03.jpg' COMMENT '预览图',
    "video_res" varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/video/1.mp4' COMMENT '视频存储地址',
    "v_score" int unsigned DEFAULT '1' COMMENT '视频得分',
    PRIMARY KEY ("vid"),
    KEY "sort_name" ("sort_name") USING BTREE,
    KEY "uid2" ("uid") USING BTREE,
    CONSTRAINT "video_ibfk_1" FOREIGN KEY ("sort_name") REFERENCES "sort" ("sortname") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "video_ibfk_2" FOREIGN KEY ("uid") REFERENCES "usercontent" ("uid") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
