-- Source: https://github.com/tintin3274/items-delivery/blob/22646d8be47ae82d6b2b96ae851a57909fb3925d/items_delivery_structure.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 6

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `phone_number` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `unit` text NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `required` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `item_export` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `export_quantity` int(10) UNSIGNED NOT NULL,
  `export_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `item_import` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `import_quantity` int(10) UNSIGNED NOT NULL,
  `import_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `import_remark` text NOT NULL DEFAULT 'ARRIVAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `list_item` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `order_request` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `status` text NOT NULL DEFAULT 'PENDING',
  `address` text NOT NULL,
  `description` text DEFAULT NULL,
  `create_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `due_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `item_export`
  ADD CONSTRAINT `item_export_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_request` (`id`),
  ADD CONSTRAINT `item_export_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

ALTER TABLE `item_import`
  ADD CONSTRAINT `item_import_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

ALTER TABLE `list_item`
  ADD CONSTRAINT `list_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_request` (`id`),
  ADD CONSTRAINT `list_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

ALTER TABLE `order_request`
  ADD CONSTRAINT `FKfxjv0s37wwv4q392ftjueij4s` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

