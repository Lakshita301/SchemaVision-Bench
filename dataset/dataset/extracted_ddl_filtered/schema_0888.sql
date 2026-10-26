-- Source: https://github.com/SysoevaM/repo/blob/6c25e7c03fc5e20eb6f304fa56093bfb8acb8353/MySQL/lesson3/filldb.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 16

CREATE TABLE `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(245) NOT NULL COMMENT 'имя',
  `lastname` VARCHAR(245) NOT NULL COMMENT 'фамилия',
  `email` VARCHAR(245) NOT NULL,
  `phone` BIGINT(11) NOT NULL COMMENT 'телефон',
  `password_hash` CHAR(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  INDEX `firstname_lastname_idx` (`lastname` ASC, `firstname` ASC))
ENGINE = InnoDB
COMMENT = 'пользователи';

CREATE TABLE `profiles` (
  `users_id` INT(11) NOT NULL,
  `gender` ENUM('m', 'f', 'x') NOT NULL,
  `birthday` DATE NOT NULL,
  `location` VARCHAR(245) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  INDEX `fk_profiles_users_idx` (`users_id` ASC),
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_profiles_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `friend_requests` (
  `from_user_id` INT(11) NOT NULL,
  `to_user_id` INT(11) NOT NULL,
  `status` TINYINT(1) UNSIGNED NOT NULL COMMENT 'статус: 0 - запрос, 1 - подтвержден, 2 - отклонен',
  INDEX `fk_friend_requests_users1_idx` (`from_user_id` ASC),
  INDEX `fk_friend_requests_users2_idx` (`to_user_id` ASC),
  PRIMARY KEY (`from_user_id`, `to_user_id`),
  CONSTRAINT `fk_friend_requests_users1`
    FOREIGN KEY (`from_user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_requests_users2`
    FOREIGN KEY (`to_user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` INT(11) NOT NULL,
  `to_user_id` INT(11) NOT NULL,
  `text` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users1_idx` (`from_user_id` ASC),
  INDEX `fk_messages_users2_idx` (`to_user_id` ASC),
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`from_user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users2`
    FOREIGN KEY (`to_user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `communities` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  `admin_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_communities_users1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_communities_users1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `users_communities` (
  `community_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  INDEX `fk_users_communities_users1_idx` (`user_id` ASC),
  INDEX `fk_users_communities_communities1_idx` (`community_id` ASC),
  PRIMARY KEY (`community_id`, `user_id`),
  CONSTRAINT `fk_users_communities_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_communities_communities1`
    FOREIGN KEY (`community_id`)
    REFERENCES `communities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `media_types` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE `media` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `media_type_id` INT(11) NOT NULL,
  `text` TEXT NULL DEFAULT NULL,
  `file` BLOB NULL DEFAULT NULL COMMENT '/files/img/01.jpg',
  `size` INT(11) NULL DEFAULT NULL,
  `metadata` JSON NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_media_media_types1_idx` (`media_type_id` ASC),
  CONSTRAINT `fk_media_media_types1`
    FOREIGN KEY (`media_type_id`)
    REFERENCES `media_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `photo_albums` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  `decs` TEXT NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_photo_albums_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_photo_albums_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `photos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `album_id` INT(11) NOT NULL,
  `media_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_photos_photo_albums1_idx` (`album_id` ASC),
  INDEX `fk_photos_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_photos_photo_albums1`
    FOREIGN KEY (`album_id`)
    REFERENCES `photo_albums` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photos_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `likes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` INT(11) NOT NULL,
  `to_user_id` INT(11) NOT NULL,
  `media_id` INT(11) NULL DEFAULT NULL,
  `message_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `fk_from_to_idx` (`from_user_id` ASC, `to_user_id` ASC),
  UNIQUE INDEX `fk_from_to_media_idx` (`from_user_id` ASC, `to_user_id` ASC, `media_id` ASC),
  UNIQUE INDEX `fk_from_to_message_idx` (`from_user_id` ASC, `to_user_id` ASC, `message_id` ASC),
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`from_user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_users2`
    FOREIGN KEY (`to_user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_message1`
    FOREIGN KEY (`message_id`)
    REFERENCES `messages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

