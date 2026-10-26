-- Source: https://github.com/lvh201998/chatbot2/blob/d66d35337388e6cced948187919bea7869fa4a94/database/chat.sql?raw=true
-- Tables detected: 15 | FK/REFERENCES mentions: 2

CREATE TABLE `channel` (
  `id` int(11) NOT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `group_recipient_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `comment_owner` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `comment_edit_date` timestamp NULL DEFAULT NULL,
  `comment_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `like_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message_creator` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_reply` int(11) DEFAULT NULL,
  `reply_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `message_recipient` (
  `id` int(11) NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `post_owner` int(11) NOT NULL,
  `post_visibility` int(11) NOT NULL DEFAULT 0,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `post_edit_date` timestamp NULL DEFAULT NULL,
  `text_content` text DEFAULT NULL,
  `picture_media` text DEFAULT NULL,
  `video_media` text DEFAULT NULL,
  `post_place` int(11) DEFAULT 1,
  `is_shared` int(11) DEFAULT 0,
  `post_shared_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `post_place` (
  `id` int(11) NOT NULL,
  `post_place` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `post_visibility` (
  `id` int(11) NOT NULL,
  `visibility` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hash` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `joined` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_type` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT '',
  `bio` varchar(800) DEFAULT NULL,
  `picture` text DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT -1,
  `last_active_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_metadata` (
  `id` int(11) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_relation` (
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `since` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(30) DEFAULT NULL,
  `permission` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `writing_message_notifier` (
  `message_writer` int(11) DEFAULT NULL,
  `message_waiter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `message_recipient`
  ADD CONSTRAINT `message_recipient_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE SET NULL;

ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_place` FOREIGN KEY (`post_place`) REFERENCES `post_place` (`id`);

