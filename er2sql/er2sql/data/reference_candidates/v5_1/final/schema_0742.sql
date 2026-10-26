-- Source: https://github.com/WebExpertProDev/Laravel-React-Germany-project/blob/bcc9f09a5d6e450f8f54cb04f95741937e662a40/app2.5.2.sql?raw=true
-- Tables detected: 52 | FK/REFERENCES mentions: 8
CREATE TABLE accept_deliveries (
    id BIGINT NOT NULL,
    order_id int NOT NULL,
    user_id int NOT NULL,
    customer_id int NOT NULL,
    is_complete SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE activity_log (
    id NUMERIC NOT NULL,
    log_name varchar(191) DEFAULT NULL,
    description text NOT NULL,
    subject_id NUMERIC DEFAULT NULL,
    subject_type varchar(191) DEFAULT NULL,
    causer_id NUMERIC DEFAULT NULL,
    causer_type varchar(191) DEFAULT NULL,
    properties text DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE addons (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    price decimal(20,2) NOT NULL,
    addon_category_id int NOT NULL,
    user_id int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    is_active SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE addon_categories (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    type varchar(191) NOT NULL,
    user_id int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    description text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE addon_category_item (
    id BIGINT NOT NULL,
    addon_category_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE addresses (
    id BIGINT NOT NULL,
    user_id int NOT NULL,
    address text DEFAULT NULL,
    house text DEFAULT NULL,
    landmark text DEFAULT NULL,
    tag text DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    latitude varchar(191) DEFAULT NULL,
    longitude varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE alerts (
    id NUMERIC NOT NULL,
    data TEXT DEFAULT NULL,
    user_id bigint DEFAULT NULL,
    is_read SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE coupons (
    id BIGINT NOT NULL,
    name varchar(191) DEFAULT NULL,
    description varchar(191) DEFAULT NULL,
    code varchar(191) NOT NULL,
    discount_type varchar(191) NOT NULL,
    discount varchar(191) NOT NULL,
    expiry_date TIMESTAMP DEFAULT NULL,
    is_active SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    restaurant_id int DEFAULT NULL,
    count int NOT NULL DEFAULT 0,
    max_count int NOT NULL DEFAULT 1,
    min_subtotal decimal(20,2) NOT NULL DEFAULT 0.00,
    max_discount decimal(20,2) DEFAULT NULL,
    subtotal_message varchar(191) DEFAULT NULL,
    user_type varchar(191) DEFAULT 'ALL',
    max_count_per_user int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE coupon_restaurant (
    id BIGINT NOT NULL,
    coupon_id int NOT NULL,
    restaurant_id int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE delivery_collections (
    id BIGINT NOT NULL,
    user_id int NOT NULL,
    amount decimal(20,2) NOT NULL DEFAULT 0.00,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE delivery_collection_logs (
    id BIGINT NOT NULL,
    delivery_collection_id int NOT NULL,
    amount decimal(20,2) NOT NULL DEFAULT 0.00,
    type varchar(191) DEFAULT NULL,
    message TEXT DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE delivery_guy_details (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    age varchar(191) DEFAULT NULL,
    gender varchar(191) DEFAULT NULL,
    photo varchar(191) DEFAULT NULL,
    description varchar(191) DEFAULT NULL,
    vehicle_number varchar(191) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    commission_rate decimal(8,2) NOT NULL DEFAULT 5.00,
    is_notifiable SMALLINT DEFAULT 0,
    max_accept_delivery_limit int NOT NULL DEFAULT 100,
    delivery_lat varchar(191) DEFAULT NULL,
    delivery_long varchar(191) DEFAULT NULL,
    heading varchar(191) DEFAULT NULL,
    tip_commission_rate decimal(8,2) NOT NULL DEFAULT 100.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE items (
    id BIGINT NOT NULL,
    restaurant_id int NOT NULL,
    item_category_id int NOT NULL,
    name varchar(191) NOT NULL,
    price decimal(20,2) NOT NULL,
    old_price decimal(20,2) NOT NULL DEFAULT 0.00,
    image varchar(191) DEFAULT NULL,
    is_recommended SMALLINT NOT NULL,
    is_popular SMALLINT NOT NULL,
    is_new SMALLINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    "desc" TEXT DEFAULT NULL,
    placeholder_image varchar(191) DEFAULT NULL,
    is_active SMALLINT NOT NULL DEFAULT 1,
    is_veg SMALLINT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE item_categories (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    is_enabled SMALLINT NOT NULL DEFAULT 1,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    user_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE locations (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    description varchar(191) DEFAULT NULL,
    is_popular SMALLINT NOT NULL DEFAULT 0,
    is_active SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE migrations (
    id BIGINT NOT NULL,
    migration varchar(191) NOT NULL,
    batch int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE model_has_permissions (
    permission_id BIGINT NOT NULL,
    model_type varchar(191) NOT NULL,
    model_id NUMERIC NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE model_has_roles (
    role_id BIGINT NOT NULL,
    model_type varchar(191) NOT NULL,
    model_id NUMERIC NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE modules (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    description TEXT NOT NULL,
    version varchar(191) NOT NULL,
    is_active SMALLINT NOT NULL DEFAULT 0,
    is_installed SMALLINT NOT NULL DEFAULT 1,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    short_name varchar(191) NOT NULL,
    code varchar(191) NOT NULL,
    settings_path TEXT DEFAULT NULL,
    update_date TIMESTAMP NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE orderitems (
    id BIGINT NOT NULL,
    order_id int NOT NULL,
    item_id int NOT NULL,
    name varchar(191) NOT NULL,
    quantity int NOT NULL,
    price decimal(20,2) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE orders (
    id BIGINT NOT NULL,
    unique_order_id varchar(191) NOT NULL,
    orderstatus_id int NOT NULL DEFAULT 1,
    user_id int NOT NULL,
    coupon_name varchar(191) DEFAULT NULL,
    location TEXT DEFAULT NULL,
    address varchar(191) NOT NULL,
    tax decimal(20,2) DEFAULT NULL,
    restaurant_charge decimal(20,2) DEFAULT NULL,
    delivery_charge decimal(20,2) DEFAULT NULL,
    total decimal(20,2) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    payment_mode varchar(191) NOT NULL,
    order_comment text DEFAULT NULL,
    restaurant_id int DEFAULT NULL,
    transaction_id text DEFAULT NULL,
    delivery_type int NOT NULL DEFAULT 1,
    payable decimal(20,2) NOT NULL DEFAULT 0.00,
    wallet_amount decimal(8,2) DEFAULT NULL,
    tip_amount decimal(8,2) DEFAULT NULL,
    tax_amount decimal(8,2) DEFAULT NULL,
    coupon_amount decimal(8,2) DEFAULT NULL,
    sub_total decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE orderstatuses (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE order_item_addons (
    id BIGINT NOT NULL,
    orderitem_id int NOT NULL,
    addon_category_name varchar(191) NOT NULL,
    addon_name varchar(191) NOT NULL,
    addon_price decimal(20,2) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE pages (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    body TEXT DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE password_resets (
    email varchar(191) NOT NULL,
    token varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE password_reset_otps (
    id BIGINT NOT NULL,
    user_id int NOT NULL,
    code varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE payment_gateways (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    description TEXT DEFAULT NULL,
    logo varchar(191) DEFAULT NULL,
    is_active SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE payment_gateway_restaurant (
    id BIGINT NOT NULL,
    payment_gateway_id int NOT NULL,
    restaurant_id int NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE permissions (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    guard_name varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE popular_geo_places (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    latitude varchar(191) NOT NULL,
    longitude varchar(191) NOT NULL,
    is_active SMALLINT NOT NULL DEFAULT 1,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE promo_sliders (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    is_active SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    location_id int DEFAULT NULL,
    position_id int NOT NULL DEFAULT 0,
    size int NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE push_tokens (
    id NUMERIC NOT NULL,
    token TEXT NOT NULL,
    status SMALLINT NOT NULL DEFAULT 0,
    is_sent SMALLINT NOT NULL DEFAULT 0,
    is_active SMALLINT NOT NULL DEFAULT 1,
    user_id int DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE ratings (
    id BIGINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    rating int NOT NULL,
    order_id int NOT NULL,
    comment TEXT DEFAULT NULL,
    rateable_type varchar(191) NOT NULL,
    rateable_id NUMERIC NOT NULL,
    user_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE restaurants (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    description varchar(191) DEFAULT NULL,
    location_id varchar(191) DEFAULT NULL,
    image varchar(191) DEFAULT NULL,
    rating varchar(191) DEFAULT NULL,
    delivery_time varchar(191) DEFAULT NULL,
    price_range varchar(191) DEFAULT NULL,
    is_pureveg SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    slug varchar(191) DEFAULT NULL,
    placeholder_image varchar(191) DEFAULT NULL,
    latitude varchar(191) DEFAULT NULL,
    longitude varchar(191) DEFAULT NULL,
    certificate varchar(191) DEFAULT NULL,
    restaurant_charges decimal(20,2) DEFAULT NULL,
    delivery_charges decimal(20,2) DEFAULT NULL,
    address text NOT NULL,
    pincode varchar(191) DEFAULT NULL,
    landmark text DEFAULT NULL,
    sku varchar(191) NOT NULL,
    is_active SMALLINT NOT NULL DEFAULT 0,
    is_accepted SMALLINT NOT NULL DEFAULT 0,
    is_featured SMALLINT NOT NULL DEFAULT 0,
    commission_rate decimal(8,2) NOT NULL DEFAULT 0.00,
    delivery_type int NOT NULL DEFAULT 1,
    delivery_radius decimal(8,2) NOT NULL DEFAULT 10.00,
    delivery_charge_type varchar(191) NOT NULL DEFAULT 'FIXED',
    base_delivery_charge decimal(20,2) DEFAULT NULL,
    base_delivery_distance int DEFAULT NULL,
    extra_delivery_charge decimal(20,2) DEFAULT NULL,
    extra_delivery_distance int DEFAULT NULL,
    min_order_price decimal(20,2) NOT NULL DEFAULT 0.00,
    is_notifiable SMALLINT DEFAULT 0,
    auto_acceptable SMALLINT NOT NULL DEFAULT 0,
    schedule_data TEXT DEFAULT NULL,
    is_schedulable SMALLINT NOT NULL DEFAULT 0,
    order_column int DEFAULT NULL,
    custom_message TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE restaurant_categories (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    is_active SMALLINT NOT NULL DEFAULT 1,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE restaurant_category_restaurant (
    id BIGINT NOT NULL,
    restaurant_category_id BIGINT NOT NULL,
    restaurant_id BIGINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE restaurant_category_sliders (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    image text DEFAULT NULL,
    image_placeholder text DEFAULT NULL,
    categories_ids TEXT NOT NULL,
    is_active SMALLINT NOT NULL DEFAULT 1,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    order_column int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE restaurant_earnings (
    id BIGINT NOT NULL,
    restaurant_id int NOT NULL,
    user_id int DEFAULT NULL,
    amount decimal(20,2) NOT NULL DEFAULT 0.00,
    is_requested SMALLINT NOT NULL DEFAULT 0,
    is_processed SMALLINT NOT NULL DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    restaurant_payout_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE restaurant_payouts (
    id BIGINT NOT NULL,
    restaurant_id int NOT NULL,
    restaurant_earning_id int NOT NULL,
    amount decimal(20,2) NOT NULL,
    status varchar(191) NOT NULL,
    transaction_mode varchar(191) DEFAULT NULL,
    transaction_id TEXT DEFAULT NULL,
    message TEXT DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE restaurant_user (
    id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    restaurant_id BIGINT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE roles (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    guard_name varchar(191) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE role_has_permissions (
    permission_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE settings (
    id BIGINT NOT NULL,
    key varchar(191) NOT NULL,
    value TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE slides (
    id BIGINT NOT NULL,
    promo_slider_id int NOT NULL,
    unique_id varchar(191) DEFAULT NULL,
    name varchar(191) DEFAULT NULL,
    image text DEFAULT NULL,
    image_placeholder text DEFAULT NULL,
    url text DEFAULT NULL,
    is_active SMALLINT NOT NULL DEFAULT 1,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    order_column int DEFAULT NULL,
    model varchar(191) DEFAULT NULL,
    item_id int DEFAULT NULL,
    restaurant_id int DEFAULT NULL,
    is_locationset SMALLINT NOT NULL DEFAULT 0,
    latitude varchar(191) DEFAULT NULL,
    longitude varchar(191) DEFAULT NULL,
    radius varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE sms_gateways (
    id NUMERIC NOT NULL,
    gateway_name varchar(191) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE sms_otps (
    id NUMERIC NOT NULL,
    otp varchar(191) DEFAULT NULL,
    phone varchar(191) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE store_payout_details (
    id BIGINT NOT NULL,
    restaurant_id int NOT NULL,
    data TEXT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE transactions (
    id BIGINT NOT NULL,
    payable_type varchar(191) NOT NULL,
    payable_id NUMERIC NOT NULL,
    wallet_id BIGINT DEFAULT NULL,
    type TEXT NOT NULL CHECK (type IN ('deposit', 'withdraw')),
    amount bigint NOT NULL,
    confirmed SMALLINT NOT NULL,
    meta TEXT DEFAULT NULL CHECK (json_valid(meta)),
    uuid char(36) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE transfers (
    id BIGINT NOT NULL,
    from_type varchar(191) NOT NULL,
    from_id NUMERIC NOT NULL,
    to_type varchar(191) NOT NULL,
    to_id NUMERIC NOT NULL,
    status TEXT NOT NULL DEFAULT 'transfer' CHECK (status IN ('exchange', 'transfer', 'paid', 'refund', 'gift')),
    status_last TEXT DEFAULT NULL CHECK (status_last IN ('exchange', 'transfer', 'paid', 'refund', 'gift')),
    deposit_id BIGINT NOT NULL,
    withdraw_id BIGINT NOT NULL,
    discount bigint NOT NULL DEFAULT 0,
    fee bigint NOT NULL DEFAULT 0,
    uuid char(36) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE translations (
    id BIGINT NOT NULL,
    language_name varchar(191) NOT NULL,
    data TEXT NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    is_default SMALLINT NOT NULL DEFAULT 0,
    is_active SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE users (
    id BIGINT NOT NULL,
    name varchar(191) NOT NULL,
    email varchar(191) NOT NULL,
    email_verified_at timestamp NULL DEFAULT NULL,
    password varchar(191) NOT NULL,
    remember_token varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    auth_token TEXT DEFAULT NULL,
    phone varchar(191) DEFAULT NULL,
    default_address_id int DEFAULT 0,
    delivery_pin varchar(191) DEFAULT NULL,
    delivery_guy_detail_id int DEFAULT NULL,
    avatar text DEFAULT NULL,
    is_active SMALLINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE wallets (
    id BIGINT NOT NULL,
    holder_type varchar(191) NOT NULL,
    holder_id NUMERIC NOT NULL,
    name varchar(191) NOT NULL,
    slug varchar(191) NOT NULL,
    description varchar(191) DEFAULT NULL,
    balance bigint NOT NULL DEFAULT 0,
    decimal_places smallint NOT NULL DEFAULT 2,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE model_has_permissions ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE;
ALTER TABLE model_has_roles ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE ratings ADD CONSTRAINT ratings_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE role_has_permissions ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE;
ALTER TABLE role_has_permissions ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
ALTER TABLE transactions ADD CONSTRAINT transactions_wallet_id_foreign FOREIGN KEY (wallet_id) REFERENCES wallets (id) ON DELETE CASCADE;
ALTER TABLE transfers ADD CONSTRAINT transfers_deposit_id_foreign FOREIGN KEY (deposit_id) REFERENCES transactions (id) ON DELETE CASCADE;
ALTER TABLE transfers ADD CONSTRAINT transfers_withdraw_id_foreign FOREIGN KEY (withdraw_id) REFERENCES transactions (id) ON DELETE CASCADE;
