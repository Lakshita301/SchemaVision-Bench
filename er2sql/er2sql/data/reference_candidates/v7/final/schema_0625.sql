-- Source: https://github.com/am1n7/setram/blob/ff6468b5949aa0acc36f9628d3a32ac0860d166a/ticket.sql?raw=true
-- Tables detected: 20 | FK/REFERENCES mentions: 10
CREATE TABLE categories (
    id BIGINT NOT NULL,
    parent_id BIGINT DEFAULT NULL,
    "order" int NOT NULL DEFAULT 1,
    name varchar(255) NOT NULL,
    slug varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE data_rows (
    id BIGINT NOT NULL,
    data_type_id BIGINT NOT NULL,
    field varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    display_name varchar(255) NOT NULL,
    required SMALLINT NOT NULL DEFAULT 0,
    browse SMALLINT NOT NULL DEFAULT 1,
    read SMALLINT NOT NULL DEFAULT 1,
    edit SMALLINT NOT NULL DEFAULT 1,
    add SMALLINT NOT NULL DEFAULT 1,
    delete SMALLINT NOT NULL DEFAULT 1,
    details text DEFAULT NULL,
    "order" int NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE data_types (
    id BIGINT NOT NULL,
    name varchar(255) NOT NULL,
    slug varchar(255) NOT NULL,
    display_name_singular varchar(255) NOT NULL,
    display_name_plural varchar(255) NOT NULL,
    icon varchar(255) DEFAULT NULL,
    model_name varchar(255) DEFAULT NULL,
    policy_name varchar(255) DEFAULT NULL,
    controller varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    generate_permissions SMALLINT NOT NULL DEFAULT 0,
    server_side SMALLINT NOT NULL DEFAULT 0,
    details text DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE failed_jobs (
    id NUMERIC NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload TEXT NOT NULL,
    exception TEXT NOT NULL,
    failed_at timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE menus (
    id BIGINT NOT NULL,
    name varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE menu_items (
    id BIGINT NOT NULL,
    menu_id BIGINT DEFAULT NULL,
    title varchar(255) NOT NULL,
    url varchar(255) NOT NULL,
    target varchar(255) NOT NULL DEFAULT '_self',
    icon_class varchar(255) DEFAULT NULL,
    color varchar(255) DEFAULT NULL,
    parent_id int DEFAULT NULL,
    "order" int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    route varchar(255) DEFAULT NULL,
    parameters text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE migrations (
    id BIGINT NOT NULL,
    migration varchar(255) NOT NULL,
    batch int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE orders (
    id NUMERIC NOT NULL,
    ticket_id NUMERIC NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    quantity int NOT NULL,
    payment TEXT NOT NULL DEFAULT 'pending' CHECK (payment IN ('pending', 'success', 'error')),
    paypal_token varchar(255) DEFAULT NULL,
    total varchar(255) NOT NULL,
    invoice varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    duration int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE pages (
    id BIGINT NOT NULL,
    author_id int NOT NULL,
    title varchar(255) NOT NULL,
    excerpt text DEFAULT NULL,
    body text DEFAULT NULL,
    image varchar(255) DEFAULT NULL,
    slug varchar(255) NOT NULL,
    meta_description text DEFAULT NULL,
    meta_keywords text DEFAULT NULL,
    status TEXT NOT NULL DEFAULT 'INACTIVE' CHECK (status IN ('ACTIVE', 'INACTIVE')),
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE password_resets (
    email varchar(255) NOT NULL,
    token varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE permissions (
    id NUMERIC NOT NULL,
    key varchar(255) NOT NULL,
    table_name varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE permission_role (
    permission_id NUMERIC NOT NULL,
    role_id NUMERIC NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE plans (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    price varchar(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    duration varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE posts (
    id BIGINT NOT NULL,
    author_id int NOT NULL,
    category_id int DEFAULT NULL,
    title varchar(255) NOT NULL,
    seo_title varchar(255) DEFAULT NULL,
    excerpt text DEFAULT NULL,
    body text NOT NULL,
    image varchar(255) DEFAULT NULL,
    slug varchar(255) NOT NULL,
    meta_description text DEFAULT NULL,
    meta_keywords text DEFAULT NULL,
    status TEXT NOT NULL DEFAULT 'DRAFT' CHECK (status IN ('PUBLISHED', 'DRAFT', 'PENDING')),
    featured SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE roles (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    display_name varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE settings (
    id BIGINT NOT NULL,
    key varchar(255) NOT NULL,
    display_name varchar(255) NOT NULL,
    value text DEFAULT NULL,
    details text DEFAULT NULL,
    type varchar(255) NOT NULL,
    "order" int NOT NULL DEFAULT 1,
    "group" varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE tickets (
    id NUMERIC NOT NULL,
    name varchar(255) NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    description text DEFAULT NULL,
    stock int DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE translations (
    id BIGINT NOT NULL,
    table_name varchar(255) NOT NULL,
    column_name varchar(255) NOT NULL,
    foreign_key BIGINT NOT NULL,
    locale varchar(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE users (
    id NUMERIC NOT NULL,
    role_id NUMERIC DEFAULT NULL,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    avatar varchar(255) DEFAULT 'users/default.png',
    email_verified_at timestamp NULL DEFAULT NULL,
    password varchar(255) NOT NULL,
    remember_token varchar(100) DEFAULT NULL,
    settings text DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    plan_id NUMERIC DEFAULT NULL,
    subscription date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE user_roles (
    user_id NUMERIC NOT NULL,
    role_id NUMERIC NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE permission_role
  ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE,
  ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE users
  ADD CONSTRAINT users_plan_id_foreign FOREIGN KEY (plan_id) REFERENCES plans (id) ON DELETE CASCADE,
  ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id);
ALTER TABLE user_roles
  ADD CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
  ADD CONSTRAINT user_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE categories ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES categories (id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE data_rows ADD CONSTRAINT data_rows_data_type_id_foreign FOREIGN KEY (data_type_id) REFERENCES data_types (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE menu_items ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES menus (id) ON DELETE CASCADE;
ALTER TABLE orders ADD CONSTRAINT orders_ticket_id_foreign FOREIGN KEY (ticket_id) REFERENCES tickets (id) ON DELETE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE;
ALTER TABLE users ADD CONSTRAINT users_plan_id_foreign FOREIGN KEY (plan_id) REFERENCES plans (id) ON DELETE CASCADE;
ALTER TABLE user_roles ADD CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
