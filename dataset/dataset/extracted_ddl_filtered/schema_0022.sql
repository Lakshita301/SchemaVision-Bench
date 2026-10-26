-- Source: https://github.com/p6/bizsensebms/blob/4e9c673fe82e88c529899b9644072e4f084cb555/application/data/backup/2010-03-31-17-37-31.sql?raw=true
-- Tables detected: 61 | FK/REFERENCES mentions: 43

CREATE TABLE `access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT 'roleid',
  `privilege_id` int(10) unsigned NOT NULL COMMENT 'privilege id',
  PRIMARY KEY (`access_id`),
  KEY `role_id` (`role_id`),
  KEY `privilege_id` (`privilege_id`),
  CONSTRAINT `access_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `access_ibfk_4` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `account` (
  `account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address_line_1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `billing_address_line_2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `billing_address_line_3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address_line_4` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address_line_1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address_line_2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address_line_3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address_line_4` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_to` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created` int(11) NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `branch_id` (`branch_id`),
  KEY `created_by` (`created_by`),
  KEY `assigned_to` (`assigned_to`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `account_notes` (
  `account_notes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `notes` text CHARACTER SET latin1 NOT NULL,
  `created` int(11) NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`account_notes_id`),
  KEY `account_id` (`account_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `account_notes_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_notes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `branch` (
  `branch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_manager` int(10) unsigned DEFAULT NULL,
  `branch_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `address_line_1` varchar(100) CHARACTER SET latin1 NOT NULL,
  `address_line_2` varchar(100) CHARACTER SET latin1 NOT NULL,
  `address_line_3` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `address_line_4` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state` varchar(100) CHARACTER SET latin1 NOT NULL,
  `postal_code` varchar(10) CHARACTER SET latin1 NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(320) CHARACTER SET latin1 DEFAULT NULL,
  `service_tax_number` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `tin` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `parent_branch_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `is_hq` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `branch_name` (`branch_name`),
  KEY `branch_manager` (`branch_manager`),
  KEY `parent_branch_id` (`parent_branch_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`branch_manager`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `branch_ibfk_2` FOREIGN KEY (`parent_branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `campaign` (
  `campaign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `assigned_to` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created` int(11) NOT NULL COMMENT 'when campaign was created',
  `branch_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`campaign_id`),
  KEY `assigned_to` (`assigned_to`),
  KEY `branch_id` (`branch_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `campaign_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `campaign_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `contact` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `middle_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `work_phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `home_phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `title` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `department` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `work_email` varchar(320) CHARACTER SET latin1 DEFAULT NULL,
  `other_email` varchar(320) CHARACTER SET latin1 DEFAULT NULL,
  `do_not_call` tinyint(1) NOT NULL DEFAULT '0',
  `email_opt_out` tinyint(1) NOT NULL DEFAULT '0',
  `billing_city` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `billing_state` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `billing_postal_code` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `billing_country` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `shipping_city` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `shipping_state` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `shipping_postal_code` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `shipping_country` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `reports_to` int(10) unsigned DEFAULT NULL,
  `salutation_id` int(10) unsigned DEFAULT NULL,
  `assistant_id` int(10) unsigned DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `billing_address_line_1` varchar(100) CHARACTER SET latin1 NOT NULL,
  `billing_address_line_2` varchar(100) CHARACTER SET latin1 NOT NULL,
  `billing_address_line_3` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `billing_address_line_4` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `shipping_address_line_1` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `shipping_address_line_2` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `shipping_address_line_3` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shipping_address_line_4` varchar(100) CHARACTER SET latin1 NOT NULL,
  `ss_enabled` tinyint(1) DEFAULT '0',
  `ss_active` tinyint(1) DEFAULT NULL,
  `ss_password` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `reports_to` (`reports_to`),
  KEY `salutation_id` (`salutation_id`),
  KEY `assistant_id` (`assistant_id`),
  KEY `branch_id` (`branch_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `contact_notes` (
  `contact_notes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `notes` text CHARACTER SET utf8 NOT NULL,
  `created` int(11) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`contact_notes_id`),
  KEY `opportunity_id` (`contact_id`,`created_by`),
  KEY `created_by` (`created_by`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `contact_notes_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contact_notes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `currency` (
  `currency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(10) CHARACTER SET latin1 NOT NULL,
  `short_description` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `fa_account` (
  `fa_account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `debit` decimal(10,0) DEFAULT NULL,
  `credit` decimal(10,0) DEFAULT NULL,
  `transaction_timestamp` int(11) DEFAULT NULL,
  `notes` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`fa_account_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `fa_contact` (
  `fa_contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `debit` decimal(10,0) DEFAULT NULL,
  `credit` decimal(10,0) DEFAULT NULL,
  `transaction_timestamp` int(11) DEFAULT NULL,
  `notes` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`fa_contact_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `fa_group` (
  `fa_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `fa_group_category_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`fa_group_id`),
  UNIQUE KEY `name` (`name`),
  KEY `fa_group_category_id` (`fa_group_category_id`),
  CONSTRAINT `fa_group_ibfk_1` FOREIGN KEY (`fa_group_category_id`) REFERENCES `fa_group` (`fa_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `fa_group_category` (
  `fa_group_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`fa_group_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `fa_ledger` (
  `fa_ledger_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `fa_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`fa_ledger_id`),
  UNIQUE KEY `name` (`name`),
  KEY `fa_group_id` (`fa_group_id`),
  CONSTRAINT `fa_ledger_ibfk_1` FOREIGN KEY (`fa_group_id`) REFERENCES `fa_group` (`fa_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `fa_ledger_entry` (
  `fa_ledger_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_ledger_id` int(10) unsigned NOT NULL,
  `debit` decimal(10,0) NOT NULL,
  `credit` decimal(10,0) NOT NULL,
  `notes` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `transaction_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`fa_ledger_entry_id`),
  KEY `fa_ledger_id` (`fa_ledger_id`),
  CONSTRAINT `fa_ledger_entry_ibfk_1` FOREIGN KEY (`fa_ledger_id`) REFERENCES `fa_ledger` (`fa_ledger_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `inventory` (
  `inventory_id` int(10) unsigned NOT NULL,
  `warehouse_id` int(10) unsigned NOT NULL,
  `purchase_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `serial_no` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `box_no` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `item_notes` varchar(200) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `invoice` (
  `invoice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `invoice_type` int(10) unsigned NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `to_type` int(10) unsigned NOT NULL,
  `to_type_id` int(10) unsigned NOT NULL,
  `debit_entry_id` int(10) unsigned NOT NULL,
  `notes` text CHARACTER SET utf8,
  `delivery_terms` text CHARACTER SET utf8,
  `payment_terms` text CHARACTER SET utf8,
  `purchase_order` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `invoice_item` (
  `invoice_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `invoice_item_type` int(11) NOT NULL,
  `invoice_item_inventory_id` int(10) unsigned NOT NULL,
  `unit_price` decimal(10,0) NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `tax_type_id` int(10) unsigned DEFAULT NULL,
  `item_description` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`invoice_item_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `invoice_item_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `lead` (
  `lead_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `middle_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `company_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `home_phone` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `work_phone` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(320) CHARACTER SET latin1 DEFAULT NULL,
  `address_line_1` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `address_line_2` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `address_line_3` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `address_line_4` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `state` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `do_not_call` tinyint(1) NOT NULL DEFAULT '0',
  `email_opt_out` tinyint(1) NOT NULL DEFAULT '0',
  `converted` tinyint(1) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) DEFAULT NULL,
  `lead_source_id` int(10) unsigned DEFAULT NULL,
  `lead_status_id` int(10) unsigned DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `branch_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`lead_id`),
  KEY `created_by` (`created_by`),
  KEY `branch_id` (`branch_id`),
  KEY `assigned_to` (`assigned_to`),
  KEY `lead_status_id` (`lead_status_id`),
  KEY `lead_source_id` (`lead_source_id`),
  CONSTRAINT `lead_ibfk_2` FOREIGN KEY (`lead_status_id`) REFERENCES `lead_status` (`lead_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lead_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lead_ibfk_5` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lead_ibfk_6` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_source` (`lead_source_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `lead_notes` (
  `lead_notes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `notes` text NOT NULL,
  `created` int(11) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lead_notes_id`),
  KEY `opportunity_id` (`lead_id`,`created_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `lead_notes_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `lead` (`lead_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lead_notes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lead_source` (
  `lead_source_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`lead_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `lead_status` (
  `lead_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`lead_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `list` (
  `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` int(11) NOT NULL COMMENT 'when list was created',
  `created_by` int(10) unsigned NOT NULL,
  `show_in_customer_portal` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`list_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `list_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `priority` varchar(100) CHARACTER SET latin1 NOT NULL,
  `message` varchar(250) CHARACTER SET latin1 NOT NULL,
  `log_timestamp` varchar(50) CHARACTER SET latin1 NOT NULL,
  `priority_name` varchar(25) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `manufacturer` (
  `manufacturer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `opportunity` (
  `opportunity_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_type` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `amount` double DEFAULT NULL,
  `expected_close_date` int(11) NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `lead_source_id` int(10) unsigned DEFAULT NULL,
  `sales_stage_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `assigned_to` int(10) unsigned NOT NULL,
  `branch_id` int(10) unsigned DEFAULT NULL,
  `created` int(11) NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`opportunity_id`),
  KEY `created_by` (`created_by`),
  KEY `branch_id` (`branch_id`),
  KEY `assigned_to` (`assigned_to`),
  KEY `contact_id` (`contact_id`),
  KEY `account_id` (`account_id`),
  KEY `sales_stage_id` (`sales_stage_id`),
  KEY `lead_source_id` (`lead_source_id`),
  CONSTRAINT `opportunity_ibfk_1` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_source` (`lead_source_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opportunity_ibfk_2` FOREIGN KEY (`sales_stage_id`) REFERENCES `sales_stage` (`sales_stage_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opportunity_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opportunity_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `opportunity_contact` (
  `opportunity_id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`opportunity_id`),
  KEY `contact_id` (`contact_id`),
  CONSTRAINT `opportunity_contact_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opportunity_contact_ibfk_2` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`opportunity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `opportunity_notes` (
  `opportunity_notes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(10) unsigned NOT NULL,
  `notes` text CHARACTER SET utf8 NOT NULL,
  `created` int(11) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`opportunity_notes_id`),
  KEY `opportunity_id` (`opportunity_id`,`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `organization_details` (
  `organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) CHARACTER SET latin1 NOT NULL,
  `website` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'website url',
  `description` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `logo` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `logo_for_documents` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `footer` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `privilege` (
  `privilege_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `unit_price` decimal(10,0) NOT NULL,
  `taxable` tinyint(4) NOT NULL DEFAULT '1',
  `tax_type_id` int(10) unsigned DEFAULT NULL,
  `subscribable` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`),
  KEY `tax_type_id` (`tax_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `product_item_general` (
  `product_general_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `unit_price` double NOT NULL,
  PRIMARY KEY (`product_general_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `middle_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `personal_email` varchar(320) CHARACTER SET latin1 DEFAULT NULL,
  `work_phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `home_phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `reports_to` int(10) unsigned DEFAULT NULL,
  `primary_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `primary_role` (`primary_role`),
  KEY `reports_to` (`reports_to`),
  KEY `branch_id` (`branch_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`reports_to`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `profile_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profile_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `purchase` (
  `purchase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) CHARACTER SET latin1 NOT NULL,
  `vendor_sale_reference` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `other_delivery_point_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `other_delivery_point` text CHARACTER SET latin1,
  `delivery_terms` text CHARACTER SET latin1 NOT NULL,
  `payment_terms` text CHARACTER SET latin1 NOT NULL,
  `other_purchase_terms` text CHARACTER SET latin1,
  `shipping_instructions` text CHARACTER SET latin1,
  `purchase_notes` text CHARACTER SET latin1,
  `internal_purchase_notes` text CHARACTER SET latin1,
  `vendor_id` int(10) unsigned NOT NULL,
  `vendor_contact_id` int(10) unsigned DEFAULT NULL,
  `delivery_point` int(10) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `consignee_branch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `purchase_products` (
  `purchase_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `unit_price` double NOT NULL,
  `tax_type_id` int(11) unsigned DEFAULT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`purchase_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `quote` (
  `quote_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `assigned_to` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `subject` varchar(200) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1,
  `delivery_terms` text CHARACTER SET latin1,
  `payment_terms` text CHARACTER SET latin1,
  `internal_notes` text CHARACTER SET latin1,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `quote_products` (
  `quote_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `unit_price` double NOT NULL,
  `quantity` double NOT NULL,
  `tax_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`quote_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `resource` (
  `resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'role id',
  `name` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'role name',
  `description` varchar(250) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `sales_stage` (
  `sales_stage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `context` int(1) NOT NULL,
  PRIMARY KEY (`sales_stage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `salutation` (
  `salutation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`salutation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `shift` (
  `shift_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `in_time` int(11) NOT NULL,
  `out_time` int(11) DEFAULT NULL,
  `uid` int(10) unsigned NOT NULL,
  `work_location_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `site_email` (
  `site_email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(320) CHARACTER SET latin1 NOT NULL,
  `from_name` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'BizSense Site Mailer',
  `transport` varchar(50) CHARACTER SET latin1 NOT NULL,
  `smtp_server` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `smtp_require_auth` tinyint(1) DEFAULT NULL,
  `smtp_auth` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `smtp_username` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `smtp_password` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `smtp_secure_connection` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `smtp_port` int(11) DEFAULT NULL,
  `footer` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`site_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `task` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `task_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `assigned_to` (`assigned_to`),
  KEY `task_status_id` (`task_status_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`task_status_id`) REFERENCES `task_status` (`task_status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `task_category` (
  `task_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`task_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `task_status` (
  `task_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `closed_context` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `task_time` (
  `task_tme_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `in_time` datetime NOT NULL,
  `out_time` int(11) DEFAULT NULL,
  `uid` int(10) unsigned NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`task_tme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tax_class` (
  `tax_class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tax_type` (
  `tax_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `percentage` double NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_add_on` tinyint(1) NOT NULL DEFAULT '0',
  `fa_ledger_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`tax_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ticket` (
  `ticket_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8,
  `contact_id` int(10) unsigned NOT NULL,
  `created` int(11) DEFAULT NULL,
  `ticket_status_id` int(10) unsigned NOT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `contact_id` (`contact_id`),
  KEY `ticket_status_id` (`ticket_status_id`),
  KEY `assigned_to` (`assigned_to`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_status` (`ticket_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`assigned_to`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ticket_comment` (
  `ticket_comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `created` int(11) NOT NULL,
  `created_by_type` int(11) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ticket_comment_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `ticket_comment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ticket_status` (
  `ticket_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `closed_context` int(11) NOT NULL,
  PRIMARY KEY (`ticket_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `url_access` (
  `url_access_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'urlAccessId',
  `url` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'URL module/controller/action',
  `privilege_name` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `assertion_class` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`url_access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(320) CHARACTER SET latin1 NOT NULL COMMENT 'username',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'password',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'block status',
  `mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'pw req+',
  `hash` varchar(32) CHARACTER SET latin1 NOT NULL,
  `created` int(11) NOT NULL COMMENT 'when account was created',
  `alt_email` varchar(150) CHARACTER SET latin1 NOT NULL COMMENT 'alternate email',
  `host_created` varchar(250) CHARACTER SET latin1 NOT NULL COMMENT 'hostname',
  `ip_created` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'IP address',
  `last_access_ip` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `last_access_host` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `accessed` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `user_timezone` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `variable` (
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `value` longtext CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `branchId` int(10) unsigned NOT NULL,
  `addressLine1` varchar(100) CHARACTER SET latin1 NOT NULL,
  `addressLine2` varchar(100) CHARACTER SET latin1 NOT NULL,
  `addressLine3` varchar(100) CHARACTER SET latin1 NOT NULL,
  `addressLine4` varchar(100) CHARACTER SET latin1 NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state` varchar(100) CHARACTER SET latin1 NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 NOT NULL,
  `postalCode` varchar(20) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `incharge` int(10) unsigned NOT NULL,
  `description` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `work_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ws_access` (
  `ws_access_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ws_application_id` int(10) unsigned NOT NULL,
  `ws_access_timestamp` int(10) unsigned NOT NULL,
  `success` int(11) NOT NULL,
  PRIMARY KEY (`ws_access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ws_application` (
  `ws_application_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `api_key` varchar(40) CHARACTER SET latin1 NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ws_application_id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ws_ss_client` (
  `ws_ss_client_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(300) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ws_ss_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

