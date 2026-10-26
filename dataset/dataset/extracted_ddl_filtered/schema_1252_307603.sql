-- Source: https://github.com/mate-academy/jv-web-security/blob/60b08d77265498a21892654b4ebbc9af4ffbb23c/src/main/resources/init_db.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE `drivers`  (
                            `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `license_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                            `is_deleted` bit(1) NOT NULL DEFAULT b'0',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `manufacturers`  (
                                  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
                                  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                                  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                                  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `cars`  (
                         `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
                         `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                         `manufacturer_id` bigint(0) UNSIGNED NOT NULL,
                         `is_deleted` bit(1) NOT NULL DEFAULT b'0',
                         PRIMARY KEY (`id`) USING BTREE,
                         INDEX `FK_manufacturer_id`(`manufacturer_id`) USING BTREE,
                         CONSTRAINT `FK_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `cars_drivers`  (
                                 `car_id` bigint(0) UNSIGNED NOT NULL,
                                 `driver_id` bigint(0) UNSIGNED NOT NULL,
                                 PRIMARY KEY (`car_id`, `driver_id`) USING BTREE,
                                 INDEX `driver_id`(`driver_id`) USING BTREE,
                                 INDEX `car_id`(`car_id`) USING BTREE,
                                 CONSTRAINT `car_id` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                 CONSTRAINT `driver_id` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

