-- Source: https://github.com/MAhmoud2527/Gym/blob/b3e085d1b78d51a89e039808a69950e33a070905/gym_db.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 12
-- Foreign keys added via ALTER TABLE:
CREATE TABLE country (
    id int NOT NULL,
    country_name char(25) NOT NULL,
    country_created_at timestamp NOT NULL DEFAULT current_timestamp()()
);
CREATE TABLE days (
    id int NOT NULL,
    day_name char(50) NOT NULL
);
CREATE TABLE exercises (
    id int NOT NULL,
    exercises_name char(20) NOT NULL,
    sets int NOT NULL,
    add_by int NOT NULL,
    day_id int NOT NULL,
    trainee_id int NOT NULL
);
CREATE TABLE images (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    exe_id int NOT NULL,
    image_created_at timestamp NOT NULL DEFAULT current_timestamp()()
);
CREATE TABLE package (
    id int NOT NULL,
    package_name char(50) NOT NULL,
    month_num int NOT NULL,
    package_amount int NOT NULL,
    package_created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    add_by int NOT NULL
);
CREATE TABLE trainees_more_info (
    id int NOT NULL,
    weight int NOT NULL,
    height int NOT NULL,
    package_id int NOT NULL,
    coach_id int NOT NULL,
    more_info int NOT NULL,
    more_add_by int NOT NULL
);
CREATE TABLE users (
    id int NOT NULL,
    username char(20) NOT NULL,
    email char(30) NOT NULL,
    password char(100) NOT NULL,
    phone int NOT NULL,
    photo char(50) NOT NULL,
    country_id int NOT NULL,
    user_type_id int NOT NULL,
    add_by int DEFAULT NULL,
    user_created_at timestamp NOT NULL DEFAULT current_timestamp()()
);
CREATE TABLE usertype (
    id int NOT NULL,
    title char(20) NOT NULL
);

                          

ALTER TABLE exercises
  ADD CONSTRAINT coach_relation FOREIGN KEY (add_by) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT day_relation FOREIGN KEY (day_id) REFERENCES days (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT user_relation FOREIGN KEY (trainee_id) REFERENCES trainees_more_info (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trainees_more_info
  ADD CONSTRAINT coach_id FOREIGN KEY (coach_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT more_add_by FOREIGN KEY (more_add_by) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT more_rel FOREIGN KEY (more_info) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT package_id FOREIGN KEY (package_id) REFERENCES package (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE users
  ADD CONSTRAINT add_user_relation FOREIGN KEY (add_by) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT country FOREIGN KEY (country_id) REFERENCES country (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT user_type_relation FOREIGN KEY (user_type_id) REFERENCES usertype (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE exercises ADD CONSTRAINT coach_relation FOREIGN KEY (add_by) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE images ADD CONSTRAINT img_rel FOREIGN KEY (exe_id) REFERENCES exercises (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE package ADD CONSTRAINT added_relateduser_rel FOREIGN KEY (add_by) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trainees_more_info ADD CONSTRAINT coach_id FOREIGN KEY (coach_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE users ADD CONSTRAINT add_user_relation FOREIGN KEY (add_by) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
