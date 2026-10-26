-- Source: https://github.com/arifkusnadi/rent-all/blob/198f82768de14fffdc147320431a6296343c6a65/arent_webservice/rentall.sql?raw=true
-- Tables detected: 5 | FK constraints: 4

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `date` date NOT NULL,
  `rent_start` date NOT NULL,
  `rent_end` date NOT NULL,
  `total_fee` decimal(10,0) NOT NULL,
  `payment_type` enum('DANA','OVO','SPAY','MBANKING') NOT NULL,
  `notes` varchar(50) NOT NULL,
  `reviewed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `product` (
  `id_products` int(11) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` enum('car','bike') NOT NULL,
  `details` text NOT NULL,
  `location` varchar(50) NOT NULL,
  `rental_type` enum('daily','weekly','monthly') NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `reviews` (
  `id_booking` int(11) NOT NULL,
  `review` varchar(150) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `spec` (
  `id_products` int(11) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `Seat` int(11) NOT NULL,
  `Gear Box` varchar(20) NOT NULL,
  `Motor` varchar(30) NOT NULL,
  `Speed(0-100)` varchar(20) NOT NULL,
  `Top Speed` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_products`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `spec`
  ADD CONSTRAINT `spec_ibfk_1` FOREIGN KEY (`id_products`) REFERENCES `product` (`id_products`) ON DELETE NO ACTION ON UPDATE NO ACTION;

