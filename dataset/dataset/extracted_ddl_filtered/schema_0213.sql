-- Source: https://github.com/Brampaap/polytech_BD_project/blob/c008783dabf8546398edafbff45371f5406834dd/backup/std_1257_18.05.20.sql?raw=true
-- Tables detected: 17 | FK/REFERENCES mentions: 19

CREATE TABLE `access_levels` (
  `id` int(11) NOT NULL,
  `access_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bonus` (
  `id_pr` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `score` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `work_phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `courier_in_order` (
  `id` int(11) NOT NULL,
  `idDelivery` int(11) NOT NULL,
  `idCourier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `d_date` date NOT NULL,
  `s_time` time NOT NULL,
  `e_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `details` (
  `id` int(255) NOT NULL,
  `BIK` int(255) DEFAULT NULL,
  `INN` bigint(20) DEFAULT NULL,
  `OKPO` int(255) DEFAULT NULL,
  `KPP` varchar(255) DEFAULT NULL,
  `recipiet` varchar(255) DEFAULT NULL,
  `KC` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `O_date` date NOT NULL,
  `O_time` time NOT NULL,
  `payments` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `sum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `product_in_restaurants` (
  `id` int(11) NOT NULL,
  `idRest` int(11) NOT NULL,
  `idProd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `prod_and_deliv_in_order` (
  `id` int(11) NOT NULL,
  `idDelivery` int(11) NOT NULL,
  `idOrder` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_bank_details` int(11) DEFAULT NULL,
  `id_contacts` int(11) DEFAULT NULL,
  `status_r` bit(1) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `description` text,
  `image` varchar(255) NOT NULL,
  `img_name` varchar(50) NOT NULL,
  `site_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `social_networks` (
  `id_pr` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `instagramm` int(11) DEFAULT NULL,
  `facebook` int(11) DEFAULT NULL,
  `vk` int(11) DEFAULT NULL,
  `viber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL,
  `t_name` varchar(20) DEFAULT NULL,
  `d_of_reg` varchar(20) NOT NULL,
  `born` text,
  `id_contacts` int(11) DEFAULT NULL,
  `card_number` int(255) DEFAULT NULL,
  `gender` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id_user` int(10) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_order` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_in_data` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_userdata` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_in_level` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `bonus`
  ADD CONSTRAINT `bonus_ibfk_1` FOREIGN KEY (`id`) REFERENCES `userdata` (`id`);

ALTER TABLE `courier_in_order`
  ADD CONSTRAINT `courier_in_order_ibfk_1` FOREIGN KEY (`idDelivery`) REFERENCES `delivery` (`id`),
  ADD CONSTRAINT `courier_in_order_ibfk_2` FOREIGN KEY (`idCourier`) REFERENCES `users` (`id_user`);

ALTER TABLE `product_in_restaurants`
  ADD CONSTRAINT `product_in_restaurants_ibfk_1` FOREIGN KEY (`idRest`) REFERENCES `Restaurants` (`id`),
  ADD CONSTRAINT `product_in_restaurants_ibfk_2` FOREIGN KEY (`idProd`) REFERENCES `product` (`id`);

ALTER TABLE `prod_and_deliv_in_order`
  ADD CONSTRAINT `prod_and_deliv_in_order_ibfk_1` FOREIGN KEY (`idDelivery`) REFERENCES `delivery` (`id`),
  ADD CONSTRAINT `prod_and_deliv_in_order_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `prod_and_deliv_in_order_ibfk_3` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`);

ALTER TABLE `Restaurants`
  ADD CONSTRAINT `Restaurants_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `Restaurants_ibfk_4` FOREIGN KEY (`id_contacts`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `Restaurants_ibfk_5` FOREIGN KEY (`id_bank_details`) REFERENCES `details` (`id`);

ALTER TABLE `social_networks`
  ADD CONSTRAINT `social_networks_ibfk_1` FOREIGN KEY (`id`) REFERENCES `userdata` (`id`);

ALTER TABLE `userdata`
  ADD CONSTRAINT `userdata_ibfk_3` FOREIGN KEY (`id_contacts`) REFERENCES `contacts` (`id`);

ALTER TABLE `users_order`
  ADD CONSTRAINT `users_order_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `users_order_ibfk_2` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`);

ALTER TABLE `user_in_data`
  ADD CONSTRAINT `user_in_data_ibfk_1` FOREIGN KEY (`id_userdata`) REFERENCES `userdata` (`id`),
  ADD CONSTRAINT `user_in_data_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

ALTER TABLE `user_in_level`
  ADD CONSTRAINT `user_in_level_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `user_in_level_ibfk_2` FOREIGN KEY (`id_level`) REFERENCES `access_levels` (`id`);

