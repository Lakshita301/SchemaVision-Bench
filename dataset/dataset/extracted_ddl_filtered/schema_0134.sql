-- Source: https://github.com/hmicn/nodejs-ecommerce/blob/0f411b371017a2a718f9e85ccfca62c51d245fad/sql/aws.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 1

CREATE TABLE `categorie` (
  `id` int NOT NULL,
  `nomCategorie` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` bigint NOT NULL,
  `nomProduit` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) NOT NULL,
  `categorie` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `reviews` (
  `id` bigint NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `rating` tinyint NOT NULL,
  `product_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confpass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

