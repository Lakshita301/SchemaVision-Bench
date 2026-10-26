-- Source: https://github.com/vburlai/chat-design-demo/blob/d75260137cd39247b75869394f4533c686b70f5e/db-primary/01-init.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE chat_rooms (
    room_id VARCHAR(16) NOT NULL UNIQUE,
    name VARCHAR(32) NOT NULL,
    PRIMARY KEY (room_id)
);

CREATE TABLE chat_users (
    clientId VARCHAR(16) NOT NULL,
    hostname VARCHAR(32) NOT NULL,
    room VARCHAR(16) NOT NULL,
    username VARCHAR(128),
    joined TIMESTAMP not null DEFAULT now(),
    PRIMARY KEY (clientId, hostname, room),
    FOREIGN KEY (room) REFERENCES chat_rooms(room_id)
) ENGINE = MEMORY;

CREATE TABLE messages (
    room VARCHAR(16) NOT NULL,
    message VARCHAR(256),
    sent TIMESTAMP not null DEFAULT now(),
    FOREIGN KEY (room) REFERENCES chat_rooms(room_id)
);

