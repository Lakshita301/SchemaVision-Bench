-- Source: https://github.com/gabbybruck/cs3200-fall2020-server-java-gbruck/blob/aa414de584d8dbdcf8fac2354d423f794f5296e6/create.sql?raw=true
-- Tables detected: 12 | FK/REFERENCES mentions: 13
CREATE TABLE widgets (
    id int NOT NULL,
    name varchar(45) DEFAULT NULL,
    width int DEFAULT NULL,
    height int DEFAULT NULL,
    cssclass varchar(45) DEFAULT NULL,
    text varchar(45) DEFAULT NULL,
    "order" int DEFAULT NULL,
    dtype varchar(45) DEFAULT NULL,
    cssstyle varchar(45) DEFAULT NULL,
    url varchar(45) DEFAULT NULL,
    sharable SMALLINT DEFAULT NULL,
    expandable SMALLINT DEFAULT NULL,
    src varchar(45) DEFAULT NULL,
    size int DEFAULT NULL,
    html varchar(45) DEFAULT NULL,
    page_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE websites (
    id int NOT NULL,
    name varchar(45) DEFAULT NULL,
    description varchar(200) DEFAULT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    visits varchar(45) DEFAULT NULL,
    developer_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE website_roles (
    id int NOT NULL,
    role varchar(45) DEFAULT NULL,
    website_id int DEFAULT NULL,
    developer_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id int NOT NULL,
    useragreement SMALLINT DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE roles (
    role varchar(45) NOT NULL,
    PRIMARY KEY (role)
);

CREATE TABLE priviledges (
    priviledge varchar(45) NOT NULL,
    PRIMARY KEY (priviledge)
);

CREATE TABLE phones (
    id int NOT NULL,
    phone varchar(45) DEFAULT NULL,
    "primary" SMALLINT DEFAULT NULL,
    person_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE persons (
    idpersons int NOT NULL,
    firstname varchar(45) DEFAULT NULL,
    lastname varchar(45) DEFAULT NULL,
    username varchar(45) DEFAULT NULL,
    password varchar(45) DEFAULT NULL,
    email varchar(45) DEFAULT NULL,
    dob TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (idpersons)
);

CREATE TABLE pages (
    id int NOT NULL,
    title varchar(45) DEFAULT NULL,
    description varchar(100) DEFAULT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views int DEFAULT NULL,
    website_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE addresses (
    id int NOT NULL,
    street1 varchar(45) DEFAULT NULL,
    street2 varchar(45) DEFAULT NULL,
    city varchar(45) DEFAULT NULL,
    state varchar(45) DEFAULT NULL,
    zip varchar(45) DEFAULT NULL,
    "primary" SMALLINT DEFAULT NULL,
    person_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pages_roles (
    id int NOT NULL,
    role varchar(45) DEFAULT NULL,
    page_id int DEFAULT NULL,
    developer_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE developers (
    id int NOT NULL,
    developerskey varchar(45) DEFAULT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE widgets ADD CONSTRAINT widget_has_page FOREIGN KEY (page_id) REFERENCES pages (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE websites ADD CONSTRAINT developer_website FOREIGN KEY (developer_id) REFERENCES developers (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE website_roles ADD CONSTRAINT developer_role FOREIGN KEY (developer_id) REFERENCES developers (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE website_roles ADD CONSTRAINT website_role FOREIGN KEY (website_id) REFERENCES websites (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE website_roles ADD CONSTRAINT website_role_enumeration FOREIGN KEY (role) REFERENCES roles (role) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE users ADD CONSTRAINT user_isa_person FOREIGN KEY (id) REFERENCES persons (idpersons) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE phones ADD CONSTRAINT phone_has_person FOREIGN KEY (person_id) REFERENCES persons (idpersons) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE pages ADD CONSTRAINT page_has_website FOREIGN KEY (website_id) REFERENCES websites (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE addresses ADD CONSTRAINT address_has_person FOREIGN KEY (person_id) REFERENCES persons (idpersons) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pages_roles ADD CONSTRAINT devs_role FOREIGN KEY (developer_id) REFERENCES developers (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE pages_roles ADD CONSTRAINT pages_role FOREIGN KEY (page_id) REFERENCES pages (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE pages_roles ADD CONSTRAINT roles_enumeration FOREIGN KEY (role) REFERENCES roles (role) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE developers ADD CONSTRAINT developer_is_person FOREIGN KEY (id) REFERENCES persons (idpersons) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX ON widgets (page_id);
CREATE INDEX ON websites (developer_id);
CREATE INDEX ON website_roles (role);
CREATE INDEX ON website_roles (developer_id);
CREATE INDEX ON website_roles (website_id);
CREATE INDEX ON phones (person_id);
CREATE INDEX ON pages (website_id);
CREATE INDEX ON addresses (person_id);
CREATE INDEX ON pages_roles (role);
CREATE INDEX ON pages_roles (developer_id);
CREATE INDEX ON pages_roles (page_id);
