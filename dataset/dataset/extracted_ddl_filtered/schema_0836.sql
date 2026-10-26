-- Source: https://github.com/mephistopheles-8/basicweb-rust-experiments/blob/1eca081adc1ce36be0c3764172eca7fed643b2ba/app-biz/migrations/2020-08-13-224709_create_gallery/up.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE galleries (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    kind INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    uuid BLOB NOT NULL UNIQUE,
    created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE resources (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    filepath TEXT NOT NULL UNIQUE,
    kind INTEGER NOT NULL,
    mime TEXT NOT NULL,
    uuid BLOB NOT NULL UNIQUE,
    created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE gallery_items (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    gallery INTEGER NOT NULL,
    resource INTEGER NOT NULL,
    kind INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    uuid BLOB NOT NULL UNIQUE,
    created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(gallery) REFERENCES galleries(id),
    FOREIGN KEY(resource) REFERENCES resources(id)
);

