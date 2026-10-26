-- Source: https://github.com/Meshok-maker/DATABASE/blob/aca2ef55713305ba1ccb8000748b9d1a5c67195e/mysql-init-files/0TABLE.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 10

create table clients
(
    id          bigint auto_increment
        primary key,
    surname     varchar(255) not null,
    first_name  varchar(255) not null,
    middle_name varchar(255) not null,
    dob         date         not null,
    adress      varchar(255) not null,
    telephone   varchar(255) not null,
    visa        date         null
);

create table country
(
    id           bigint auto_increment
        primary key,
    country_name varchar(255) not null,
    constraint country_country_name_uindex
        unique (country_name)
);

create table city
(
    id         bigint auto_increment
        primary key,
    country_id bigint       not null,
    city_name  varchar(255) not null,
    constraint city_ibfk_1
        foreign key (country_id) references country (id)
);

create table hotels
(
    id         bigint auto_increment
        primary key,
    host_city  bigint       not null,
    hotel_name varchar(255) not null,
    raiting    int          not null,
    price      bigint       not null,
    constraint hotels_ibfk_1
        foreign key (host_city) references city (id)
);

create table tours
(
    id             bigint auto_increment
        primary key,
    type_tour      enum ('Auto tour', 'Cruise', 'Mountain', 'Exotic', 'Healing', 'Excursion', 'Business') null,
    type_food      enum ('Breakfast only', 'Breakfast and lunch', 'All inclusive')                        null,
    hotel          bigint                                                                                 not null,
    begin_date     date                                                                                   not null,
    end_date       date                                                                                   not null,
    is_needed_visa tinyint(1) default false                                                               null,
    price          bigint                                                                                 not null,
    constraint tours_ibfk_1
        foreign key (hotel) references hotels (id)
);

create table sales
(
    id        bigint auto_increment
        primary key,
    client_id bigint not null,
    tour_id   bigint not null,
    sale_date date   not null,
    constraint sales_ibfk_1
        foreign key (client_id) references clients (id),
    constraint sales_ibfk_2
        foreign key (tour_id) references tours (id)
);

