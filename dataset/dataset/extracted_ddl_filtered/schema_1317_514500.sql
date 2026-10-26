-- Source: https://github.com/nss-day-cohort-46/tavern-api-Scott47/blob/16f8e75ba043e48cfdc432a1ed61297cf007b4d6/flagons.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE `Teams` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL
);

CREATE TABLE `Players` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `firstName`    TEXT NOT NULL,
    `lastName`    TEXT NOT NULL,
    `teamId` INTEGER NOT NULL,
    FOREIGN KEY(`teamId`) REFERENCES `Teams`(`id`)
);

CREATE TABLE `TeamScore` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `teamId` INTEGER NOT NULL,
	`score`  TEXT NOT NULL,
	`timeStamp` TEXT NOT NULL,
    FOREIGN KEY(`teamId`) REFERENCES `Teams`(`id`)
);

