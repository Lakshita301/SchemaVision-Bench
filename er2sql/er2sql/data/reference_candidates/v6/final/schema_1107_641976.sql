-- Source: https://github.com/RachaelSmethills/Restauraunt/blob/cce068d04cf7ed1c296ecf66b4ac1f50da62e8c8/SQL/testscript.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE restauraunts(
    id INTEGER PRIMARY KEY, 
    name Text,
    image TEXT
);

CREATE TABLE menus(
    id INTEGER PRIMARY KEY, 
    title Text,
    restaurauntId INTEGER,
    FOREIGN KEY(restaurauntId) REFERENCES restauraunts(id)
);

CREATE TABLE items(
    id INTEGER PRIMARY KEY, 
    name Text,
    price DECIMAL,
    menuId INTEGER,
    FOREIGN KEY(menuId) REFERENCES menus(id)
);

