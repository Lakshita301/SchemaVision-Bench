-- Source: https://github.com/mgstyle97/poom-i-api/blob/3b7d8b22effa31a5b9bbb39795268b32b03e23b8/build/resources/main/db/h2/schema.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 44

CREATE TABLE sms_certification(
    id integer primary key,
    phone_number varchar not null,
    certification_number varchar not null
);

CREATE TABLE email_certification(
    id integer primary key,
    email varchar not null,
    certification_number varchar not null
);

CREATE TABLE refresh_token (
    id integer primary key,
    member_email varchar not null,
    refresh_token varchar not null
);

CREATE TABLE address_tag (
    id integer primary key,
    extra_address varchar unique
);

CREATE TABLE address (
    id integer primary key,
    post_code varchar not null,
    address varchar not null,
    detail_address varchar not null,
    ad_tag_id integer,
    foreign key(ad_tag_id) references address_tag(id)
);

CREATE TABLE authority (
    id integer primary key,
    authority varchar unique
);

CREATE TABLE childminder_info(
    id integer primary key,
    date date,
    experience varchar,
    greeting varchar,
    score integer default 0,
    provider_count integer default 0
);

CREATE TABLE member(
    id integer primary key,
    name varchar not null,
    phone_number varchar not null,
    email varchar unique,
    password varchar not null,
    nick varchar unique,
    gender varchar not null,
    age integer not null,
    score integer not null default 0,
    score_provider_count integer not null default 0,
    cm_info_id integer,
    address_id integer,
    foreign key (cm_info_id) references childminder_info(id),
    foreign key (address_id) references address(id)
);

CREATE TABLE member_authority(
    member_id integer not null ,
    authority_id integer not null,
    foreign key (member_id) references member(id),
    foreign key (authority_id) references authority(id)
);

CREATE TABLE childminder_class(
    id integer primary key,
    title varchar not null,
    contents CLOB not null,
    capacity bigint,
    created_at date,
    modified_at date,
    is_recruit boolean default false,
    member_id integer not null,
    address_tag_id integer not null,
    foreign key (member_id) references member(id),
    foreign key (address_tag_id) references address_tag(id)
);

CREATE TABLE class_applier(
    class_id integer not null,
    member_id integer not null,
    foreign key(class_id) references childminder_class(id),
    foreign key(member_id) references member(id)
);

CREATE TABLE class_likes(
    class_id integer not null,
    member_id integer not null,
    foreign key(class_id) references childminder_class(id),
    foreign key(member_id) references member(id)
);

CREATE TABLE comment(
    id integer primary key,
    class_id integer not null,
    member_id integer not null,
    foreign key(class_id) references childminder_class(id),
    foreign key(member_id) references member(id)
);

CREATE TABLE image(
    id integer primary key,
    image_name varchar not null,
    image_original_name varchar not null,
    image_path varchar not null,
    image_uri varchar not null,
    class_id integer,
    foreign key(class_id) references childminder_class(id)
);

CREATE TABLE childminder_urgent(
    id integer primary key,
    contents CLOB not null,
    is_recruit boolean default false,
    created_at date,
    modified_at date,
    start_time timestamp not null,
    end_time timestamp not null,
    member_id integer not null,
    address_tag_id integer not null,
    foreign key(member_id) references member(id),
    foreign key(address_tag_id) references address_tag(id)
);

CREATE TABLE childminder_urgent_application(
    id integer primary key,
    contents varchar not null,
    member_id integer not null,
    urgent_id integer not null,
    foreign key(member_id) references member(id),
    foreign key(urgent_id) references childminder_urgent(id)
);

CREATE TABLE urgent_likes(
    member_id integer not null,
    urgent_id integer not null,
    foreign key(member_id) references member(id),
    foreign key(urgent_id) references childminder_urgent(id)
);

CREATE TABLE child(
    id integer primary key,
    name varchar not null,
    birthday date not null,
    school varchar not null,
    special_note varchar,
    member_id integer not null,
    urgent_id integer,
    foreign key(member_id) references member(id),
    foreign key(urgent_id) references childminder_urgent(id)
);

