-- Source: https://github.com/akshayyadav76/mysql_workspace/blob/00779b0820f339057adc79f795e6b7337eddbaf5/.c9/metadata/workspace/10.Instagram.sql/ig_Schema.sql?raw=true
-- Tables detected: 16 | FK/REFERENCES mentions: 36

CREATE TABLE users (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    username VARCHAR(255) UNIQUE NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW()\n);

CREATE TABLE photos (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    image_url VARCHAR(255) NOT NULL,\n    user_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY(user_id) REFERENCES users(id)\n);

CREATE TABLE comments (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    comment_text VARCHAR(255) NOT NULL,\n    user_id INTEGER NOT NULL,\n    photo_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY(user_id) REFERENCES users(id),\n    FOREIGN KEY(photo_id) REFERENCES photos(id)\n);

CREATE TABLE likes (\n    user_id INTEGER NOT NULL,\n    photo_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY(user_id) REFERENCES users(id),\n    FOREIGN KEY(photo_id) REFERENCES photos(id),\n    PRIMARY KEY(user_id, photo_id)\n);

CREATE TABLE follows (\n    follower_id INTEGER NOT NULL,\n    followee_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY (follower_id) REFERENCES users(id),\n    FOREIGN KEY (followee_id) REFERENCES users(id),\n    PRIMARY KEY(follower_id, followee_id)\n);

CREATE TABLE tags (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    tag_name VARCHAR(255) UNIQUE,\n    created_at TIMESTAMP DEFAULT NOW()\n);

CREATE TABLE photo_tags (\n    photo_id INTEGER NOT NULL,\n    tag_id INTEGER NOT NULL,\n    FOREIGN KEY(photo_id) REFERENCES photos(id),\n    FOREIGN KEY(tag_id) REFERENCES tags(id),\n    PRIMARY KEY(photo_id, tag_id)\n);

CREATE TABLE users (","    id INTEGER AUTO_INCREMENT PRIMARY KEY,","    username VARCHAR(255) UNIQUE NOT NULL,","    created_at TIMESTAMP DEFAULT NOW()",");

CREATE TABLE users (","    id INTEGER AUTO_INCREMENT PRIMARY KEY,","    username VARCHAR(255) UNIQUE NOT NULL,","    created_at TIMESTAMP DEFAULT NOW()",");

CREATE TABLE users (","    id INTEGER AUTO_INCREMENT PRIMARY KEY,","    username VARCHAR(255) UNIQUE NOT NULL,","    created_at TIMESTAMP DEFAULT NOW()",");

CREATE TABLE photos (","    id INTEGER AUTO_INCREMENT PRIMARY KEY,","    image_url VARCHAR(255) NOT NULL,","    user_id INTEGER NOT NULL,","    created_at TIMESTAMP DEFAULT NOW(),","    FOREIGN KEY(user_id) REFERENCES users(id)",");

CREATE TABLE comments (","    id INTEGER AUTO_INCREMENT PRIMARY KEY,","    comment_text VARCHAR(255) NOT NULL,","    user_id INTEGER NOT NULL,","    photo_id INTEGER NOT NULL,","    created_at TIMESTAMP DEFAULT NOW(),","    FOREIGN KEY(user_id) REFERENCES users(id),","    FOREIGN KEY(photo_id) REFERENCES photos(id)",");

CREATE TABLE likes (","    user_id INTEGER NOT NULL,","    photo_id INTEGER NOT NULL,","    created_at TIMESTAMP DEFAULT NOW(),","    FOREIGN KEY(user_id) REFERENCES users(id),","    FOREIGN KEY(photo_id) REFERENCES photos(id),","    PRIMARY KEY(user_id, photo_id)",");

CREATE TABLE follows (","    follower_id INTEGER NOT NULL,","    followee_id INTEGER NOT NULL,","    created_at TIMESTAMP DEFAULT NOW(),","    FOREIGN KEY (follower_id) REFERENCES users(id),","    FOREIGN KEY (followee_id) REFERENCES users(id),","    PRIMARY KEY(follower_id, followee_id)",");

CREATE TABLE tags (","    id INTEGER AUTO_INCREMENT PRIMARY KEY,","    tag_name VARCHAR(255) UNIQUE,","    created_at TIMESTAMP DEFAULT NOW()",");

CREATE TABLE photo_tags (","    photo_id INTEGER NOT NULL,","    tag_id INTEGER NOT NULL,","    FOREIGN KEY(photo_id) REFERENCES photos(id),","    FOREIGN KEY(tag_id) REFERENCES tags(id),","    PRIMARY KEY(photo_id, tag_id)",");

