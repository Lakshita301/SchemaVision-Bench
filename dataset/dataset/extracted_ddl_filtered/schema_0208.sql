-- Source: https://github.com/dstdfx/otus-dbmgmt/blob/9038d89ce06e52106d58e78bd7a0287a5a7b119f/part1/normalized_schema.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 6

CREATE TABLE `customer` (
  `id` uuid PRIMARY KEY,
  `title` titles,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `correspondence_language` ENUM ('RU', 'EN', 'IT', 'CS', 'DE', 'PL', 'FR', 'NL', 'HU'),
  `birth_date` timestamp,
  `gender` ENUM ('male', 'female'),
  `marital_status` martial_statuse,
  `address_id` uuid
);

CREATE TABLE `address` (
  `id` uuid PRIMARY KEY,
  `building_id` uuid,
  `postal_code` varchar(255)
);

CREATE TABLE `country` (
  `id` uuid PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `region` (
  `id` uuid PRIMARY KEY,
  `name` varchar(255),
  `country_id` uuid
);

CREATE TABLE `city` (
  `id` uuid PRIMARY KEY,
  `name` varchar(255),
  `region_id` uuid
);

CREATE TABLE `street` (
  `id` uuid PRIMARY KEY,
  `name` varchar(255),
  `city_id` uuid
);

CREATE TABLE `building` (
  `id` uuid PRIMARY KEY,
  `number` int,
  `litera` varchar(2),
  `street_id` uuid
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `customer` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

ALTER TABLE `address` ADD FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);

ALTER TABLE `region` ADD FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

ALTER TABLE `city` ADD FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

ALTER TABLE `street` ADD FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

ALTER TABLE `building` ADD FOREIGN KEY (`street_id`) REFERENCES `street` (`id`);

