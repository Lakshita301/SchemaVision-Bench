-- Source: https://github.com/CLR60/Statistics-password/blob/878724c7ecc8bb895152089fd66e4ad0a8bc253b/Projet_Stage/project_leak.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

CREATE TABLE `email` (
  `id_email` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `password` (
  `password` varchar(255) NOT NULL,
  `using_site` varchar(255) DEFAULT NULL,
  `id_email` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `name_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `role_user` varchar(1) NOT NULL DEFAULT 'u',
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `password`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`id_email`) REFERENCES `email` (`id_email`) ON DELETE CASCADE;

