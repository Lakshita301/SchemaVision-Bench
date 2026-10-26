-- Source: https://github.com/Parrysidhu/Cloud-Computing/blob/764d10ca19f07cd8a3c0f5fe8464d2da1affe311/COVID_19_Home_Care_Kit/COVID-19-Home-Care-Kit-Implementations/covid.sql?raw=true
-- Tables detected: 4 | FK constraints: 1

CREATE TABLE `area` (
  `a_id` int(10) NOT NULL,
  `a_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `assistant` (
  `asid` int(10) NOT NULL,
  `aname` varchar(30) NOT NULL,
  `apassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patients` (
  `patients_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patients_add` varchar(100) NOT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `temp` float DEFAULT NULL,
  `bpm` float DEFAULT NULL,
  `blood oxygen` int(11) DEFAULT NULL,
  `a_id` int(11) NOT NULL,
  `Date-Time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `upassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `area` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

