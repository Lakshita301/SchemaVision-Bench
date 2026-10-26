-- Source: https://github.com/gevorgdarbinyanweb/jolly_rex/blob/46bcc1885c1e3333863896e9528cad43452d4b6f/db_backup/jolly_rex_db_2019-05-26.sql?raw=true
-- Tables detected: 43 | FK/REFERENCES mentions: 1

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `description` text,
  `postal_code` varchar(20) DEFAULT NULL,
  `address` text,
  `phone_number` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `support_instant_booking` tinyint(1) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `price_description` text,
  `package_description` text,
  `rating` tinyint(1) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `video` text,
  `first_line_address` text,
  `post_code` varchar(30) DEFAULT NULL,
  `area` text,
  `city` text,
  `support_mileage` tinyint(1) DEFAULT NULL,
  `mileage_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_branches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_line_address` text,
  `post_code` varchar(30) DEFAULT NULL,
  `area` text,
  `city` text,
  `note` text,
  `entertainer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_busy_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `busy_date` date DEFAULT NULL,
  `busy_start_time` time DEFAULT NULL,
  `busy_end_time` time DEFAULT NULL,
  `reason` tinyint(1) DEFAULT NULL,
  `order_id` int(11) DEFAULT '0',
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_busy_schedule_staff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `busy_schedule_id` int(11) DEFAULT NULL,
  `entertainer_staff_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_enquiries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `entertainer_id` int(11) DEFAULT NULL,
  `option1_date` date DEFAULT NULL,
  `option1_start_time` time DEFAULT NULL,
  `option1_end_time` time DEFAULT NULL,
  `option2_date` date DEFAULT NULL,
  `option2_start_time` time DEFAULT NULL,
  `option2_end_time` time DEFAULT NULL,
  `option3_date` date DEFAULT NULL,
  `option3_start_time` time DEFAULT NULL,
  `option3_end_time` time DEFAULT NULL,
  `party_type_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `host_child_name` varchar(50) DEFAULT NULL,
  `host_child_age` int(11) DEFAULT NULL,
  `host_child_gender` varchar(10) DEFAULT NULL,
  `special_requests` text,
  `title` varchar(10) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone_number` varchar(30) DEFAULT NULL,
  `mobile_number` varchar(30) DEFAULT NULL,
  `entertainers_count` tinyint(2) DEFAULT NULL,
  `first_line_address` text,
  `post_code` varchar(30) DEFAULT NULL,
  `area` text,
  `city` text,
  `status` varchar(30) DEFAULT '',
  `theme_service_id` int(11) DEFAULT NULL,
  `extra_option` int(11) DEFAULT NULL,
  `additional_service_id` int(11) DEFAULT NULL,
  `youngest_age` int(11) DEFAULT NULL,
  `oldest_age` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_enquiry_notifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `entertainer_id` int(11) DEFAULT NULL,
  `enquiry_id` int(11) DEFAULT NULL,
  `note` text,
  `creator_id` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_enquiry_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `enquiry_id` int(11) DEFAULT NULL,
  `entertainer_service_id` int(11) DEFAULT '0',
  `extra_guest_count` tinyint(3) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_order_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `entertainer_service_id` int(11) DEFAULT '0',
  `extra_guest_count` tinyint(3) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `party_type_id` int(11) DEFAULT NULL,
  `theme_service_id` int(11) NOT NULL DEFAULT '0',
  `additional_service_id` int(11) DEFAULT '0',
  `entertainer_package_id` int(11) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `entertainers_count` tinyint(4) DEFAULT NULL,
  `special_requests` text,
  `price` double DEFAULT NULL,
  `price_type` varchar(10) DEFAULT NULL,
  `host_child_age` tinyint(2) DEFAULT NULL,
  `host_child_gender` varchar(10) DEFAULT NULL,
  `host_child_name` varchar(50) DEFAULT NULL,
  `telephone_number` varchar(30) DEFAULT NULL,
  `venue_address` text,
  `post_code` varchar(30) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `note` text,
  `entertainer_name` varchar(50) DEFAULT NULL,
  `message` text,
  `status` varchar(50) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `info_status` varchar(50) DEFAULT NULL,
  `enquiry_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_orders_staff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entertainer_order_id` int(11) DEFAULT NULL,
  `entertainer_staff_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_party_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `party_theme_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_postal_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) NOT NULL,
  `postal_code_id` int(11) NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainer_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `count_of_guests` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `extra_guest_count` int(11) DEFAULT NULL,
  `entertainers_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_entertainer_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `photo` text,
  `entertainer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `delivery` tinyint(1) DEFAULT NULL,
  `rating` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_food_item_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_item_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_food_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` text,
  `view_count` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_food_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_order_food_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `food_item_id` int(11) DEFAULT NULL,
  `count` tinyint(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `people_count` int(11) DEFAULT NULL,
  `message_on` text,
  `color_message_on` varchar(20) DEFAULT NULL,
  `font_message_on` varchar(20) DEFAULT NULL,
  `note` text,
  `when_will_be_ready` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_order_product_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_item_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `count` tinyint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `entertainer_id` int(11) DEFAULT NULL,
  `venue_id` int(11) DEFAULT NULL,
  `food_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_party_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_party_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_photographer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_postal_code_directions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_postal_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(5) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `postal_code_direction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `delivery` tinyint(4) DEFAULT NULL,
  `rating` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_product_item_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_item_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_product_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` text,
  `view_count` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `comment` text,
  `order_id` int(11) DEFAULT NULL,
  `entertainers_point` double DEFAULT NULL,
  `overall_program_point` double DEFAULT NULL,
  `keep_anonymous` tinyint(1) DEFAULT NULL,
  `admin_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_theme_id` int(11) DEFAULT NULL,
  `name` text,
  `entertainers_number` int(11) DEFAULT '0',
  `base_extra_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `support_instant_booking` tinyint(1) DEFAULT NULL,
  `rating` int(1) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_photos_user_foreign_key` (`user_id`),
  CONSTRAINT `user_photos_user_foreign_key` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `rating` tinyint(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `support_instant_booking` tinyint(1) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_venue_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` text,
  `hour` int(11) DEFAULT NULL,
  `venue_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_venue_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_venue_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

