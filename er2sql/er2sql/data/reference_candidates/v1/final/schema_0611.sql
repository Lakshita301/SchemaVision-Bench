-- Source: https://github.com/myxzlpltk/chatbox/blob/1c5b496ee30aa6dd59248f87f1f69d2f463060bc/chat.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 1
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "chat" (
    "id_chat" int NOT NULL,
    "waktu_mulai" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expired" TIMESTAMP NOT NULL,
    "token" varchar(100) NOT NULL,
    "status" varchar(25) NOT NULL,
    "nama" varchar(100) NOT NULL,
    "email" varchar(100) NOT NULL,
    "nomor_telepon" varchar(20) NOT NULL
);

CREATE TABLE "config" (
    "id_config" int NOT NULL,
    "name" text NOT NULL,
    "value" text NOT NULL
);

CREATE TABLE "detail_chat" (
    "id_detail" int NOT NULL,
    "id_chat" int NOT NULL,
    "sumber" varchar(20) NOT NULL,
    "isi" text NOT NULL,
    "waktu" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" varchar(25) NOT NULL DEFAULT 'unread'
);

CREATE TABLE "mail" (
    "id_mail" int NOT NULL,
    "origin" int NOT NULL,
    "dest" int NOT NULL,
    "title" text NOT NULL,
    "content" text NOT NULL,
    "date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "trash" enum('0','1') NOT NULL DEFAULT '0',
    "readed" enum('0','1') DEFAULT '0'
);

CREATE TABLE "user_mail" (
    "id_user" int NOT NULL,
    "username" varchar(255) NOT NULL,
    "password" text NOT NULL,
    "role" enum('admin','user') NOT NULL,
    "nama" varchar(255) NOT NULL
);


                          

ALTER TABLE "detail_chat"
  ADD CONSTRAINT "detail_chat_ibfk_1" FOREIGN KEY ("id_chat") REFERENCES "chat" ("id_chat") ON DELETE CASCADE ON UPDATE CASCADE;
