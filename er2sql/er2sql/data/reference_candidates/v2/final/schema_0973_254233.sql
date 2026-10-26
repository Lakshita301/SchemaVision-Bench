-- Source: https://github.com/Arnzero/php_SQL_DBs_HWs/blob/f54072d07f898469682a74f0adff9779fab33d02/325%20Intro%20to%20SQL/325hw2/325hw2-create.sql?raw=true
-- Tables detected: 3 | FK constraints: 2
create table Client(
    Cli_id char(4),
    Cli_lname VARCHAR(10),
    Cli_fname VARCHAR(10),
    Cli_phone VARCHAR(12),
    primary key(Cli_id)
);

create table Video(
    Vid_id char(6),
    Vid_format VARCHAR(6),
    Vid_purchased_date date,
    Vid_rental_price number(3,2),
    Vid_length integer,
    primary key(Vid_id)
);

create table Rental(
    Cli_id char(4),
    Vid_id char(6),
    primary key (Cli_id, Vid_id),
    foreign key(Cli_id) references Client(Cli_id),
    foreign key(Vid_id) references Video(Vid_id)
);
