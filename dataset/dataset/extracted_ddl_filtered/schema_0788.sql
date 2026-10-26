-- Source: https://github.com/jfar007/ApiRest_POFS/blob/4047b3bc8eb99b7ae760bbad543e93ece072b103/fsolutionslvdb.sql?raw=true
-- Tables detected: 20 | FK/REFERENCES mentions: 46

CREATE TABLE branch_office (
  id                            int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name                          varchar(100) NOT NULL,
  main_phone                    varchar(20) NOT NULL,
  main_address                  varchar(50) NOT NULL,
  latitude_longitude_elevation  varchar(150) NOT NULL,
  customer_id                   int(10) UNSIGNED NOT NULL,
  active                        tinyint(1) NOT NULL DEFAULT 0,
  created_at                    timestamp NULL,
  updated_at                    timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE category (
  id          int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name        varchar(30) NOT NULL,
  short_name  varchar(20) NOT NULL,
  active      tinyint(1) NOT NULL DEFAULT 0,
  created_at  timestamp NULL,
  updated_at  timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE customer (
  id            int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name          varchar(100) NOT NULL,
  main_phone    varchar(20) NOT NULL,
  main_address  varchar(50) NOT NULL,
  profile_id    int(10) UNSIGNED NOT NULL,
  active        tinyint(1) NOT NULL DEFAULT 0,
  created_at    timestamp NULL,
  updated_at    timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE list_customer_product (
  id           int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name         varchar(50) NOT NULL,
  description  varchar(100) NOT NULL,
  customer_id  int(10) UNSIGNED NOT NULL,
  users_lm_id  int(10) UNSIGNED,
  active       tinyint(1) NOT NULL DEFAULT 0,
  created_at   timestamp NULL,
  updated_at   timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE list_customer_product_details (
  id                        int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  list_customer_product_id  int(10) UNSIGNED NOT NULL,
  product_id                int(10) UNSIGNED NOT NULL,
  suggest                   tinyint(1) NOT NULL DEFAULT 0,
  priority                  int NOT NULL,
  active                    tinyint(1) NOT NULL DEFAULT 0,
  created_at                timestamp NULL,
  updated_at                timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE migrations (
  id         int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  migration  varchar(255) NOT NULL,
  batch      int NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE notificationdays (
  id                 int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `day`              varchar(20) NOT NULL,
  until_this_time    smallint NOT NULL,
  send_notification  tinyint(1) NOT NULL DEFAULT 0,
  active             tinyint(1) NOT NULL DEFAULT 0,
  customer_id        int(10) UNSIGNED NOT NULL,
  created_at         timestamp NULL,
  updated_at         timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE order_management (
  id                  int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  task_id             int(10) UNSIGNED NOT NULL,
  customer_id         int(10) UNSIGNED NOT NULL,
  `from`              date NOT NULL,
  name_of_day         varchar(40) NOT NULL,
  hour_of_day         time NOT NULL,
  notify              tinyint(1) NOT NULL DEFAULT 0,
  initial_day_notify  varchar(40) NOT NULL,
  notify_from         time NOT NULL,
  active              tinyint(1) NOT NULL DEFAULT 0,
  created_at          timestamp NULL,
  updated_at          timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE product (
  id                        int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  cod_fs                    varchar(20) NOT NULL,
  item                      varchar(20) NOT NULL,
  name                      varchar(40) NOT NULL,
  pronunciation_in_english  varchar(150) NOT NULL,
  description               varchar(150) NOT NULL,
  packsize                  varchar(20) NOT NULL,
  picture_url               varchar(150) NOT NULL,
  category_id               int(10) UNSIGNED NOT NULL,
  unit_id                   int(10) UNSIGNED NOT NULL,
  active                    tinyint(1) NOT NULL DEFAULT 0,
  created_at                timestamp NULL,
  updated_at                timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE profile (
  id          int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name        varchar(30) NOT NULL,
  active      tinyint(1) NOT NULL DEFAULT 0,
  created_at  timestamp NULL,
  updated_at  timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE purchase_order (
  id                     int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  customer_id            int(10) UNSIGNED NOT NULL,
  branch_office_id       int(10) UNSIGNED NOT NULL,
  description            varchar(150),
  total_quantity         double NOT NULL,
  purchase_order_number  varchar(100),
  purchase_order_url     varchar(150),
  cut_date               datetime,
  status_id              int(10) UNSIGNED NOT NULL,
  users_create_id        int(10) UNSIGNED NOT NULL,
  users_lm_id            int(10) UNSIGNED NOT NULL,
  created_at             timestamp NULL,
  updated_at             timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE purchase_order_details (
  id                   int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  purchase_order_id    int(10) UNSIGNED NOT NULL,
  product_id           int(10) UNSIGNED NOT NULL,
  quantity             double NOT NULL,
  purchase_order_date  date NOT NULL,
  created_at           timestamp NULL,
  updated_at           timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE rol (
  id          int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name        varchar(30) NOT NULL,
  active      tinyint(1) NOT NULL DEFAULT 0,
  created_at  timestamp NULL,
  updated_at  timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE section (
  id          int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name        varchar(30) NOT NULL,
  active      tinyint(1) NOT NULL DEFAULT 0,
  created_at  timestamp NULL,
  updated_at  timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE section_rol (
  rol_id      int(10) UNSIGNED NOT NULL,
  section_id  int(10) UNSIGNED NOT NULL,
  active      tinyint(1) NOT NULL DEFAULT 0,
  created_at  timestamp NULL,
  updated_at  timestamp NULL
) ENGINE = InnoDB;

CREATE TABLE sessions (
  id             varchar(255) NOT NULL,
  user_id        int(10) UNSIGNED,
  ip_address     varchar(45),
  user_agent     text,
  payload        text NOT NULL,
  last_activity  int NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE `status` (
  id           int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name         varchar(30) NOT NULL,
  description  varchar(100) NOT NULL,
  active       tinyint(1) NOT NULL DEFAULT 0,
  created_at   timestamp NULL,
  updated_at   timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE task (
  id          int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name        varchar(40) NOT NULL,
  active      tinyint(1) NOT NULL DEFAULT 0,
  created_at  timestamp NULL,
  updated_at  timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE unit (
  id          int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  name        varchar(50) NOT NULL,
  short_name  varchar(20) NOT NULL,
  active      tinyint(1) NOT NULL DEFAULT 0,
  created_at  timestamp NULL,
  updated_at  timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE users (
  id                            int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  username                      varchar(8) NOT NULL,
  `password`                    varchar(100) NOT NULL,
  name                          varchar(150) NOT NULL,
  email                         varchar(255) NOT NULL,
  branch_office                 varchar(100) NOT NULL,
  mobile_phone                  varchar(20) NOT NULL,
  landline                      varchar(10) NOT NULL,
  address                       varchar(50) NOT NULL,
  latitude_longitude_elevation  varchar(150) NOT NULL,
  rol_id                        int(10) UNSIGNED,
  customer_id                   int(10) UNSIGNED,
  branch_office_cf_id           int(10) UNSIGNED,
  confirmed                     tinyint(1) DEFAULT 0,
  confirmation_code             varchar(255),
  active                        tinyint(1) NOT NULL DEFAULT 0,
  created_at                    timestamp NULL,
  updated_at                    timestamp NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE branch_office
  ADD CONSTRAINT branch_office_customer_id_foreign
  FOREIGN KEY (customer_id)
    REFERENCES customer(id)
    ON DELETE CASCADE;

ALTER TABLE customer
  ADD CONSTRAINT customer_profile_id_foreign
  FOREIGN KEY (profile_id)
    REFERENCES profile(id)
    ON DELETE CASCADE;

ALTER TABLE list_customer_product
  ADD CONSTRAINT list_customer_product_customer_id_foreign
  FOREIGN KEY (customer_id)
    REFERENCES customer(id)
    ON DELETE CASCADE;

ALTER TABLE list_customer_product
  ADD CONSTRAINT list_customer_product_users_lm_id_foreign
  FOREIGN KEY (users_lm_id)
    REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE list_customer_product_details
  ADD CONSTRAINT list_customer_product_details_list_customer_product_id_foreign
  FOREIGN KEY (list_customer_product_id)
    REFERENCES list_customer_product(id)
    ON DELETE CASCADE;

ALTER TABLE list_customer_product_details
  ADD CONSTRAINT list_customer_product_details_product_id_foreign
  FOREIGN KEY (product_id)
    REFERENCES product(id)
    ON DELETE CASCADE;

ALTER TABLE notificationdays
  ADD CONSTRAINT notificationdays_customer_id_foreign
  FOREIGN KEY (customer_id)
    REFERENCES customer(id)
    ON DELETE CASCADE;

ALTER TABLE order_management
  ADD CONSTRAINT order_management_customer_id_foreign
  FOREIGN KEY (customer_id)
    REFERENCES customer(id)
    ON DELETE CASCADE;

ALTER TABLE order_management
  ADD CONSTRAINT order_management_task_id_foreign
  FOREIGN KEY (task_id)
    REFERENCES task(id)
    ON DELETE CASCADE;

ALTER TABLE product
  ADD CONSTRAINT product_category_id_foreign
  FOREIGN KEY (category_id)
    REFERENCES category(id)
    ON DELETE CASCADE;

ALTER TABLE product
  ADD CONSTRAINT product_unit_id_foreign
  FOREIGN KEY (unit_id)
    REFERENCES unit(id)
    ON DELETE CASCADE;

ALTER TABLE purchase_order
  ADD CONSTRAINT purchase_order_branch_office_id_foreign
  FOREIGN KEY (branch_office_id)
    REFERENCES branch_office(id)
    ON DELETE CASCADE;

ALTER TABLE purchase_order
  ADD CONSTRAINT purchase_order_customer_id_foreign
  FOREIGN KEY (customer_id)
    REFERENCES customer(id)
    ON DELETE CASCADE;

ALTER TABLE purchase_order
  ADD CONSTRAINT purchase_order_status_id_foreign
  FOREIGN KEY (status_id)
    REFERENCES `status`(id)
    ON DELETE CASCADE;

ALTER TABLE purchase_order
  ADD CONSTRAINT purchase_order_users_create_id_foreign
  FOREIGN KEY (users_create_id)
    REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE purchase_order
  ADD CONSTRAINT purchase_order_users_lm_id_foreign
  FOREIGN KEY (users_lm_id)
    REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE purchase_order_details
  ADD CONSTRAINT purchase_order_details_product_id_foreign
  FOREIGN KEY (product_id)
    REFERENCES product(id)
    ON DELETE CASCADE;

ALTER TABLE purchase_order_details
  ADD CONSTRAINT purchase_order_details_purchase_order_id_foreign
  FOREIGN KEY (purchase_order_id)
    REFERENCES purchase_order(id)
    ON DELETE CASCADE;

ALTER TABLE section_rol
  ADD CONSTRAINT section_rol_rol_id_foreign
  FOREIGN KEY (rol_id)
    REFERENCES rol(id)
    ON DELETE CASCADE;

ALTER TABLE section_rol
  ADD CONSTRAINT section_rol_section_id_foreign
  FOREIGN KEY (section_id)
    REFERENCES section(id)
    ON DELETE CASCADE;

ALTER TABLE users
  ADD CONSTRAINT users_branch_office_cf_id_foreign
  FOREIGN KEY (branch_office_cf_id)
    REFERENCES branch_office(id)
    ON DELETE CASCADE;

ALTER TABLE users
  ADD CONSTRAINT users_customer_id_foreign
  FOREIGN KEY (customer_id)
    REFERENCES customer(id)
    ON DELETE CASCADE;

ALTER TABLE users
  ADD CONSTRAINT users_rol_id_foreign
  FOREIGN KEY (rol_id)
    REFERENCES rol(id)
    ON DELETE CASCADE;

