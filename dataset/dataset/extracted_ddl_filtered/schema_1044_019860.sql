-- Source: https://github.com/MyaThinzar-coder/Bakery-Shop-Point-of-Sale-System/blob/85409e4d67a6e71a5984aaddd0bd8cd6c6fde1b0/bakery.sql?raw=true
-- Tables detected: 13 | FK constraints: 10

CREATE TABLE `br_category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `br_credit_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(20) DEFAULT NULL,
  `card_paid` int(11) DEFAULT NULL,
  `card_status` enum('order','sales') DEFAULT NULL,
  `card_paid_id` varchar(15) NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `br_customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(30) DEFAULT NULL,
  `cust_phno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `br_employee` (
  `emp_id` char(8) NOT NULL,
  `emp_name` varchar(35) NOT NULL,
  `emp_password` varchar(50) DEFAULT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `emp_ph` varchar(9) DEFAULT NULL,
  `emp_roles` enum('admin','staff') DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `br_employee_action_log` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` char(8) DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  `action_name` enum('order','sales') DEFAULT NULL,
  `action_control_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `br_employee_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` char(8) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

CREATE TABLE `br_ingredient` (
  `ing_id` int(11) NOT NULL AUTO_INCREMENT,
  `ing_name` varchar(150) DEFAULT NULL,
  `ing_desc` varchar(300) DEFAULT NULL,
  `ing_cost` int(11) DEFAULT NULL,
  `ing_qty` int(11) DEFAULT NULL,
  `order_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ing_id`),
  KEY `order_no` (`order_no`),
  CONSTRAINT `br_ingredient_ibfk_1` FOREIGN KEY (`order_no`) REFERENCES `br_order` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `br_order` (
  `order_no` char(15) NOT NULL,
  `order_date` date NOT NULL,
  `receive_date` date DEFAULT NULL,
  `order_status` tinyint(4) DEFAULT NULL,
  `paid_status` enum('cash','card') NOT NULL,
  `cust_id` int(11) NOT NULL,
  `emp_id` char(8) NOT NULL,
  PRIMARY KEY (`order_no`),
  KEY `cust_id` (`cust_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `br_order_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `br_customer` (`cust_id`),
  CONSTRAINT `br_order_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `br_employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `br_order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_qty` int(11) DEFAULT NULL,
  `order_price` int(11) DEFAULT NULL,
  `order_no` char(15) DEFAULT NULL,
  `prod_id` char(8) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `prod_id` (`prod_id`),
  KEY `order_no` (`order_no`),
  CONSTRAINT `br_order_detail_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `br_product` (`prod_id`),
  CONSTRAINT `br_order_detail_ibfk_3` FOREIGN KEY (`order_no`) REFERENCES `br_order` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `br_product` (
  `prod_id` char(8) NOT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `prod_price` int(11) DEFAULT NULL,
  `prod_desc` varchar(300) DEFAULT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `br_product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `br_category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `br_product_photo` (
  `prod_id` char(8) NOT NULL,
  `photo_name` varchar(50) DEFAULT NULL,
  `photo_data` blob,
  `photo_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  CONSTRAINT `br_product_photo_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `br_product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `br_sales` (
  `sales_id` char(15) NOT NULL,
  `sales_date` datetime DEFAULT NULL,
  `paid_status` enum('cash','card') NOT NULL,
  `emp_id` char(8) NOT NULL,
  PRIMARY KEY (`sales_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `br_sales_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `br_employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `br_sales_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` char(8) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sales_id` char(15) DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `prod_id` (`prod_id`),
  KEY `sales_id` (`sales_id`),
  CONSTRAINT `br_sales_detail_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `br_product` (`prod_id`),
  CONSTRAINT `br_sales_detail_ibfk_3` FOREIGN KEY (`sales_id`) REFERENCES `br_sales` (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

