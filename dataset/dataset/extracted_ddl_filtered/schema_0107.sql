-- Source: https://github.com/KostaDev/printoffice_web/blob/90f639e0c1d13600e180f167027f0d2119f8a6b8/ddl/printoffice.ddl?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 5

create table `client`
(
    `client_id`  int primary key auto_increment,
    `first_name` varchar(255) not null,
    `last_name`  varchar(255) not null,
    `email`      varchar(255),
    `phone`      varchar(255)
);

create table `employee`
(
    `employee_id` int primary key auto_increment,
    `first_name`  varchar(255) not null,
    `last_name`   varchar(255) not null,
    `username`    varchar(255) not null,
    `password`    varchar(255) not null
);

create table `printing_machine`
(
    `printing_machine_id` int primary key auto_increment,
    `description`         text default (''),
    `manufacturing_date`  date         not null,
    `make`                varchar(255) not null,
    `model`               varchar(255) not null
);

create table `print`
(
    `print_id`            int primary key auto_increment,

    `printing_machine_id` int  not null,
    `employee_id`         int  not null,
    `document_id`         int  not null,

    `note`                text default (''),
    `print_date`          date not null,

    constraint `fk_print_printing_machine` foreign key (`printing_machine_id`) references `printing_machine` (`printing_machine_id`),
    constraint `fk_print_employee` foreign key (`employee_id`) references `employee` (`employee_id`),
    constraint `fk_print_document` foreign key (`document_id`) references `document` (`document_id`)
);

create table `document`
(
    `document_id`        int primary key auto_increment,

    `deadline`           date not null,
    `hard_cover`         tinyint      default 0,
    `print_instructions` varchar(255) default ''
);

create table `order`
(
    `order_id`   int primary key auto_increment,

    `print_id`   int   not null,
    `client_id`  int   not null,

    `paid`       tinyint default 0,
    `price`      float not null,
    `order_date` date    default (current_date),

    constraint `fk_order_print` foreign key (`print_id`) references `print` (`print_id`),
    constraint `fk_order_client` foreign key (`client_id`) references `client` (`client_id`)
);

