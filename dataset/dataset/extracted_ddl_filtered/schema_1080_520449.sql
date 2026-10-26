-- Source: https://github.com/MrCodeMania/TMI/blob/8f9945eb1e78b816f908380da78a74761cd1e69a/exec/TMI_mysql_dump.sql?raw=true
-- Tables detected: 8 | FK constraints: 6

CREATE TABLE `app` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `git_url` varchar(255) DEFAULT NULL,
  `recent_datetime` datetime DEFAULT NULL,
  `recent_total_branch_cov_covered` int NOT NULL,
  `recent_total_branch_cov_missed` int NOT NULL,
  `recent_total_elapsed_time` int NOT NULL,
  `recent_total_error_count` int NOT NULL,
  `recent_total_fail_count` int NOT NULL,
  `recent_total_line_cov_covered` int NOT NULL,
  `recent_total_line_cov_missed` int NOT NULL,
  `recent_total_run_count` int NOT NULL,
  `recent_total_skip_count` int NOT NULL,
  `reg_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK24xq4bnkxjlix83jiu99i1w5b` (`project_id`),
  CONSTRAINT `FK24xq4bnkxjlix83jiu99i1w5b` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `coverage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_cov_covered` int NOT NULL,
  `branch_cov_missed` int NOT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `highlight_html` varchar(255) DEFAULT NULL,
  `line_cov_covered` int NOT NULL,
  `line_cov_missed` int NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `report_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt0kx4sc29maqx9jj6bj19e4wn` (`report_id`),
  CONSTRAINT `FKt0kx4sc29maqx9jj6bj19e4wn` FOREIGN KEY (`report_id`) REFERENCES `report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl7ga8i4ry2amd4mb525tdmjf6` (`department_id`),
  CONSTRAINT `FKl7ga8i4ry2amd4mb525tdmjf6` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `total_branch_cov_covered` int NOT NULL,
  `total_branch_cov_missed` int NOT NULL,
  `total_elapsed_time` int NOT NULL,
  `total_error_count` int NOT NULL,
  `total_fail_count` int NOT NULL,
  `total_line_cov_covered` int NOT NULL,
  `total_line_cov_missed` int NOT NULL,
  `total_run_count` int NOT NULL,
  `total_skip_count` int NOT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlu0heogws02ux709hy9fjtgdl` (`app_id`),
  CONSTRAINT `FKlu0heogws02ux709hy9fjtgdl` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `elapsed_time` int NOT NULL,
  `error_message` varchar(5000) DEFAULT NULL,
  `error_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `report_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhiyc2yvgl4a8g7k5vbrqafewo` (`report_id`),
  CONSTRAINT `FKhiyc2yvgl4a8g7k5vbrqafewo` FOREIGN KEY (`report_id`) REFERENCES `report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user',
  `uid` varchar(255) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgkh2fko1e4ydv1y6vtrwdc6my` (`department_id`),
  CONSTRAINT `FKgkh2fko1e4ydv1y6vtrwdc6my` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

