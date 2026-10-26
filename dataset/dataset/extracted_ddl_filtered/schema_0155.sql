-- Source: https://github.com/Fikri1234/code-with-quarkus/blob/f2e53679d103ef4898de588c359adb2223ac92d8/src/main/resources/import-dev.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 5

CREATE TABLE `Post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tittle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Tag_Post` (
  `tags_id` bigint NOT NULL,
  `posts_id` bigint NOT NULL,
  `Tag_id` bigint NOT NULL,
  KEY `FKgqhxm0g4v3bixa1vdylqhcu6b` (`posts_id`),
  KEY `FKbk6mym61qnh7mldwonyecic1y` (`tags_id`),
  KEY `FK4b0n6if1fnmn8fp0htstblhdk` (`Tag_id`),
  CONSTRAINT `FK4b0n6if1fnmn8fp0htstblhdk` FOREIGN KEY (`Tag_id`) REFERENCES `Tag` (`id`),
  CONSTRAINT `FKbk6mym61qnh7mldwonyecic1y` FOREIGN KEY (`tags_id`) REFERENCES `Tag` (`id`),
  CONSTRAINT `FKgqhxm0g4v3bixa1vdylqhcu6b` FOREIGN KEY (`posts_id`) REFERENCES `Post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `post_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4y9x7mqk3boimf1dl5pmspwh9` (`tag_id`),
  KEY `FKekfaw2j8vk8v44or8liyt8eu` (`post_id`),
  CONSTRAINT `FK4y9x7mqk3boimf1dl5pmspwh9` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`id`),
  CONSTRAINT `FKekfaw2j8vk8v44or8liyt8eu` FOREIGN KEY (`post_id`) REFERENCES `Post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

