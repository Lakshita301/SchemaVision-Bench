-- Source: https://github.com/Ludosopher/Service_database_of_rental_housing/blob/524143b31c161a6a2e441f2c4c5d023b935f08d0/create.sql?raw=true
-- Tables detected: 18 | FK constraints: 23

CREATE TABLE users (
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(120) UNIQUE,
password_hash VARCHAR(100) UNIQUE,
wallet DOUBLE(10,2) UNSIGNED COMMENT 'Кошелёк пользователя',
rating DOUBLE(2,1) UNSIGNED COMMENT 'Рейтинг пользователя от 1 до 5',

INDEX users_firstname_lastname_idx(first_name, last_name) 
) COMMENT 'Пользователи - частные лица';

CREATE TABLE rent_apartment_ads (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user BIGINT UNSIGNED NOT NULL,
    head TEXT,
    price FLOAT COMMENT 'Стоимость в месяц',
    deposit TINYINT UNSIGNED COMMENT 'Период предоплаты в месяцах',
    duration TINYINT UNSIGNED COMMENT 'Длительность размещения объявления в сутках',
    is_promotion BIT COMMENT 'Наличие/Отсутсвие дополнительной помощи со стороны ресурса в продвижении объявления',
    payment FLOAT COMMENT 'Сумма заплаченная пользователем ресурсу за объявление'
    
) COMMENT 'Объявления о сдаче жилья в аренду';

CREATE TABLE photos (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_ad BIGINT UNSIGNED NOT NULL,
    filename VARCHAR(255) NOT NULL,
    size INT,
	metadata VARCHAR(50),
    uploaded DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (id_ad) REFERENCES rent_apartment_ads(id)
) COMMENT 'Фотографии пользователей';

CREATE TABLE phones (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user BIGINT UNSIGNED NOT NULL,
    fone_number BIGINT UNSIGNED UNIQUE,
    
    FOREIGN KEY (id_user) REFERENCES users(id)
) COMMENT 'Телефоны пользователей. Их может быть несколько.';

CREATE TABLE profiles (
	id_user BIGINT UNSIGNED NOT NULL UNIQUE,
    gender CHAR(1),
    birthday DATE,
	photo_avatar VARCHAR(255),
    settlement VARCHAR(100) COMMENT 'Насёлённый пункт',
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (id_user) REFERENCES users(id)
) COMMENT 'Профили пользователей';

CREATE TABLE social_networks (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) UNIQUE
) COMMENT 'Социальные сети';

CREATE TABLE users_accounts (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user BIGINT UNSIGNED NOT NULL,
    id_network BIGINT UNSIGNED NOT NULL,
    link VARCHAR(100),
    
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_network) REFERENCES social_networks(id)
 ) COMMENT 'Акаунты пользователей в социальных сетях';

CREATE TABLE feedback (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_author BIGINT UNSIGNED NOT NULL,
    id_target BIGINT UNSIGNED NOT NULL,
    body TEXT,
    rating TINYINT UNSIGNED COMMENT 'Оценка одного пользователя другим от 1 до 5',
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (id_author) REFERENCES users(id),
    FOREIGN KEY (id_target) REFERENCES users(id),
    
    CHECK (id_author <> id_target)
 ) COMMENT 'Отзывы и оценки пользователей между собой';

CREATE TABLE messages (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_author BIGINT UNSIGNED NOT NULL,
    id_target BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (id_author) REFERENCES users(id),
    FOREIGN KEY (id_target) REFERENCES users(id)
    
    -- CHECK (id_author <> id_target)
 ) COMMENT 'Сообщения между пользователями';

CREATE TABLE notices (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (id_user) REFERENCES users(id)
) COMMENT 'Уведомление пользователей администрацией портала';

CREATE TABLE home_types (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    home_type ENUM('brick', 'panel', 'block', 'monolithic', 'wooden')
) COMMENT 'Типы зданий: кирпичное, панельное, блочное, монолитное, деревянное';

CREATE TABLE regions (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(30) NOT NULL UNIQUE,
    
    INDEX region_idx (region)
) COMMENT 'Субъекты РФ';

CREATE TABLE citys (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_region BIGINT UNSIGNED NOT NULL,
    city VARCHAR(30) NOT NULL UNIQUE,
    
    FOREIGN KEY (id_region) REFERENCES regions(id),
    INDEX city_idx (city)
    
) COMMENT 'Города РФ';

CREATE TABLE ads_profiles (
	id_ad BIGINT UNSIGNED NOT NULL UNIQUE,
    id_city BIGINT UNSIGNED NOT NULL,
    adress VARCHAR(50),
    location_map VARCHAR(30) COMMENT 'Географические координаты дома',
    id_home_type BIGINT UNSIGNED NOT NULL,
    floors TINYINT UNSIGNED NOT NULL COMMENT 'Этажность здания',
    `floor` TINYINT UNSIGNED NOT NULL COMMENT 'Этаж сдаваемой квартиры',
    rooms TINYINT UNSIGNED NOT NULL COMMENT 'Комнат в квартире',
    belconys TINYINT UNSIGNED NOT NULL COMMENT 'Балконов в квартире',
    total_area TINYINT UNSIGNED NOT NULL COMMENT 'Общая площадь, кв.м.',
    living_area TINYINT UNSIGNED NOT NULL COMMENT 'Жилая площадь, кв.м.',
    kitchen_area TINYINT UNSIGNED NOT NULL COMMENT 'Площадь кухни, кв.м.',
    beds TINYINT UNSIGNED NOT NULL COMMENT 'Количество кроватей',
    sleeping_places TINYINT UNSIGNED NOT NULL COMMENT 'Количество спальных мест',
    is_wifi BIT COMMENT 'Наличие WI-FI',
    is_TV BIT COMMENT 'Наличие телевизора и телевидения',
    is_kitchen_stove BIT COMMENT 'Наличие кухонной плиты',
    is_microwave BIT COMMENT 'Наличие микроволновой печи',
    is_fridge BIT COMMENT 'Наличие холодильника',
    is_washer BIT COMMENT 'Наличие стиральной машины',
    is_flatiron BIT COMMENT 'Наличие утюга',
    is_conditioner BIT COMMENT 'Наличие кондиционера',
    is_parking_space BIT COMMENT 'Наличие парковочного места',
    can_children BIT COMMENT 'Возможность проживания с маленькими детьми до 7 лет',
    can_events BIT COMMENT 'Возможность использовать в мероприятии',
    can_smoke BIT COMMENT 'Возможность курения в помещении',
    can_pets BIT COMMENT 'Возможность проживания с домашним животным',
    additional_description TEXT COMMENT 'Дополнительное описание',
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (id_ad) REFERENCES rent_apartment_ads(id),
    FOREIGN KEY (id_city) REFERENCES citys(id),
    FOREIGN KEY (id_home_type) REFERENCES home_types(id)
 ) COMMENT 'Профили частных объявлений о сдаче квартиры';

CREATE TABLE favorite_users (
	id_electing_user BIGINT UNSIGNED NOT NULL,
    id_elected_user BIGINT UNSIGNED NOT NULL,
    is_election BIT COMMENT 'Наличие/Отсутствие id_elected_user в избранных у id_electing_user',
    update_at DATETIME DEFAULT NOW(),
    
    PRIMARY KEY (id_electing_user, id_elected_user),
    FOREIGN KEY (id_electing_user) REFERENCES users(id),
    FOREIGN KEY (id_elected_user) REFERENCES users(id),
    
    CHECK (id_electing_user <> id_elected_user)
) COMMENT 'Избранные другие пользователи';

CREATE TABLE favorite_ads (
	id_electing_user BIGINT UNSIGNED NOT NULL,
    id_elected_ad BIGINT UNSIGNED NOT NULL,
    is_election BIT COMMENT 'Наличие/Отсутствие id_elected_user в избранных у id_electing_user',
    update_at DATETIME DEFAULT NOW(),
    
    PRIMARY KEY (id_electing_user, id_elected_ad),
    FOREIGN KEY (id_electing_user) REFERENCES users(id),
    FOREIGN KEY (id_elected_ad) REFERENCES rent_apartment_ads(id)
) COMMENT 'Избранные объявления других пользователей';

CREATE TABLE transactions (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_ad BIGINT UNSIGNED NOT NULL,
    id_renter BIGINT UNSIGNED NOT NULL,
    transaction_date DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (id_ad) REFERENCES rent_apartment_ads(id),
    FOREIGN KEY (id_renter) REFERENCES users(id)
) COMMENT 'Заключённые сделки по объявлениям';

CREATE TABLE mutually_favorites (
	id_first_favorite BIGINT UNSIGNED NOT NULL,
    id_second_favorite BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (id_first_favorite, id_second_favorite),
    FOREIGN KEY (id_first_favorite) REFERENCES users(id),
    FOREIGN KEY (id_second_favorite) REFERENCES rent_apartment_ads(id)
) COMMENT 'Взаимно избранные пользователи';

-- Foreign keys added via ALTER TABLE:
ALTER TABLE rent_apartment_ads ADD FOREIGN KEY (id_user) REFERENCES users(id);

