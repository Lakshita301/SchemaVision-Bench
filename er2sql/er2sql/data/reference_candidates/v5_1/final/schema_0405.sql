-- Source: https://github.com/VanAnh199/Bao_Cao_Thuc_Tap/blob/0a9265456236d34db9d493ae579fbf151db13bb6/fresher_management.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 4
CREATE TABLE migrations (
    id BIGINT NOT NULL,
    migration varchar(255) NOT NULL,
    batch int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE model_has_permissions (
    permission_id NUMERIC NOT NULL,
    model_type varchar(255) NOT NULL,
    model_id NUMERIC NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE model_has_roles (
    role_id NUMERIC NOT NULL,
    model_type varchar(255) NOT NULL,
    model_id NUMERIC NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE permissions (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    guard_name varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE reports (
    id NUMERIC NOT NULL,
    user_id varchar(255) NOT NULL,
    today_plan text NOT NULL,
    actual text NOT NULL,
    tomorrow_plan text NOT NULL,
    issues text NOT NULL,
    action text NOT NULL,
    note text NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE requests (
    id NUMERIC NOT NULL,
    user_id varchar(255) NOT NULL,
    absence_date TIMESTAMP NOT NULL,
    reason varchar(255) DEFAULT NULL,
    type varchar(255) NOT NULL,
    status varchar(255) NOT NULL DEFAULT 'Pending',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE roles (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    guard_name varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE role_has_permissions (
    permission_id NUMERIC NOT NULL,
    role_id NUMERIC NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE timesheets (
    id NUMERIC NOT NULL,
    user_id int NOT NULL,
    user_name varchar(255) NOT NULL,
    time_in timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    time_out timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE users (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(20) DEFAULT NULL,
    dob date DEFAULT NULL,
    part varchar(255) DEFAULT NULL,
    class varchar(255) DEFAULT NULL,
    img varchar(255) DEFAULT NULL,
    provider_id varchar(255) DEFAULT NULL,
    password varchar(255) DEFAULT NULL,
    remember_token varchar(100) DEFAULT NULL,
    status varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE model_has_permissions ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE;
ALTER TABLE model_has_roles ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE role_has_permissions ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE;
ALTER TABLE role_has_permissions ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
