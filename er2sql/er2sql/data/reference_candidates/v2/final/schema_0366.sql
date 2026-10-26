-- Source: https://github.com/siroj100/hidupgue/blob/fd8709045b3afe6641723049b6619b8ca233b577/system/create.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 10
create table pengguna (
    id int not null auto_increment,
    user_name varchar(50) unique not null,
    password varchar(64) not null,
    salt varchar(64) not null,
    real_name varchar(100) not null,
    primary_kontak_id int,
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    constraint fk_pengguna_0 foreign key (primary_kontak_id) references kontak (id),
    primary key (id)
);

create table enum_params (
    id int not null auto_increment,
    enum_class varchar(30),
    enum_value int,
    enum_value_desc varchar(100),
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    primary key (id)
);

create table aktivitas (
    id int not null auto_increment,
    name varchar(100),
    description varchar(500),
    eval_periond int,
    status int,
    activity_type int,
    start_target_date TIMESTAMP,
    end_target_date TIMESTAMP,
    start_executed_date TIMESTAMP,
    end_executed_date TIMESTAMP,
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    primary key (id)
);

create table catatan (
    id int not null auto_increment,
    title varchar(100),
    teks text,
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    primary key (id)
);

create table kontak (
    id int not null auto_increment,
    name varchar(100),
    birth_date date,
    sex char(1),
    company varchar(100),
    pengguna_id int not null,
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    constraint fk_kontak_0 foreign key (pengguna_id) references pengguna (id),
    primary key (id)
);

create table kontak_email (
    id int not null auto_increment,
    email_address varchar(500),
    add_info varchar(100),
    contact_info_type int,
    primary_flag boolean DEFAULT FALSE,
    kontak_id int not null,
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    constraint fk_kontak_email_0 foreign key (kontak_id) references kontak (id),
    primary key (id)
);

create table kontak_telepon (
    id int not null auto_increment,
    phone_number varchar(20),
    add_info varchar(100),
    contact_info_type int,
    primary_flag boolean DEFAULT FALSE,
    kontak_id int not null,
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    constraint fk_kontak_telepon_0 foreign key (kontak_id) references kontak (id),
    primary key (id)
);

create table kontak_alamat (
    id int not null auto_increment,
    address varchar(500),
    add_info varchar(100),
    contact_info_type int,
    primary_flag boolean DEFAULT FALSE,
    kontak_id int not null,
    created_on timestamp DEFAULT 0,
    updated_on timestamp DEFAULT CURRENT_TIMESTAMP,
    constraint fk_kontak_alamat_0 foreign key (kontak_id) references kontak (id),
    primary key (id)
);
