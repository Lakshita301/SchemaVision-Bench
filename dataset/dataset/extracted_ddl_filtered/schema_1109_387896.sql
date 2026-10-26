-- Source: https://github.com/stevenlundy/databases/blob/9e2964cf8ea7f83569fa068aa1c41b33d0d9f627/server/schema.sql?raw=true
-- Tables detected: 4 | FK constraints: 4

CREATE TABLE `messages` (
  `id` INT(3) NOT NULL AUTO_INCREMENT,
  `message` varchar(255),
  `timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` INT(3) NOT NULL,
  `room` INT(3) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
  `id` INT(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `rooms` (
  `id` INT(3) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `friends` (
  `friender` INT(3) NOT NULL,
  `friendee` INT(3) NOT NULL
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `messages` ADD CONSTRAINT `messages_fk0` FOREIGN KEY (`user`) REFERENCES `users`(`id`);

ALTER TABLE `messages` ADD CONSTRAINT `messages_fk1` FOREIGN KEY (`room`) REFERENCES `rooms`(`id`);

ALTER TABLE `friends` ADD CONSTRAINT `friends_fk0` FOREIGN KEY (`friender`) REFERENCES `users`(`id`);

ALTER TABLE `friends` ADD CONSTRAINT `friends_fk1` FOREIGN KEY (`friendee`) REFERENCES `users`(`id`);

