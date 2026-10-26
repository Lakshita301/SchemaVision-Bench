-- Source: https://github.com/oumss/Big-Cooking-Data/blob/07a556f83a7270bfd76e873e66acabaf10b02c47/BigCookingData/src/persistance/creation.sql?raw=true
-- Tables detected: 12 | FK constraints: 10

CREATE TABLE `user` ( 
	`id_user` integer AUTO_INCREMENT, 
    `surname` varchar(30), 
    `firstname` varchar(30), 
    `login` varchar(30), 
    `password` varchar(30), 
    PRIMARY KEY (`id_user`)
);

CREATE TABLE `ingredient` (
  `alim_grp_code` int(11) NOT NULL,
  `alim_ssgrp_code` int(11) NOT NULL,
  `alim_ssssgrp_code` int(11) NOT NULL,
  `alim_grp_nom_fr` varchar(200) DEFAULT NULL,
  `alim_ssgrp_nom_fr` varchar(200) DEFAULT NULL,
  `alim_ssssgrp_nom_fr` varchar(200) DEFAULT NULL,
  `id_ingredient` int(11) NOT NULL,
  `alim_nom_fr` varchar(200) DEFAULT NULL,
  `Energie, Reglement UE No 1169/2011 (kcal/100g)` float DEFAULT NULL,
  `Energie, N x facteur Jones, avec fibres  (kJ/100g)` float DEFAULT NULL,
  `Energie, N x facteur Jones, avec fibres  (kcal/100g)` float DEFAULT NULL,
  `Eau (g/100g)` float DEFAULT NULL,
  `Proteines (g/100g)` float DEFAULT NULL,
  `Proteines brutes, N x 6.25 (g/100g)` float DEFAULT NULL,
  `Glucides (g/100g)` float DEFAULT NULL,
  `Lipides (g/100g)` float DEFAULT NULL,
  `Sucres (g/100g)` float DEFAULT NULL,
  `Amidon (g/100g)` float DEFAULT NULL,
  `Fibres alimentaires (g/100g)` float DEFAULT NULL,
  `Polyols totaux (g/100g)` float DEFAULT NULL,
  `Cendres (g/100g)` float DEFAULT NULL,
  `Alcool (g/100g)` float DEFAULT NULL,
  `Acides organiques (g/100g)` float DEFAULT NULL,
  `AG satures (g/100g)` float DEFAULT NULL,
  `AG monoinsatures (g/100g)` float DEFAULT NULL,
  `AG polyinsatures (g/100g)` float DEFAULT NULL,
  `AG 4:0, butyrique (g/100g)` float DEFAULT NULL,
  `AG 6:0, caproique (g/100g)` float DEFAULT NULL,
  `AG 8:0, caprylique (g/100g)` float DEFAULT NULL,
  `AG 10:0, caprique (g/100g)` float DEFAULT NULL,
  `AG 12:0, laurique (g/100g)` float DEFAULT NULL,
  `AG 14:0, myristique (g/100g)` float DEFAULT NULL,
  `AG 16:0, palmitique (g/100g)` float DEFAULT NULL,
  `AG 18:0, stearique (g/100g)` float DEFAULT NULL,
  `AG 18:1 9c (n-9), oleique (g/100g)` float DEFAULT NULL,
  `AG 18:2 9c,12c (n-6), linoleique (g/100g)` float DEFAULT NULL,
  `AG 18:3 c9,c12,c15 (n-3), alpha-linolenique (g/100g)` float DEFAULT NULL,
  `AG 20:4 5c,8c,11c,14c (n-6), arachidonique (g/100g)` float DEFAULT NULL,
  `AG 20:5 5c,8c,11c,14c,17c (n-3) EPA (g/100g)` float DEFAULT NULL,
  `AG 22:6 4c,7c,10c,13c,16c,19c (n-3) DHA (g/100g)` float DEFAULT NULL,
  `Cholesterol (mg/100g)` float DEFAULT NULL,
  `Sel chlorure de sodium (g/100g)` float DEFAULT NULL,
  `Calcium (mg/100g)` float DEFAULT NULL,
  `Chlorure (mg/100g)` float DEFAULT NULL,
  `Cuivre (mg/100g)` float DEFAULT NULL,
  `Fer (mg/100g)` float DEFAULT NULL,
  `Iode (ug/100g)` float DEFAULT NULL,
  `Magnesium (mg/100g)` float DEFAULT NULL,
  `Manganese (mg/100g)` float DEFAULT NULL,
  `Phosphore (mg/100g)` float DEFAULT NULL,
  `Potassium (mg/100g)` float DEFAULT NULL,
  `Selenium (ug/100g)` float DEFAULT NULL,
  `Sodium (mg/100g)` float DEFAULT NULL,
  `Zinc (mg/100g)` float DEFAULT NULL,
  `Retinol (ug/100g)` float DEFAULT NULL,
  `Beta-Carotene (ug/100g)` float DEFAULT NULL,
  `Vitamine D (ug/100g)` float DEFAULT NULL,
  `Vitamine E (mg/100g)` float DEFAULT NULL,
  `Vitamine K1 (ug/100g)` float DEFAULT NULL,
  `Vitamine K2 (ug/100g)` float DEFAULT NULL,
  `Vitamine C (mg/100g)` float DEFAULT NULL,
  `Vitamine B1 ou Thiamine (mg/100g)` float DEFAULT NULL,
  `Vitamine B2 ou Riboflavine (mg/100g)` float DEFAULT NULL,
  `Vitamine B3 ou PP ou Niacine (mg/100g)` float DEFAULT NULL,
  `Vitamine B5 ou Acide pantothenique (mg/100g)` float DEFAULT NULL,
  `Vitamine B6 (mg/100g)` float DEFAULT NULL,
  `Vitamine B9 ou Folates totaux (ug/100g)` float DEFAULT NULL,
  `Vitamine B12 (ug/100g)` float DEFAULT NULL,
  `poids` int(11) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
);

CREATE TABLE `ingredient_recipe`( 
    `id_recipe` integer,
    `id_ingredient` integer, 
    `quantity` varchar(100),
    `ingredientList` varchar(200),
    FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`)
);

CREATE TABLE `recipe`( 
    `id_recipe` integer AUTO_INCREMENT, 
    `url` varchar(300),
    `title` varchar(200),
    `number_of_person` integer,
    `level` integer,
    `budget` integer, 
    `category` text,
    `time_total` varchar(100),
    `time_cooking` varchar(100),
    `utensils` text,
    `ingredients_list` text,
    `id_ingredient_recipe` integer, 
    `picture` LONGBLOB, 
    `steps` text, 
    PRIMARY KEY (`id_recipe`)
);

CREATE TABLE `connexion`( 
    `tmp` integer,
    `id_user` integer,
    PRIMARY KEY (`tmp`),
    FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`), 
);

CREATE TABLE `weight_ingredient`( 
    `id_weight_ingredient` integer AUTO_INCREMENT,
    `id_user` integer,
    `id_ingredient` integer,
    `weight_ingredient` integer, 
    PRIMARY KEY (`id_weight_ingredient`),
    FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
    FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
);

CREATE TABLE `weight_recipe`( 
    `id_weight_recipe` integer AUTO_INCREMENT,
    `id_user` integer,
    `id_recipe` integer, 
    `weight_recipe` integer, 
    PRIMARY KEY (`id_weight_recipe`),
    FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
    FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`)
);

CREATE TABLE `proposed_recipe_user`( 
    `id_proposed_recipe_user` integer AUTO_INCREMENT,
    `id_user` integer,
    `id_recipe` integer,
    `visited` BOOLEAN,
    PRIMARY KEY (`id_proposed_recipe_user`),
    FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
    FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`)  
);

CREATE TABLE `visits`( 
    `id_visits` integer AUTO_INCREMENT,
    `id_user` integer,
    `id_recipe` integer,
    `liked` BOOLEAN,
    PRIMARY KEY (`id_visits`),
    FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
    FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`)  
);

CREATE TABLE `liked_recipes` ( 
    `id_user` integer, 
    `id_recipe` integer
);

CREATE TABLE `disliked_recipes` (  
    `id_user` integer, 
    `id_recipe` integer
);

CREATE TABLE `weight_perceptron`(
    `id_user` integer,
    `Eau (g/100g)` float,
    `Sucres (g/100g)` float,
    `Sel chlorure de sodium (g/100g)` float,
  	`Proteines (g/100g)` float DEFAULT NULL,
  	`Glucides (g/100g)` float DEFAULT NULL,
  	`Lipides (g/100g)` float DEFAULT NULL,
  	`Energie, Reglement UE No 1169/2011 (kcal/100g)` float DEFAULT NULL,
    `W0` float
);

