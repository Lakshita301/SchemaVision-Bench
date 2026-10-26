-- Source: https://github.com/taquoctran0111/Web-Film/blob/38568476756aee87c1296433efedba31695c4f47/db/db_movies.sql?raw=true
-- Tables detected: 14 | FK/REFERENCES mentions: 3

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_comments` (
  `comment_id` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `comment_sender_name` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_episodes` (
  `episode_id` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `episode_name` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_films` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sub_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `typemovie` int(11) DEFAULT NULL,
  `nation_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `image_vertical` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `num_view` int(11) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `image_horizontal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_listcategory` (
  `film_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `list_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_nations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_navmenu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating_action` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_serimovies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_singlemovies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_theatermovies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_typemovies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `usertype_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_usertypes` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `tbl_episodes`
  ADD CONSTRAINT `fk_tbl_episodes_tbl_films` FOREIGN KEY (`film_id`) REFERENCES `tbl_films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tbl_films`
  ADD CONSTRAINT `fk_tbl_films_tbl_nations` FOREIGN KEY (`nation_id`) REFERENCES `tbl_nations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tbl_users`
  ADD CONSTRAINT `fk_tbl_users_tbl_usertypes` FOREIGN KEY (`usertype_id`) REFERENCES `tbl_usertypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

