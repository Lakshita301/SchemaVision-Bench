-- Source: https://github.com/9648092138/AudioApp/blob/d4ca487854248964634a9a6e918a341f87328fa8/src/main/resources/db/migration/V1__schema.sql?raw=true
-- Tables detected: 6 | FK constraints: 6
CREATE TABLE "users" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "name" varchar(40) NOT NULL,
    "username" varchar(15) NOT NULL,
    "email" varchar(40) NOT NULL,
    "password" varchar(100) NOT NULL,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    UNIQUE KEY "uk_users_username" ("username"),
    UNIQUE KEY "uk_users_email" ("email")
);

CREATE TABLE "roles" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "name" varchar(60) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "uk_roles_name" ("name")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE "user_roles" (
    "user_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    PRIMARY KEY ("user_id","role_id"),
    KEY "fk_user_roles_role_id" ("role_id"),
    CONSTRAINT "fk_user_roles_role_id" FOREIGN KEY ("role_id") REFERENCES "roles" ("id"),
    CONSTRAINT "fk_user_roles_user_id" FOREIGN KEY ("user_id") REFERENCES "users" ("id")
);

CREATE TABLE "polls" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "question" varchar(140) NOT NULL,
    "expiration_date_time" TIMESTAMP NOT NULL,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "created_by" bigint DEFAULT NULL,
    "updated_by" bigint DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "choices" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "text" varchar(40) NOT NULL,
    "poll_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_choices_poll_id" ("poll_id"),
    CONSTRAINT "fk_choices_poll_id" FOREIGN KEY ("poll_id") REFERENCES "polls" ("id")
);

CREATE TABLE "votes" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "user_id" bigint NOT NULL,
    "poll_id" bigint NOT NULL,
    "choice_id" bigint NOT NULL,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    KEY "fk_votes_user_id" ("user_id"),
    KEY "fk_votes_poll_id" ("poll_id"),
    KEY "fk_votes_choice_id" ("choice_id"),
    CONSTRAINT "fk_votes_user_id" FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    CONSTRAINT "fk_votes_poll_id" FOREIGN KEY ("poll_id") REFERENCES "polls" ("id"),
    CONSTRAINT "fk_votes_choice_id" FOREIGN KEY ("choice_id") REFERENCES "choices" ("id")
);
