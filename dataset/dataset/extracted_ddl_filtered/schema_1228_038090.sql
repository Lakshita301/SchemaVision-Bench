-- Source: https://github.com/Es-Di-Bee/Online-Mechanic-Appointment-System/blob/46236ac45d9ad8463e0ec78aabbdbedf0ce1706a/Car_service-main/Database/car_service.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `mechanic_id` int(11) NOT NULL,
  `Time_from` time NOT NULL,
  `Time_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `mechanics` (
  `mechanic_id` int(11) NOT NULL,
  `mechanic_name` varchar(255) NOT NULL,
  `mech_username` varchar(255) NOT NULL,
  `mech_password` varchar(255) NOT NULL,
  `mech_speacility` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `mechanics_schedule` (
  `schedule_ID` int(11) NOT NULL,
  `mechanic_id` int(30) NOT NULL,
  `day` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `Appoint_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` int(25) NOT NULL,
  `car_license_no` varchar(255) NOT NULL,
  `car_engine_no` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`mechanic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `mechanics_schedule`
  ADD CONSTRAINT `mechanics_schedule_ibfk_1` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`mechanic_id`);

