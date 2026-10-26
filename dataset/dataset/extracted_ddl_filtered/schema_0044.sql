-- Source: https://github.com/CODERS-BAY/hotel-Doominik96/blob/8678454cdd45275fe2e1c30109f5681e53688ef5/hotel.sql?raw=true
-- Tables detected: 16 | FK/REFERENCES mentions: 16

CREATE TABLE `basicdesign` (
  `package_id` int(11) NOT NULL,
  `basicpackage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `basicpackage` (
  `basicpackage_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_arrival` datetime DEFAULT NULL,
  `booking_departure` datetime DEFAULT NULL,
  `booking_room_number` int(11) NOT NULL,
  `guest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `booking_has_package` (
  `booking_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `caretaker` (
  `caretaker_svnr` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `caretaker_has_package` (
  `caretaker_svnr` bigint(20) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `employee` (
  `employee_svnr` bigint(20) NOT NULL,
  `employee_firstname` varchar(30) DEFAULT NULL,
  `employee_lastname` varchar(30) DEFAULT NULL,
  `employee_postalcode` int(11) DEFAULT NULL,
  `employee_street` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_firstname` varchar(50) DEFAULT NULL,
  `guest_lastname` varchar(50) DEFAULT NULL,
  `guest_postalcode` int(11) DEFAULT NULL,
  `guest_street` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `luxurydesign` (
  `basicpackage_id` int(11) NOT NULL,
  `luxurypackage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `luxurypackage` (
  `luxurypackage_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_design` varchar(50) DEFAULT NULL,
  `package_price` varchar(50) DEFAULT NULL,
  `package_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `package_has_caretaker` (
  `package_id` int(11) NOT NULL,
  `caretaker_svnr` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `roomattendant` (
  `roomattendant_svnr` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rooms` (
  `room_number` int(11) NOT NULL,
  `room_persons` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `roomattendant_svnr` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `basicdesign`
  ADD CONSTRAINT `basicdesign_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `basicdesign_ibfk_2` FOREIGN KEY (`basicpackage_id`) REFERENCES `basicpackage` (`basicpackage_id`);

ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`booking_room_number`) REFERENCES `rooms` (`room_number`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`);

ALTER TABLE `booking_has_package`
  ADD CONSTRAINT `booking_has_package_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `booking_has_package_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);

ALTER TABLE `caretaker`
  ADD CONSTRAINT `caretaker_ibfk_1` FOREIGN KEY (`caretaker_svnr`) REFERENCES `employee` (`employee_svnr`);

ALTER TABLE `caretaker_has_package`
  ADD CONSTRAINT `caretaker_has_package_ibfk_1` FOREIGN KEY (`caretaker_svnr`) REFERENCES `caretaker` (`caretaker_svnr`),
  ADD CONSTRAINT `caretaker_has_package_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

ALTER TABLE `luxurydesign`
  ADD CONSTRAINT `luxurydesign_ibfk_1` FOREIGN KEY (`basicpackage_id`) REFERENCES `basicpackage` (`basicpackage_id`),
  ADD CONSTRAINT `luxurydesign_ibfk_2` FOREIGN KEY (`luxurypackage_id`) REFERENCES `luxurypackage` (`luxurypackage_id`);

ALTER TABLE `package_has_caretaker`
  ADD CONSTRAINT `package_has_caretaker_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `package_has_caretaker_ibfk_2` FOREIGN KEY (`caretaker_svnr`) REFERENCES `caretaker` (`caretaker_svnr`);

ALTER TABLE `roomattendant`
  ADD CONSTRAINT `roomattendant_ibfk_1` FOREIGN KEY (`roomattendant_svnr`) REFERENCES `employee` (`employee_svnr`);

ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`roomattendant_svnr`) REFERENCES `roomattendant` (`roomattendant_svnr`);

