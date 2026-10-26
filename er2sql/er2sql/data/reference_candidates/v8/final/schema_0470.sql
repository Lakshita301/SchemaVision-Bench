-- Source: https://github.com/lvh201998/chatbot2/blob/d66d35337388e6cced948187919bea7869fa4a94/database/chat.sql?raw=true
-- Tables detected: 15 | FK/REFERENCES mentions: 2
CREATE TABLE channel (
    id int NOT NULL,
    sender int DEFAULT NULL,
    receiver int DEFAULT NULL,
    group_recipient_id int DEFAULT NULL,
    message_id int DEFAULT NULL
);
CREATE TABLE comment (
    id int NOT NULL,
    comment_owner int NOT NULL,
    post_id int NOT NULL,
    comment_date timestamp NOT NULL DEFAULT current_timestamp(),
    comment_edit_date timestamp NULL DEFAULT NULL,
    comment_text text DEFAULT NULL
);
CREATE TABLE "like" (
    id int NOT NULL,
    post_id int DEFAULT NULL,
    user_id int DEFAULT NULL,
    like_date timestamp NOT NULL DEFAULT current_timestamp()
);
CREATE TABLE message (
    id int NOT NULL,
    message_creator int DEFAULT NULL,
    message text DEFAULT NULL,
    create_date TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    is_reply int DEFAULT NULL,
    reply_to int DEFAULT NULL
);
CREATE TABLE message_recipient (
    id int NOT NULL,
    receiver_id int DEFAULT NULL,
    message_id int DEFAULT NULL,
    is_read SMALLINT NOT NULL DEFAULT 0
);
CREATE TABLE post (
    id int NOT NULL,
    post_owner int NOT NULL,
    post_visibility int NOT NULL DEFAULT 0,
    post_date timestamp NOT NULL DEFAULT current_timestamp(),
    post_edit_date timestamp NULL DEFAULT NULL,
    text_content text DEFAULT NULL,
    picture_media text DEFAULT NULL,
    video_media text DEFAULT NULL,
    post_place int DEFAULT 1,
    is_shared int DEFAULT 0,
    post_shared_id int DEFAULT NULL
);
CREATE TABLE post_place (
    id int NOT NULL,
    post_place varchar(40) DEFAULT NULL
);
CREATE TABLE post_visibility (
    id int NOT NULL,
    visibility varchar(40) DEFAULT NULL
);
CREATE TABLE users_session (
    id int NOT NULL,
    user_id int DEFAULT NULL,
    hash varchar(64) DEFAULT NULL
);
CREATE TABLE user_follow (
    id int NOT NULL,
    follower_id int NOT NULL,
    followed_id int NOT NULL
);
CREATE TABLE user_info (
    id int NOT NULL,
    username varchar(20) DEFAULT NULL,
    password varchar(64) DEFAULT NULL,
    salt varchar(32) DEFAULT NULL,
    firstname varchar(50) DEFAULT NULL,
    lastname varchar(50) DEFAULT NULL,
    joined timestamp NOT NULL DEFAULT current_timestamp(),
    user_type int DEFAULT NULL,
    email varchar(255) DEFAULT '',
    bio varchar(800) DEFAULT NULL,
    picture text DEFAULT NULL,
    cover text DEFAULT NULL,
    private int NOT NULL DEFAULT -1,
    last_active_update timestamp NULL DEFAULT NULL
);
CREATE TABLE user_metadata (
    id int NOT NULL,
    label varchar(200) DEFAULT NULL,
    content varchar(200) DEFAULT NULL,
    user_id int DEFAULT NULL
);
CREATE TABLE user_relation (
    "from" int NOT NULL,
    "to" int NOT NULL,
    status varchar(1) DEFAULT NULL,
    since timestamp NOT NULL DEFAULT current_timestamp(),
    id int NOT NULL
);
CREATE TABLE user_type (
    id int NOT NULL,
    type_name varchar(30) DEFAULT NULL,
    permission text DEFAULT NULL
);
CREATE TABLE writing_message_notifier (
    message_writer int DEFAULT NULL,
    message_waiter int DEFAULT NULL
);
ALTER TABLE message_recipient ADD CONSTRAINT message_recipient_ibfk_1 FOREIGN KEY (message_id) REFERENCES message (id) ON DELETE SET NULL;
ALTER TABLE post ADD CONSTRAINT fk_post_place FOREIGN KEY (post_place) REFERENCES post_place (id);
