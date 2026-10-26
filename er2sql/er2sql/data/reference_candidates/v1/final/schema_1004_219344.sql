-- Source: https://github.com/victorskl/spring-boot-tute/blob/779d0f4c1c4250a9d0f3fa71e3d77b8d9b5ae816/04-secured-rest-api/src/main/resources/db/migration/h2/V01_01__create_user_tables.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE users(
    id serial NOT NULL,
    username varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    password varchar(128) NOT NULL,
    enabled bool NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id),
    CONSTRAINT user_uq UNIQUE (username),
    CONSTRAINT email_uq UNIQUE (email)
);

CREATE TABLE roles(
    id serial NOT NULL,
    name varchar(50) NOT NULL,
    CONSTRAINT roles_pk PRIMARY KEY (id),
    CONSTRAINT roles_uq UNIQUE (name)
);

CREATE TABLE roles_users(
    role_id integer,
    user_id integer
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE roles_users ADD CONSTRAINT users_fk FOREIGN KEY (user_id)
--   REFERENCES users (id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE roles_users ADD CONSTRAINT roles_fk FOREIGN KEY (role_id)
--   REFERENCES roles (id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE roles_users ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE roles_users ADD FOREIGN KEY (role_id) REFERENCES roles(id);

