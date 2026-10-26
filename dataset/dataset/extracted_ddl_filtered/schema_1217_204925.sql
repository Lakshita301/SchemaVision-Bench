-- Source: https://github.com/GrantArsenovich/Book/blob/d2160e0ec4c220bd5ea87673d1acd44b3646135f/library.sql?raw=true
-- Tables detected: 6 | FK constraints: 6

CREATE TABLE `arend` (
  `ArendId` int(30) UNSIGNED NOT NULL,
  `BookId` int(30) UNSIGNED NOT NULL,
  `DateGive` date NOT NULL,
  `DateGiveAway` date NOT NULL,
  `Reader_ticket` int(30) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `author` (
  `AuthorId` int(30) UNSIGNED NOT NULL,
  `AuthorName` varchar(100) NOT NULL,
  `popularity` int(30) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `book` (
  `BookId` int(30) UNSIGNED NOT NULL,
  `BookName` varchar(100) NOT NULL,
  `WritingYear` int(100) UNSIGNED NOT NULL,
  `AuthorId` int(30) UNSIGNED NOT NULL,
  `Quantity` int(30) UNSIGNED NOT NULL,
  `OblojkaId` int(30) UNSIGNED NOT NULL,
  `IzdatelstvoId` int(30) UNSIGNED NOT NULL,
  `IzdatelstvoYear` int(30) UNSIGNED NOT NULL,
  `Reader_ticket` int(30) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `izdatelstvo` (
  `IzdatelstvoId` int(30) UNSIGNED NOT NULL,
  `IzdatelstvoName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `oblojka` (
  `OblojkaId` int(30) UNSIGNED NOT NULL,
  `TypeOblojka` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `readers` (
  `Reader_ticket` int(10) UNSIGNED NOT NULL,
  `FIO` longtext NOT NULL,
  `Adress` longtext NOT NULL,
  `Number_Phone` bigint(11) UNSIGNED NOT NULL,
  `debt` int(30) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `arend`
  ADD CONSTRAINT `arend_ibfk_1` FOREIGN KEY (`BookId`) REFERENCES `book` (`BookId`),
  ADD CONSTRAINT `arend_ibfk_2` FOREIGN KEY (`Reader_ticket`) REFERENCES `readers` (`Reader_ticket`);

ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`AuthorId`) REFERENCES `author` (`AuthorId`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`OblojkaId`) REFERENCES `oblojka` (`OblojkaId`),
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`IzdatelstvoId`) REFERENCES `izdatelstvo` (`IzdatelstvoId`),
  ADD CONSTRAINT `book_ibfk_5` FOREIGN KEY (`Reader_ticket`) REFERENCES `readers` (`Reader_ticket`);

