-- Source: https://github.com/mag-da-lenka/hack_your_future/blob/58b8be7eca5c1e5ddc5c24c89c29ca26a9112bd0/17_db3_home_forest_and_meal_apps/db3_homework-draft_meal%20application_data.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE `meal` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY, 
`title` varchar(255) NOT NULL,
`description` text NULL DEFAULT NULL, 
`location` varchar(255) NOT NULL,
`when` DATETIME NOT NULL,
`max_reservations` int(10) unsigned NOT NULL,
`price` DECIMAL(6,2) NOT NULL,                         -- is that ok? -- https://www.mysqltutorial.org/mysql-decimal/
`created_date` DATE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reservation` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
`number_of_guests` int(10) unsigned NOT NULL,
`meal_id` int(10) unsigned NOT NULL,
`created_date` DATE NOT NULL,
  CONSTRAINT `fk_meal_reservation` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `review` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
`title` varchar(255) NOT NULL,
`description` text NULL DEFAULT NULL,
`meal_id` int(10) unsigned NOT NULL,
`stars` int(5) unsigned NULL,
  CONSTRAINT `fk_meal_review` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

