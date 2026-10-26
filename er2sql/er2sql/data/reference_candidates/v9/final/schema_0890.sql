-- Source: https://github.com/nctri0110php/shopbanbanh/blob/0a00fdb59b741377d82733829c9f554861c2c505/shop_banh/public/template/db_banhang.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 1
-- Foreign keys added via ALTER TABLE:
CREATE TABLE bills (
    id BIGINT NOT NULL,
    id_customer int DEFAULT NULL,
    date_order date DEFAULT NULL,
    total float DEFAULT NULL ,
    payment varchar(200) CHARACTER SET utf8 DEFAULT NULL ,
    note varchar(500) CHARACTER SET utf8 DEFAULT NULL,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bill_detail (
    id BIGINT NOT NULL,
    id_bill int NOT NULL,
    id_product int NOT NULL,
    quantity int NOT NULL ,
    unit_price DOUBLE PRECISION NOT NULL,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

CREATE TABLE customer (
    id BIGINT NOT NULL,
    name varchar(100) NOT NULL,
    gender varchar(10) NOT NULL,
    email varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    phone_number varchar(20) NOT NULL,
    note varchar(200) NOT NULL,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE news (
    id int NOT NULL,
    title varchar(200) CHARACTER SET utf8 NOT NULL ,
    content text CHARACTER SET utf8 NOT NULL ,
    image varchar(100) CHARACTER SET utf8 NOT NULL ,
    create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

CREATE TABLE products (
    id BIGINT NOT NULL,
    name varchar(100) DEFAULT NULL,
    id_type BIGINT DEFAULT NULL,
    description text,
    unit_price float DEFAULT NULL,
    promotion_price float DEFAULT NULL,
    image varchar(255) DEFAULT NULL,
    unit varchar(255) DEFAULT NULL,
    new SMALLINT DEFAULT '0',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE slide (
    id int NOT NULL,
    link varchar(100) NOT NULL,
    image varchar(100) NOT NULL
);

CREATE TABLE type_products (
    id BIGINT NOT NULL,
    name varchar(100) NOT NULL,
    description text NOT NULL,
    image varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE users (
    id BIGINT NOT NULL,
    full_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    phone varchar(20) DEFAULT NULL,
    address varchar(255) DEFAULT NULL,
    remember_token varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


                          

ALTER TABLE products
  ADD CONSTRAINT products_id_type_foreign FOREIGN KEY (id_type) REFERENCES type_products (id);
COMMENT ON COLUMN bills.total IS 'tổng tiền';
COMMENT ON COLUMN bills.payment IS 'hình thức thanh toán';
COMMENT ON COLUMN bill_detail.quantity IS 'số lượng';
COMMENT ON COLUMN news.title IS 'tiêu đề';
COMMENT ON COLUMN news.content IS 'nội dung';
COMMENT ON COLUMN news.image IS 'hình';
