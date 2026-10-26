-- Source: https://github.com/shrimaliakash/PHPRoleManagement/blob/2f221c9e49d2e4738c6299d3c01bd6cd411f56a2/db/akash_test.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE `tbl_info` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_login` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `isLogin` tinyint(1) NOT NULL DEFAULT 0,
  `isBlock` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_other` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `permission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tbl_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_login_ibfk_2` FOREIGN KEY (`role`) REFERENCES `tbl_other` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

