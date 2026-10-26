-- Source: https://github.com/mingliee/asgn_usmers/blob/b25bafc6dfdd9e807a441bbff1ec5d5cf1510cbc/sql/usmers.sql?raw=true
-- Tables detected: 25 | FK/REFERENCES mentions: 11
CREATE TABLE abbr (
    abbr_id int NOT NULL,
    abbr_value varchar(11) NOT NULL,
    abbr_name varchar(30) NOT NULL
);
CREATE TABLE admin (
    admin_id varchar(20) NOT NULL,
    user_email varchar(255) NOT NULL,
    added_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE ads_accom (
    ads_id varchar(20) NOT NULL,
    ads_status varchar(50) NOT NULL,
    ads_title text NOT NULL,
    ads_cat varchar(50) NOT NULL,
    ads_price decimal(9,2) NOT NULL,
    ads_descp text NOT NULL,
    ads_loc varchar(50) NOT NULL,
    ads_area varchar(50) DEFAULT NULL,
    ads_publish_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ads_latest_update_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id int NOT NULL,
    accm_tenet_pref varchar(11) NOT NULL,
    private_status varchar(11) DEFAULT NULL,
    admin_update_date timestamp NULL DEFAULT NULL
);
CREATE TABLE ads_item (
    ads_id varchar(20) NOT NULL,
    ads_status varchar(50) DEFAULT NULL,
    ads_title text NOT NULL,
    ads_cat varchar(50) NOT NULL,
    ads_price decimal(9,2) NOT NULL,
    ads_descp text NOT NULL,
    ads_loc varchar(50) NOT NULL,
    ads_area varchar(50) DEFAULT NULL,
    ads_publish_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ads_latest_update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    user_id int NOT NULL,
    item_condition varchar(11) DEFAULT NULL,
    item_deal_method varchar(11) DEFAULT NULL,
    private_status varchar(11) DEFAULT NULL,
    admin_update_date timestamp NULL DEFAULT NULL
);
CREATE TABLE ads_job (
    ads_id varchar(20) NOT NULL,
    ads_status varchar(50) NOT NULL,
    ads_title text NOT NULL,
    ads_cat varchar(50) NOT NULL,
    ads_price decimal(9,2) NOT NULL,
    ads_descp text NOT NULL,
    ads_loc varchar(50) NOT NULL,
    ads_area varchar(50) NOT NULL,
    ads_publish_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ads_latest_update_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id int NOT NULL,
    job_contract_type varchar(11) DEFAULT NULL,
    job_salary_type varchar(11) DEFAULT NULL,
    private_status varchar(11) DEFAULT NULL,
    admin_update_date timestamp NULL DEFAULT NULL
);
CREATE TABLE ads_management (
    id int NOT NULL,
    ads_id varchar(20) DEFAULT NULL,
    action varchar(11) DEFAULT NULL,
    descp varchar(255) DEFAULT NULL,
    time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    pic int DEFAULT NULL
);
CREATE TABLE ads_status (
    status_id int NOT NULL,
    status_value varchar(50) NOT NULL,
    status_name varchar(50) NOT NULL
);
CREATE TABLE avatar (
    avatar_id varchar(20) NOT NULL,
    avatar_name varchar(255) NOT NULL,
    avatar_file BYTEA NOT NULL
);
CREATE TABLE category (
    cat_id int NOT NULL,
    cat_value varchar(50) NOT NULL,
    cat_name varchar(255) NOT NULL
);
CREATE TABLE deleted_ads (
    deleted_ads_id varchar(20) NOT NULL,
    ads_id varchar(20) NOT NULL,
    ads_status varchar(50) NOT NULL,
    ads_title text NOT NULL,
    ads_cat varchar(50) NOT NULL,
    ads_price decimal(9,2) NOT NULL,
    ads_descp text NOT NULL,
    ads_loc varchar(50) NOT NULL,
    ads_area varchar(50) NOT NULL,
    ads_publish_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ads_latest_update_date timestamp NOT NULL,
    user_id int NOT NULL,
    sub_info_1 varchar(11) NOT NULL,
    sub_info_2 varchar(11) NOT NULL,
    private_status varchar(11) NOT NULL,
    deleted_date timestamp NOT NULL
);
CREATE TABLE deleted_image (
    deleted_image_id varchar(20) NOT NULL,
    image_id varchar(20) NOT NULL,
    image_name varchar(255) NOT NULL,
    image_file BYTEA NOT NULL,
    ads_id varchar(20) NOT NULL,
    image_status varchar(50) NOT NULL
);
CREATE TABLE favourite (
    user_id int NOT NULL,
    ads_id varchar(20) NOT NULL,
    fav_added_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE image_accom (
    image_id varchar(20) NOT NULL,
    image_name varchar(255) DEFAULT NULL,
    image_file BYTEA,
    ads_id varchar(20) NOT NULL,
    image_status varchar(50) NOT NULL
);
CREATE TABLE image_item (
    image_id varchar(20) NOT NULL,
    image_name varchar(255) DEFAULT NULL,
    image_file BYTEA,
    image_label varchar(255) DEFAULT NULL,
    image_ocr varchar(500) DEFAULT NULL,
    ads_id varchar(20) NOT NULL,
    image_status varchar(50) NOT NULL
);
CREATE TABLE image_job (
    image_id varchar(20) NOT NULL,
    image_name varchar(255) DEFAULT NULL,
    image_file BYTEA,
    ads_id varchar(20) NOT NULL,
    image_status varchar(50) DEFAULT NULL
);
CREATE TABLE location (
    loc_id int NOT NULL,
    loc_value varchar(50) NOT NULL,
    loc_name varchar(255) NOT NULL,
    lat decimal(10,8) DEFAULT NULL,
    lng decimal(11,8) DEFAULT NULL
);
CREATE TABLE message (
    msg_id int NOT NULL,
    sender_id int NOT NULL,
    receiver_id int NOT NULL,
    content text NOT NULL,
    time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status int NOT NULL
);
CREATE TABLE report (
    report_id varchar(20) NOT NULL,
    report_type varchar(10) DEFAULT NULL,
    reported_by_user_id int NOT NULL,
    reason varchar(255) NOT NULL,
    report_descp text,
    report_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status varchar(20) DEFAULT NULL,
    comment varchar(255) DEFAULT NULL,
    update_date timestamp NULL DEFAULT NULL
);
CREATE TABLE report_ads (
    report_id varchar(20) NOT NULL,
    ads_id varchar(20) NOT NULL
);
CREATE TABLE report_reason (
    reason_id int NOT NULL,
    reason_value varchar(20) DEFAULT NULL,
    reason_name varchar(255) DEFAULT NULL
);
CREATE TABLE school (
    school_id varchar(20) NOT NULL,
    school_value varchar(20) NOT NULL,
    school_name varchar(50) NOT NULL
);
CREATE TABLE support (
    support_id varchar(20) NOT NULL,
    user_id int DEFAULT NULL,
    support_subject varchar(255) NOT NULL,
    support_descp text,
    support_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    status varchar(20) DEFAULT NULL,
    comment varchar(255) DEFAULT NULL,
    update_date timestamp NULL DEFAULT NULL
);
CREATE TABLE ticket_status (
    status_id int NOT NULL,
    status_value varchar(20) DEFAULT NULL,
    status_name varchar(20) DEFAULT NULL
);
CREATE TABLE "user" (
    user_id int NOT NULL,
    user_email varchar(255) NOT NULL,
    user_pswd varchar(200) NOT NULL,
    user_name varchar(255) NOT NULL,
    whatsapp text,
    user_gender varchar(200) DEFAULT NULL,
    school varchar(10) DEFAULT NULL,
    address varchar(50) DEFAULT NULL,
    area varchar(50) DEFAULT NULL,
    avatar_id varchar(20) NOT NULL,
    user_status varchar(1) NOT NULL DEFAULT 'P',
    create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    token varchar(255) DEFAULT NULL,
    admin_update_date date DEFAULT NULL
);
CREATE TABLE user_management (
    id int NOT NULL,
    user_id int DEFAULT NULL,
    action varchar(11) DEFAULT NULL,
    descp varchar(255) DEFAULT NULL,
    time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    pic int DEFAULT NULL
);
ALTER TABLE ads_accom ADD CONSTRAINT fk_accom_user_id FOREIGN KEY (user_id) REFERENCES "user" (user_id);
ALTER TABLE ads_item ADD CONSTRAINT ads_item_ibfk_1 FOREIGN KEY (user_id) REFERENCES "user" (user_id);
ALTER TABLE ads_job ADD CONSTRAINT fk_job_user_id FOREIGN KEY (user_id) REFERENCES "user" (user_id);
ALTER TABLE favourite ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES "user" (user_id);
ALTER TABLE image_accom ADD CONSTRAINT fk_ads_id FOREIGN KEY (ads_id) REFERENCES ads_accom (ads_id);
ALTER TABLE image_item ADD CONSTRAINT fk_image_item FOREIGN KEY (ads_id) REFERENCES ads_item (ads_id);
ALTER TABLE image_job ADD CONSTRAINT fk_image_id FOREIGN KEY (ads_id) REFERENCES ads_job (ads_id);
ALTER TABLE image_job ADD CONSTRAINT fk_image_job_id FOREIGN KEY (ads_id) REFERENCES ads_job (ads_id);
ALTER TABLE report_ads ADD CONSTRAINT fk_report_id FOREIGN KEY (report_id) REFERENCES report (report_id);
ALTER TABLE report_ads ADD CONSTRAINT report_ads_ibfk_1 FOREIGN KEY (report_id) REFERENCES report (report_id);
ALTER TABLE report_ads ADD CONSTRAINT report_ads_ibfk_2 FOREIGN KEY (report_id) REFERENCES report (report_id);
