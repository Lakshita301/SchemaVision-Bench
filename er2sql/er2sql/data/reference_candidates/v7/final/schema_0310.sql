-- Source: https://github.com/mamsdiallo/DAND/blob/75f5cc4f4ee521ba4ad90e388b318ee79f8936de/3.DataWrangling/Wrangle%20OpenStreetMap%20Data/SQLite/createOSM_schema.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 8
CREATE TABLE nodes (
    id INT PRIMARY KEY NOT NULL,
    lat REAL,
    lon REAL,
    "user" TEXT,
    uid INT,
    version INT,
    changeset INT,
    timestamp TEXT
);

CREATE TABLE nodes_tags (
    id INT,
    key TEXT,
    value TEXT,
    type TEXT,
    FOREIGN KEY (id) REFERENCES nodes(id)
);

CREATE TABLE ways (
    id INT PRIMARY KEY NOT NULL,
    "user" TEXT,
    uid INT,
    version TEXT,
    changeset INT,
    timestamp TEXT
);

CREATE TABLE ways_tags (
    id INT NOT NULL,
    key TEXT NOT NULL,
    value TEXT NOT NULL,
    type TEXT,
    FOREIGN KEY (id) REFERENCES ways(id)
);

CREATE TABLE ways_nodes (
    id INT NOT NULL,
    node_id INT NOT NULL,
    position INT NOT NULL,
    FOREIGN KEY (id) REFERENCES ways(id),
    FOREIGN KEY (node_id) REFERENCES nodes(id)
);
