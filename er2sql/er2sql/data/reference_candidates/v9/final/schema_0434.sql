-- Source: https://github.com/anton-itscript/WM/blob/444292157c4bc8144d3baffdbd77940cb13c29b8/application/www/files/install/long_db.sql?raw=true
-- Tables detected: 30 | FK/REFERENCES mentions: 22
CREATE TABLE calculation_handler (
    handler_id SMALLINT NOT NULL DEFAULT '0',
    handler_id_code varchar(255) DEFAULT NULL,
    display_name varchar(255) DEFAULT NULL,
    metric_id SMALLINT NOT NULL,
    default_prefix varchar(2) NOT NULL,
    aws_panel_display_position SMALLINT NOT NULL DEFAULT '0',
    aws_panel_show SMALLINT NOT NULL DEFAULT '0',
    PRIMARY KEY (handler_id)
);

CREATE TABLE ex_schedule_report (
    ex_schedule_id int NOT NULL,
    station_type varchar(255) NOT NULL,
    report_type varchar(50) NOT NULL DEFAULT 'synop',
    period smallint NOT NULL DEFAULT '60',
    report_format varchar(20) NOT NULL DEFAULT 'csv',
    start_datetime timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    next_run_planned timestamp NULL DEFAULT '0000-00-00 00:00:00',
    ex_schedule_ident varchar(255) DEFAULT NULL,
    generation_delay int DEFAULT '0',
    aging_time_delay int DEFAULT '10',
    active int DEFAULT '1',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (ex_schedule_id)
);

CREATE TABLE ex_schedule_report_destination (
    ex_schedule_destination_id int NOT NULL,
    ex_schedule_id int NOT NULL,
    method varchar(20) NOT NULL DEFAULT 'mail',
    destination_email varchar(255) NOT NULL,
    destination_local_folder varchar(255) NOT NULL,
    destination_ip varchar(15) NOT NULL,
    destination_ip_port smallint NOT NULL DEFAULT '21',
    destination_ip_folder varchar(255) NOT NULL DEFAULT '',
    destination_ip_user varchar(255) NOT NULL,
    destination_ip_password varchar(255) NOT NULL,
    PRIMARY KEY (ex_schedule_destination_id)
);

CREATE TABLE ex_schedule_report_processed (
    ex_schedule_processed_id int NOT NULL,
    ex_schedule_id int NOT NULL,
    is_synchronized int DEFAULT '0',
    aging_time int DEFAULT NULL,
    "current_role" varchar(255) NOT NULL DEFAULT 'none',
    check_period_start timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    check_period_end timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (ex_schedule_processed_id)
);

CREATE TABLE ex_schedule_send_log (
    ex_schedulte_send_log_id int NOT NULL,
    ex_schedule_processed_id int NOT NULL,
    ex_schedule_destination_id int NOT NULL,
    sent int DEFAULT '0',
    send_logs BYTEA,
    updated timestamp NULL DEFAULT NULL,
    created timestamp NULL DEFAULT NULL,
    PRIMARY KEY (ex_schedulte_send_log_id)
);

CREATE TABLE listener (
    listener_id int NOT NULL DEFAULT '0',
    process_pid INTEGER DEFAULT NULL,
    source varchar(50) DEFAULT NULL,
    started int DEFAULT NULL,
    stopped int DEFAULT NULL,
    connection_result_code varchar(20) DEFAULT NULL,
    connection_result_description varchar(255) DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    additional_param varchar(255) DEFAULT NULL,
    PRIMARY KEY (listener_id)
);

CREATE TABLE listener_log (
    log_id int NOT NULL DEFAULT '0',
    listener_id int DEFAULT NULL,
    message text,
    station_type varchar(10) DEFAULT NULL,
    station_id smallint DEFAULT NULL,
    measuring_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    is_processed SMALLINT DEFAULT NULL,
    is_processing SMALLINT DEFAULT NULL,
    is_last SMALLINT DEFAULT NULL,
    is_actual SMALLINT DEFAULT NULL,
    rewrite_prev_values SMALLINT DEFAULT NULL,
    source varchar(15) DEFAULT NULL,
    source_info varchar(30) DEFAULT NULL,
    failed SMALLINT DEFAULT NULL,
    fail_description varchar(255) DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (log_id)
);

CREATE TABLE listener_log_process_error (
    process_error_id int NOT NULL DEFAULT '0',
    log_id int DEFAULT NULL,
    type TEXT DEFAULT NULL CHECK (type IN ('error', 'warning')),
    code varchar(255) DEFAULT NULL,
    description text,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (process_error_id)
);

CREATE TABLE listener_process (
    listener_process_id int NOT NULL DEFAULT '0',
    listener_id int DEFAULT NULL,
    status varchar(255) DEFAULT NULL,
    comment text,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (listener_process_id)
);

CREATE TABLE refbook_measurement_type (
    measurement_type_id SMALLINT NOT NULL DEFAULT '0',
    display_name varchar(255) DEFAULT NULL,
    code varchar(50) DEFAULT NULL,
    ord SMALLINT DEFAULT NULL,
    PRIMARY KEY (measurement_type_id)
);

CREATE TABLE refbook_measurement_type_metric (
    measurement_type_metric_id smallint NOT NULL DEFAULT '0',
    measurement_type_id SMALLINT DEFAULT NULL,
    metric_id SMALLINT DEFAULT NULL,
    is_main SMALLINT DEFAULT NULL,
    PRIMARY KEY (measurement_type_metric_id)
);

CREATE TABLE refbook_metric (
    metric_id SMALLINT NOT NULL DEFAULT '0',
    html_code varchar(50) DEFAULT NULL,
    short_name varchar(10) DEFAULT NULL,
    full_name varchar(255) DEFAULT NULL,
    code varchar(30) DEFAULT NULL,
    PRIMARY KEY (metric_id)
);

CREATE TABLE schedule_report (
    schedule_id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    report_type varchar(50) NOT NULL DEFAULT 'synop',
    station_id smallint NOT NULL,
    period smallint NOT NULL DEFAULT '60',
    report_format varchar(20) NOT NULL DEFAULT 'csv',
    last_scheduled_run_fact timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    last_scheduled_run_planned timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    send_like_attach int DEFAULT '1',
    send_email_together int DEFAULT '0',
    PRIMARY KEY (schedule_id)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

CREATE TABLE schedule_report_destination (
    schedule_destination_id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    schedule_id int NOT NULL,
    method varchar(20) NOT NULL DEFAULT 'mail',
    destination_email varchar(255) NOT NULL,
    destination_local_folder varchar(255) NOT NULL,
    destination_ip varchar(15) NOT NULL,
    destination_ip_port smallint NOT NULL DEFAULT '21',
    destination_ip_folder varchar(255) NOT NULL DEFAULT '/',
    destination_ip_user varchar(255) NOT NULL,
    destination_ip_password varchar(255) NOT NULL,
    PRIMARY KEY (schedule_destination_id)
);

CREATE TABLE schedule_report_processed (
    schedule_processed_id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    sr_to_s_id int NOT NULL,
    check_period_start timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    check_period_end timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    listener_log_id int NOT NULL,
    listener_log_ids text NOT NULL,
    is_processed SMALLINT NOT NULL DEFAULT '0',
    serialized_report_errors text NOT NULL,
    serialized_report_explanations text NOT NULL,
    is_last SMALLINT NOT NULL DEFAULT '0',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (schedule_processed_id)
) ENGINE=InnoDB AUTO_INCREMENT=70608 DEFAULT CHARSET=utf8;

CREATE TABLE schedule_report_to_station (
    id int NOT NULL,
    schedule_id int NOT NULL,
    station_id smallint NOT NULL,
    updated timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    created timestamp NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (id)
);

CREATE TABLE sensor_data (
    sensor_data_id int NOT NULL DEFAULT '0',
    station_id smallint DEFAULT NULL,
    sensor_id int DEFAULT NULL,
    sensor_feature_id int DEFAULT NULL,
    sensor_feature_value TEXT,
    is_m TEXT DEFAULT NULL CHECK (is_m IN ('1', '0')),
    metric_id SMALLINT DEFAULT NULL,
    sensor_feature_normalized_value decimal(15,4) DEFAULT NULL,
    sensor_feature_exp_value smallint DEFAULT NULL,
    period smallint DEFAULT NULL,
    listener_log_id int DEFAULT NULL,
    measuring_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (sensor_data_id)
);

CREATE TABLE sensor_data_minute (
    sensor_data_id int NOT NULL DEFAULT '0',
    sensor_id int DEFAULT NULL,
    station_id smallint DEFAULT NULL,
    sensor_value smallint DEFAULT NULL,
    metric_id SMALLINT DEFAULT NULL,
    sensor_feature_normalized_value int DEFAULT NULL,
    "5min_sum" smallint DEFAULT NULL,
    "10min_sum" smallint DEFAULT NULL,
    "20min_sum" smallint DEFAULT NULL,
    "30min_sum" smallint DEFAULT NULL,
    "60min_sum" smallint DEFAULT NULL,
    "1day_sum" INTEGER DEFAULT NULL,
    bucket_size decimal(11,2) DEFAULT NULL,
    listener_log_id int DEFAULT NULL,
    measuring_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    battery_voltage decimal(11,2) DEFAULT NULL,
    is_tmp SMALLINT DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (sensor_data_id)
);

CREATE TABLE sensor_handler (
    handler_id SMALLINT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    handler_id_code varchar(255) NOT NULL,
    display_name varchar(255) NOT NULL,
    handler_default_display_name varchar(255) DEFAULT NULL,
    default_prefix varchar(2) NOT NULL,
    aws_panel_display_position SMALLINT NOT NULL,
    aws_panel_show SMALLINT NOT NULL DEFAULT '0',
    aws_single_display_position SMALLINT NOT NULL DEFAULT '0',
    aws_single_group varchar(255) NOT NULL,
    aws_station_uses SMALLINT NOT NULL DEFAULT '0',
    rain_station_uses SMALLINT NOT NULL DEFAULT '0',
    awa_station_uses SMALLINT NOT NULL DEFAULT '0',
    flags bigint NOT NULL DEFAULT '0',
    start_time SMALLINT NOT NULL DEFAULT '-1',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (handler_id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE sensor_handler_default_feature (
    handler_feature_id int NOT NULL DEFAULT '0',
    handler_id SMALLINT DEFAULT NULL,
    feature_code varchar(50) DEFAULT NULL,
    aws_panel_show SMALLINT NOT NULL DEFAULT '0',
    feature_constant_value decimal(11,3) DEFAULT NULL,
    metric_id SMALLINT DEFAULT NULL,
    filter_max decimal(11,2) DEFAULT NULL,
    filter_min decimal(11,2) DEFAULT NULL,
    filter_diff decimal(11,2) DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (handler_feature_id)
);

CREATE TABLE sensor_sea_level_trend (
    trend_id int NOT NULL DEFAULT '0',
    log_id int DEFAULT NULL,
    sensor_id int DEFAULT NULL,
    trend varchar(20) DEFAULT NULL,
    is_significant TEXT DEFAULT NULL CHECK (is_significant IN ('0', '1')),
    last_high decimal(15,4) DEFAULT NULL,
    last_high_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    last_low decimal(15,4) DEFAULT NULL,
    last_low_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    measuring_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (trend_id)
);

CREATE TABLE station (
    station_id smallint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    display_name varchar(255) NOT NULL,
    station_id_code varchar(5) NOT NULL,
    station_number varchar(3) NOT NULL,
    station_type TEXT NOT NULL DEFAULT 'rain' CHECK (station_type IN ('rain', 'aws', 'awos')),
    logger_type TEXT NOT NULL DEFAULT 'DLM11'  CHECK (logger_type IN ('DLM11', 'DLM13M')),
    communication_type TEXT NOT NULL DEFAULT 'direct' CHECK (communication_type IN ('direct', 'sms', 'tcpip', 'gprs', 'server')),
    communication_port varchar(5) NOT NULL,
    communication_esp_ip varchar(15) NOT NULL DEFAULT '',
    communication_esp_port int NOT NULL DEFAULT '0',
    details text,
    status_message_period smallint NOT NULL DEFAULT '60',
    event_message_period smallint NOT NULL DEFAULT '10',
    timezone_id varchar(255) NOT NULL DEFAULT 'UTC',
    timezone_offset varchar(20) NOT NULL,
    wmo_block_number varchar(3) DEFAULT NULL,
    wmo_member_state_id varchar(3) DEFAULT NULL,
    wmo_station_number int NOT NULL DEFAULT '0',
    wmo_originating_centre int NOT NULL DEFAULT '202',
    national_aws_number int DEFAULT '0',
    lat decimal(20,10) NOT NULL DEFAULT '0.0000000000',
    lng decimal(20,10) NOT NULL DEFAULT '0.0000000000',
    altitude int NOT NULL DEFAULT '0',
    magnetic_north_offset SMALLINT NOT NULL DEFAULT '0',
    country_id int NOT NULL DEFAULT '0',
    city_id int NOT NULL DEFAULT '0',
    awos_msg_source_folder text CHARACTER SET ucs2 NOT NULL,
    icao_code varchar(4) DEFAULT NULL,
    phone_number TEXT,
    sms_message TEXT,
    station_gravity decimal(20,10) DEFAULT '0.0000000000',
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    color varchar(255) DEFAULT NULL,
    aws_format int DEFAULT 1,
    PRIMARY KEY (station_id)
);

CREATE TABLE station_calculation (
    calculation_id int NOT NULL DEFAULT '0',
    station_id smallint DEFAULT NULL,
    handler_id SMALLINT DEFAULT NULL,
    formula varchar(20) DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (calculation_id)
);

CREATE TABLE station_calculation_data (
    calculation_data_id int NOT NULL DEFAULT '0',
    calculation_id int DEFAULT NULL,
    listener_log_id int DEFAULT NULL,
    value decimal(15,4) DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (calculation_data_id)
);

CREATE TABLE station_calculation_variable (
    calculation_variable_id int NOT NULL DEFAULT '0',
    calculation_id int DEFAULT NULL,
    variable_name varchar(20) DEFAULT NULL,
    sensor_feature_id int DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (calculation_variable_id)
);

CREATE TABLE station_sensor (
    station_sensor_id int NOT NULL DEFAULT '0',
    station_id smallint DEFAULT NULL,
    sensor_id_code varchar(3) DEFAULT NULL,
    display_name varchar(255) DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    handler_id SMALLINT DEFAULT NULL,
    PRIMARY KEY (station_sensor_id)
);

CREATE TABLE station_sensor_feature (
    sensor_feature_id int NOT NULL DEFAULT '0',
    sensor_id int DEFAULT NULL,
    feature_code varchar(50) DEFAULT NULL,
    feature_display_name varchar(255) DEFAULT NULL,
    feature_constant_value decimal(11,3) DEFAULT NULL,
    measurement_type_code varchar(50) DEFAULT NULL,
    metric_id SMALLINT DEFAULT NULL,
    is_main SMALLINT DEFAULT NULL,
    filter_max decimal(11,2) DEFAULT NULL,
    filter_min decimal(11,2) DEFAULT NULL,
    filter_diff decimal(11,2) DEFAULT NULL,
    has_filters SMALLINT DEFAULT NULL,
    has_filter_min SMALLINT DEFAULT NULL,
    has_filter_max SMALLINT DEFAULT NULL,
    has_filter_diff SMALLINT DEFAULT NULL,
    is_constant SMALLINT DEFAULT NULL,
    is_cumulative SMALLINT DEFAULT NULL,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (sensor_feature_id)
);

CREATE TABLE tbl_forwarded_message (
    id NUMERIC NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    message_id int NOT NULL,
    client_id BIGINT NOT NULL,
    status TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new', 'sent')),
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (id)
) ;

CREATE TABLE tbl_message_forwarding_info (
    id BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    source text NOT NULL,
    description text,
    PRIMARY KEY (id)
) ;

CREATE TABLE xml_process_log (
    xml_log_id int NOT NULL DEFAULT '0',
    comment text,
    created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    updated timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (xml_log_id)
);
ALTER TABLE listener_log_process_error ADD CONSTRAINT listener_log_process_errors_fk FOREIGN KEY (log_id) REFERENCES listener_log (log_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE listener_process ADD CONSTRAINT listener_process_fk FOREIGN KEY (listener_id) REFERENCES listener (listener_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE refbook_measurement_type_metric ADD CONSTRAINT refbook_measurement_type_metric_fk FOREIGN KEY (measurement_type_id) REFERENCES refbook_measurement_type (measurement_type_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE refbook_measurement_type_metric ADD CONSTRAINT refbook_measurement_type_metric_fk1 FOREIGN KEY (metric_id) REFERENCES refbook_metric (metric_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE schedule_report_destination ADD CONSTRAINT schedule_report_destination_fk FOREIGN KEY (schedule_id) REFERENCES schedule_report (schedule_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE sensor_data ADD CONSTRAINT sensor_data_fk FOREIGN KEY (sensor_feature_id) REFERENCES station_sensor_feature (sensor_feature_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE sensor_data ADD CONSTRAINT sensor_data_fk1 FOREIGN KEY (listener_log_id) REFERENCES listener_log (log_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE sensor_data_minute ADD CONSTRAINT sensor_data_minute_fk FOREIGN KEY (listener_log_id) REFERENCES listener_log (log_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE sensor_data_minute ADD CONSTRAINT sensor_data_minute_fk1 FOREIGN KEY (sensor_id) REFERENCES station_sensor (station_sensor_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE sensor_handler_default_feature ADD CONSTRAINT sensor_handler_default_feature_fk FOREIGN KEY (handler_id) REFERENCES sensor_handler (handler_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE sensor_sea_level_trend ADD CONSTRAINT sensor_sea_level_trend_fk FOREIGN KEY (log_id) REFERENCES listener_log (log_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE sensor_sea_level_trend ADD CONSTRAINT sensor_sea_level_trend_fk1 FOREIGN KEY (sensor_id) REFERENCES station_sensor (station_sensor_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE station_calculation ADD CONSTRAINT station_calculation_fk FOREIGN KEY (station_id) REFERENCES station (station_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE station_calculation ADD CONSTRAINT station_calculation_fk1 FOREIGN KEY (handler_id) REFERENCES calculation_handler (handler_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE station_calculation_data ADD CONSTRAINT station_calculation_data_fk FOREIGN KEY (calculation_id) REFERENCES station_calculation (calculation_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE station_calculation_data ADD CONSTRAINT station_calculation_data_fk1 FOREIGN KEY (listener_log_id) REFERENCES listener_log (log_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE station_calculation_variable ADD CONSTRAINT fk_station_cal_var__sensor_feature_id FOREIGN KEY (sensor_feature_id) REFERENCES station_sensor_feature (sensor_feature_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE station_calculation_variable ADD CONSTRAINT station_calculation_variable_fk FOREIGN KEY (calculation_id) REFERENCES station_calculation (calculation_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE station_sensor ADD CONSTRAINT station_sensor_fk FOREIGN KEY (station_id) REFERENCES station (station_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE station_sensor_feature ADD CONSTRAINT station_sensor_feature_fk FOREIGN KEY (sensor_id) REFERENCES station_sensor (station_sensor_id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE tbl_forwarded_message ADD CONSTRAINT fk_forwarded_message__client_id FOREIGN KEY (client_id) REFERENCES tbl_message_forwarding_info (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE tbl_forwarded_message ADD CONSTRAINT fk_forwarded_message__log_id FOREIGN KEY (message_id) REFERENCES listener_log (log_id) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX ON listener_log (listener_id);
CREATE INDEX ON listener_log (is_last,station_id,failed);
CREATE INDEX ON listener_log (measuring_timestamp);
CREATE INDEX ON listener_log (is_actual,is_last,is_processed,is_processing);
CREATE INDEX ON listener_log_process_error (log_id);
CREATE INDEX ON listener_process (listener_id);
CREATE INDEX ON refbook_measurement_type_metric (measurement_type_id);
CREATE INDEX ON refbook_measurement_type_metric (metric_id);
CREATE INDEX ON schedule_report_destination (schedule_id);
CREATE INDEX ON schedule_report_processed (listener_log_id);
CREATE INDEX ON schedule_report_processed (is_last,is_processed);
CREATE INDEX ON schedule_report_processed (created);
CREATE INDEX ON sensor_data (sensor_feature_id);
CREATE INDEX ON sensor_data (listener_log_id);
CREATE INDEX ON sensor_data (sensor_id);
CREATE INDEX ON sensor_data (station_id);
CREATE INDEX ON sensor_data (sensor_feature_id,measuring_timestamp,is_m);
CREATE INDEX ON sensor_data (listener_log_id,sensor_feature_id,measuring_timestamp);
CREATE INDEX ON sensor_data (measuring_timestamp);
CREATE INDEX ON sensor_data_minute (listener_log_id);
CREATE INDEX ON sensor_data_minute (sensor_id);
CREATE INDEX ON sensor_handler_default_feature (handler_id);
CREATE INDEX ON sensor_sea_level_trend (log_id);
CREATE INDEX ON sensor_sea_level_trend (sensor_id);
CREATE INDEX ON station (station_type);
CREATE INDEX ON station_calculation (station_id);
CREATE INDEX ON station_calculation (handler_id);
CREATE INDEX ON station_calculation_data (calculation_id);
CREATE INDEX ON station_calculation_data (listener_log_id);
CREATE INDEX ON station_calculation_variable (calculation_id);
CREATE INDEX ON station_calculation_variable (sensor_feature_id);
CREATE INDEX ON station_sensor (station_id);
CREATE INDEX ON station_sensor (handler_id);
CREATE INDEX ON station_sensor_feature (sensor_id);
CREATE INDEX ON station_sensor_feature (metric_id);
CREATE INDEX ON station_sensor_feature (sensor_id,feature_code);
CREATE INDEX ON tbl_forwarded_message (status);
CREATE INDEX ON tbl_forwarded_message (message_id);
CREATE INDEX ON tbl_forwarded_message (client_id);
COMMENT ON COLUMN ex_schedule_report.report_type IS 'synop, bufr';
COMMENT ON COLUMN ex_schedule_report.period IS 'in minutes';
COMMENT ON COLUMN ex_schedule_report.report_format IS 'txt, csv';
COMMENT ON COLUMN schedule_report.report_type IS 'synop, bufr';
COMMENT ON COLUMN schedule_report.period IS 'in minutes';
COMMENT ON COLUMN schedule_report.report_format IS 'txt, csv';
COMMENT ON COLUMN sensor_handler.flags IS 'Bit flags';
COMMENT ON COLUMN station.logger_type IS 'Data logger type';
COMMENT ON COLUMN station.status_message_period IS 'minutes';
COMMENT ON COLUMN station.event_message_period IS 'minutes';
COMMENT ON COLUMN station.icao_code IS 'ICAO code. Station name for METAR/SPECI reports.';
COMMENT ON COLUMN station.phone_number IS 'Phone number of modem for reset by SMS';
COMMENT ON COLUMN station.sms_message IS 'Reset message for modem';
COMMENT ON COLUMN tbl_forwarded_message.message_id IS 'Id of message in listener_log';
COMMENT ON COLUMN tbl_forwarded_message.client_id IS 'Id of message forwarding info';
COMMENT ON COLUMN tbl_message_forwarding_info.source IS 'Connection source string';
COMMENT ON COLUMN tbl_message_forwarding_info.description IS 'Description of forward info';
COMMENT ON TABLE tbl_message_forwarding_info IS 'Provides info about WMs for message forwarding.';
COMMENT ON TABLE tbl_forwarded_message IS 'Table with info about forwarded messages';
