-- Source: https://github.com/ClementGib/Coco/blob/8fbce5eedd9aac6c0d1db2a6a28f217e90062dcd/docker/postgres/test/init.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 10
CREATE TABLE users
(
    username varchar(255) NOT NULL,
    password text NOT NULL,
    admin boolean NOT NULL,
    email varchar(255) NOT NULL,
    history jsonb NOT NULL,
    birthday DATE NOT NULL,
    creation_date timestamp NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE comments
(
    comment_id BIGSERIAL NOT NULL,
    tutorial_id bigint NOT NULL,
    user_username varchar(255) NOT NULL,
    content text NOT NULL,
    creation_date timestamp NOT NULL,
    PRIMARY KEY (comment_id),
    CONSTRAINT fk_comments_users FOREIGN KEY(user_username) REFERENCES users(username)
);

CREATE TABLE categories
(
    name text NOT NULL UNIQUE
);

CREATE TABLE tutorials
(
    tutorial_id BIGSERIAL NOT NULL,
    title varchar(255) NOT NULL,
    category varchar(255) NOT NULL,
    author varchar(255) NOT NULL,
    description text NOT NULL,
    image_name varchar(255),
    liked integer NOT NULL,
    last bigint references tutorials(tutorial_id),
    next bigint references tutorials(tutorial_id),
    CONSTRAINT pk_tutorials PRIMARY KEY (tutorial_id),
    CONSTRAINT fk_tutorials FOREIGN KEY(category) REFERENCES categories(name)
);

CREATE TABLE pages
	(
    page_id BIGSERIAL NOT NULL,
    page_nb integer NOT NULL,
    tutorial bigint NOT NULL,
    title text NOT NULL,
    creation_date timestamp NOT NULL,
    update_date timestamp NOT NULL,
    CONSTRAINT pk_pages PRIMARY KEY (page_id),
    CONSTRAINT fk_pages FOREIGN KEY(tutorial) REFERENCES tutorials(tutorial_id)
);

CREATE TABLE posts
	(
    post_id BIGSERIAL NOT NULL,
    post_nb integer NOT NULL,
    page bigint NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    creation_date timestamp NOT NULL,
    update_date timestamp NOT NULL,
    CONSTRAINT pk_posts PRIMARY KEY (post_id),
    CONSTRAINT fk_posts FOREIGN KEY(page) REFERENCES pages(page_id)
);

CREATE TABLE dictionnaries
	(
    word varchar(255) NOT NULL UNIQUE,
    description text NOT NULL,
    used integer NOT NULL,
    CONSTRAINT pk_dictionnaries PRIMARY KEY (word)
);

CREATE TABLE ids
	(
    origin varchar(255) NOT NULL UNIQUE,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    description text NOT NULL,
    CONSTRAINT pk_ids PRIMARY KEY (origin)
);
