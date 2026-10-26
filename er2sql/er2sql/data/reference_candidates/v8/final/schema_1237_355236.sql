-- Source: https://github.com/Swapdev/supplier/blob/96bb0c542b53eeec7a7d607346429f9901e88afc/test_jumla.sql?raw=true
-- Tables detected: 35 | FK constraints: 13
CREATE TABLE attributes (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    type varchar(191) NOT NULL,
    description TEXT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE brands (
    id BIGINT NOT NULL,
    name varchar(191) DEFAULT NULL,
    slug varchar(191) DEFAULT NULL,
    image varchar(191) DEFAULT NULL,
    featured int DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE categories (
    id BIGINT NOT NULL,
    parent_id BIGINT DEFAULT NULL,
    "order" int NOT NULL DEFAULT '1',
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE category (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    parent int DEFAULT NULL,
    featured int DEFAULT NULL,
    image varchar(191) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE category_product (
    id BIGINT NOT NULL,
    product_id BIGINT DEFAULT NULL,
    category_id BIGINT DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE coupons (
    id BIGINT NOT NULL,
    code varchar(191) NOT NULL,
    type varchar(191) NOT NULL,
    value int DEFAULT NULL,
    percent_off int DEFAULT NULL,
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
    details text,
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
CREATE TABLE orders (
    id BIGINT NOT NULL,
    user_id BIGINT DEFAULT NULL,
    billing_email varchar(191) NOT NULL,
    billing_name varchar(191) NOT NULL,
    billing_address varchar(191) NOT NULL,
    billing_city varchar(191) NOT NULL,
    billing_province varchar(191) NOT NULL,
    billing_postalcode varchar(191) NOT NULL,
    billing_phone varchar(191) NOT NULL,
    billing_name_on_card varchar(191) NOT NULL,
    billing_discount int NOT NULL DEFAULT '0',
    billing_discount_code varchar(191) DEFAULT NULL,
    billing_subtotal int NOT NULL,
    billing_tax int NOT NULL,
    billing_total int NOT NULL,
    payment_gateway varchar(191) NOT NULL DEFAULT 'stripe',
    shipped SMALLINT NOT NULL DEFAULT '0',
    error varchar(191) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE order_product (
    id BIGINT NOT NULL,
    order_id BIGINT DEFAULT NULL,
    product_id BIGINT DEFAULT NULL,
    quantity BIGINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
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
CREATE TABLE products (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    brand int DEFAULT NULL,
    slug varchar(191) NOT NULL,
    details varchar(191) DEFAULT NULL,
    description text,
    featured SMALLINT NOT NULL DEFAULT '0',
    image varchar(191) DEFAULT NULL,
    images text,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE product_attributes (
    id BIGINT NOT NULL,
    product_id int NOT NULL,
    attribute_key varchar(191) NOT NULL,
    attribute_value varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE product_fields (
    id BIGINT NOT NULL,
    "product-type" varchar(191) NOT NULL,
    key varchar(191) NOT NULL,
    label varchar(191) NOT NULL,
    type varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE product_metas (
    id BIGINT NOT NULL,
    product_id int NOT NULL,
    key varchar(191) NOT NULL,
    value TEXT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE product_variations (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    image varchar(191) DEFAULT NULL,
    quantity varchar(191) DEFAULT NULL,
    product int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE profile_verifications (
    id BIGINT NOT NULL,
    "user" varchar(191) NOT NULL,
    key varchar(191) NOT NULL,
    value varchar(191) NOT NULL,
    code varchar(191) NOT NULL,
    verified varchar(191) NOT NULL DEFAULT 'N',
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
    value text,
    details text,
    type varchar(191) NOT NULL,
    "order" int NOT NULL DEFAULT '1',
    "group" varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE suggested_bussinesses (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    type varchar(191) NOT NULL,
    "user" varchar(191) NOT NULL,
    owned varchar(191) DEFAULT NULL,
    status varchar(191) NOT NULL,
    additional_information TEXT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE suppliers (
    id BIGINT NOT NULL,
    uid int NOT NULL,
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE supplier_fields (
    id BIGINT NOT NULL,
    key varchar(191) NOT NULL,
    label varchar(191) NOT NULL,
    type varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE supplier_metas (
    id BIGINT NOT NULL,
    supplier varchar(191) NOT NULL,
    key varchar(191) NOT NULL,
    value varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE template_parts (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    content TEXT NOT NULL,
    description TEXT NOT NULL,
    slug varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
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
    role_id BIGINT DEFAULT NULL,
    name varchar(191) NOT NULL,
    email varchar(191) NOT NULL,
    phone varchar(191) DEFAULT NULL,
    avatar varchar(191) DEFAULT 'users/default.png',
    password varchar(191) NOT NULL,
    remember_token varchar(100) DEFAULT NULL,
    settings text,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE categories ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES categories (id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE category_product ADD CONSTRAINT category_product_category_id_foreign FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE;
ALTER TABLE category_product ADD CONSTRAINT category_product_product_id_foreign FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE;
ALTER TABLE data_rows ADD CONSTRAINT data_rows_data_type_id_foreign FOREIGN KEY (data_type_id) REFERENCES data_types (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE menu_items ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES menus (id) ON DELETE CASCADE;
ALTER TABLE orders ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE order_product ADD CONSTRAINT order_product_order_id_foreign FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE order_product ADD CONSTRAINT order_product_product_id_foreign FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE users ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id);
ALTER TABLE user_roles ADD CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE user_roles ADD CONSTRAINT user_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
