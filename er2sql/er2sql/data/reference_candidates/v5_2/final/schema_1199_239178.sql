-- Source: https://github.com/nickzadpratama/CI4-Login/blob/ad4cd87313b90c2ebcc61d5c0b459a06c43c26cf/loginci.sql?raw=true
-- Tables detected: 11 | FK constraints: 7
CREATE TABLE auth_activation_attempts (
    id BIGINT NOT NULL,
    ip_address varchar(255) NOT NULL,
    user_agent varchar(255) NOT NULL,
    token varchar(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL
);
CREATE TABLE auth_groups (
    id BIGINT NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL
);
CREATE TABLE auth_groups_permissions (
    group_id BIGINT NOT NULL DEFAULT 0,
    permission_id BIGINT NOT NULL DEFAULT 0
);
CREATE TABLE auth_groups_users (
    group_id BIGINT NOT NULL DEFAULT 0,
    user_id BIGINT NOT NULL DEFAULT 0
);
CREATE TABLE auth_logins (
    id BIGINT NOT NULL,
    ip_address varchar(255) DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    user_id BIGINT DEFAULT NULL,
    date TIMESTAMP NOT NULL,
    success SMALLINT NOT NULL
);
CREATE TABLE auth_permissions (
    id BIGINT NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL
);
CREATE TABLE auth_reset_attempts (
    id BIGINT NOT NULL,
    email varchar(255) NOT NULL,
    ip_address varchar(255) NOT NULL,
    user_agent varchar(255) NOT NULL,
    token varchar(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL
);
CREATE TABLE auth_tokens (
    id BIGINT NOT NULL,
    selector varchar(255) NOT NULL,
    hashedvalidator varchar(255) NOT NULL,
    user_id BIGINT NOT NULL,
    expires TIMESTAMP NOT NULL
);
CREATE TABLE auth_users_permissions (
    user_id BIGINT NOT NULL DEFAULT 0,
    permission_id BIGINT NOT NULL DEFAULT 0
);
CREATE TABLE migrations (
    id NUMERIC NOT NULL,
    version varchar(255) NOT NULL,
    class varchar(255) NOT NULL,
    "group" varchar(255) NOT NULL,
    namespace varchar(255) NOT NULL,
    time int NOT NULL,
    batch BIGINT NOT NULL
);
CREATE TABLE users (
    id BIGINT NOT NULL,
    email varchar(255) NOT NULL,
    username varchar(30) DEFAULT NULL,
    password_hash varchar(255) NOT NULL,
    reset_hash varchar(255) DEFAULT NULL,
    reset_at TIMESTAMP DEFAULT NULL,
    reset_expires TIMESTAMP DEFAULT NULL,
    activate_hash varchar(255) DEFAULT NULL,
    status varchar(255) DEFAULT NULL,
    status_message varchar(255) DEFAULT NULL,
    active SMALLINT NOT NULL DEFAULT 0,
    force_pass_reset SMALLINT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT NULL,
    updated_at TIMESTAMP DEFAULT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);
ALTER TABLE auth_groups_permissions ADD CONSTRAINT auth_groups_permissions_group_id_foreign FOREIGN KEY (group_id) REFERENCES auth_groups (id) ON DELETE CASCADE;
ALTER TABLE auth_groups_permissions ADD CONSTRAINT auth_groups_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES auth_permissions (id) ON DELETE CASCADE;
ALTER TABLE auth_groups_users ADD CONSTRAINT auth_groups_users_group_id_foreign FOREIGN KEY (group_id) REFERENCES auth_groups (id) ON DELETE CASCADE;
ALTER TABLE auth_groups_users ADD CONSTRAINT auth_groups_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE auth_tokens ADD CONSTRAINT auth_tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE auth_users_permissions ADD CONSTRAINT auth_users_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES auth_permissions (id) ON DELETE CASCADE;
ALTER TABLE auth_users_permissions ADD CONSTRAINT auth_users_permissions_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
