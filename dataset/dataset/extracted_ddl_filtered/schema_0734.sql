-- Source: https://github.com/kissik/db_course_tic_tac_toe/blob/70401b3fe91dca7ab4a41dd00796b1e4aa172a1a/src/main/resources/db/migration/V1.0__init.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE ACCOUNT (
  id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  username VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  CONSTRAINT pk_account_id PRIMARY KEY (id)
);

CREATE TABLE GAME (
  id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  game_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  screen BLOB,
  CONSTRAINT pk_game_id PRIMARY KEY (id)
);

CREATE TABLE GAME_SESSION (
  game_id BIGINT UNSIGNED NOT NULL,
  account_id BIGINT UNSIGNED NOT NULL,
  result ENUM('WIN', 'LOSE', 'DRAW'),
  CONSTRAINT pk_game_session PRIMARY KEY (game_id, account_id)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE GAME_SESSION ADD CONSTRAINT
  fk_game_session_game FOREIGN KEY (game_id)
  REFERENCES GAME(id);

ALTER TABLE GAME_SESSION ADD CONSTRAINT
  fk_game_session_account FOREIGN KEY (account_id)
  REFERENCES ACCOUNT(id);

