-- Source: https://github.com/Alvi4142/CSE327/blob/1f2a134ffd57c82b7b543aad39a41ce1cbf669f5/medlink.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 2

CREATE TABLE `blog` (
  `user_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `user_experience` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `doc_info` (
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(1111) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `chamber1` varchar(50) NOT NULL,
  `chamber2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `medicine` (
  `med_id` int(11) NOT NULL,
  `med_name` varchar(11111) NOT NULL,
  `generic_name` varchar(100) NOT NULL,
  `alternative_brands` varchar(100) DEFAULT NULL,
  `side_effects` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `prescription` (
  `doc_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `consultation_date` date NOT NULL,
  `details` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `address_details` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `user_info` (`user_id`);

