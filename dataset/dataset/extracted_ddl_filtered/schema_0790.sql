-- Source: https://github.com/MAhmoud2527/Gym/blob/b3e085d1b78d51a89e039808a69950e33a070905/gym_db.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 12

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_name` char(25) NOT NULL,
  `country_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `day_name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `exercises` (
  `id` int(11) NOT NULL,
  `exercises_name` char(20) NOT NULL,
  `sets` int(11) NOT NULL,
  `add_by` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `exe_id` int(11) NOT NULL,
  `image_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `package_name` char(50) NOT NULL,
  `month_num` int(11) NOT NULL,
  `package_amount` int(50) NOT NULL,
  `package_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `add_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `trainees_more_info` (
  `id` int(11) NOT NULL,
  `weight` int(25) NOT NULL,
  `height` int(25) NOT NULL,
  `package_id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `more_info` int(11) NOT NULL,
  `more_add_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` char(20) NOT NULL,
  `email` char(30) NOT NULL,
  `password` char(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `photo` char(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `add_by` int(11) DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `title` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `exercises`
  ADD CONSTRAINT `coach_relation` FOREIGN KEY (`add_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `day_relation` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_relation` FOREIGN KEY (`trainee_id`) REFERENCES `trainees_more_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `images`
  ADD CONSTRAINT `img_rel` FOREIGN KEY (`exe_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `package`
  ADD CONSTRAINT `added_RElatedUser_rel` FOREIGN KEY (`add_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `trainees_more_info`
  ADD CONSTRAINT `coach_id` FOREIGN KEY (`coach_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `more_add_by` FOREIGN KEY (`more_add_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `more_rel` FOREIGN KEY (`more_info`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_id` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `users`
  ADD CONSTRAINT `add_user_relation` FOREIGN KEY (`add_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_type_relation` FOREIGN KEY (`user_type_id`) REFERENCES `usertype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

