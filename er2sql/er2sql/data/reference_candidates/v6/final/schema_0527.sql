-- Source: https://github.com/Cafe-Variome/CafeVariome/blob/890471a9c74bdc825749aa51f866ea60b1740588/Install/MySql/cafevariome.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 10
CREATE TABLE eavs (
    "id" int NOT NULL,
    uid char(36) NOT NULL,
    source_id int NOT NULL,
    "fileName" INTEGER NOT NULL,
    subject_id varchar(36) NOT NULL,
    attribute varchar(50) NOT NULL,
    value varchar(200) DEFAULT NULL,
    elastic bit(1) NOT NULL DEFAULT b'0'
);
CREATE TABLE groups (
    "id" INTEGER NOT NULL,
    name varchar(20) NOT NULL,
    description varchar(100) NOT NULL
);
CREATE TABLE login_attempts (
    "id" BIGINT NOT NULL,
    ip_address varchar(45) NOT NULL,
    login varchar(100) NOT NULL,
    time BIGINT DEFAULT NULL
);
CREATE TABLE menu_items (
    "id" int NOT NULL,
    position int NOT NULL,
    "title" varchar(64) NOT NULL,
    url varchar(256) DEFAULT NULL,
    page_id int DEFAULT NULL
);
CREATE TABLE networks (
    network_key int NOT NULL,
    network_name TEXT NOT NULL,
    network_type varchar(50) NOT NULL
);
CREATE TABLE network_groups (
    "id" BIGINT NOT NULL,
    name varchar(100) NOT NULL,
    description varchar(100) NOT NULL,
    network_key int NOT NULL,
    group_type varchar(50) NOT NULL,
    url varchar(256) NOT NULL
);
CREATE TABLE network_groups_sources (
    "id" BIGINT NOT NULL,
    source_id BIGINT NOT NULL,
    group_id BIGINT NOT NULL,
    installation_key varchar(32) CHARACTER SET latin1 NOT NULL,
    network_key int NOT NULL
);
CREATE TABLE network_requests (
    "id" int NOT NULL,
    network_key int NOT NULL,
    installation_key varchar(100) NOT NULL,
    url TEXT NOT NULL,
    justification TEXT NOT NULL,
    email varchar(50) NOT NULL,
    ip TEXT NOT NULL,
    token varchar(32) NOT NULL,
    "status" SMALLINT NOT NULL
);
CREATE TABLE pages (
    "id" int NOT NULL,
    "Title" varchar(50) NOT NULL,
    content TEXT NOT NULL,
    author BIGINT NOT NULL,
    "Active" bit(1) NOT NULL,
    removable bit(1) NOT NULL
);
CREATE TABLE pipeline (
    "id" int NOT NULL,
    name varchar(50) NOT NULL,
    subject_id_location SMALLINT NOT NULL DEFAULT '0',
    subject_id_attribute_name varchar(100) NOT NULL,
    grouping SMALLINT NOT NULL DEFAULT '0',
    group_columns varchar(200) DEFAULT NULL,
    dateformat SMALLINT DEFAULT NULL,
    hpo_attribute_name varchar(100) DEFAULT NULL,
    negated_hpo_attribute_name varchar(100) DEFAULT NULL,
    orpha_attribute_name varchar(100) DEFAULT NULL,
    internal_delimiter char(1) DEFAULT NULL
);
CREATE TABLE settings (
    setting_id int NOT NULL,
    setting_key varchar(50) NOT NULL,
    value varchar(100) NOT NULL,
    setting_name varchar(50) DEFAULT NULL,
    info TEXT NOT NULL,
    setting_group varchar(50) DEFAULT NULL,
    validation_rules varchar(100) NOT NULL DEFAULT 'required|xss_clean'
);
CREATE TABLE sources (
    source_id BIGINT NOT NULL,
    owner_name TEXT NOT NULL,
    email TEXT NOT NULL,
    name varchar(30) NOT NULL,
    uri TEXT NOT NULL,
    description TEXT NOT NULL,
    long_description TEXT NOT NULL,
    "status" varchar(15) NOT NULL,
    date_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    username varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    record_count bigint NOT NULL DEFAULT '0',
    elastic_status SMALLINT DEFAULT '0',
    elastic_lock SMALLINT DEFAULT '0'
);
CREATE TABLE uploaddatastatus (
    "FileName" varchar(100) NOT NULL,
    uploadstart TIMESTAMP NOT NULL,
    uploadend TIMESTAMP DEFAULT NULL,
    "Status" varchar(20) NOT NULL,
    elasticstatus varchar(20) NOT NULL,
    source_id int NOT NULL,
    user_id BIGINT NOT NULL,
    "ID" BIGINT NOT NULL,
    patient varchar(50) DEFAULT NULL,
    tissue varchar(50) DEFAULT NULL,
    pipeline_id int DEFAULT NULL,
    setting_file varchar(50) DEFAULT NULL
);
CREATE TABLE upload_error (
    "ID" INTEGER NOT NULL,
    error_id INTEGER NOT NULL,
    message varchar(500) NOT NULL,
    error_code int NOT NULL,
    source_id int NOT NULL
);
CREATE TABLE upload_jobs (
    "ID" int NOT NULL,
    source_id int NOT NULL,
    user_id INTEGER NOT NULL,
    linking_id varchar(50) NOT NULL
);
CREATE TABLE users (
    "id" BIGINT NOT NULL,
    ip_address varchar(45) NOT NULL,
    username varchar(100) DEFAULT NULL,
    password varchar(255) NOT NULL,
    email varchar(254) NOT NULL,
    activation_selector varchar(255) DEFAULT NULL,
    activation_code varchar(255) DEFAULT NULL,
    forgotten_password_selector varchar(255) DEFAULT NULL,
    forgotten_password_code varchar(255) DEFAULT NULL,
    forgotten_password_time BIGINT DEFAULT NULL,
    remember_selector varchar(255) DEFAULT NULL,
    remember_code varchar(255) DEFAULT NULL,
    created_on BIGINT NOT NULL,
    last_login BIGINT DEFAULT NULL,
    "active" SMALLINT DEFAULT NULL,
    first_name varchar(50) DEFAULT NULL,
    last_name varchar(50) DEFAULT NULL,
    company varchar(100) DEFAULT NULL,
    phone varchar(20) DEFAULT NULL,
    is_admin SMALLINT NOT NULL DEFAULT '0',
    token varchar(50) DEFAULT NULL,
    remote SMALLINT NOT NULL DEFAULT '0'
);
CREATE TABLE users_groups (
    "id" BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    group_id INTEGER NOT NULL
);
CREATE TABLE users_groups_networks (
    "id" BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    group_id BIGINT NOT NULL,
    installation_key varchar(100) NOT NULL,
    network_key int NOT NULL
);
ALTER TABLE network_groups_sources
  ADD CONSTRAINT networkgroupidfk FOREIGN KEY (group_id) REFERENCES network_groups ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT sourceidfk FOREIGN KEY (source_id) REFERENCES sources (source_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE users_groups
  ADD CONSTRAINT fk_users_groups_groups1 FOREIGN KEY (group_id) REFERENCES groups ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_users_groups_users1 FOREIGN KEY (user_id) REFERENCES users ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE users_groups_networks
  ADD CONSTRAINT groupidfk FOREIGN KEY (group_id) REFERENCES network_groups ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT userfk FOREIGN KEY (user_id) REFERENCES users ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE menu_items ADD CONSTRAINT page_fk FOREIGN KEY (page_id) REFERENCES pages ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE network_groups_sources ADD CONSTRAINT networkgroupidfk FOREIGN KEY (group_id) REFERENCES network_groups ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE network_requests ADD CONSTRAINT networkrequest_networkkey_fk FOREIGN KEY (network_key) REFERENCES networks (network_key) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pages ADD CONSTRAINT author_fk FOREIGN KEY (author) REFERENCES users ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE uploaddatastatus ADD CONSTRAINT pipeline_id_fk FOREIGN KEY (pipeline_id) REFERENCES pipeline ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE users_groups ADD CONSTRAINT fk_users_groups_groups1 FOREIGN KEY (group_id) REFERENCES groups ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE users_groups_networks ADD CONSTRAINT groupidfk FOREIGN KEY (group_id) REFERENCES network_groups ("id") ON DELETE CASCADE ON UPDATE CASCADE;
