-- Source: https://github.com/littlekelvin/spring-boot-test-ci/blob/27d199509a1c8ca72dbb04cf8783db3c6f266e64/src/test/resources/db/schema-h2.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

create table m_author
(
    id               bigint auto_increment
        primary key,
    create_by        varchar(255) null,
    create_date      datetime(3)  null,
    last_update_by   varchar(255) null,
    last_update_date datetime     null,
    age              int          null,
    gender           varchar(255) null,
    name             varchar(32)  not null
);

create table m_post
(
    id               bigint auto_increment
        primary key,
    create_by        varchar(255) null,
    create_date      datetime(3)  null,
    last_update_by   varchar(255) null,
    last_update_date datetime     null,
    body             varchar(255) null,
    title            varchar(255) null,
    author_id        bigint       null,
    constraint FKp1hw0ofp49x20h8yjt7fg5j0p
        foreign key (author_id) references m_author (id)
);

create table m_user
(
    id               bigint auto_increment
        primary key,
    create_by        varchar(255) null,
    create_date      datetime(3)  null,
    last_update_by   varchar(255) null,
    last_update_date datetime     null,
    birth_day        datetime(3)  null,
    password         varchar(255) null,
    role             int          null,
    username         varchar(255) null
);

