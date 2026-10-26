-- Source: https://github.com/DavidIvanov02/Atlas-Service-Managment/blob/59164802bc8a87c92a72136a6dd63198dfb483ba/database/atlas_service_management.sql?raw=true
-- Tables detected: 13 | FK/REFERENCES mentions: 10
CREATE TABLE charts (
    id NUMERIC NOT NULL,
    name varchar(50) NOT NULL,
    description varchar(500) NOT NULL,
    tag varchar(50) NOT NULL,
    data_link varchar(500) NOT NULL,
    grafana_link varchar(500) NOT NULL,
    image_link varchar(500) NOT NULL,
    value_type varchar(255) NOT NULL
);
CREATE TABLE failed_jobs (
    id NUMERIC NOT NULL,
    uuid varchar(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload TEXT NOT NULL,
    exception TEXT NOT NULL,
    failed_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE incidents (
    id NUMERIC NOT NULL,
    number int NOT NULL DEFAULT 10000,
    category_id NUMERIC NOT NULL,
    state varchar(255) NOT NULL,
    impact varchar(255) NOT NULL,
    urgency varchar(255) NOT NULL,
    priority varchar(255) NOT NULL,
    short_description varchar(255) NOT NULL,
    description text DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE incident_user (
    id NUMERIC NOT NULL,
    incident_id NUMERIC NOT NULL,
    caller_id NUMERIC NOT NULL,
    executor_id NUMERIC NOT NULL,
    model_from varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE migrations (
    id BIGINT NOT NULL,
    migration varchar(255) NOT NULL,
    batch int NOT NULL
);
CREATE TABLE model_has_roles (
    role_id NUMERIC NOT NULL,
    model_type varchar(255) NOT NULL,
    model_id NUMERIC NOT NULL,
    model_from varchar(255) NOT NULL
);
CREATE TABLE password_resets (
    email varchar(255) NOT NULL,
    token varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL
);
CREATE TABLE roles (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    description text NOT NULL,
    guard_name varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE teams (
    id NUMERIC NOT NULL,
    owner_id NUMERIC NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    image varchar(255) NOT NULL DEFAULT 'default.png',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE team_incident (
    id NUMERIC NOT NULL,
    team_id NUMERIC NOT NULL,
    incident_id NUMERIC NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE team_role (
    id NUMERIC NOT NULL,
    team_id NUMERIC NOT NULL,
    role_id NUMERIC NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE team_user (
    id NUMERIC NOT NULL,
    team_id NUMERIC NOT NULL,
    user_id NUMERIC NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE users (
    id NUMERIC NOT NULL,
    first_name varchar(50) NOT NULL,
    middle_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    avatar varchar(255) NOT NULL DEFAULT 'default.png',
    token varchar(255) NOT NULL,
    description varchar(255) DEFAULT NULL,
    city varchar(255) DEFAULT NULL,
    country varchar(255) DEFAULT NULL,
    last_login_ip varchar(255) DEFAULT NULL,
    last_login_at TIMESTAMP DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
ALTER TABLE incidents ADD CONSTRAINT incidents_category_id_foreign FOREIGN KEY (category_id) REFERENCES charts (id);
ALTER TABLE incident_user ADD CONSTRAINT incident_user_caller_id_foreign FOREIGN KEY (caller_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE incident_user ADD CONSTRAINT incident_user_executor_id_foreign FOREIGN KEY (executor_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE incident_user ADD CONSTRAINT incident_user_incident_id_foreign FOREIGN KEY (incident_id) REFERENCES incidents (id) ON DELETE CASCADE;
ALTER TABLE model_has_roles ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE team_incident ADD CONSTRAINT team_incident_incident_id_foreign FOREIGN KEY (incident_id) REFERENCES incidents (id) ON DELETE CASCADE;
ALTER TABLE team_incident ADD CONSTRAINT team_incident_team_id_foreign FOREIGN KEY (team_id) REFERENCES teams (id) ON DELETE CASCADE;
ALTER TABLE team_role ADD CONSTRAINT team_role_team_id_foreign FOREIGN KEY (team_id) REFERENCES teams (id) ON DELETE CASCADE;
ALTER TABLE team_user ADD CONSTRAINT team_user_team_id_foreign FOREIGN KEY (team_id) REFERENCES teams (id) ON DELETE CASCADE;
ALTER TABLE team_user ADD CONSTRAINT team_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id);
