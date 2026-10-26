-- Source: https://github.com/Bobysait/khalidouarga_7_20210807/blob/9368c2c40f181135dfdb7103fc34682fbb4d2729/backend/sql.dump/db_gmm_20210801231359772.dump.sql?raw=true
-- Tables detected: 7 | FK constraints: 8

CREATE TABLE `gmm_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int unsigned NOT NULL,
  `file_size` int unsigned NOT NULL,
  `file_type` varchar(32) NOT NULL,
  `data` blob,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attachment_post` (`id_post`),
  CONSTRAINT `fk_attachment_post` FOREIGN KEY (`id_post`) REFERENCES `gmm_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `gmm_avatars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int unsigned NOT NULL,
  `file_size` int unsigned NOT NULL,
  `file_type` varchar(32) NOT NULL,
  `data` blob,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_avatar_user` (`id_user`),
  CONSTRAINT `fk_avatar_user` FOREIGN KEY (`id_user`) REFERENCES `gmm_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `gmm_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` text NOT NULL,
  `nb_views` int unsigned NOT NULL DEFAULT '0',
  `nb_comments` int unsigned NOT NULL DEFAULT '0',
  `url_attachment` varchar(255) DEFAULT NULL,
  `id_attachment` int unsigned DEFAULT NULL,
  `is_topic` int unsigned DEFAULT '1',
  `date_creation` varchar(255) NOT NULL,
  `date_update` varchar(255) DEFAULT NULL,
  `nb_reactions` int unsigned NOT NULL DEFAULT '0',
  `reactions` varchar(255) NOT NULL DEFAULT '{"like":0, "love":0, "wow":0, "laugh":0, "dislike":0}',
  PRIMARY KEY (`id`),
  KEY `fk_posts_user` (`id_user`),
  CONSTRAINT `fk_posts_user` FOREIGN KEY (`id_user`) REFERENCES `gmm_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `gmm_privileges` (
  `id` int unsigned NOT NULL,
  `name` varchar(16) NOT NULL,
  `is_owner` int unsigned DEFAULT '0',
  `is_admin` int unsigned DEFAULT '0',
  `create_message` varchar(4) DEFAULT '0',
  `edit_message` varchar(4) DEFAULT '0',
  `view_message` varchar(4) DEFAULT '0',
  `delete_message` varchar(4) DEFAULT '0',
  `edit_user` varchar(4) DEFAULT '0',
  `view_user` varchar(4) DEFAULT '0',
  `delete_user` varchar(4) DEFAULT '0',
  `disconnect` varchar(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `gmm_topic_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_topic` int unsigned NOT NULL,
  `id_post` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_topic_posts_post` (`id_post`),
  KEY `ind_topic` (`id_topic`),
  CONSTRAINT `fk_topic_posts_post` FOREIGN KEY (`id_post`) REFERENCES `gmm_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_topic_posts_topic` FOREIGN KEY (`id_topic`) REFERENCES `gmm_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `gmm_user_reactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int unsigned NOT NULL,
  `id_post` int unsigned NOT NULL,
  `reaction` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_reactions_user` (`id_user`),
  KEY `fk_user_reactions_reaction` (`id_post`),
  CONSTRAINT `fk_user_reactions_reaction` FOREIGN KEY (`id_post`) REFERENCES `gmm_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_reactions_user` FOREIGN KEY (`id_user`) REFERENCES `gmm_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `gmm_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_privilege` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(512) NOT NULL,
  `date_naissance` datetime NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_connexion` datetime DEFAULT NULL,
  `url_avatar` varchar(255) DEFAULT NULL,
  `id_avatar` int unsigned DEFAULT NULL,
  `service` varchar(64) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `signature` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_users_privilege` (`id_privilege`),
  CONSTRAINT `fk_users_privilege` FOREIGN KEY (`id_privilege`) REFERENCES `gmm_privileges` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

