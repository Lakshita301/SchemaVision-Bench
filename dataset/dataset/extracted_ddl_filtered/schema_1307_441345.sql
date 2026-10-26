-- Source: https://github.com/walidaous/gestion_etudians/blob/3751ae9e178243a7402e7930e409b43f47aff0c6/school1.sql?raw=true
-- Tables detected: 4 | FK constraints: 2

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `id_filiere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `id_classe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `filiere` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `usename` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `classe`
  ADD CONSTRAINT `fk_fl` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`code`);

ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`code`);

