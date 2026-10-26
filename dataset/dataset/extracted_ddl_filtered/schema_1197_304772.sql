-- Source: https://github.com/hexfusion/angler/blob/84523ab7b956edf15f8af760a7eca765d1d3dfc2/applications/Angler/dbicdh/MySQL/deploy/0.08/001-auto.sql?raw=true
-- Tables detected: 49 | FK constraints: 72

CREATE TABLE `addresses` (
  `addresses_id` integer NOT NULL auto_increment,
  `users_id` integer NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT '',
  `archived` enum('0','1') NOT NULL DEFAULT '0',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `address_2` varchar(255) NOT NULL DEFAULT '',
  `postal_code` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(32) NOT NULL DEFAULT '',
  `states_id` integer NULL,
  `country_iso_code` char(2) NOT NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `addresses_idx_country_iso_code` (`country_iso_code`),
  INDEX `addresses_idx_states_id` (`states_id`),
  INDEX `addresses_idx_users_id` (`users_id`),
  PRIMARY KEY (`addresses_id`),
  CONSTRAINT `addresses_fk_country_iso_code` FOREIGN KEY (`country_iso_code`) REFERENCES `countries` (`country_iso_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `addresses_fk_states_id` FOREIGN KEY (`states_id`) REFERENCES `states` (`states_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `addresses_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `attribute_values` (
  `attribute_values_id` integer NOT NULL auto_increment,
  `attributes_id` integer NOT NULL,
  `value` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `priority` integer NOT NULL DEFAULT 0,
  INDEX `attribute_values_idx_attributes_id` (`attributes_id`),
  PRIMARY KEY (`attribute_values_id`),
  UNIQUE `attribute_values_attributes_id_value` (`attributes_id`, `value`),
  CONSTRAINT `attribute_values_fk_attributes_id` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `attributes` (
  `attributes_id` integer NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `dynamic` enum('0','1') NOT NULL DEFAULT '0',
  `priority` integer NOT NULL DEFAULT 0,
  PRIMARY KEY (`attributes_id`),
  UNIQUE `attributes_name_type` (`name`, `type`)
) ENGINE=InnoDB;

CREATE TABLE `cart_products` (
  `cart_products_id` integer NOT NULL auto_increment,
  `carts_id` integer NOT NULL,
  `sku` varchar(64) NOT NULL,
  `cart_position` integer NOT NULL,
  `quantity` integer NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `cart_products_idx_carts_id` (`carts_id`),
  INDEX `cart_products_idx_sku` (`sku`),
  PRIMARY KEY (`cart_products_id`),
  CONSTRAINT `cart_products_fk_carts_id` FOREIGN KEY (`carts_id`) REFERENCES `carts` (`carts_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_products_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `carts` (
  `carts_id` integer NOT NULL auto_increment,
  `name` varchar(255) NOT NULL DEFAULT '',
  `users_id` integer NULL,
  `sessions_id` varchar(255) NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `carts_idx_sessions_id` (`sessions_id`),
  INDEX `carts_idx_users_id` (`users_id`),
  PRIMARY KEY (`carts_id`),
  UNIQUE `carts_name_sessions_id` (`name`, `sessions_id`),
  CONSTRAINT `carts_fk_sessions_id` FOREIGN KEY (`sessions_id`) REFERENCES `sessions` (`sessions_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `countries` (
  `country_iso_code` char(2) NOT NULL,
  `scope` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `priority` integer NOT NULL DEFAULT 0,
  `show_states` enum('0','1') NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_iso_code`)
) ENGINE=InnoDB;

CREATE TABLE `fl_bench_journal_versions` (
  `id` integer NOT NULL auto_increment,
  `version` varchar(50) NOT NULL,
  `ddl` text NULL,
  `upgrade_sql` text NULL,
  PRIMARY KEY (`id`),
  UNIQUE `dbix_class_deploymenthandler_versions_version` (`version`)
);

CREATE TABLE `inventories` (
  `sku` varchar(64) NOT NULL,
  `quantity` integer NOT NULL DEFAULT 0,
  `lead_time_min_days` integer NOT NULL DEFAULT 0,
  `lead_time_max_days` integer NOT NULL DEFAULT 0,
  `manufacturer_quantity` integer NOT NULL DEFAULT 0,
  INDEX (`sku`),
  PRIMARY KEY (`sku`),
  CONSTRAINT `inventories_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `media_displays` (
  `media_displays_id` integer NOT NULL auto_increment,
  `media_types_id` integer NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NULL,
  `path` varchar(255) NULL,
  `size` varchar(255) NULL,
  INDEX `media_displays_idx_media_types_id` (`media_types_id`),
  PRIMARY KEY (`media_displays_id`),
  UNIQUE `media_types_id_type_unique` (`media_types_id`, `type`),
  CONSTRAINT `media_displays_fk_media_types_id` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`media_types_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `media_products` (
  `media_id` integer NOT NULL,
  `sku` varchar(64) NOT NULL,
  INDEX `media_products_idx_media_id` (`media_id`),
  INDEX `media_products_idx_sku` (`sku`),
  PRIMARY KEY (`media_id`, `sku`),
  CONSTRAINT `media_products_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `medias` (`media_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `media_products_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `media_types` (
  `media_types_id` integer NOT NULL auto_increment,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`media_types_id`),
  UNIQUE `media_types_type` (`type`)
) ENGINE=InnoDB;

CREATE TABLE `merchandising_attributes` (
  `merchandising_attributes_id` integer NOT NULL auto_increment,
  `merchandising_products_id` integer NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL,
  INDEX `merchandising_attributes_idx_merchandising_products_id` (`merchandising_products_id`),
  PRIMARY KEY (`merchandising_attributes_id`),
  CONSTRAINT `merchandising_attributes_fk_merchandising_products_id` FOREIGN KEY (`merchandising_products_id`) REFERENCES `merchandising_products` (`merchandising_products_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `merchandising_products` (
  `merchandising_products_id` integer NOT NULL auto_increment,
  `sku` varchar(64) NOT NULL,
  `sku_related` varchar(64) NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  INDEX `merchandising_products_idx_sku` (`sku`),
  INDEX `merchandising_products_idx_sku_related` (`sku_related`),
  PRIMARY KEY (`merchandising_products_id`),
  UNIQUE `merchandising_products_sku_sku_related_type` (`sku`, `sku_related`, `type`),
  CONSTRAINT `merchandising_products_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `merchandising_products_fk_sku_related` FOREIGN KEY (`sku_related`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `message_types` (
  `message_types_id` integer NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`message_types_id`),
  UNIQUE `message_types_name` (`name`)
) ENGINE=InnoDB;

CREATE TABLE `navigation_attribute_values` (
  `navigation_attribute_values_id` integer NOT NULL auto_increment,
  `navigation_attributes_id` integer NOT NULL,
  `attribute_values_id` integer NOT NULL,
  INDEX `navigation_attribute_values_idx_attribute_values_id` (`attribute_values_id`),
  INDEX `navigation_attribute_values_idx_navigation_attributes_id` (`navigation_attributes_id`),
  PRIMARY KEY (`navigation_attribute_values_id`),
  CONSTRAINT `navigation_attribute_values_fk_attribute_values_id` FOREIGN KEY (`attribute_values_id`) REFERENCES `attribute_values` (`attribute_values_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `navigation_attribute_values_fk_navigation_attributes_id` FOREIGN KEY (`navigation_attributes_id`) REFERENCES `navigation_attributes` (`navigation_attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `navigation_attributes` (
  `navigation_attributes_id` integer NOT NULL auto_increment,
  `navigation_id` integer NOT NULL,
  `attributes_id` integer NOT NULL,
  INDEX `navigation_attributes_idx_attributes_id` (`attributes_id`),
  INDEX `navigation_attributes_idx_navigation_id` (`navigation_id`),
  PRIMARY KEY (`navigation_attributes_id`),
  UNIQUE `navigation_id_attributes_id` (`navigation_id`, `attributes_id`),
  CONSTRAINT `navigation_attributes_fk_attributes_id` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `navigation_attributes_fk_navigation_id` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`navigation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `navigation_products` (
  `sku` varchar(64) NOT NULL,
  `navigation_id` integer NOT NULL,
  `type` varchar(16) NULL,
  `priority` integer NOT NULL DEFAULT 0,
  INDEX `navigation_products_idx_navigation_id` (`navigation_id`),
  INDEX `navigation_products_idx_sku` (`sku`),
  PRIMARY KEY (`sku`, `navigation_id`),
  CONSTRAINT `navigation_products_fk_navigation_id` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`navigation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `navigation_products_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `navigations` (
  `navigation_id` integer NOT NULL auto_increment,
  `uri` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `scope` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `alias` integer NULL,
  `parent_id` integer NULL,
  `priority` integer NOT NULL DEFAULT 0,
  `product_count` integer NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `code` varchar(8) NULL,
  INDEX `navigations_idx_parent_id` (`parent_id`),
  PRIMARY KEY (`navigation_id`),
  UNIQUE `navigations_uri` (`uri`),
  CONSTRAINT `navigations_fk_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `navigations` (`navigation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `orderlines` (
  `orderlines_id` integer NOT NULL auto_increment,
  `orders_id` integer NOT NULL,
  `order_position` integer NOT NULL DEFAULT 0,
  `sku` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `weight` numeric(10, 3) NOT NULL DEFAULT 0.0,
  `quantity` integer NOT NULL,
  `price` numeric(10, 2) NOT NULL,
  `subtotal` numeric(11, 2) NOT NULL,
  `shipping` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `handling` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `salestax` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `status` varchar(24) NOT NULL DEFAULT '',
  INDEX `orderlines_idx_orders_id` (`orders_id`),
  INDEX `orderlines_idx_sku` (`sku`),
  PRIMARY KEY (`orderlines_id`),
  CONSTRAINT `orderlines_fk_orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderlines_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `permissions` (
  `permissions_id` integer NOT NULL auto_increment,
  `roles_id` integer NOT NULL,
  `perm` varchar(255) NOT NULL,
  INDEX `permissions_idx_roles_id` (`roles_id`),
  PRIMARY KEY (`permissions_id`),
  CONSTRAINT `permissions_fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`roles_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `price_modifiers` (
  `price_modifiers_id` integer NOT NULL auto_increment,
  `sku` varchar(64) NOT NULL,
  `quantity` integer NOT NULL DEFAULT 0,
  `roles_id` integer NULL,
  `price` numeric(10, 2) NOT NULL,
  `discount` numeric(7, 4) NULL,
  `start_date` date NULL,
  `end_date` date NULL,
  INDEX `price_modifiers_idx_sku` (`sku`),
  INDEX `price_modifiers_idx_roles_id` (`roles_id`),
  PRIMARY KEY (`price_modifiers_id`),
  CONSTRAINT `price_modifiers_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`),
  CONSTRAINT `price_modifiers_fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`roles_id`)
) ENGINE=InnoDB;

CREATE TABLE `product_attribute_values` (
  `product_attribute_values_id` integer NOT NULL auto_increment,
  `product_attributes_id` integer NOT NULL,
  `attribute_values_id` integer NOT NULL,
  INDEX `product_attribute_values_idx_attribute_values_id` (`attribute_values_id`),
  INDEX `product_attribute_values_idx_product_attributes_id` (`product_attributes_id`),
  PRIMARY KEY (`product_attribute_values_id`),
  CONSTRAINT `product_attribute_values_fk_attribute_values_id` FOREIGN KEY (`attribute_values_id`) REFERENCES `attribute_values` (`attribute_values_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_attribute_values_fk_product_attributes_id` FOREIGN KEY (`product_attributes_id`) REFERENCES `product_attributes` (`product_attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `product_attributes` (
  `product_attributes_id` integer NOT NULL auto_increment,
  `sku` varchar(64) NOT NULL,
  `attributes_id` integer NOT NULL,
  `canonical` enum('0','1') NOT NULL DEFAULT '1',
  INDEX `product_attributes_idx_attributes_id` (`attributes_id`),
  INDEX `product_attributes_idx_sku` (`sku`),
  PRIMARY KEY (`product_attributes_id`),
  UNIQUE `sku_attributes_id` (`sku`, `attributes_id`),
  CONSTRAINT `product_attributes_fk_attributes_id` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_attributes_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `products` (
  `sku` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `price` numeric(10, 2) NOT NULL DEFAULT 0.0,
  `uri` varchar(255) NULL,
  `weight` numeric(10, 2) NULL,
  `priority` integer NOT NULL DEFAULT 0,
  `gtin` varchar(32) NULL,
  `canonical_sku` varchar(64) NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `inventory_exempt` enum('0','1') NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `manufacturer_sku` varchar(64) NULL,
  `cost` numeric(10, 2) NOT NULL DEFAULT 0.0,
  INDEX `products_idx_canonical_sku` (`canonical_sku`),
  PRIMARY KEY (`sku`),
  UNIQUE `product_manufacturer_sku` (`manufacturer_sku`),
  UNIQUE `products_gtin` (`gtin`),
  UNIQUE `products_uri` (`uri`),
  CONSTRAINT `products_fk_canonical_sku` FOREIGN KEY (`canonical_sku`) REFERENCES `products` (`sku`)
) ENGINE=InnoDB;

CREATE TABLE `roles` (
  `roles_id` integer NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`roles_id`),
  UNIQUE `roles_name` (`name`)
) ENGINE=InnoDB;

CREATE TABLE `sessions` (
  `sessions_id` varchar(255) NOT NULL,
  `session_data` text NOT NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY (`sessions_id`)
) ENGINE=InnoDB;

CREATE TABLE `settings` (
  `settings_id` integer NOT NULL auto_increment,
  `scope` varchar(32) NOT NULL,
  `site` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `category` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`settings_id`)
);

CREATE TABLE `shipment_carriers` (
  `shipment_carriers_id` integer NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `account_number` varchar(255) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`shipment_carriers_id`)
) ENGINE=InnoDB;

CREATE TABLE `shipment_destinations` (
  `shipment_destinations_id` integer NOT NULL auto_increment,
  `zones_id` integer NOT NULL,
  `shipment_methods_id` integer NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  INDEX `shipment_destinations_idx_shipment_methods_id` (`shipment_methods_id`),
  INDEX `shipment_destinations_idx_zones_id` (`zones_id`),
  PRIMARY KEY (`shipment_destinations_id`),
  CONSTRAINT `shipment_destinations_fk_shipment_methods_id` FOREIGN KEY (`shipment_methods_id`) REFERENCES `shipment_methods` (`shipment_methods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shipment_destinations_fk_zones_id` FOREIGN KEY (`zones_id`) REFERENCES `zones` (`zones_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `shipment_methods` (
  `shipment_methods_id` integer NOT NULL auto_increment,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `shipment_carriers_id` integer NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `shipment_methods_idx_shipment_carriers_id` (`shipment_carriers_id`),
  PRIMARY KEY (`shipment_methods_id`),
  CONSTRAINT `shipment_methods_fk_shipment_carriers_id` FOREIGN KEY (`shipment_carriers_id`) REFERENCES `shipment_carriers` (`shipment_carriers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `shipment_rates` (
  `shipment_rates_id` integer NOT NULL auto_increment,
  `zones_id` integer NOT NULL,
  `shipment_methods_id` integer NOT NULL,
  `value_type` varchar(64) NULL,
  `value_unit` varchar(64) NULL,
  `min_value` numeric(10, 2) NOT NULL DEFAULT 0.0,
  `max_value` numeric(10, 2) NOT NULL DEFAULT 0.0,
  `price` numeric(10, 2) NOT NULL DEFAULT 0.0,
  `valid_from` date NOT NULL,
  `valid_to` date NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `shipment_rates_idx_shipment_methods_id` (`shipment_methods_id`),
  INDEX `shipment_rates_idx_zones_id` (`zones_id`),
  PRIMARY KEY (`shipment_rates_id`),
  CONSTRAINT `shipment_rates_fk_shipment_methods_id` FOREIGN KEY (`shipment_methods_id`) REFERENCES `shipment_methods` (`shipment_methods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shipment_rates_fk_zones_id` FOREIGN KEY (`zones_id`) REFERENCES `zones` (`zones_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `shipments` (
  `shipments_id` integer NOT NULL auto_increment,
  `tracking_number` varchar(255) NOT NULL DEFAULT '',
  `shipment_carriers_id` integer NOT NULL,
  `shipment_methods_id` integer NOT NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `shipments_idx_shipment_carriers_id` (`shipment_carriers_id`),
  INDEX `shipments_idx_shipment_methods_id` (`shipment_methods_id`),
  PRIMARY KEY (`shipments_id`),
  CONSTRAINT `shipments_fk_shipment_carriers_id` FOREIGN KEY (`shipment_carriers_id`) REFERENCES `shipment_carriers` (`shipment_carriers_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shipments_fk_shipment_methods_id` FOREIGN KEY (`shipment_methods_id`) REFERENCES `shipment_methods` (`shipment_methods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `states` (
  `states_id` integer NOT NULL auto_increment,
  `scope` varchar(32) NOT NULL DEFAULT '',
  `country_iso_code` char(2) NOT NULL,
  `state_iso_code` varchar(6) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `priority` integer NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  INDEX `states_idx_country_iso_code` (`country_iso_code`),
  PRIMARY KEY (`states_id`),
  UNIQUE `states_state_country` (`country_iso_code`, `state_iso_code`),
  CONSTRAINT `states_fk_country_iso_code` FOREIGN KEY (`country_iso_code`) REFERENCES `countries` (`country_iso_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `taxes` (
  `taxes_id` integer NOT NULL auto_increment,
  `tax_name` varchar(64) NOT NULL,
  `description` varchar(64) NOT NULL,
  `percent` numeric(7, 4) NOT NULL,
  `decimal_places` integer NOT NULL DEFAULT 2,
  `rounding` char(1) NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NULL,
  `country_iso_code` char(2) NULL,
  `states_id` integer NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `taxes_idx_country_iso_code` (`country_iso_code`),
  INDEX `taxes_idx_states_id` (`states_id`),
  INDEX `taxes_idx_tax_name` (`tax_name`),
  INDEX `taxes_idx_valid_from` (`valid_from`),
  INDEX `taxes_idx_valid_to` (`valid_to`),
  PRIMARY KEY (`taxes_id`),
  CONSTRAINT `taxes_fk_country_iso_code` FOREIGN KEY (`country_iso_code`) REFERENCES `countries` (`country_iso_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `taxes_fk_states_id` FOREIGN KEY (`states_id`) REFERENCES `states` (`states_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `user_attribute_values` (
  `user_attribute_values_id` integer NOT NULL auto_increment,
  `user_attributes_id` integer NOT NULL,
  `attribute_values_id` integer NOT NULL,
  INDEX `user_attribute_values_idx_attribute_values_id` (`attribute_values_id`),
  INDEX `user_attribute_values_idx_user_attributes_id` (`user_attributes_id`),
  PRIMARY KEY (`user_attribute_values_id`),
  CONSTRAINT `user_attribute_values_fk_attribute_values_id` FOREIGN KEY (`attribute_values_id`) REFERENCES `attribute_values` (`attribute_values_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_attribute_values_fk_user_attributes_id` FOREIGN KEY (`user_attributes_id`) REFERENCES `user_attributes` (`user_attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `user_attributes` (
  `user_attributes_id` integer NOT NULL auto_increment,
  `users_id` integer NOT NULL,
  `attributes_id` integer NOT NULL,
  INDEX `user_attributes_idx_attributes_id` (`attributes_id`),
  INDEX `user_attributes_idx_users_id` (`users_id`),
  PRIMARY KEY (`user_attributes_id`),
  UNIQUE `users_id_attributes_id` (`users_id`, `attributes_id`),
  CONSTRAINT `user_attributes_fk_attributes_id` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_attributes_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `users` (
  `users_id` integer NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `nickname` varchar(255) NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `last_login` datetime NULL,
  `fail_count` integer NOT NULL DEFAULT 0,
  `reset_expires` datetime NULL,
  `reset_token` varchar(255) NULL,
  `is_anonymous` enum('0','1') NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  INDEX `users_idx_reset_token` (`reset_token`),
  PRIMARY KEY (`users_id`),
  UNIQUE `users_nickname` (`nickname`),
  UNIQUE `users_username` (`username`)
) ENGINE=InnoDB;

CREATE TABLE `zone_countries` (
  `zones_id` integer NOT NULL,
  `country_iso_code` char(2) NOT NULL,
  INDEX `zone_countries_idx_country_iso_code` (`country_iso_code`),
  INDEX `zone_countries_idx_zones_id` (`zones_id`),
  PRIMARY KEY (`zones_id`, `country_iso_code`),
  CONSTRAINT `zone_countries_fk_country_iso_code` FOREIGN KEY (`country_iso_code`) REFERENCES `countries` (`country_iso_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zone_countries_fk_zones_id` FOREIGN KEY (`zones_id`) REFERENCES `zones` (`zones_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `zone_states` (
  `zones_id` integer NOT NULL,
  `states_id` integer NOT NULL,
  INDEX `zone_states_idx_states_id` (`states_id`),
  INDEX `zone_states_idx_zones_id` (`zones_id`),
  PRIMARY KEY (`zones_id`, `states_id`),
  CONSTRAINT `zone_states_fk_states_id` FOREIGN KEY (`states_id`) REFERENCES `states` (`states_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zone_states_fk_zones_id` FOREIGN KEY (`zones_id`) REFERENCES `zones` (`zones_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `zones` (
  `zones_id` integer NOT NULL auto_increment,
  `zone` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY (`zones_id`),
  UNIQUE `zones_zone` (`zone`)
) ENGINE=InnoDB;

CREATE TABLE `orders` (
  `orders_id` integer NOT NULL auto_increment,
  `order_number` varchar(24) NOT NULL,
  `order_date` timestamp NULL,
  `users_id` integer NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `shipping_addresses_id` integer NOT NULL,
  `billing_addresses_id` integer NOT NULL,
  `weight` numeric(11, 3) NOT NULL DEFAULT 0.0,
  `payment_method` varchar(255) NOT NULL DEFAULT '',
  `payment_number` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `shipping_method` varchar(255) NOT NULL DEFAULT '',
  `subtotal` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `shipping` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `handling` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `salestax` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `total_cost` numeric(11, 2) NOT NULL DEFAULT 0.0,
  INDEX `orders_idx_billing_addresses_id` (`billing_addresses_id`),
  INDEX `orders_idx_shipping_addresses_id` (`shipping_addresses_id`),
  INDEX `orders_idx_users_id` (`users_id`),
  PRIMARY KEY (`orders_id`),
  UNIQUE `orders_order_number` (`order_number`),
  CONSTRAINT `orders_fk_billing_addresses_id` FOREIGN KEY (`billing_addresses_id`) REFERENCES `addresses` (`addresses_id`),
  CONSTRAINT `orders_fk_shipping_addresses_id` FOREIGN KEY (`shipping_addresses_id`) REFERENCES `addresses` (`addresses_id`),
  CONSTRAINT `orders_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `payment_orders` (
  `payment_orders_id` integer NOT NULL auto_increment,
  `payment_mode` varchar(32) NOT NULL DEFAULT '',
  `payment_action` varchar(32) NOT NULL DEFAULT '',
  `payment_id` varchar(32) NOT NULL DEFAULT '',
  `auth_code` varchar(255) NOT NULL DEFAULT '',
  `users_id` integer NULL,
  `sessions_id` varchar(255) NULL,
  `orders_id` integer NULL,
  `amount` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `status` varchar(32) NOT NULL DEFAULT '',
  `payment_sessions_id` varchar(255) NOT NULL DEFAULT '',
  `payment_error_code` varchar(32) NOT NULL DEFAULT '',
  `payment_error_message` text NULL,
  `payment_fee` numeric(11, 2) NOT NULL DEFAULT 0.0,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `payment_orders_idx_orders_id` (`orders_id`),
  INDEX `payment_orders_idx_sessions_id` (`sessions_id`),
  INDEX `payment_orders_idx_users_id` (`users_id`),
  PRIMARY KEY (`payment_orders_id`),
  CONSTRAINT `payment_orders_fk_orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_orders_fk_sessions_id` FOREIGN KEY (`sessions_id`) REFERENCES `sessions` (`sessions_id`) ON DELETE SET NULL,
  CONSTRAINT `payment_orders_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `user_roles` (
  `users_id` integer NOT NULL,
  `roles_id` integer NOT NULL,
  INDEX `user_roles_idx_roles_id` (`roles_id`),
  INDEX `user_roles_idx_users_id` (`users_id`),
  PRIMARY KEY (`users_id`, `roles_id`),
  CONSTRAINT `user_roles_fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`roles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `medias` (
  `media_id` integer NOT NULL auto_increment,
  `file` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL DEFAULT '',
  `mime_type` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `author_users_id` integer NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `media_types_id` integer NOT NULL,
  INDEX `medias_idx_author_users_id` (`author_users_id`),
  INDEX `medias_idx_media_types_id` (`media_types_id`),
  PRIMARY KEY (`media_id`),
  UNIQUE `media_id_media_types_id_unique` (`media_id`, `media_types_id`),
  UNIQUE `medias_file` (`file`),
  CONSTRAINT `medias_fk_author_users_id` FOREIGN KEY (`author_users_id`) REFERENCES `users` (`users_id`),
  CONSTRAINT `medias_fk_media_types_id` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`media_types_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `messages` (
  `messages_id` integer NOT NULL auto_increment,
  `title` varchar(255) NOT NULL DEFAULT '',
  `message_types_id` integer NOT NULL,
  `uri` varchar(255) NULL,
  `format` varchar(32) NOT NULL DEFAULT 'plain',
  `content` text NOT NULL,
  `author_users_id` integer NULL,
  `rating` numeric(4, 2) NOT NULL DEFAULT 0,
  `recommend` enum('0','1') NULL,
  `public` enum('0','1') NOT NULL DEFAULT '0',
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `approved_by_users_id` integer NULL,
  `parent_id` integer NULL,
  `created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  INDEX `messages_idx_parent_id` (`parent_id`),
  INDEX `messages_idx_approved_by_users_id` (`approved_by_users_id`),
  INDEX `messages_idx_author_users_id` (`author_users_id`),
  INDEX `messages_idx_message_types_id` (`message_types_id`),
  PRIMARY KEY (`messages_id`),
  CONSTRAINT `messages_fk_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `messages` (`messages_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_fk_approved_by_users_id` FOREIGN KEY (`approved_by_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_fk_author_users_id` FOREIGN KEY (`author_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_fk_message_types_id` FOREIGN KEY (`message_types_id`) REFERENCES `message_types` (`message_types_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `order_statuses` (
  `order_status_id` integer NOT NULL auto_increment,
  `orders_id` integer NOT NULL,
  `status` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  INDEX `order_statuses_idx_orders_id` (`orders_id`),
  PRIMARY KEY (`order_status_id`),
  CONSTRAINT `order_statuses_fk_orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `orderlines_shippings` (
  `orderlines_id` integer NOT NULL,
  `addresses_id` integer NOT NULL,
  `shipments_id` integer NOT NULL,
  INDEX `orderlines_shippings_idx_addresses_id` (`addresses_id`),
  INDEX `orderlines_shippings_idx_orderlines_id` (`orderlines_id`),
  INDEX `orderlines_shippings_idx_shipments_id` (`shipments_id`),
  PRIMARY KEY (`orderlines_id`, `addresses_id`),
  CONSTRAINT `orderlines_shippings_fk_addresses_id` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`addresses_id`),
  CONSTRAINT `orderlines_shippings_fk_orderlines_id` FOREIGN KEY (`orderlines_id`) REFERENCES `orderlines` (`orderlines_id`),
  CONSTRAINT `orderlines_shippings_fk_shipments_id` FOREIGN KEY (`shipments_id`) REFERENCES `shipments` (`shipments_id`)
) ENGINE=InnoDB;

CREATE TABLE `product_reviews` (
  `messages_id` integer NOT NULL,
  `sku` varchar(64) NOT NULL,
  INDEX `product_reviews_idx_messages_id` (`messages_id`),
  INDEX `product_reviews_idx_sku` (`sku`),
  PRIMARY KEY (`messages_id`, `sku`),
  CONSTRAINT `product_reviews_fk_messages_id` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`messages_id`) ON DELETE CASCADE,
  CONSTRAINT `product_reviews_fk_sku` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `order_comments` (
  `messages_id` integer NOT NULL,
  `orders_id` integer NOT NULL,
  INDEX `order_comments_idx_messages_id` (`messages_id`),
  INDEX `order_comments_idx_orders_id` (`orders_id`),
  PRIMARY KEY (`messages_id`, `orders_id`),
  CONSTRAINT `order_comments_fk_messages_id` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`messages_id`) ON DELETE CASCADE,
  CONSTRAINT `order_comments_fk_orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

