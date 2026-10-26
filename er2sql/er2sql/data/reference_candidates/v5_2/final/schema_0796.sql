-- Source: https://github.com/mdmartinvega/Proyecto_Server/blob/0b8f5ab9007cb4d5e70993c618b649cdb8d39374/be_buddy.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 7
CREATE TABLE city (
    id int NOT NULL,
    name varchar(64) NOT NULL
);
CREATE TABLE doctrine_migration_versions (
    version varchar(191) NOT NULL,
    executed_at TIMESTAMP DEFAULT NULL,
    execution_time int DEFAULT NULL
);
CREATE TABLE interest (
    id int NOT NULL,
    tag varchar(64) NOT NULL
);
CREATE TABLE language (
    id int NOT NULL,
    name varchar(64) NOT NULL
);
CREATE TABLE message (
    id int NOT NULL,
    sender_id int NOT NULL,
    receiver_id int NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL
);
CREATE TABLE "user" (
    id int NOT NULL,
    email varchar(180) NOT NULL,
    roles TEXT NOT NULL,
    password varchar(255) NOT NULL,
    name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    age smallint DEFAULT NULL,
    bio TEXT DEFAULT NULL,
    years_living int DEFAULT NULL,
    image varchar(255) DEFAULT NULL,
    city_id int NOT NULL,
    avatar varchar(255) DEFAULT NULL
);
CREATE TABLE user_interest (
    user_id int NOT NULL,
    interest_id int NOT NULL
);
CREATE TABLE user_language (
    user_id int NOT NULL,
    language_id int NOT NULL
);
ALTER TABLE message ADD CONSTRAINT fk_b6bd307fcd53edb6 FOREIGN KEY (receiver_id) REFERENCES "user" (id);
ALTER TABLE message ADD CONSTRAINT fk_b6bd307ff624b39d FOREIGN KEY (sender_id) REFERENCES "user" (id);
ALTER TABLE "user" ADD CONSTRAINT fk_8d93d6498bac62af FOREIGN KEY (city_id) REFERENCES city (id);
ALTER TABLE user_interest ADD CONSTRAINT fk_8cb3fe675a95ff89 FOREIGN KEY (interest_id) REFERENCES interest (id) ON DELETE CASCADE;
ALTER TABLE user_interest ADD CONSTRAINT fk_8cb3fe67a76ed395 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE;
ALTER TABLE user_language ADD CONSTRAINT fk_345695b582f1baf4 FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE;
ALTER TABLE user_language ADD CONSTRAINT fk_345695b5a76ed395 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE;
COMMENT ON COLUMN message.created_at IS '(DC2Type:datetime_immutable)';
COMMENT ON COLUMN "user".roles IS '(DC2Type:json)';
