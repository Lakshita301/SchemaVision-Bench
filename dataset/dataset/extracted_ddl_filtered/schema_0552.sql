-- Source: https://github.com/TristanTMT/GestionAttributionOrdinateurs/blob/f0baa9e2f6e15f6d79f1db77a07650d47be60dbd/reservationOrdinateurSimplon.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

CREATE TABLE `computer_user` (
  `idcomputer_user` int NOT NULL AUTO_INCREMENT,
  `computer_id` int NOT NULL,
  `user_id_reservation` int NOT NULL,
  `hour` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `computerName` varchar(45) NOT NULL,
  PRIMARY KEY (`idcomputer_user`),
  KEY `FK1_idx` (`computer_id`),
  KEY `FK2_idx` (`user_id_reservation`),
  CONSTRAINT `FK1` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`id_computer`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK2` FOREIGN KEY (`user_id_reservation`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `computers` (
  `id_computer` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) DEFAULT NULL,
  `name_computer` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `used_computer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_computer`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `membres` (
  `id` int NOT NULL,
  `pseudo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `motdepasse` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `lastName_user` varchar(45) NOT NULL,
  `firstName_user` varchar(45) NOT NULL,
  `use_computer` int DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

