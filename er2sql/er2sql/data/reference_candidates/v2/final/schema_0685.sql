-- Source: https://github.com/LCBRU/genvasc_portal/blob/c7d9004c6f7c5e060ea1d7215b4cc7e67a85f298/web/portal/db_upgrade/000006.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4
CREATE TABLE role (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    description VARCHAR(255) NOT NULL
)
;

CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL,
    confirmed_at TIMESTAMP NULL,
    last_login_at TIMESTAMP NULL,
    current_login_at TIMESTAMP NULL,
    last_login_ip VARCHAR(50) NULL,
    current_login_ip VARCHAR(50) NULL,
    login_count INTEGER NULL
)
;

CREATE TABLE roles_users (
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
)
;
