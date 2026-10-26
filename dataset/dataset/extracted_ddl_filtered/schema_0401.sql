-- Source: https://github.com/lmurature/melist-api/blob/326c832312e03b393a2aa4e934d88fd7e09889d6/db/melist.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 8

CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `refresh_token` varchar(256) DEFAULT NULL,
  `access_token` varchar(256) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `item` (
  `item_id` varchar(64) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `list` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` bigint unsigned NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `privacy` varchar(64) NOT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `list_FK` (`owner_id`),
  CONSTRAINT `list_FK` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75618245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `share_config` (
  `user_id` bigint unsigned NOT NULL,
  `list_id` bigint unsigned NOT NULL,
  `type` varchar(64) NOT NULL,
  KEY `share_config_FK` (`user_id`),
  KEY `share_config_FK_1` (`list_id`),
  CONSTRAINT `share_config_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `share_config_FK_1` FOREIGN KEY (`list_id`) REFERENCES `list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_favorite_list` (
  `user_id` bigint unsigned NOT NULL,
  `list_id` bigint unsigned NOT NULL,
  KEY `user_favorite_list_FK` (`user_id`),
  KEY `user_favorite_list_FK_1` (`list_id`),
  CONSTRAINT `user_favorite_list_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_favorite_list_FK_1` FOREIGN KEY (`list_id`) REFERENCES `list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `list_item` (
  `list_id` bigint unsigned NOT NULL,
  `item_id` varchar(64) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `variation_ext_id` bigint unsigned DEFAULT NULL,
  KEY `list_item_FK` (`list_id`),
  KEY `list_item_FK_1` (`item_id`),
  CONSTRAINT `list_item_FK` FOREIGN KEY (`list_id`) REFERENCES `list` (`id`),
  CONSTRAINT `list_item_FK_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `item_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(64) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `has_deal` tinyint(1) DEFAULT NULL,
  `date_fetched` date NOT NULL,
  `reviews_quantity` int NULL;

