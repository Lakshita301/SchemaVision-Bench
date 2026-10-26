-- Source: https://github.com/JSRevolorio/Sales_System_Web_App/blob/a710774f2e8522500e6d6031ddb232d69eeb8159/SistemaVentas_Web_app/SqlScript.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 4

CREATE TABLE `client` (
  `id_Client` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `nit`  varchar(13) DEFAULT NULL,
  `name` varchar(244) DEFAULT NULL,
  `address` varchar(244) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `product` (
  `id_Product` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name` varchar(244) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) UNSIGNED DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `employee` (
  `id_Employee` int(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `dpi`  BIGINT(13) DEFAULT NULL,
  `password`  varchar(40) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `user` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sales` (
  `id_Sales` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `id_Client` int(11) NOT NULL,
  `id_Employee` int(10) NOT NULL,
  `serial_Number` varchar(244) DEFAULT NULL,
  `sale_Date` date DEFAULT NULL,
  `total_Price` double DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
   FOREIGN KEY(`id_Client`) REFERENCES `client`(`id_Client`),
   FOREIGN KEY(`id_Employee`) REFERENCES `employee`(`id_Employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sale_detail` (
  `id_Sale_detail` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `id_Sales` int(11) NOT NULL,
  `id_Product` int(11) NOT NULL,
  `quantity` int(11) UNSIGNED DEFAULT NULL,
  `SubTotal` double DEFAULT NULL,
   FOREIGN KEY(id_Sales) REFERENCES  `sales`(`id_Sales`),
   FOREIGN KEY(id_Product) REFERENCES `product`(`id_Product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

