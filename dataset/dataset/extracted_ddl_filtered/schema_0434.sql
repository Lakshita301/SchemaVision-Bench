-- Source: https://github.com/anton-itscript/WM/blob/444292157c4bc8144d3baffdbd77940cb13c29b8/application/www/files/install/long_db.sql?raw=true
-- Tables detected: 30 | FK/REFERENCES mentions: 22

CREATE TABLE `calculation_handler` (
  `handler_id` tinyint(4) NOT NULL DEFAULT '0',
  `handler_id_code` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `metric_id` tinyint(4) NOT NULL,
  `default_prefix` varchar(2) NOT NULL,
  `aws_panel_display_position` tinyint(4) NOT NULL DEFAULT '0',
  `aws_panel_show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`handler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ex_schedule_report` (
  `ex_schedule_id` int(11) NOT NULL,
  `station_type` varchar(255) NOT NULL,
  `report_type` varchar(50) NOT NULL DEFAULT 'synop' COMMENT 'synop, bufr',
  `period` smallint(6) NOT NULL DEFAULT '60' COMMENT 'in minutes',
  `report_format` varchar(20) NOT NULL DEFAULT 'csv' COMMENT 'txt, csv',
  `start_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_run_planned` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `ex_schedule_ident` varchar(255) DEFAULT NULL,
  `generation_delay` int(11) DEFAULT '0',
  `aging_time_delay` int(11) DEFAULT '10',
  `active` int(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ex_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ex_schedule_report_destination` (
  `ex_schedule_destination_id` int(11) NOT NULL,
  `ex_schedule_id` int(11) NOT NULL,
  `method` varchar(20) NOT NULL DEFAULT 'mail',
  `destination_email` varchar(255) NOT NULL,
  `destination_local_folder` varchar(255) NOT NULL,
  `destination_ip` varchar(15) NOT NULL,
  `destination_ip_port` smallint(5) NOT NULL DEFAULT '21',
  `destination_ip_folder` varchar(255) NOT NULL DEFAULT '',
  `destination_ip_user` varchar(255) NOT NULL,
  `destination_ip_password` varchar(255) NOT NULL,
  PRIMARY KEY (`ex_schedule_destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ex_schedule_report_processed` (
  `ex_schedule_processed_id` int(11) NOT NULL,
  `ex_schedule_id` int(11) NOT NULL,
  `is_synchronized` int(1) DEFAULT '0',
  `aging_time` int(50) DEFAULT NULL,
  `current_role` varchar(255) NOT NULL DEFAULT 'none',
  `check_period_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_period_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ex_schedule_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ex_schedule_send_log` (
  `ex_schedulte_send_log_id` int(11) NOT NULL,
  `ex_schedule_processed_id` int(11) NOT NULL,
  `ex_schedule_destination_id` int(11) NOT NULL,
  `sent` int(1) DEFAULT '0',
  `send_logs` longblob,
  `updated` timestamp NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ex_schedulte_send_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `listener` (
  `listener_id` int(11) NOT NULL DEFAULT '0',
  `process_pid` mediumint(9) unsigned DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `started` int(11) DEFAULT NULL,
  `stopped` int(11) DEFAULT NULL,
  `connection_result_code` varchar(20) DEFAULT NULL,
  `connection_result_description` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `additional_param` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`listener_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `listener_log` (
  `log_id` int(11) NOT NULL DEFAULT '0',
  `listener_id` int(11) DEFAULT NULL,
  `message` text,
  `station_type` varchar(10) DEFAULT NULL,
  `station_id` smallint(6) DEFAULT NULL,
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_processed` tinyint(1) DEFAULT NULL,
  `is_processing` tinyint(1) DEFAULT NULL,
  `is_last` tinyint(1) DEFAULT NULL,
  `is_actual` tinyint(1) DEFAULT NULL,
  `rewrite_prev_values` tinyint(1) DEFAULT NULL,
  `source` varchar(15) DEFAULT NULL,
  `source_info` varchar(30) DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `fail_description` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `listener_id` (`listener_id`),
  KEY `listener_log__last_station_failed` (`is_last`,`station_id`,`failed`),
  KEY `listener_log__measuring_timestamp` (`measuring_timestamp`),
  KEY `listener_log__is_indexes` (`is_actual`,`is_last`,`is_processed`,`is_processing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `listener_log_process_error` (
  `process_error_id` int(11) NOT NULL DEFAULT '0',
  `log_id` int(11) DEFAULT NULL,
  `type` enum('error','warning') DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`process_error_id`),
  KEY `log_id` (`log_id`),
  CONSTRAINT `listener_log_process_errors_fk` FOREIGN KEY (`log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `listener_process` (
  `listener_process_id` int(11) NOT NULL DEFAULT '0',
  `listener_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `comment` text,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`listener_process_id`),
  KEY `listener_id` (`listener_id`),
  CONSTRAINT `listener_process_fk` FOREIGN KEY (`listener_id`) REFERENCES `listener` (`listener_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `refbook_measurement_type` (
  `measurement_type_id` tinyint(4) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ord` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`measurement_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `refbook_measurement_type_metric` (
  `measurement_type_metric_id` smallint(6) NOT NULL DEFAULT '0',
  `measurement_type_id` tinyint(4) DEFAULT NULL,
  `metric_id` tinyint(4) DEFAULT NULL,
  `is_main` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`measurement_type_metric_id`),
  KEY `measurement_type_id` (`measurement_type_id`),
  KEY `metric_id` (`metric_id`),
  CONSTRAINT `refbook_measurement_type_metric_fk` FOREIGN KEY (`measurement_type_id`) REFERENCES `refbook_measurement_type` (`measurement_type_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `refbook_measurement_type_metric_fk1` FOREIGN KEY (`metric_id`) REFERENCES `refbook_metric` (`metric_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `refbook_metric` (
  `metric_id` tinyint(4) NOT NULL DEFAULT '0',
  `html_code` varchar(50) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`metric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schedule_report` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` varchar(50) NOT NULL DEFAULT 'synop' COMMENT 'synop, bufr',
  `station_id` smallint(6) NOT NULL,
  `period` smallint(6) NOT NULL DEFAULT '60' COMMENT 'in minutes',
  `report_format` varchar(20) NOT NULL DEFAULT 'csv' COMMENT 'txt, csv',
  `last_scheduled_run_fact` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_scheduled_run_planned` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `send_like_attach` int(1) DEFAULT '1',
  `send_email_together` int(1) DEFAULT '0',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

CREATE TABLE `schedule_report_destination` (
  `schedule_destination_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `method` varchar(20) NOT NULL DEFAULT 'mail',
  `destination_email` varchar(255) NOT NULL,
  `destination_local_folder` varchar(255) NOT NULL,
  `destination_ip` varchar(15) NOT NULL,
  `destination_ip_port` smallint(5) NOT NULL DEFAULT '21',
  `destination_ip_folder` varchar(255) NOT NULL DEFAULT '/',
  `destination_ip_user` varchar(255) NOT NULL,
  `destination_ip_password` varchar(255) NOT NULL,
  PRIMARY KEY (`schedule_destination_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `schedule_report_destination_fk` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_report` (`schedule_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schedule_report_processed` (
  `schedule_processed_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_to_s_id` int(11) NOT NULL,
  `check_period_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_period_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `listener_log_id` int(11) NOT NULL,
  `listener_log_ids` text NOT NULL,
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `serialized_report_errors` text NOT NULL,
  `serialized_report_explanations` text NOT NULL,
  `is_last` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`schedule_processed_id`),
  KEY `listener_log_id` (`listener_log_id`),
  KEY `sch_rep_processed__is_indexes` (`is_last`,`is_processed`),
  KEY `sch_rep_processed__created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=70608 DEFAULT CHARSET=utf8;

CREATE TABLE `schedule_report_to_station` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `station_id` smallint(7) NOT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sensor_data` (
  `sensor_data_id` int(11) NOT NULL DEFAULT '0',
  `station_id` smallint(6) DEFAULT NULL,
  `sensor_id` int(11) DEFAULT NULL,
  `sensor_feature_id` int(11) DEFAULT NULL,
  `sensor_feature_value` tinytext,
  `is_m` enum('1','0') DEFAULT NULL,
  `metric_id` tinyint(4) DEFAULT NULL,
  `sensor_feature_normalized_value` decimal(15,4) DEFAULT NULL,
  `sensor_feature_exp_value` smallint(6) DEFAULT NULL,
  `period` smallint(6) DEFAULT NULL,
  `listener_log_id` int(11) DEFAULT NULL,
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sensor_data_id`),
  KEY `sensor_feature_id` (`sensor_feature_id`),
  KEY `listener_log_id` (`listener_log_id`),
  KEY `sensor_data_sensor_id_index` (`sensor_id`),
  KEY `sensor_data_station_id_index` (`station_id`),
  KEY `sensor_data__feature_measuuring_index` (`sensor_feature_id`,`measuring_timestamp`,`is_m`),
  KEY `sensor_data__log_feature_index` (`listener_log_id`,`sensor_feature_id`,`measuring_timestamp`),
  KEY `sensor_data__measuring_timestamp` (`measuring_timestamp`),
  CONSTRAINT `sensor_data_fk` FOREIGN KEY (`sensor_feature_id`) REFERENCES `station_sensor_feature` (`sensor_feature_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `sensor_data_fk1` FOREIGN KEY (`listener_log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sensor_data_minute` (
  `sensor_data_id` int(11) NOT NULL DEFAULT '0',
  `sensor_id` int(11) DEFAULT NULL,
  `station_id` smallint(6) DEFAULT NULL,
  `sensor_value` smallint(6) DEFAULT NULL,
  `metric_id` tinyint(4) DEFAULT NULL,
  `sensor_feature_normalized_value` int(11) DEFAULT NULL,
  `5min_sum` smallint(6) DEFAULT NULL,
  `10min_sum` smallint(6) DEFAULT NULL,
  `20min_sum` smallint(6) DEFAULT NULL,
  `30min_sum` smallint(6) DEFAULT NULL,
  `60min_sum` smallint(6) DEFAULT NULL,
  `1day_sum` mediumint(9) DEFAULT NULL,
  `bucket_size` decimal(11,2) DEFAULT NULL,
  `listener_log_id` int(11) DEFAULT NULL,
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `battery_voltage` decimal(11,2) DEFAULT NULL,
  `is_tmp` tinyint(1) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sensor_data_id`),
  KEY `listener_log_id` (`listener_log_id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `sensor_data_minute_fk` FOREIGN KEY (`listener_log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `sensor_data_minute_fk1` FOREIGN KEY (`sensor_id`) REFERENCES `station_sensor` (`station_sensor_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sensor_handler` (
  `handler_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `handler_id_code` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `handler_default_display_name` varchar(255) DEFAULT NULL,
  `default_prefix` varchar(2) NOT NULL,
  `aws_panel_display_position` tinyint(4) NOT NULL,
  `aws_panel_show` tinyint(1) NOT NULL DEFAULT '0',
  `aws_single_display_position` tinyint(4) NOT NULL DEFAULT '0',
  `aws_single_group` varchar(255) NOT NULL,
  `aws_station_uses` tinyint(1) NOT NULL DEFAULT '0',
  `rain_station_uses` tinyint(1) NOT NULL DEFAULT '0',
  `awa_station_uses` tinyint(1) NOT NULL DEFAULT '0',
  `flags` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Bit flags',
  `start_time` tinyint(2) NOT NULL DEFAULT '-1',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`handler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `sensor_handler_default_feature` (
  `handler_feature_id` int(11) NOT NULL DEFAULT '0',
  `handler_id` tinyint(4) DEFAULT NULL,
  `feature_code` varchar(50) DEFAULT NULL,
  `aws_panel_show` tinyint(1) NOT NULL DEFAULT '0',
  `feature_constant_value` decimal(11,3) DEFAULT NULL,
  `metric_id` tinyint(4) DEFAULT NULL,
  `filter_max` decimal(11,2) DEFAULT NULL,
  `filter_min` decimal(11,2) DEFAULT NULL,
  `filter_diff` decimal(11,2) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`handler_feature_id`),
  KEY `handler_id` (`handler_id`),
  CONSTRAINT `sensor_handler_default_feature_fk` FOREIGN KEY (`handler_id`) REFERENCES `sensor_handler` (`handler_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sensor_sea_level_trend` (
  `trend_id` int(11) NOT NULL DEFAULT '0',
  `log_id` int(11) DEFAULT NULL,
  `sensor_id` int(11) DEFAULT NULL,
  `trend` varchar(20) DEFAULT NULL,
  `is_significant` enum('0','1') DEFAULT NULL,
  `last_high` decimal(15,4) DEFAULT NULL,
  `last_high_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_low` decimal(15,4) DEFAULT NULL,
  `last_low_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `measuring_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`trend_id`),
  KEY `sensor_sea_level_trend_fk` (`log_id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `sensor_sea_level_trend_fk` FOREIGN KEY (`log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `sensor_sea_level_trend_fk1` FOREIGN KEY (`sensor_id`) REFERENCES `station_sensor` (`station_sensor_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `station` (
  `station_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL,
  `station_id_code` varchar(5) NOT NULL,
  `station_number` varchar(3) NOT NULL,
  `station_type` enum('rain','aws','awos') NOT NULL DEFAULT 'rain',
  `logger_type` enum('DLM11','DLM13M') NOT NULL DEFAULT 'DLM11' COMMENT 'Data logger type',
  `communication_type` enum('direct','sms','tcpip','gprs','server') NOT NULL DEFAULT 'direct',
  `communication_port` varchar(5) NOT NULL,
  `communication_esp_ip` varchar(15) NOT NULL DEFAULT '',
  `communication_esp_port` int(11) NOT NULL DEFAULT '0',
  `details` text,
  `status_message_period` smallint(6) NOT NULL DEFAULT '60' COMMENT 'minutes',
  `event_message_period` smallint(6) NOT NULL DEFAULT '10' COMMENT 'minutes',
  `timezone_id` varchar(255) NOT NULL DEFAULT 'UTC',
  `timezone_offset` varchar(20) NOT NULL,
  `wmo_block_number` varchar(3) DEFAULT NULL,
  `wmo_member_state_id` varchar(3) DEFAULT NULL,
  `wmo_station_number` int(11) NOT NULL DEFAULT '0',
  `wmo_originating_centre` int(11) NOT NULL DEFAULT '202',
  `national_aws_number` int(11) DEFAULT '0',
  `lat` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `lng` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `altitude` int(9) NOT NULL DEFAULT '0',
  `magnetic_north_offset` tinyint(3) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `awos_msg_source_folder` text CHARACTER SET ucs2 NOT NULL,
  `icao_code` varchar(4) DEFAULT NULL COMMENT 'ICAO code. Station name for METAR/SPECI reports.',
  `phone_number` tinytext COMMENT 'Phone number of modem for reset by SMS',
  `sms_message` tinytext COMMENT 'Reset message for modem',
  `station_gravity` decimal(20,10) DEFAULT '0.0000000000',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `color` varchar(255) DEFAULT NULL,
  `aws_format` int(10) DEFAULT 1,
  PRIMARY KEY (`station_id`),
  KEY `i_station__type` (`station_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `station_calculation` (
  `calculation_id` int(11) NOT NULL DEFAULT '0',
  `station_id` smallint(6) DEFAULT NULL,
  `handler_id` tinyint(4) DEFAULT NULL,
  `formula` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`calculation_id`),
  KEY `station_id` (`station_id`),
  KEY `handler_id` (`handler_id`),
  CONSTRAINT `station_calculation_fk` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `station_calculation_fk1` FOREIGN KEY (`handler_id`) REFERENCES `calculation_handler` (`handler_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `station_calculation_data` (
  `calculation_data_id` int(11) NOT NULL DEFAULT '0',
  `calculation_id` int(11) DEFAULT NULL,
  `listener_log_id` int(11) DEFAULT NULL,
  `value` decimal(15,4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`calculation_data_id`),
  KEY `calculation_id` (`calculation_id`),
  KEY `listener_log_id` (`listener_log_id`),
  CONSTRAINT `station_calculation_data_fk` FOREIGN KEY (`calculation_id`) REFERENCES `station_calculation` (`calculation_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `station_calculation_data_fk1` FOREIGN KEY (`listener_log_id`) REFERENCES `listener_log` (`log_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `station_calculation_variable` (
  `calculation_variable_id` int(11) NOT NULL DEFAULT '0',
  `calculation_id` int(11) DEFAULT NULL,
  `variable_name` varchar(20) DEFAULT NULL,
  `sensor_feature_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`calculation_variable_id`),
  KEY `calculation_id` (`calculation_id`),
  KEY `fk_station_cal_var__sensor_feature_id` (`sensor_feature_id`),
  CONSTRAINT `fk_station_cal_var__sensor_feature_id` FOREIGN KEY (`sensor_feature_id`) REFERENCES `station_sensor_feature` (`sensor_feature_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `station_calculation_variable_fk` FOREIGN KEY (`calculation_id`) REFERENCES `station_calculation` (`calculation_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `station_sensor` (
  `station_sensor_id` int(11) NOT NULL DEFAULT '0',
  `station_id` smallint(6) DEFAULT NULL,
  `sensor_id_code` varchar(3) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `handler_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`station_sensor_id`),
  KEY `station_id` (`station_id`),
  KEY `handler_id` (`handler_id`),
  CONSTRAINT `station_sensor_fk` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `station_sensor_feature` (
  `sensor_feature_id` int(11) NOT NULL DEFAULT '0',
  `sensor_id` int(11) DEFAULT NULL,
  `feature_code` varchar(50) DEFAULT NULL,
  `feature_display_name` varchar(255) DEFAULT NULL,
  `feature_constant_value` decimal(11,3) DEFAULT NULL,
  `measurement_type_code` varchar(50) DEFAULT NULL,
  `metric_id` tinyint(4) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT NULL,
  `filter_max` decimal(11,2) DEFAULT NULL,
  `filter_min` decimal(11,2) DEFAULT NULL,
  `filter_diff` decimal(11,2) DEFAULT NULL,
  `has_filters` tinyint(1) DEFAULT NULL,
  `has_filter_min` tinyint(1) DEFAULT NULL,
  `has_filter_max` tinyint(1) DEFAULT NULL,
  `has_filter_diff` tinyint(1) DEFAULT NULL,
  `is_constant` tinyint(1) DEFAULT NULL,
  `is_cumulative` tinyint(1) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sensor_feature_id`),
  KEY `sensor_id` (`sensor_id`),
  KEY `metric_id` (`metric_id`),
  KEY `sensor_feature__id_code_index` (`sensor_id`,`feature_code`),
  CONSTRAINT `station_sensor_feature_fk` FOREIGN KEY (`sensor_id`) REFERENCES `station_sensor` (`station_sensor_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_forwarded_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL COMMENT 'Id of message in listener_log',
  `client_id` int(10) unsigned NOT NULL COMMENT 'Id of message forwarding info',
  `status` enum('new','sent') NOT NULL DEFAULT 'new',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `i_forwarded_message__status` (`status`),
  KEY `fk_forwarded_message__log_id` (`message_id`),
  KEY `fk_forwarded_message__client_id` (`client_id`),
  CONSTRAINT `fk_forwarded_message__client_id` FOREIGN KEY (`client_id`) REFERENCES `tbl_message_forwarding_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_forwarded_message__log_id` FOREIGN KEY (`message_id`) REFERENCES `listener_log` (`log_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table with info about forwarded messages';

CREATE TABLE `tbl_message_forwarding_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL COMMENT 'Connection source string',
  `description` text COMMENT 'Description of forward info',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Provides info about WMs for message forwarding.';

CREATE TABLE `xml_process_log` (
  `xml_log_id` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`xml_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

