-- Source: https://github.com/sharadvats/st3-backend/blob/2b11ea260ceb03626edb70fcd53fdb720c9d8c38/src/main/resources/db/initDB_postgres.sql?raw=true
-- Tables detected: 4 | FK constraints: 2

CREATE TABLE users
(
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  name        VARCHAR NOT NULL,
  surName     VARCHAR NOT NULL,
  phonenumber VARCHAR NOT NULL,
  homeNumber  VARCHAR,
  address     VARCHAR,
  email       VARCHAR,
  password    VARCHAR NOT NULL
);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role    VARCHAR,
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE persistent_logins (
  username  VARCHAR(64) NOT NULL,
  series    VARCHAR(64) PRIMARY KEY,
  token     VARCHAR(64) NOT NULL,
  last_used TIMESTAMP   NOT NULL
);

CREATE TABLE user_records
(
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  name        VARCHAR NOT NULL,
  surName     VARCHAR NOT NULL,
  phonenumber VARCHAR NOT NULL,
  email       VARCHAR,
  user_id     INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

