-- Source: https://github.com/haiconga263/TrueFail/blob/91d45e048d7c44b3001e811e44ff639f57784598/Database/aritnt.sql?raw=true
-- Tables detected: 45 | FK/REFERENCES mentions: 78

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(1) CHARACTER SET latin1 NOT NULL,
  `object_id` int(11) NOT NULL COMMENT 'The object id is a id of object reference',
  `street` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `ward_id` int(11) NOT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_address_country_idx` (`country_id`),
  KEY `pk_address_province_idx` (`province_id`),
  KEY `pk_address_district_idx` (`district_id`),
  KEY `pk_address_ward_idx` (`ward_id`),
  CONSTRAINT `pk_address_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_address_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_address_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_address_ward` FOREIGN KEY (`ward_id`) REFERENCES `ward` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `caption` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT 'type is a column that decribe type of caption.\\n1/ Messgae\\n2/ Lable\\n3/ Column',
  `default_caption` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=latin1;

CREATE TABLE `caption_language` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `caption_id` bigint(20) NOT NULL,
  `caption` varchar(4000) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_caption_language_caption_idx` (`caption_id`),
  KEY `pk_caption_language_language_idx` (`language_id`),
  CONSTRAINT `pk_caption_language_caption` FOREIGN KEY (`caption_id`) REFERENCES `caption` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_caption_language_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_collection_address_idx` (`address_id`),
  KEY `pk_collection_contact_idx` (`contact_id`),
  KEY `pk_collection_employee_idx` (`manager_id`),
  CONSTRAINT `pk_collection_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_collection_contact` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_collection_employee` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `collection_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collection_employee_idx` (`collection_id`),
  KEY `fk_collection_employee_employee_idx` (`employee_id`),
  CONSTRAINT `fk_collection_employee_collection` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_collection_employee_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(1) CHARACTER SET latin1 NOT NULL,
  `object_id` int(11) NOT NULL COMMENT 'The object id is a id of object reference',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `gender` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_distribution_contact_idx` (`contact_id`),
  KEY `pk_distribution_address_idx` (`address_id`),
  KEY `pk_distribution_employee_idx` (`manager_id`),
  CONSTRAINT `pk_distribution_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_distribution_contact` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_distribution_employee` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_district_country_idx` (`country_id`),
  KEY `pk_district_province_idx` (`province_id`),
  CONSTRAINT `pk_district_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_district_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `full_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `report_to` int(11) DEFAULT NULL,
  `report_to_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `job_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_employee_employee_report_to_idx` (`report_to`),
  CONSTRAINT `pk_employee_employee_report_to` FOREIGN KEY (`report_to`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `farmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_company` tinyint(4) NOT NULL,
  `tax_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `farmer_buying_calendar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `buying_date` date NOT NULL,
  `is_ordered` tinyint(4) NOT NULL DEFAULT '0',
  `is_expired` tinyint(4) NOT NULL DEFAULT '0',
  `is_adaped` tinyint(4) NOT NULL,
  `adap_note` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_farmer_buying_calendar_farmer_idx` (`farmer_id`),
  CONSTRAINT `pk_farmer_buying_calendar_farmer` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `farmer_buying_calendar_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farmer_buying_calendar_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `adap_quantity` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_farmer_buying_calendar_item_farmer_buying_calendar_idx` (`farmer_buying_calendar_id`),
  KEY `pk_farmer_buying_calendar_item_product_idx` (`product_id`),
  KEY `pk_farmer_buying_calendar_item_uom_idx` (`uom_id`),
  CONSTRAINT `pk_farmer_buying_calendar_item_farmer_buying_calendar` FOREIGN KEY (`farmer_buying_calendar_id`) REFERENCES `farmer_buying_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_buying_calendar_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_buying_calendar_item_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `farmer_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `farmer_buying_calendar_id` bigint(20) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `buying_date` date NOT NULL,
  `ship_to` int(11) NOT NULL,
  `total_amount` decimal(10,0) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_farmer_order_farmer_idx` (`farmer_id`),
  KEY `pk_farmer_order_farmer_buying_calendar_idx` (`farmer_buying_calendar_id`),
  KEY `pk_farmer_order_farmer_order_status_idx` (`status_id`),
  KEY `pk_farmer_order_collection_idx` (`ship_to`),
  KEY `fk_farmer_order_collection_idx` (`collection_id`),
  CONSTRAINT `fk_farmer_order_collection` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_order_collection` FOREIGN KEY (`ship_to`) REFERENCES `collection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_order_farmer` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_order_farmer_buying_calendar` FOREIGN KEY (`farmer_buying_calendar_id`) REFERENCES `farmer_buying_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_order_farmer_order_status` FOREIGN KEY (`status_id`) REFERENCES `farmer_order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `farmer_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `farmer_order_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `ordered_quantity` int(11) NOT NULL,
  `deliveried_quantity` int(11) NOT NULL,
  `uom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_farmer_order_item_farmer_order_idx` (`farmer_order_id`),
  KEY `pk_farmer_order_item_product_idx` (`product_id`),
  KEY `pk_farmer_order_item_farmer_order_status_idx` (`status_id`),
  KEY `pk_farmer_order_item_uom_idx` (`uom_id`),
  CONSTRAINT `pk_farmer_order_item_farmer_order` FOREIGN KEY (`farmer_order_id`) REFERENCES `farmer_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_order_item_farmer_order_status` FOREIGN KEY (`status_id`) REFERENCES `farmer_order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_order_item_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `farmer_order_status` (
  `id` int(11) NOT NULL,
  `caption_name` varchar(50) NOT NULL,
  `caption_decription` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `farmer_retailer_order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `retailer_id` int(11) NOT NULL,
  `retailer_order_id` bigint(20) NOT NULL,
  `retailer_order_item_id` bigint(20) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `farmer_order_id` bigint(20) NOT NULL,
  `farmer_order_item_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_farmer_retailer_order_items_retailer_idx` (`retailer_id`),
  KEY `pk_farmer_retailer_order_items_farmer_idx` (`farmer_id`),
  KEY `pk_farmer_retailer_order_items_product_idx` (`product_id`),
  KEY `pk_farmer_retailer_order_items_uom_idx` (`uom_id`),
  CONSTRAINT `pk_farmer_retailer_order_items_farmer` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_retailer_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_retailer_order_items_retailer` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_farmer_retailer_order_items_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `fulfillment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_fulfillment_contact_idx` (`contact_id`),
  KEY `pk_fulfillment_address_idx` (`address_id`),
  KEY `pk_fulfillment_employee_idx` (`manager_id`),
  CONSTRAINT `pk_fulfillment_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_fulfillment_contact` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_fulfillment_employee` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `description` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `image_url` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `default_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `default_description` varchar(255) DEFAULT NULL,
  `default_uom_id` int(11) NOT NULL DEFAULT '1',
  `default_buying_price` decimal(10,0) NOT NULL,
  `default_selling_price` decimal(10,0) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `product_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_product_language_language_idx` (`language_id`),
  KEY `pk_product_language_product_idx` (`product_id`),
  CONSTRAINT `pk_product_language_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_product_language_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

CREATE TABLE `product_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `buying_price` decimal(10,0) NOT NULL,
  `selling_price` decimal(10,0) NOT NULL,
  `effectived_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_product_price_product_idx` (`product_id`),
  KEY `pk_product_price_uom_idx` (`uom_id`),
  CONSTRAINT `pk_product_price_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_product_price_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_province_country_idx` (`country_id`),
  KEY `pk_province_region_idx` (`region_id`),
  CONSTRAINT `pk_province_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_province_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_region_country_idx` (`country_id`),
  CONSTRAINT `pk_region_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `is_company` tinyint(4) NOT NULL DEFAULT '0',
  `tax_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `retailer_buying_calendar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `buying_date` date NOT NULL,
  `is_ordered` tinyint(4) NOT NULL DEFAULT '0',
  `is_expired` tinyint(4) NOT NULL DEFAULT '0',
  `is_adaped` tinyint(4) NOT NULL,
  `adap_note` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_retailer_buying_calendar_retailer_idx` (`retailer_id`),
  CONSTRAINT `pk_retailer_buying_calendar_retailer` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `retailer_buying_calendar_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `retailer_buying_calendar_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `adap_quantity` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_retailer_buying_calendar_retailer_buying_calendar_item_idx` (`retailer_buying_calendar_id`),
  KEY `pk_retailer_buying_calendar_item_product_idx` (`product_id`),
  KEY `pk_retailer_buying_calendar_item_uom_idx` (`uom_id`),
  CONSTRAINT `pk_retailer_buying_calendar_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_buying_calendar_item_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_buying_calendar_retailer_buying_calendar_item` FOREIGN KEY (`retailer_buying_calendar_id`) REFERENCES `retailer_buying_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

CREATE TABLE `retailer_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gln` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `retailer_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `retailer_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distribution_id_to` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `retailer_id` int(11) NOT NULL,
  `retailer_buying_calendar_id` bigint(20) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `buying_date` date NOT NULL,
  `bill_to` int(11) NOT NULL,
  `ship_to` int(11) NOT NULL,
  `total_amount` decimal(10,0) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `retailer_ordercol` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_retailer_order_retailer_idx` (`retailer_id`),
  KEY `pk_retailer_order_retailer_buying_calendar_idx` (`retailer_buying_calendar_id`),
  KEY `pk_retailer_order_retailer_order_status_idx` (`status_id`),
  KEY `pk_retailer_order_retailer_location_bill_to_idx` (`bill_to`),
  KEY `pk_retailer_order_retailer_location_ship_to_idx` (`ship_to`),
  CONSTRAINT `pk_retailer_order_retailer` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_order_retailer_buying_calendar` FOREIGN KEY (`retailer_buying_calendar_id`) REFERENCES `retailer_buying_calendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_order_retailer_location_bill_to` FOREIGN KEY (`bill_to`) REFERENCES `retailer_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_order_retailer_location_ship_to` FOREIGN KEY (`ship_to`) REFERENCES `retailer_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_order_retailer_order_status` FOREIGN KEY (`status_id`) REFERENCES `retailer_order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `retailer_order_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `retailer_id` int(11) NOT NULL,
  `retailer_order_id` bigint(20) NOT NULL,
  `retailer_order_item_id` bigint(20) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `note` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_retailer_idx` (`retailer_id`),
  KEY `fk_audit_retailer_order_idx` (`retailer_order_id`),
  KEY `fk_audit_retailer_order_status_idx` (`status_id`),
  KEY `fk_audit_retailer_order_item_idx` (`retailer_order_item_id`),
  CONSTRAINT `fk_audit_retailer` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_audit_retailer_order` FOREIGN KEY (`retailer_order_id`) REFERENCES `retailer_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_audit_retailer_order_item` FOREIGN KEY (`retailer_order_item_id`) REFERENCES `retailer_order_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_audit_retailer_order_status` FOREIGN KEY (`status_id`) REFERENCES `retailer_order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `retailer_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `retailer_order_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `ordered_quantity` int(11) NOT NULL,
  `adap_quantity` int(11) DEFAULT NULL,
  `deliveried_quantity` int(11) DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_retailer_order_item_retailer_order_idx` (`retailer_order_id`),
  KEY `pk_retailer_order_item_product_idx` (`product_id`),
  KEY `pk_retailer_order_uom_idx` (`uom_id`),
  KEY `pk_retailer_order_item_retailer_order_status_idx` (`status_id`),
  CONSTRAINT `pk_retailer_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_order_item_retailer_order` FOREIGN KEY (`retailer_order_id`) REFERENCES `retailer_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_order_item_retailer_order_status` FOREIGN KEY (`status_id`) REFERENCES `retailer_order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_retailer_order_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

CREATE TABLE `retailer_order_status` (
  `id` int(11) NOT NULL,
  `caption_name` varchar(50) NOT NULL,
  `caption_description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `role` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `is_external_role` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `router` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_longitude` float NOT NULL,
  `current_latitude` float NOT NULL,
  `radius` float NOT NULL,
  `distribution_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_router_distribution_idx` (`distribution_id`),
  CONSTRAINT `fk_router_distribution` FOREIGN KEY (`distribution_id`) REFERENCES `distribution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `router_id` int(11) DEFAULT NULL,
  `distribution_id` int(11) NOT NULL,
  `status_id` smallint(6) NOT NULL,
  `deliveryman_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `current_longitude` float DEFAULT NULL,
  `current_latitude` float DEFAULT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trip_status_idx` (`status_id`),
  KEY `fk_trip_employee_idx` (`deliveryman_id`),
  KEY `fk_trip_driver_idx` (`driver_id`),
  KEY `fk_trip_vehicle_idx` (`vehicle_id`),
  KEY `fk_trip_route_idx` (`router_id`),
  KEY `fk_trip_distribution_idx` (`distribution_id`),
  CONSTRAINT `fk_trip_deliveryman` FOREIGN KEY (`deliveryman_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_distribution` FOREIGN KEY (`distribution_id`) REFERENCES `distribution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_driver` FOREIGN KEY (`driver_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_route` FOREIGN KEY (`router_id`) REFERENCES `router` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_status` FOREIGN KEY (`status_id`) REFERENCES `trip_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trip_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trip_audit_trip_status_idx` (`status_id`),
  KEY `fk_trip_audit_trip_idx` (`trip_id`),
  CONSTRAINT `fk_trip_audit_trip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_audit_trip_status` FOREIGN KEY (`status_id`) REFERENCES `trip_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trip_order` (
  `id` bigint(20) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `is_completed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_trip_order_trip_idx` (`trip_id`),
  CONSTRAINT `fk_trip_order_trip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trip_status` (
  `id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `uom` (
  `id` int(11) NOT NULL,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_access_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `access_token` varchar(256) CHARACTER SET utf8 NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_user_access_token_user_account_idx` (`user_id`),
  CONSTRAINT `pk_user_access_token_user_account` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;

CREATE TABLE `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 NOT NULL,
  `security_password` char(36) NOT NULL,
  `password_reset_code` char(8) DEFAULT NULL,
  `is_external_user` tinyint(4) DEFAULT '1',
  `is_superadmin` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) DEFAULT '0',
  `is_actived` tinyint(4) NOT NULL DEFAULT '0',
  `is_used` tinyint(4) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

CREATE TABLE `user_account_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_account_id` int(11) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`user_account_id`),
  KEY `pk_user_account_role_role_idx` (`role_id`),
  CONSTRAINT `pk_user_account_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_user_account_role_user_account` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `type_id` smallint(6) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehicle_vehicle_type_idx` (`type_id`),
  CONSTRAINT `fk_vehicle_vehicle_type` FOREIGN KEY (`type_id`) REFERENCES `vehicle_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vehicle_type` (
  `id` smallint(6) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_ward_country_idx` (`country_id`),
  KEY `pk_ward_province_idx` (`province_id`),
  KEY `pk_ward_district_idx` (`district_id`),
  CONSTRAINT `pk_ward_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_ward_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_ward_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

