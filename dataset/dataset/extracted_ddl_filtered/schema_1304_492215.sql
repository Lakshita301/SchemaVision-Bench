-- Source: https://github.com/glissader/mySQL/blob/fc39c0e9e7edc04d28e6664cf1f348942d9e5f0a/%D0%94%D0%97%20%D0%A3%D1%80%D0%BE%D0%BA%208/_vk_db.sql?raw=true
-- Tables detected: 13 | FK constraints: 19

CREATE TABLE users
(
    id            BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname     VARCHAR(50),
    lastname      VARCHAR(50),
    email         VARCHAR(120) UNIQUE,
    password_hash VARCHAR(100),
    phone         BIGINT UNSIGNED UNIQUE,
    INDEX users_firstname_lastname_idx (firstname, lastname)
);

CREATE TABLE media_types
(
    id         SERIAL,
    name       VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE media
(
    id            SERIAL,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id       BIGINT UNSIGNED NOT NULL,
    body          text,
    filename      VARCHAR(255),
    size          INT,
    metadata      JSON,
    created_at    DATETIME DEFAULT NOW(),
    updated_at    DATETIME ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (media_type_id) REFERENCES media_types (id)
);

CREATE TABLE `profiles`
(
    user_id    BIGINT UNSIGNED NOT NULL UNIQUE,
    gender     ENUM ('f', 'm'),
    birthday   DATE,
    photo_id   BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown   VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (photo_id) REFERENCES media (id)
);

CREATE TABLE messages
(
    id           SERIAL,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id   BIGINT UNSIGNED NOT NULL,
    body         TEXT,
    created_at   DATETIME DEFAULT NOW(),

    FOREIGN KEY (from_user_id) REFERENCES users (id),
    FOREIGN KEY (to_user_id) REFERENCES users (id)
);

CREATE TABLE friend_requests
(
    initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id    BIGINT UNSIGNED NOT NULL,
    `status`          ENUM ('requested', 'approved', 'declined', 'unfriended'),
    requested_at      DATETIME DEFAULT NOW(),
    updated_at        DATETIME ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (initiator_user_id, target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users (id),
    FOREIGN KEY (target_user_id) REFERENCES users (id)
);

CREATE TABLE communities
(
    id            SERIAL,
    name          VARCHAR(150),
    admin_user_id BIGINT UNSIGNED NOT NULL,

    INDEX communities_name_idx (name),
    foreign key (admin_user_id) references users (id)
);

CREATE TABLE users_communities
(
    user_id      BIGINT UNSIGNED NOT NULL,
    community_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (user_id, community_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (community_id) REFERENCES communities (id)
);

CREATE TABLE likes
(
    id         SERIAL,
    user_id    BIGINT UNSIGNED NOT NULL,
    media_id   BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (media_id) REFERENCES media (id)
);

CREATE TABLE `photo_albums`
(
    `id`      SERIAL,
    `name`    varchar(255)    DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id),
    PRIMARY KEY (`id`)
);

CREATE TABLE `photos`
(
    id         SERIAL,
    `album_id` BIGINT unsigned NULL,
    `media_id` BIGINT unsigned NOT NULL,

    FOREIGN KEY (album_id) REFERENCES photo_albums (id),
    FOREIGN KEY (media_id) REFERENCES media (id)
);

CREATE TABLE likes_messages
(
    id         SERIAL,
    user_id    BIGINT UNSIGNED NOT NULL,
    message_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users (id) on delete cascade,
    FOREIGN KEY (message_id) REFERENCES messages (id) on delete cascade
);

CREATE TABLE likes_users
(
    id         SERIAL,
    user_id    BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users (id)
);

