-- Source: https://github.com/forderation/nest-bot/blob/c227aec030bf7af0077593b4c49e2b569276c8aa/nest-bot-dev.sql?raw=true
-- Tables detected: 7 | FK constraints: 6

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `telegram_user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `team_leader_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nik` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jenis_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reminder` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `merk_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merk_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `position_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `new_update` tinyint(1) NOT NULL,
  `picture_loc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `approve_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `approve_state` enum('approved','disagree','waiting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_state` enum('baik','dikembalikan','rusak','belum_melaporkan','hilang') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reminder_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `last_known_group_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_team_leader_id_foreign` FOREIGN KEY (`team_leader_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `position_products`
  ADD CONSTRAINT `position_products_approve_id_foreign` FOREIGN KEY (`approve_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `position_products_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `position_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `products`
  ADD CONSTRAINT `products_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `jenis_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_merk_id_foreign` FOREIGN KEY (`merk_id`) REFERENCES `merk_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

