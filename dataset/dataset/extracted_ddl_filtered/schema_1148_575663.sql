-- Source: https://github.com/Davi-o/projeto-final-web/blob/59316990e26a8254dbed4c6a0480bcd0fa3c4f17/db_files/agenda.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `type` varchar(4) NOT NULL DEFAULT 'cpf',
  `document` varchar(15) NOT NULL,
  `birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `person_address` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `postal_code` varchar(30) NOT NULL,
  `address` varchar(150) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `complement` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `person_contact` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `person_address`
  ADD CONSTRAINT `person_address_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

ALTER TABLE `person_contact`
  ADD CONSTRAINT `person_contact_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

