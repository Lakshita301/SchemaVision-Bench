-- Source: https://github.com/Orbifoldt/cooking-hub/blob/f545b38471af5a283c9d8ff0ea04c690c9911498/design-documents/databases/recipes/recipes-hub-schema-mysql.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 3

CREATE TABLE `recipes` (
  `id` int AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp DEFAULT (now()),
  PRIMARY KEY (`id`)
);

CREATE TABLE `ingredients` (
  `id` int AUTO_INCREMENT,
  `name` varchar(255),
  `density` real DEFAULT null,
  PRIMARY KEY (`id`)
);

CREATE TABLE `recipe_ingredients` (
  `recipe_id` int NOT NULL,
  `ordinal` int NOT NULL COMMENT 'n-th ingredient in recipe',
  `ingredient_id` int NOT NULL,
  `amount` real NOT NULL,
  `type` ENUM ('MASS', 'VOLUME', 'OTHER') NOT NULL,
  `notes` varchar(255),
  PRIMARY KEY (`recipe_id`, `ordinal`)
);

CREATE TABLE `instructions` (
  `recipe_id` int NOT NULL,
  `ordinal` int NOT NULL COMMENT 'n-th instruction in recipe',
  `instruction` varchar(255),
  PRIMARY KEY (`recipe_id`, `ordinal`)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `recipe_ingredients` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

ALTER TABLE `recipe_ingredients` ADD FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

ALTER TABLE `instructions` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

