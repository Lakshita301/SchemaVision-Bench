-- Source: https://github.com/persiatc/persiaShop/blob/85d69caf49612355c713278ea3f86e9c6bbb3b8f/DB/file.sql?raw=true
-- Tables detected: 30 | FK/REFERENCES mentions: 22
CREATE TABLE articles (
    id int NOT NULL,
    user_id int NOT NULL,
    demo text NOT NULL,
    file_id int NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE baskets (
    id int NOT NULL,
    user_id int NOT NULL,
    product_id int NOT NULL,
    price int NOT NULL,
    status char(1) DEFAULT '0',
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE categories (
    id int NOT NULL,
    chid int NOT NULL DEFAULT 0,
    fa_name varchar(100) NOT NULL,
    en_name varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    image varchar(100) NOT NULL
);
CREATE TABLE comments (
    id NUMERIC NOT NULL,
    commentable_id NUMERIC NOT NULL,
    commentable_type varchar(100) NOT NULL,
    user_id NUMERIC NOT NULL,
    status varchar(50) NOT NULL,
    comment varchar(300) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE contacts (
    id NUMERIC NOT NULL,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    subject varchar(200) NOT NULL,
    content varchar(300) NOT NULL,
    status int NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE factors (
    id int NOT NULL,
    user_id int NOT NULL,
    sum int NOT NULL,
    status char(1) DEFAULT '0',
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE factor_product (
    factor_id int NOT NULL,
    product_id int NOT NULL
);
CREATE TABLE failed_jobs (
    id NUMERIC NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload TEXT NOT NULL,
    exception TEXT NOT NULL,
    failed_at timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE favorites (
    id int NOT NULL,
    user_id int NOT NULL,
    product_id int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
CREATE TABLE files (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    file varchar(100) NOT NULL
);
CREATE TABLE genders (
    id int NOT NULL,
    fa_name varchar(100) NOT NULL,
    en_name varchar(100) DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE migrations (
    id BIGINT NOT NULL,
    migration varchar(255) NOT NULL,
    batch int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE password_resets (
    email varchar(255) NOT NULL,
    token varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE payments (
    id int NOT NULL,
    factor_id int NOT NULL,
    trackingcode int NOT NULL,
    status char(1) DEFAULT '0',
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE permissions (
    id int NOT NULL,
    fa_name varchar(100) NOT NULL,
    en_name varchar(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE permission_role (
    permission_id int NOT NULL,
    role_id int NOT NULL
);
CREATE TABLE photos (
    id NUMERIC NOT NULL,
    path varchar(100) NOT NULL,
    photoable_id int NOT NULL,
    photoable_type varchar(100) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE posts (
    id NUMERIC NOT NULL,
    user_id int NOT NULL,
    title varchar(200) NOT NULL,
    description TEXT NOT NULL,
    image varchar(200) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE producers (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE products (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    producer_id int NOT NULL,
    category_id int NOT NULL,
    type_id int NOT NULL DEFAULT 1,
    price int NOT NULL,
    status char(1) NOT NULL DEFAULT '1',
    special char(1) DEFAULT '0',
    sales_number int NOT NULL DEFAULT 0,
    discount int DEFAULT 0,
    image varchar(100) NOT NULL,
    file varchar(100) NOT NULL,
    body text DEFAULT NULL,
    download_number int DEFAULT 0,
    click_number int DEFAULT 0,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE ratings (
    id BIGINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    rating int NOT NULL,
    rateable_type varchar(255) NOT NULL,
    rateable_id NUMERIC NOT NULL,
    user_id int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE roles (
    id int NOT NULL,
    fa_name varchar(100) DEFAULT NULL,
    en_name varchar(100) DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE role_user (
    role_id int NOT NULL,
    user_id int NOT NULL
);
CREATE TABLE sliderparents (
    id int NOT NULL,
    fa_name varchar(100) DEFAULT NULL,
    en_name varchar(100) DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);
CREATE TABLE sliders (
    id int NOT NULL,
    url varchar(100) DEFAULT NULL,
    sliderparent_id int NOT NULL,
    title varchar(100) DEFAULT NULL,
    image varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE supports (
    id int NOT NULL,
    user_id int NOT NULL,
    subject varchar(100) DEFAULT NULL,
    content text NOT NULL,
    status int NOT NULL DEFAULT 0,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
CREATE TABLE taggables (
    id int NOT NULL,
    tag_id int NOT NULL,
    taggable_id int NOT NULL,
    taggable_type varchar(100) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE tags (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE types (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp()(),
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE users (
    id int NOT NULL,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    image varchar(100) DEFAULT NULL,
    email_verified_at timestamp NULL DEFAULT NULL,
    password varchar(100) NOT NULL,
    remember_token varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    gender_id int DEFAULT NULL,
    lastlogin timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE articles ADD CONSTRAINT fk_articles_files FOREIGN KEY (file_id) REFERENCES files (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE articles ADD CONSTRAINT fk_articles_users_0 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE baskets ADD CONSTRAINT fk_basket_products FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE baskets ADD CONSTRAINT fk_baskets_users_0 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE factors ADD CONSTRAINT fk_factors_users_0 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE factor_product ADD CONSTRAINT fk_factor_product_factors FOREIGN KEY (factor_id) REFERENCES factors (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE factor_product ADD CONSTRAINT fk_factor_product_products FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT fk_favorites_products FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE favorites ADD CONSTRAINT fk_favorites_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE payments ADD CONSTRAINT fk_payments_factors FOREIGN KEY (factor_id) REFERENCES factors (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT fk_permission_role_permissions FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT fk_permission_role_roles FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE posts ADD CONSTRAINT fk_posts_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE products ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE products ADD CONSTRAINT fk_products_producers FOREIGN KEY (producer_id) REFERENCES producers (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE products ADD CONSTRAINT fk_products_types FOREIGN KEY (type_id) REFERENCES types (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ratings ADD CONSTRAINT ratings_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE role_user ADD CONSTRAINT fk_role_user_roles FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE role_user ADD CONSTRAINT fk_role_user_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE sliders ADD CONSTRAINT fk_sliders_slider_parents FOREIGN KEY (sliderparent_id) REFERENCES sliderparents (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE supports ADD CONSTRAINT fk_supports_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE users ADD CONSTRAINT fk_users_genders FOREIGN KEY (gender_id) REFERENCES genders (id) ON DELETE CASCADE ON UPDATE CASCADE;
