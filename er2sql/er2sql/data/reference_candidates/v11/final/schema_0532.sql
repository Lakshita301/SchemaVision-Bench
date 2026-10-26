-- Source: https://github.com/luisboch/hour_management/blob/17a5625efeb5b75f6dae09ee50f4cd06857b043b/sql/1.0.0.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 2
CREATE TABLE users
(
    id serial primary key,
    "name" character varying(255) NOT NULL,
    cpf character varying(255),
    email character varying(255) NOT NULL,
    "password" character varying(255) NOT NULL,
    day_active_hour time(0) without time zone NOT NULL,
    active boolean NOT NULL,
    creation_date timestamp(0) without time zone NOT NULL DEFAULT now(),
    last_access timestamp(0) without time zone,
    last_update timestamp(0) without time zone NOT NULL DEFAULT now()
);
CREATE TABLE user_work_day
(
    id serial primary key,
    user_id integer NOT NULL,
    date date NOT NULL,
    day_active_hour time(0) without time zone NOT NULL,
    start_work timestamp(0) without time zone,
    end_work timestamp(0) without time zone,
    CONSTRAINT uk_user_date UNIQUE (user_id, date)
);
create table activity
(
    id serial primary key,
    type_id integer NOT NULL,
    user_id integer,
    "name" character varying(255) NOT NULL,
    priority integer NOT NULL DEFAULT 0,
    description character varying(255) NOT NULL,
    creation_date timestamp(0) without time zone NOT NULL DEFAULT now(),
    last_update timestamp(0) without time zone NOT NULL DEFAULT now(),
    active boolean NOT NULL DEFAULT true,
    status integer NOT NULL DEFAULT 0
);
CREATE TABLE activity_interaction
(
    id serial primary key,
    user_id integer,
    activity_id integer,
    creation_date timestamp(0) without time zone NOT NULL DEFAULT now(),
    end_date timestamp(0) without time zone,
    start_date timestamp(0) without time zone NOT NULL DEFAULT now()
);
CREATE TABLE activity_type
(
    id serial primary key,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    creation_date timestamp(0) without time zone NOT NULL DEFAULT now(),
    last_update timestamp(0) without time zone NOT NULL DEFAULT now(),
    active boolean NOT NULL
);
CREATE TABLE customer
(
    id serial primary key,
    name character varying(255) NOT NULL,
    creation_date timestamp(0) without time zone NOT NULL DEFAULT now(),
    last_update timestamp(0) without time zone NOT NULL DEFAULT now(),
    active boolean NOT NULL default true
);
ALTER TABLE activity ADD constraint fk_type foreign key (type_id)
	references activity_type(id);
