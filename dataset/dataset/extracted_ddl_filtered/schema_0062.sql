-- Source: https://github.com/Kerrex/TrainingCenter_Backend/blob/288991fa23a384d80c5a4aded245d3398aa61da3/out/production/resources/sql-scripts/schema.sql?raw=true
-- Tables detected: 12 | FK/REFERENCES mentions: 20

CREATE TABLE training_center_role (
  id INT NOT NULL IDENTITY,
  description varchar(255) DEFAULT NULL,
  role_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE training_center_user (
  id INT NOT NULL IDENTITY ,
  first_name varchar(255) NULL,
  last_name varchar(255) NULL,
  password varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE user_data (
  user_id INT NOT NULL,
  gender INT NULL, /* 0 female, 1 male */
  height INT NULL, /* w centymetrach */
  PRIMARY KEY (user_id)
);

CREATE TABLE user_role (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  CONSTRAINT FK859n2jvi8ivhui0rl0esws6o FOREIGN KEY (user_id) REFERENCES training_center_user (id),
  CONSTRAINT FKa68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES training_center_user (id),
  CONSTRAINT PK_USER_ROLE PRIMARY KEY (user_id, role_id)
);

CREATE TABLE user_measurement (
  id INT NOT NULL IDENTITY,
  user_id INT NOT NULL,
  waist INT NOT NULL, /* w milimetrach */
  weight INT NOT NULL, /* w hektagramach */
  biceps INT  NULL, /* w milimetrach */
  thigh INT  NULL, /* w milimetrach */
  hips INT NOT NULL, /* w milimetrach */
  chest INT NULL, /* w milimetrach */
  neck INT NOT NULL, /* w milimetrach */
  date_added TIMESTAMP NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FKa68196081fvovjhkek5m97n3z FOREIGN KEY (user_id) REFERENCES training_center_user (id)
);

CREATE TABLE language_version (
  name varchar(30) NOT NULL UNIQUE,
  code VARCHAR(5) NOT NULL,
  PRIMARY KEY (code)
);

CREATE TABLE exercise (
  id INT NOT NULL IDENTITY,
  default_name varchar(255) NOT NULL,
  youtube_link varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE exercise_language_version (
  exercise_id INT NOT NULL,
  language_version_code VARCHAR(5) NOT NULL,
  name varchar(255) NOT NULL,
  CONSTRAINT FK_EXERCISE_LV_EXERCISE FOREIGN KEY (exercise_id) REFERENCES exercise (id),
  CONSTRAINT FK_EXERVICE_LV_LANGUAGE_VERSION FOREIGN KEY (language_version_code) REFERENCES language_version (code),
  CONSTRAINT PK_EXERCISE_LANGUAGE_VERSION PRIMARY KEY (exercise_id, language_version_code)
);

CREATE TABLE training_plan (
  id INT NOT NULL IDENTITY ,
  name VARCHAR(40) NOT NULL,
  user_id INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES training_center_user (id)
);

CREATE TABLE measure (
  id INT NOT NULL IDENTITY,
  name VARCHAR(5) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE exercise_training_plan (
  training_plan_id INT NOT NULL,
  exercise_id INT NOT NULL,
  series_count INT NOT NULL,
  intensivity INT NOT NULL, /* razy 100 */
  measure_id INT NULL,
  FOREIGN KEY (training_plan_id) REFERENCES training_plan (id),
  FOREIGN KEY (exercise_id) REFERENCES exercise (id),
  FOREIGN KEY (measure_id) REFERENCES measure (id),
  PRIMARY KEY (training_plan_id, exercise_id)
);

CREATE TABLE training_plan_date (
  id INT NOT NULL IDENTITY,
  date DATE NOT NULL,
  training_plan_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (training_plan_id) REFERENCES training_plan (id)
);

