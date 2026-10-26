-- Source: https://github.com/akshayyadav76/mysql_workspace/blob/00779b0820f339057adc79f795e6b7337eddbaf5/.c9/metadata/workspace/10.Instagram/ig_Schema.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 18

CREATE TABLE users (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    username VARCHAR(255) UNIQUE NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW()\n);

CREATE TABLE photos (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    image_url VARCHAR(255) NOT NULL,\n    user_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY(user_id) REFERENCES users(id)\n);

CREATE TABLE comments (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    comment_text VARCHAR(255) NOT NULL,\n    user_id INTEGER NOT NULL,\n    photo_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY(user_id) REFERENCES users(id),\n    FOREIGN KEY(photo_id) REFERENCES photos(id)\n);

CREATE TABLE likes (\n    user_id INTEGER NOT NULL,\n    photo_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY(user_id) REFERENCES users(id),\n    FOREIGN KEY(photo_id) REFERENCES photos(id),\n    PRIMARY KEY(user_id, photo_id)\n);

CREATE TABLE follows (\n    follower_id INTEGER NOT NULL,\n    followee_id INTEGER NOT NULL,\n    created_at TIMESTAMP DEFAULT NOW(),\n    FOREIGN KEY (follower_id) REFERENCES users(id),\n    FOREIGN KEY (followee_id) REFERENCES users(id),\n    PRIMARY KEY(follower_id, followee_id)\n);

CREATE TABLE tags (\n    id INTEGER AUTO_INCREMENT PRIMARY KEY,\n    tag_name VARCHAR(255) UNIQUE,\n    created_at TIMESTAMP DEFAULT NOW()\n);

CREATE TABLE photo_tags (\n    photo_id INTEGER NOT NULL,\n    tag_id INTEGER NOT NULL,\n    FOREIGN KEY(photo_id) REFERENCES photos(id),\n    FOREIGN KEY(tag_id) REFERENCES tags(id),\n    PRIMARY KEY(photo_id, tag_id)\n);

