-- Source: https://github.com/forderation/nest-bot/blob/c227aec030bf7af0077593b4c49e2b569276c8aa/nest-bot-dev.sql?raw=true
-- Tables detected: 7 | FK constraints: 6
CREATE TABLE employees (
    id NUMERIC NOT NULL,
    telegram_user_name varchar(255) NOT NULL,
    full_name varchar(255) DEFAULT NULL,
    telegram_user_id NUMERIC DEFAULT NULL,
    team_leader_id NUMERIC DEFAULT NULL,
    nik NUMERIC NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE jenis_products (
    id NUMERIC NOT NULL,
    jenis_name text NOT NULL,
    reminder int NOT NULL,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE merk_products (
    id NUMERIC NOT NULL,
    merk_name text NOT NULL,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE migrations (
    id BIGINT NOT NULL,
    migration varchar(255) NOT NULL,
    batch int NOT NULL
);
CREATE TABLE position_products (
    id NUMERIC NOT NULL,
    new_update SMALLINT NOT NULL,
    picture_loc text DEFAULT NULL,
    employee_id NUMERIC NOT NULL,
    approve_id NUMERIC DEFAULT NULL,
    product_id NUMERIC NOT NULL,
    approve_state TEXT NOT NULL CHECK (approve_state IN ('approved', 'disagree', 'waiting')),
    product_state TEXT NOT NULL CHECK (product_state IN ('baik', 'dikembalikan', 'rusak', 'belum_melaporkan', 'hilang')),
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products (
    id NUMERIC NOT NULL,
    serial_number text NOT NULL,
    product_name text NOT NULL,
    merk_id NUMERIC NOT NULL,
    jenis_id NUMERIC NOT NULL,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE reminder_groups (
    id NUMERIC NOT NULL,
    group_id bigint NOT NULL,
    last_known_group_name text DEFAULT NULL,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE employees ADD CONSTRAINT employees_team_leader_id_foreign FOREIGN KEY (team_leader_id) REFERENCES employees (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE position_products ADD CONSTRAINT position_products_approve_id_foreign FOREIGN KEY (approve_id) REFERENCES employees (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE position_products ADD CONSTRAINT position_products_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES employees (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE position_products ADD CONSTRAINT position_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE products ADD CONSTRAINT products_jenis_id_foreign FOREIGN KEY (jenis_id) REFERENCES jenis_products (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE products ADD CONSTRAINT products_merk_id_foreign FOREIGN KEY (merk_id) REFERENCES merk_products (id) ON DELETE CASCADE ON UPDATE CASCADE;
