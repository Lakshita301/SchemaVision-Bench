-- Source: https://github.com/DoHuy/parking_to_easy/blob/0bd023383d45f56f2f2315625d5a3bba987127a9/park.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 5

CREATE TABLE `credentials` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `username` text,
                               `password` text,
                               `email` text,
                               `points` int(11) DEFAULT NULL,
                               `role` text,
                               `token` text,
                               `expired` text,
                               `created_at` text,
                               `modified_at` text,
                               `deleted_at` text,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `owners` (
                          `credentialId` int(11) NOT NULL,
                          `fullName` text,
                          `cmndImage` text,
                          `address` text,
                          `phoneNumber` text,
                          `status` text,
                          `created_at` text,
                          `modified_at` text,
                          PRIMARY KEY (`credentialId`),
                          CONSTRAINT `fk_credential1` FOREIGN KEY (`credentialId`) REFERENCES `credentials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `parkings` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `parkingName` text,
                            `properties` text,
                            `address` text,
                            `kindOf` text,
                            `payment` text,
                            `longitude` text,
                            `latitude` text,
                            `capacity` text,
                            `ownerId` int(11) DEFAULT NULL,
                            `blockAmount` int(11) DEFAULT NULL,
                            `created_at` text,
                            `modified_at` text,
                            `deleted_at` text,
                            `describe` text CHARACTER SET utf8mb4,
                            `parkingImages` text,
                            `certificateOfland` text,
                            `status` text,
                            PRIMARY KEY (`id`),
                            KEY `fk_owner` (`ownerId`),
                            CONSTRAINT `fk_owner` FOREIGN KEY (`ownerId`) REFERENCES `owners` (`credentialId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `ratings` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `stars` int(11) DEFAULT NULL,
                           `credentialId` int(11) DEFAULT NULL,
                           `parkingId` int(11) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `transactions` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `credentialId` int(11) NOT NULL,
                                `parkingId` int(11) NOT NULL,
                                `licence` text,
                                `session` text,
                                `phoneNumber` text,
                                `requestedPayment` text,
                                `startTime` text,
                                `endTime` text,
                                `amount` int(11) DEFAULT NULL,
                                `status` text,
                                `reasonMsg` text,
                                `created_at` text,
                                `modified_at` text,
                                PRIMARY KEY (`id`),
                                KEY `fk_credential` (`credentialId`),
                                KEY `fk_parking` (`parkingId`),
                                CONSTRAINT `fk_credential` FOREIGN KEY (`credentialId`) REFERENCES `credentials` (`id`),
                                CONSTRAINT `fk_parking` FOREIGN KEY (`parkingId`) REFERENCES `parkings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `userDevices` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `deviceToken` text,
                               `credentialId` int(11) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `fk_credential2` (`credentialId`),
                               CONSTRAINT `fk_credential2` FOREIGN KEY (`credentialId`) REFERENCES `credentials` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 ;

