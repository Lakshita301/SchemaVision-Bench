-- Source: https://github.com/lenamh00/corona/blob/5a50f952123660423fbd35a15d029dab897a3d4b/patient_doctor(2).sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 5

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `recource_id` int(11) NOT NULL,
  `bed_name` text NOT NULL,
  `number_validate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `chat` (
  `chat-id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `msg` varchar(155) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `doctor` (
  `Doctor-id` int(11) NOT NULL,
  `Doctor-name` varchar(255) NOT NULL,
  `Jurisdiction` varchar(255) NOT NULL,
  `university` varchar(255) NOT NULL,
  `availabel_number` int(11) DEFAULT NULL,
  `recource_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `medicine` (
  `medicin_id` int(11) NOT NULL,
  `recource_id` int(11) NOT NULL,
  `medicin_name` text NOT NULL,
  `number_validate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `oxogen` (
  `oxogen_id` int(11) NOT NULL,
  `recource_id` int(11) NOT NULL,
  `oxogen_name` text NOT NULL,
  `number_validate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(155) NOT NULL,
  `mobile` text NOT NULL,
  `password` text NOT NULL,
  `Age` int(11) NOT NULL,
  `Oxygenation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `resource` (
  `recource_id` int(11) NOT NULL,
  `recource_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `bed`
  ADD CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`recource_id`) REFERENCES `resource` (`recource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`recource_id`) REFERENCES `resource` (`recource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `medicine`
  ADD CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`recource_id`) REFERENCES `resource` (`recource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `oxogen`
  ADD CONSTRAINT `oxogen_ibfk_1` FOREIGN KEY (`recource_id`) REFERENCES `resource` (`recource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

