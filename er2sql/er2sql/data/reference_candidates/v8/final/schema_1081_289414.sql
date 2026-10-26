-- Source: https://github.com/Hirevo/rss-app/blob/ff9c0001aef240b0857ec8064bb0c622c2822b19/api/migrations/2021-04-13-070525_initialize/up.sql?raw=true
-- Tables detected: 9 | FK constraints: 8
create table users (
    id varchar(255) not null unique primary key,
    email varchar(255) not null unique,
    google_uid varchar(255) unique,
    name varchar(255) not null,
    passwd varchar(255)
);

create table sessions (
    id varchar(255) not null unique primary key,
    expiry varchar(25) not null,
    data text not null
);

create table tokens (
    token varchar(255) not null unique primary key,
    user_id varchar(255) not null,
    expiry varchar(25) not null,
    foreign key (user_id) references users(id) on update cascade on delete cascade
);

create table salts (
    user_id varchar(255) not null unique primary key,
    salt varchar(255) not null,
    foreign key (user_id) references users(id) on update cascade on delete cascade
);

create table feeds (
    id varchar(255) not null unique primary key,
    title text not null,
    description text,
    feed_url text,
    homepage_url text
);

create table articles (
    id varchar(255) not null unique primary key,
    feed_id varchar(255) not null,
    title varchar(255) not null,
    url text,
    html_content text,
    foreign key (feed_id) references feeds(id) on update cascade on delete cascade
);

create table feed_categories (
    feed_id varchar(255) not null,
    category_name varchar(255) not null,
    primary key (feed_id, category_name),
    foreign key (feed_id) references feeds(id) on update cascade on delete cascade
);

create table subscriptions (
    user_id varchar(255) not null,
    feed_id varchar(255) not null,
    primary key (user_id, feed_id),
    foreign key (user_id) references users(id) on update cascade on delete cascade,
    foreign key (feed_id) references feeds(id) on update cascade on delete cascade
);

create table articles_read (
    user_id varchar(255) not null,
    article_id varchar(255) not null,
    primary key (user_id, article_id),
    foreign key (user_id) references users(id) on update cascade on delete cascade,
    foreign key (article_id) references articles(id) on update cascade on delete cascade
);
