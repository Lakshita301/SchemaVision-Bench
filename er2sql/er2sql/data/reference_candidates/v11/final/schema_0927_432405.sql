-- Source: https://github.com/Eng-HebaEssam/English-4-You/blob/dee8f1ef6cc7b4f466db3ea6b92a42590760898b/back_end/samah123.sql?raw=true
-- Tables detected: 18 | FK constraints: 14
CREATE TABLE answer (
    id int NOT NULL,
    exam_id int NOT NULL,
    mark int NOT NULL,
    user_id int NOT NULL,
    date date DEFAULT NULL,
    lesson_id int DEFAULT NULL,
    answer varchar(255) NOT NULL
);
CREATE TABLE audios (
    audio_id int NOT NULL,
    audio_name varchar(255) NOT NULL,
    audio varchar(255) NOT NULL,
    created_at date NOT NULL,
    status SMALLINT NOT NULL DEFAULT '0',
    cat_id int NOT NULL,
    orders int NOT NULL DEFAULT '0',
    audio_desc text,
    member_id int NOT NULL
);
CREATE TABLE benfits (
    benfit_id int NOT NULL,
    description varchar(225) NOT NULL,
    benfit_image varchar(225) NOT NULL,
    benfit_date date NOT NULL
);
CREATE TABLE category (
    category_id int NOT NULL,
    category_name varchar(255) NOT NULL,
    category_description text NOT NULL,
    ordering int DEFAULT '0',
    parent int NOT NULL,
    visibility SMALLINT NOT NULL,
    allow_comment SMALLINT NOT NULL,
    allow_ads SMALLINT NOT NULL,
    image varchar(255) NOT NULL
);
CREATE TABLE comments (
    comment_id int NOT NULL,
    comment text NOT NULL,
    comment_data date NOT NULL,
    status SMALLINT NOT NULL DEFAULT '0',
    member_id int NOT NULL,
    post_id int DEFAULT NULL,
    lesson_id int DEFAULT NULL,
    message_id int DEFAULT NULL
);
CREATE TABLE events (
    events_id int NOT NULL,
    events_name varchar(255) CHARACTER SET utf8 NOT NULL,
    events_description text CHARACTER SET utf8 NOT NULL,
    events_time time DEFAULT NULL,
    events_date date DEFAULT NULL,
    cat_id int DEFAULT NULL,
    orders int NOT NULL DEFAULT '0'
);
CREATE TABLE exams (
    exam_id int NOT NULL,
    exam_name varchar(255) NOT NULL,
    exam_date date NOT NULL,
    categ_id int NOT NULL,
    member_id int NOT NULL,
    lesson_id int DEFAULT NULL,
    link varchar(225) NOT NULL,
    exam_desc text,
    number int DEFAULT '10',
    type int NOT NULL DEFAULT '0',
    time int NOT NULL DEFAULT '1800',
    orders int NOT NULL DEFAULT '0'
);
CREATE TABLE lessons (
    lesson_id int NOT NULL,
    lesson_name varchar(255) NOT NULL,
    lesson_description text NOT NULL,
    video varchar(255) NOT NULL,
    lesson_data date NOT NULL,
    member_id int NOT NULL,
    cat_id int NOT NULL,
    video_name varchar(225) DEFAULT NULL,
    youtube SMALLINT NOT NULL DEFAULT '0',
    approve SMALLINT NOT NULL DEFAULT '0',
    pdf varchar(255) DEFAULT NULL,
    orders int NOT NULL DEFAULT '0'
);
CREATE TABLE lesson_member (
    lesson_member_id int NOT NULL,
    lesson_id int NOT NULL,
    member_id int NOT NULL,
    date date NOT NULL,
    type SMALLINT NOT NULL DEFAULT '0',
    cat_id int DEFAULT NULL,
    last_date date DEFAULT NULL,
    next_id SMALLINT NOT NULL DEFAULT '0'
);
CREATE TABLE live (
    live_id int NOT NULL,
    link text CHARACTER SET utf8,
    cat_id int DEFAULT NULL,
    date date NOT NULL,
    orders int NOT NULL DEFAULT '0'
);
CREATE TABLE main (
    main_id int NOT NULL,
    first int NOT NULL DEFAULT '50',
    second int NOT NULL DEFAULT '50',
    third int NOT NULL DEFAULT '50'
);
CREATE TABLE members (
    userid int NOT NULL,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    email varchar(255) DEFAULT NULL,
    fullname varchar(255) DEFAULT NULL,
    groupid int NOT NULL DEFAULT '0',
    regstatus int NOT NULL DEFAULT '0',
    date date NOT NULL,
    avatar varchar(225) NOT NULL DEFAULT 'img.png',
    lil text,
    orders int NOT NULL DEFAULT '0',
    lil_data date DEFAULT NULL,
    phone int DEFAULT NULL,
    "only" int NOT NULL DEFAULT '0',
    phone_2 int DEFAULT NULL,
    country varchar(255) DEFAULT NULL,
    city varchar(255) DEFAULT NULL,
    mac varchar(255) DEFAULT NULL
);
CREATE TABLE message (
    id int NOT NULL,
    message varchar(255) CHARACTER SET utf8 DEFAULT NULL,
    user_id int DEFAULT NULL,
    date date DEFAULT NULL,
    username varchar(255) CHARACTER SET utf8 DEFAULT NULL,
    email varchar(255) CHARACTER SET utf8 DEFAULT NULL
);
CREATE TABLE part (
    part_id int NOT NULL,
    part_name varchar(255) NOT NULL,
    exam_id int DEFAULT NULL,
    number int DEFAULT NULL,
    photo varchar(255) CHARACTER SET utf8 DEFAULT NULL,
    date date NOT NULL,
    time int DEFAULT NULL
);
CREATE TABLE post (
    post_id int NOT NULL,
    post_name varchar(255) NOT NULL,
    post_description text NOT NULL,
    post_image varchar(255) NOT NULL,
    post_data date NOT NULL,
    allow_comment SMALLINT NOT NULL DEFAULT '0',
    users int NOT NULL,
    tags varchar(225) NOT NULL,
    type SMALLINT DEFAULT NULL,
    cat_id int DEFAULT NULL,
    orders int NOT NULL DEFAULT '0'
);
CREATE TABLE question (
    id int NOT NULL,
    exam_id int DEFAULT NULL,
    ques text NOT NULL,
    added_date date NOT NULL,
    answer_1 text,
    answer_2 text,
    answer_3 text,
    answer_4 text,
    right_answer varchar(255) DEFAULT NULL,
    photo varchar(225) DEFAULT NULL,
    answer varchar(255) DEFAULT NULL,
    part_id int DEFAULT NULL
);
CREATE TABLE user_token (
    id int NOT NULL,
    username varchar(225) CHARACTER SET utf8 NOT NULL,
    token varchar(225) CHARACTER SET utf8 NOT NULL,
    timemodified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE youtube_live (
    id int NOT NULL,
    link varchar(255) NOT NULL,
    created_at date DEFAULT NULL,
    status SMALLINT NOT NULL DEFAULT '0',
    cat_id int NOT NULL,
    description text
);
ALTER TABLE audios ADD CONSTRAINT audio_cat_id FOREIGN KEY (cat_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE audios ADD CONSTRAINT member_id_audio FOREIGN KEY (member_id) REFERENCES members (userid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE comments ADD CONSTRAINT com FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE comments ADD CONSTRAINT comments FOREIGN KEY (member_id) REFERENCES members (userid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE comments ADD CONSTRAINT memb FOREIGN KEY (post_id) REFERENCES post (post_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE events ADD CONSTRAINT category FOREIGN KEY (cat_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE lesson_member ADD CONSTRAINT lessson_id FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE lesson_member ADD CONSTRAINT member_id FOREIGN KEY (member_id) REFERENCES members (userid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE message ADD CONSTRAINT user_message FOREIGN KEY (user_id) REFERENCES members (userid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE part ADD CONSTRAINT exam_id FOREIGN KEY (exam_id) REFERENCES exams (exam_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE post ADD CONSTRAINT user_name FOREIGN KEY (users) REFERENCES members (userid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE question ADD CONSTRAINT part_id FOREIGN KEY (part_id) REFERENCES part (part_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE question ADD CONSTRAINT ques FOREIGN KEY (exam_id) REFERENCES exams (exam_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE youtube_live ADD CONSTRAINT youtube_live_cat_id FOREIGN KEY (cat_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE CASCADE;
