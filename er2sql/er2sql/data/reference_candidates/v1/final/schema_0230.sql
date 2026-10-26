-- Source: https://github.com/Ocejo/yii_V1/blob/608cef4355d430dbc4dde2db732de210be714ec8/demos/blog/protected/data/schema.cubrid.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 4
CREATE TABLE tbl_lookup
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    code INTEGER NOT NULL,
    "type" VARCHAR(128) NOT NULL,
    "position" INTEGER NOT NULL
);

CREATE TABLE tbl_user
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(128) NOT NULL,
    password VARCHAR(64) NOT NULL,
    email VARCHAR(128) NOT NULL,
    profile STRING
);

CREATE TABLE tbl_post
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    content STRING NOT NULL,
    tags STRING,
    status INTEGER NOT NULL,
    create_time INTEGER,
    update_time INTEGER,
    author_id INTEGER NOT NULL,
    CONSTRAINT FK_post_author FOREIGN KEY (author_id)
		REFERENCES tbl_user (id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE tbl_comment
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    content STRING NOT NULL,
    status INTEGER NOT NULL,
    create_time INTEGER,
    author VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL,
    url VARCHAR(128),
    post_id INTEGER NOT NULL,
    CONSTRAINT FK_comment_post FOREIGN KEY (post_id)
		REFERENCES tbl_post (id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE tbl_tag
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    frequency INTEGER DEFAULT 1
);
