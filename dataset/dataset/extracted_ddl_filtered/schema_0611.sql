-- Source: https://github.com/myxzlpltk/chatbox/blob/1c5b496ee30aa6dd59248f87f1f69d2f463060bc/chat.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 1

CREATE TABLE `chat` (
  `id_chat` int(25) NOT NULL,
  `waktu_mulai` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expired` datetime NOT NULL,
  `token` varchar(100) NOT NULL,
  `status` varchar(25) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomor_telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `config` (
  `id_config` int(25) NOT NULL,
  `name` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `detail_chat` (
  `id_detail` int(25) NOT NULL,
  `id_chat` int(25) NOT NULL,
  `sumber` varchar(20) NOT NULL,
  `isi` text NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(25) NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `mail` (
  `id_mail` int(15) NOT NULL,
  `origin` int(15) NOT NULL,
  `dest` int(15) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trash` enum('0','1') NOT NULL DEFAULT '0',
  `readed` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_mail` (
  `id_user` int(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `detail_chat`
  ADD CONSTRAINT `detail_chat_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`id_chat`) ON DELETE CASCADE ON UPDATE CASCADE;

