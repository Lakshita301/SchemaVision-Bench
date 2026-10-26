-- Source: https://github.com/jstormes/auth/blob/6264f77e40b18ad9af9a4f64c740629359126595/sql/1_schema/0001_CreateStartingTables.sql?raw=true
-- Tables detected: 6 | FK constraints: 4

CREATE TABLE `client` (
  `client_id` bigint(20) NOT NULL,
  `client_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Name of client applicaiton'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `contact_method` (
  `contact_method_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `contact_value` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `contact_method_type` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `contact_method_type` (
  `contact_method_type` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Email Address',
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'Password Hash',
  `full_name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'Formal Name',
  `name_addressed_by` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'Informal (First Name)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='OAuth2 User Profile Data';

CREATE TABLE `user_to_client` (
  `user_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `translate` (
  `original_string` varchar(767) COLLATE utf8mb4_bin NOT NULL,
  `en` text COLLATE utf8mb4_bin DEFAULT NULL,
  `ft` text COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`original_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `contact_method`
  ADD CONSTRAINT `contact_method_type` FOREIGN KEY (`contact_method_type`) REFERENCES `contact_method_type` (`contact_method_type`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `user_to_client`
  ADD CONSTRAINT `client` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

