-- Source: https://github.com/Barry0310/DataBase-final-project/blob/4c6619997c4a3aef9510cbc4723f04d11b868dbd/DataBaseDDL/DDL.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 8
create table "user"
  (
    ID char(20),
    password char(20),
    name char(20),
    gender char(6),
    education char(20),
    create_time date,
    num_post int,
    primary key (ID)
);

create table classification
  (
    name char(20),
    discussion int,
    num_comment int,
    last_article_time date,
    primary key (name)
);

create table article
  (
    serial_num int,
    author char(20),
    class char(20),
    title char(30),
    content varchar(100),
    post_time date,
    primary key (serial_num),
    foreign key (author) references "user" (ID) on delete cascade,
    foreign key (class) references classification (name) on delete cascade
);

create table comment
  (
    serial_num int,
    userID char(20),
    article_num int,
    comment_time date,
    content varchar(50),
    primary key (serial_num),
    foreign key (userID) references "user" (ID) on delete cascade,
    foreign key (article_num) references article (serial_num)
);
