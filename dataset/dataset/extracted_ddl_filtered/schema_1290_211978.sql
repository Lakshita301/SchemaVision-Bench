-- Source: https://github.com/BLE-LAN/ListADV/blob/50fb30fd8e00f5b50f2f5d72ee65f62b6d38e0b5/listadv/schema.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

CREATE TABLE device (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  address TEXT UNIQUE NOT NULL,
  advtype TEXT NOT NULL,
  rssi INTEGER NOT NULL,
  timestamp TEXT NOT NULL
);

CREATE TABLE datatype (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  device INTEGER NOT NULL,
  type TEXT NOT NULL, 
  raw TEXT NOT NULL,
  FOREIGN KEY(device) REFERENCES device(id)
);

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  token TEXT UNIQUE
);

