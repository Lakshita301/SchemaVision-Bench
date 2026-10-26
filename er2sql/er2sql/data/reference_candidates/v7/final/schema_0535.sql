-- Source: https://github.com/AAJoelle/designproject/blob/1bb3ea62352ca3967762944721cbec56d1c2ddc5/eduplus%20(1).sql?raw=true
-- Tables detected: 21 | FK/REFERENCES mentions: 10
CREATE TABLE categories (
    id BIGINT NOT NULL,
    parent_id BIGINT DEFAULT NULL,
    "order" int NOT NULL DEFAULT '1',
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE courses (
    id BIGINT NOT NULL,
    course_code varchar(6) NOT NULL,
    course_name varchar(191) NOT NULL,
    level_id BIGINT NOT NULL,
    faculty_id BIGINT NOT NULL,
    department_id BIGINT DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE data_rows (
    id BIGINT NOT NULL,
    data_type_id BIGINT NOT NULL,
    field varchar(191) NOT NULL,
    type varchar(191) NOT NULL,
    display_name varchar(191) NOT NULL,
    required SMALLINT NOT NULL DEFAULT '0',
    browse SMALLINT NOT NULL DEFAULT '1',
    read SMALLINT NOT NULL DEFAULT '1',
    edit SMALLINT NOT NULL DEFAULT '1',
    add SMALLINT NOT NULL DEFAULT '1',
    delete SMALLINT NOT NULL DEFAULT '1',
    details text,
    "order" int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE data_types (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    display_name_singular varchar(191) NOT NULL,
    display_name_plural varchar(191) NOT NULL,
    icon varchar(191) DEFAULT NULL,
    model_name varchar(191) DEFAULT NULL,
    policy_name varchar(191) DEFAULT NULL,
    controller varchar(191) DEFAULT NULL,
    description varchar(191) DEFAULT NULL,
    generate_permissions SMALLINT NOT NULL DEFAULT '0',
    server_side SMALLINT NOT NULL DEFAULT '0',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE departments (
    id BIGINT NOT NULL,
    faculty_id BIGINT NOT NULL,
    department_name varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE faculties (
    id BIGINT NOT NULL,
    faculty_abbreviation varchar(191) NOT NULL,
    faculty_name varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE levels (
    id BIGINT NOT NULL,
    level BIGINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE materials (
    id BIGINT NOT NULL,
    material_name varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE menus (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE menu_items (
    id BIGINT NOT NULL,
    menu_id BIGINT DEFAULT NULL,
    title varchar(191) NOT NULL,
    url varchar(191) NOT NULL,
    target varchar(191) NOT NULL DEFAULT '_self',
    icon_class varchar(191) DEFAULT NULL,
    color varchar(191) DEFAULT NULL,
    parent_id int DEFAULT NULL,
    "order" int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    route varchar(191) DEFAULT NULL,
    parameters text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE migrations (
    id BIGINT NOT NULL,
    migration varchar(191) NOT NULL,
    batch int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE pages (
    id BIGINT NOT NULL,
    author_id int NOT NULL,
    title varchar(191) NOT NULL,
    excerpt text,
    body text,
    image varchar(191) DEFAULT NULL,
    slug varchar(191) NOT NULL,
    meta_description text,
    meta_keywords text,
    status TEXT NOT NULL DEFAULT 'INACTIVE' CHECK (status IN ('ACTIVE', 'INACTIVE')),
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE password_resets (
    email varchar(191) NOT NULL,
    token varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE permissions (
    id BIGINT NOT NULL,
    key varchar(191) NOT NULL,
    table_name varchar(191) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    permission_group_id BIGINT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE permission_groups (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE permission_role (
    permission_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE posts (
    id BIGINT NOT NULL,
    author_id int NOT NULL,
    category_id int DEFAULT NULL,
    course_id BIGINT NOT NULL,
    material_id BIGINT NOT NULL,
    academic_year varchar(4) NOT NULL,
    title varchar(191) NOT NULL,
    seo_title varchar(191) DEFAULT NULL,
    excerpt text,
    body text NOT NULL,
    image varchar(191) DEFAULT NULL,
    slug varchar(191) NOT NULL,
    meta_description text,
    meta_keywords text,
    status TEXT NOT NULL DEFAULT 'DRAFT' CHECK (status IN ('PUBLISHED', 'DRAFT', 'PENDING')),
    featured SMALLINT NOT NULL DEFAULT '0',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE roles (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    display_name varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE settings (
    id BIGINT NOT NULL,
    key varchar(191) NOT NULL,
    display_name varchar(191) NOT NULL,
    value text NOT NULL,
    details text,
    type varchar(191) NOT NULL,
    "order" int NOT NULL DEFAULT '1',
    "group" varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE translations (
    id BIGINT NOT NULL,
    table_name varchar(191) NOT NULL,
    column_name varchar(191) NOT NULL,
    foreign_key BIGINT NOT NULL,
    locale varchar(191) NOT NULL,
    value text NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE users (
    id BIGINT NOT NULL,
    role_id int DEFAULT NULL,
    name varchar(191) NOT NULL,
    email varchar(191) NOT NULL,
    avatar varchar(191) DEFAULT 'users/default.png',
    password varchar(191) NOT NULL,
    remember_token varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE courses
  ADD CONSTRAINT courses_department_id_foreign FOREIGN KEY (department_id) REFERENCES departments (id),
  ADD CONSTRAINT courses_faculty_id_foreign FOREIGN KEY (faculty_id) REFERENCES faculties (id),
  ADD CONSTRAINT courses_level_id_foreign FOREIGN KEY (level_id) REFERENCES levels (id);
ALTER TABLE permission_role
  ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE,
  ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE categories ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES categories (id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE courses ADD CONSTRAINT courses_department_id_foreign FOREIGN KEY (department_id) REFERENCES departments (id);
ALTER TABLE data_rows ADD CONSTRAINT data_rows_data_type_id_foreign FOREIGN KEY (data_type_id) REFERENCES data_types (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE departments ADD CONSTRAINT departments_faculty_id_foreign FOREIGN KEY (faculty_id) REFERENCES faculties (id);
ALTER TABLE menu_items ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES menus (id) ON DELETE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE;
ALTER TABLE posts ADD CONSTRAINT posts_ibfk_1 FOREIGN KEY (course_id) REFERENCES courses (id);
