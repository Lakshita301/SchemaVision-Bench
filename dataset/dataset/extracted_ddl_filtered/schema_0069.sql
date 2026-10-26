-- Source: https://github.com/Sa6oZnaka/movie-library/blob/543d082f5dfe407baa1013fad7f7acaec2843334/server/db.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 3

CREATE TABLE `users` (
  `id` int PRIMARY KEY auto_increment,
  `username` char(25) UNIQUE not null,
  `password` char(69) not null
);

CREATE TABLE `favorites` (
  `userId` int not null,
  `movieId` int not null,
  
  FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
);

CREATE TABLE `ratings` (
  `userId` int not null,
  `movieId` int not null,
  `rating` int not null,
  
  FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
);

CREATE TABLE `notes` (
  `userId` int not null,
  `movieId` int not null,
  `note` VARCHAR(100) not null,
  
  FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
);

