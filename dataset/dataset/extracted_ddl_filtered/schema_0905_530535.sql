-- Source: https://github.com/semma19989/exam_9/blob/c10b0f824f7f12dac1853f496dffd6f73d8d4add/src/main/resources/db.migration/V1001_basaTables.sql?raw=true
-- Tables detected: 3 | FK constraints: 3

CREATE TABLE `authors` (
     `id` int auto_increment NOT NULL,
     `email` varchar(128) NOT NULL,
     `password` varchar(128) NOT NULL,
     `fullname` varchar(128) NOT NULL default ' ',
     `enabled` boolean NOT NULL default true,
     `role` varchar(16) NOT NULL default 'USER',
     PRIMARY KEY (`id`),
     UNIQUE INDEX `email_unique` (`email` ASC)
);

CREATE TABLE `topics` (
     `id` int auto_increment NOT NULL,
     `name` varchar(128) NOT NULL,
     `description` varchar(500) NOT NULL,
     `date` date  NOT NULL,
     `author_id` int NOT NULL,
      `qtyAnswer` int NOT NULL,
    FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
    PRIMARY KEY (`id`)
);

create table `answers` (
    `id` int auto_increment NOT NULL,
    `topic_id` int NOT NULL,
    `author_id` int NOT NULL,
    `text` varchar(128) NOT NULL,
    `date` date NOT NULL,
    FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
    FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
    PRIMARY KEY (`id`)
);

