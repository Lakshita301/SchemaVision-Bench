-- Source: https://github.com/1Anass/Database-of-findapet/blob/0e2ef09e38ea7881293dd2af5dad14c3a7fbbe04/database_sql_code.sql?raw=true
-- Tables detected: 6 | FK constraints: 4
create table pet(
    pet_id int primary key,
    pet_name varchar(30) not null,
    gender varchar(10) not null,
    age smallint not null,
    coat_length varchar(15) not null,
    training text,
    description text,
    color varchar(15) not null,
    size varchar(15) not null,
    city varchar(20) not null,
    country varchar(20) not null,
    pet_type varchar(4),
    vaccination text not null,
    CONSTRAINT CK_size CHECK (size IN ('small','medium','large','extra large')),
    CONSTRAINT CK_gender CHECK (gender IN ('male','female')),
    CONSTRAINT CK_coat_length CHECK (coat_length IN ('hairless','short','medium','long','wire','curly')),
    CONSTRAINT CK_pet_type CHECK (pet_type IN ('cat','dog'))
);
create table registered_user(
    user_id int primary key,
    name varchar(40) not null,
    gender varchar(10) not null,
    age smallint not null,
    country varchar(30) not null,
    email varchar(50) not null,
    phone_number varchar(15) not null,
    CONSTRAINT CK_gender CHECK (gender IN ('male','female'))
);
create table search(
    search_id int primary key,
    ip_address varchar(30) not null,
    date date not null,
    pet_type varchar(4),
    pet_category varchar(30),
    gender varchar(10),
    size varchar(15),
    color varchar(15),
    city varchar(20),
    country varchar(20),
    CONSTRAINT CK_size CHECK (size IN ('small','medium','large','extra large')),
    CONSTRAINT CK_gender CHECK (gender IN ('male','female')),
    CONSTRAINT CK_pet_type CHECK (pet_type IN ('cat','dog'))
);
create table offer(
    offer_id int primary key,
    pet_id int not null,
    user_id int,
    phone_number varchar(15) unique not null,
    email varchar(50) not null
);
create table demand(
    demand_id int primary key,
    user_id int,
    gender varchar(10) not null,
    pet_type varchar(4) not null,
    size varchar(15),
    age smallint not null,
    color varchar(15),
    city varchar(20) not null,
    country varchar(20) not null,
    CONSTRAINT CK_size CHECK (size IN ('small','medium','large','extra large')),
    CONSTRAINT CK_gender CHECK (gender IN ('male','female')),
    CONSTRAINT CK_pet_type CHECK (pet_type IN ('cat','dog'))
);
create table credentials (
    email varchar(50) primary key,
    password varchar(30) not null
);
ALTER TABLE registered_user ADD constraint emailf_key foreign key (email) references credentials (email);
ALTER TABLE offer ADD constraint pet_fkey foreign key (pet_id) references pet (pet_id) on delete set null on update cascade;
ALTER TABLE offer ADD constraint user_fkey foreign key (user_id) references registered_user (user_id) on delete set null on update cascade;
ALTER TABLE demand ADD constraint user_fkey foreign key (user_id) references registered_user (user_id) on delete set null on update cascade;
