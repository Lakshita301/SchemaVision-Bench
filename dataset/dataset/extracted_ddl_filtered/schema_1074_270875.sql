-- Source: https://github.com/AdrianE-Gonzalez/The_Tutors-Homes_Needs_Service_Project/blob/f423914b114c3f203ce1dace310f318417a0087f/Code/sql_code/Database_HNS.sql?raw=true
-- Tables detected: 10 | FK constraints: 9

CREATE TABLE `appointments` (
  `Appointment_ID` int(11) NOT NULL,
  `Client_ID` int(11) NOT NULL,
  `Servicer_ID` int(11) NOT NULL,
  `Special_Instructions` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Service` varchar(255) NOT NULL,
  `Address_Number` int(11) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Zip_Code` int(11) NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `clients` (
  `Client_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `payments` (
  `Payment_ID` int(11) NOT NULL,
  `Client_ID` int(11) NOT NULL,
  `Servicer_ID` int(11) NOT NULL,
  `Service` varchar(255) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `providesservice` (
  `ID` int(11) NOT NULL,
  `Servicer_ID` int(11) NOT NULL,
  `Service` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `reviews` (
  `Review_ID` int(11) NOT NULL,
  `Client_ID` int(11) NOT NULL,
  `Servicer_ID` int(11) NOT NULL,
  `Written_Review` varchar(255) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Service` varchar(255) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `servicers` (
  `Servicer_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Distance_From_Address` int(11) NOT NULL,
  `Average_Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `services` (
  `Service_ID` int(11) NOT NULL,
  `Service` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sessiontimeout` (
  `Timeout` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Phone_Number` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Address_Number` int(11) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Zip_Code` int(11) NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Driver_License_Number` varchar(255) NOT NULL,
  `Driver_License_Picture` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `usersession` (
  `User_ID` int(11) NOT NULL,
  `Session_ID` int(11) NOT NULL,
  `Session_Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Session_IP` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`Client_ID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`Servicer_ID`) REFERENCES `servicers` (`Servicer_ID`);

ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`Client_ID`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`Servicer_ID`) REFERENCES `servicers` (`Servicer_ID`);

ALTER TABLE `providesservice`
  ADD CONSTRAINT `providesservice_ibfk_1` FOREIGN KEY (`Servicer_ID`) REFERENCES `servicers` (`Servicer_ID`);

ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`Client_ID`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Servicer_ID`) REFERENCES `servicers` (`Servicer_ID`);

ALTER TABLE `servicers`
  ADD CONSTRAINT `servicers_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

