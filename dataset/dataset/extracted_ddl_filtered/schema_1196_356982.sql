-- Source: https://github.com/Sabrina254/EmergencyResponseSystem/blob/94de97a99303c5d591beb666e8497793218c641d/db_files/emergency_response_rev12.sql?raw=true
-- Tables detected: 16 | FK constraints: 14

CREATE TABLE `emergency_categories` (
  `id_emergency_categories` int(11) NOT NULL,
  `emergency_categories_name` varchar(45) NOT NULL,
  `emergency_categories_description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fire_engine_information` (
  `id_fire_engine_information` int(11) NOT NULL,
  `fire_engine_information_identifier_number` varchar(45) DEFAULT NULL,
  `fire_engine_information_longitude` varchar(45) DEFAULT NULL,
  `fire_engine_information_latitude` varchar(45) DEFAULT NULL,
  `fire_engine_information_uname` varchar(45) NOT NULL,
  `fire_engine_information_email` varchar(45) NOT NULL,
  `fire_engine_information_pin` varchar(45) DEFAULT NULL,
  `status` varchar(7) DEFAULT NULL,
  `fire_station_information_id_fire_station_information` int(11) DEFAULT NULL,
  `isonline` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fire_rescue_report` (
  `id_fire_rescue_report` int(11) NOT NULL,
  `fire_rescue_report_status` varchar(45) DEFAULT NULL,
  `Moderator_i_id_Moderator_information` int(11) DEFAULT NULL,
  `Moderator_iec_id_emergency_categories` int(11) DEFAULT NULL,
  `Moderator_ila_id_level_assignment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fire_station_information` (
  `id_fire_station_information` int(11) NOT NULL,
  `fire_station_information_name` varchar(45) NOT NULL,
  `fire_station_information_longitude` varchar(45) NOT NULL,
  `fire_station_information_latitude` varchar(45) NOT NULL,
  `fire_station_information_identifier_number` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `general_rescue_report` (
  `id_general_rescue_report` int(11) NOT NULL,
  `general_rescue_report_status` varchar(45) DEFAULT NULL,
  `Mi_id_Moderator_information` int(11) DEFAULT NULL,
  `Miec_id_emergency_categories` int(11) DEFAULT NULL,
  `Mila_id_level_assignment` int(11) DEFAULT NULL,
  `rescueti_id_rescue_team_information` int(11) NOT NULL,
  `rtirsi_id_rescue_station_information` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `hospital_information` (
  `id_hospital_information` int(11) NOT NULL,
  `hospital_information_name` varchar(45) NOT NULL,
  `hospital_information_longitude` varchar(45) NOT NULL,
  `hospital_information_latitiude` varchar(45) NOT NULL,
  `hospital_information_available` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `level_assignment` (
  `id_level_assignment` int(11) NOT NULL,
  `level_assignment_name` varchar(45) NOT NULL,
  `level_assignment_description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `moderator_information` (
  `id_Moderator_information` int(11) NOT NULL,
  `Moderator_information_name` varchar(45) NOT NULL,
  `Moderator_information_phone` varchar(45) NOT NULL,
  `moderator_email` varchar(100) NOT NULL,
  `moderator_username` varchar(100) NOT NULL,
  `Moderator_information_pin` varchar(45) NOT NULL,
  `ec_id_emergency_categories` int(11) NOT NULL,
  `level_assignment_id_level_assignment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `paramedics_information` (
  `id_paramedics_information` int(11) NOT NULL,
  `paramedics_information_ambulance_number` varchar(10) DEFAULT NULL,
  `paramedics_information_available` tinyint(4) DEFAULT NULL,
  `paramedics_information_longitude` varchar(45) DEFAULT NULL,
  `paramedics_information_latitude` varchar(45) DEFAULT NULL,
  `paramedics_information_uname` varchar(45) NOT NULL,
  `paramedics_information_email` varchar(45) NOT NULL,
  `paramedics_information_pin` varchar(45) DEFAULT NULL,
  `status` varchar(7) DEFAULT NULL,
  `hospital_information_id_hospital_information` int(11) DEFAULT NULL,
  `isonline` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `paramedic_rescue_report` (
  `id_paramedic_rescue_report` int(11) NOT NULL,
  `paramedic_rescue_report_status` varchar(45) DEFAULT NULL,
  `id_Moderator_information` int(11) DEFAULT NULL,
  `id_emergency_categories` int(11) DEFAULT NULL,
  `Mila_id_level_assignment` int(11) DEFAULT NULL,
  `id_paramedics_information` int(11) NOT NULL,
  `hi_id_hospital_information` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rescue_station_information` (
  `id_rescue_station_information` int(11) NOT NULL,
  `rescue_station_information_name` varchar(45) NOT NULL,
  `rescue_station_information_longitude` varchar(45) NOT NULL,
  `rescue_station_information_latutude` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rescue_team_information` (
  `id_rescue_team_information` int(11) NOT NULL,
  `rescue_team_information_identifier_number` varchar(45) DEFAULT NULL,
  `rescue_team_information_uname` varchar(45) DEFAULT NULL,
  `rescue_team_information_email` varchar(45) DEFAULT NULL,
  `rescue_team_information_pin` varchar(45) DEFAULT NULL,
  `rescue_team_informationcol` varchar(45) DEFAULT NULL,
  `rescue_team_information_longitude` varchar(45) DEFAULT NULL,
  `rescue_team_information_latitude` varchar(45) DEFAULT NULL,
  `rescue_team_information_available` varchar(45) DEFAULT NULL,
  `status` varchar(7) DEFAULT NULL,
  `rescue_station_information_id_rescue_station_information` int(11) DEFAULT NULL,
  `isonline` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_information` (
  `id_user_information` int(11) NOT NULL,
  `user_information_name` varchar(45) NOT NULL,
  `user_information_phone_number` varchar(13) NOT NULL,
  `user_information_pin` varchar(45) NOT NULL,
  `user_state` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_request_fire` (
  `id_user_request` int(11) NOT NULL,
  `user_request_longitude` varchar(45) DEFAULT NULL,
  `user_request_latitude` varchar(45) DEFAULT NULL,
  `user_information_id_user_information` int(11) NOT NULL,
  `user_request_time_stamp` datetime DEFAULT NULL,
  `user_request_fire_status` varchar(45) DEFAULT NULL,
  `id_fire_engine_information` int(11) DEFAULT NULL,
  `fire_e_id_fire_station_information` int(11) DEFAULT NULL,
  `request_manual` varchar(4) NOT NULL,
  `request_details_manual` varchar(10000) DEFAULT NULL,
  `help_code` varchar(10) NOT NULL,
  `assigned` varchar(5) DEFAULT NULL,
  `complete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_request_paramedics` (
  `id_user_request` int(11) NOT NULL,
  `user_request_longitude` varchar(45) DEFAULT NULL,
  `user_request_latitude` varchar(45) DEFAULT NULL,
  `user_information_id_user_information` int(11) NOT NULL,
  `user_request_time_stamp` varchar(45) DEFAULT NULL,
  `id_paramedics_information` int(11) DEFAULT NULL,
  `request_manual` varchar(4) NOT NULL,
  `request_details_manual` varchar(10000) DEFAULT NULL,
  `help_code` varchar(10) NOT NULL,
  `assigned` varchar(5) DEFAULT NULL,
  `complete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_request_rescue` (
  `id_user_request` int(11) NOT NULL,
  `user_request_longitude` varchar(45) DEFAULT NULL,
  `user_request_latitude` varchar(45) DEFAULT NULL,
  `user_information_id_user_information` int(11) NOT NULL,
  `user_request_time_stamp` varchar(45) DEFAULT NULL,
  `user_request_rescue_status` varchar(45) DEFAULT NULL,
  `id_rescue_information` int(11) DEFAULT NULL,
  `request_manual` varchar(4) NOT NULL,
  `request_details_manual` varchar(10000) DEFAULT NULL,
  `help_code` varchar(10) NOT NULL,
  `assigned` varchar(5) DEFAULT NULL,
  `complete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `fire_engine_information`
  ADD CONSTRAINT `fk_fire_engine_information_fire_station_information1` FOREIGN KEY (`fire_station_information_id_fire_station_information`) REFERENCES `fire_station_information` (`id_fire_station_information`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `fire_rescue_report`
  ADD CONSTRAINT `fk_fire_rescue_report_Moderator_information1` FOREIGN KEY (`Moderator_i_id_Moderator_information`,`Moderator_iec_id_emergency_categories`,`Moderator_ila_id_level_assignment`) REFERENCES `moderator_information` (`id_Moderator_information`, `ec_id_emergency_categories`, `level_assignment_id_level_assignment`);

ALTER TABLE `general_rescue_report`
  ADD CONSTRAINT `fk_general_rescue_report_Moderator_information1` FOREIGN KEY (`Mi_id_Moderator_information`,`Miec_id_emergency_categories`,`Mila_id_level_assignment`) REFERENCES `moderator_information` (`id_Moderator_information`, `ec_id_emergency_categories`, `level_assignment_id_level_assignment`),
  ADD CONSTRAINT `fk_general_rescue_report_rescue_team_information1` FOREIGN KEY (`rescueti_id_rescue_team_information`) REFERENCES `rescue_team_information` (`id_rescue_team_information`);

ALTER TABLE `moderator_information`
  ADD CONSTRAINT `fk_Moderator_information_emergency_categories1` FOREIGN KEY (`ec_id_emergency_categories`) REFERENCES `emergency_categories` (`id_emergency_categories`),
  ADD CONSTRAINT `fk_Moderator_information_level_assignment1` FOREIGN KEY (`level_assignment_id_level_assignment`) REFERENCES `level_assignment` (`id_level_assignment`);

ALTER TABLE `paramedics_information`
  ADD CONSTRAINT `fk_paramedics_information_hospital_information1` FOREIGN KEY (`hospital_information_id_hospital_information`) REFERENCES `hospital_information` (`id_hospital_information`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `paramedic_rescue_report`
  ADD CONSTRAINT `fk_paramedic_rescue_report_Moderator_information1` FOREIGN KEY (`id_Moderator_information`,`id_emergency_categories`,`Mila_id_level_assignment`) REFERENCES `moderator_information` (`id_Moderator_information`, `ec_id_emergency_categories`, `level_assignment_id_level_assignment`),
  ADD CONSTRAINT `fk_paramedic_rescue_report_paramedics_information1` FOREIGN KEY (`id_paramedics_information`) REFERENCES `paramedics_information` (`id_paramedics_information`);

ALTER TABLE `rescue_team_information`
  ADD CONSTRAINT `fk_rescue_team_information_rescue_station_information1` FOREIGN KEY (`rescue_station_information_id_rescue_station_information`) REFERENCES `rescue_station_information` (`id_rescue_station_information`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `user_request_fire`
  ADD CONSTRAINT `fk_user_request_fire_fire_engine_information1` FOREIGN KEY (`id_fire_engine_information`) REFERENCES `fire_engine_information` (`id_fire_engine_information`),
  ADD CONSTRAINT `fk_user_request_user_information1` FOREIGN KEY (`user_information_id_user_information`) REFERENCES `user_information` (`id_user_information`);

ALTER TABLE `user_request_paramedics`
  ADD CONSTRAINT `fk_user_request_user_information11` FOREIGN KEY (`user_information_id_user_information`) REFERENCES `user_information` (`id_user_information`);

ALTER TABLE `user_request_rescue`
  ADD CONSTRAINT `fk_user_request_user_information10` FOREIGN KEY (`user_information_id_user_information`) REFERENCES `user_information` (`id_user_information`);

