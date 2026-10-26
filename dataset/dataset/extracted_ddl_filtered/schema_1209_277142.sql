-- Source: https://github.com/complitex/vetcontrol/blob/e49d345a36a05930931e184b90f414a960b5333b/src/db/common/create.sql?raw=true
-- Tables detected: 33 | FK constraints: 59

CREATE TABLE `user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя',
  `login` VARCHAR(32) NOT NULL COMMENT 'Логин',
  `_password` VARCHAR(32) DEFAULT NULL COMMENT 'Пароль',
  `first_name` VARCHAR(45) DEFAULT NULL COMMENT 'Имя',
  `middle_name` VARCHAR(45) DEFAULT NULL COMMENT 'Отчество',
  `last_name` VARCHAR(45) DEFAULT NULL COMMENT 'Фамилия',
  `job_id` BIGINT(20) DEFAULT NULL COMMENT 'Должность пользователя',
  `department_id` BIGINT(20) DEFAULT NULL COMMENT 'Подразделение, в котором работает пользователь',
  `passing_border_point_id` BIGINT(20) DEFAULT NULL COMMENT 'Пункт пропуска через границу, к которому принадлежит пользователь',
  `updated` TIMESTAMP NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
  `locale` VARCHAR(2) NULL COMMENT 'Язык, на котором пользователь предпочитает работать с системой',
  `page_size` INT(3) NULL COMMENT 'Количество записей на страницу, которое пользователь предпочитает использовать на страницах просмотра списка сущностей',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_login` (`login`),
  KEY `fk_job` (`job_id`),
  KEY `fk_user_department` (`department_id`),
  KEY `fk_border_point` (`passing_border_point_id`),
  CONSTRAINT `fk_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_user_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_border_point` FOREIGN KEY (`passing_border_point_id`) REFERENCES `passing_border_point` (`id`),
    KEY `user_updated_INDEX` (`updated`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Таблица пользователей системы';

CREATE TABLE  `usergroup` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(32) NOT NULL COMMENT 'Логин пользователя',
  `usergroup` VARCHAR(32) NOT NULL COMMENT 'Роль пользователя',
  `updated` TIMESTAMP NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_usergroup` (`login`,`usergroup`),
  CONSTRAINT `fk_user_login` FOREIGN KEY (`login`) REFERENCES `user` (`login`),
  KEY `usergroup_updated_INDEX` (`updated`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Таблица ролей пользователей';

CREATE TABLE `locales` (
  `language` varchar(2) NOT NULL COMMENT 'ISO 639 код языка',
  `isSystem` tinyint(1) NOT NULL default '0' COMMENT 'Показывает является ли данный язык системным. Системный язык является языком по умолчанию для системы',
  PRIMARY KEY  (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица поддерживаемых системой языков';

create table `generator`(
   `generatorName` varchar(20) NOT NULL COMMENT 'Наименование генератора',
   `generatorValue` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Значение генератора',
   PRIMARY KEY (`generatorName`)
 )ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Вспомогательная таблица для хранения значений, генерируемых табличными генераторами';

CREATE TABLE `stringculture` (
  `id` bigint(20) NOT NULL,
  `locale` varchar(2) NOT NULL COMMENT 'Код языка',
  `value` varchar(1024) default NULL COMMENT 'Локализованное значение',
  `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
  PRIMARY KEY  (`id`, `locale`),
    KEY `stringculture_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Таблица для хранения локализованных строк в справочниках';

CREATE TABLE `countrybook` (
  `id` bigint(20) NOT NULL auto_increment,
  `code` varchar(2) NOT NULL COMMENT 'ISO 3166 двух-символьный код страны',
  `name` bigint(20) NOT NULL COMMENT 'Название страны',
  `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
  `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
  PRIMARY KEY  (`id`),
  KEY `FK_countrybook_name` (`name`),
  CONSTRAINT `FK_countrybook_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `countrybook_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник стран';

CREATE TABLE `registered_products` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` bigint(20) NOT NULL COMMENT 'Наименование препарата',
  `classificator` bigint(20) NOT NULL COMMENT 'Классификатор',
  `cargo_producer_id` bigint(20) NOT NULL COMMENT 'Производитель',
  `regnumber` varchar(50) NOT NULL COMMENT 'Регистрационный номер',
  `date` date NOT NULL COMMENT 'Дата регистрации',
  `country_id` bigint(20) NOT NULL COMMENT 'Страна производителя',
  `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
  `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
  PRIMARY KEY  (`id`),
  KEY `FK_registeredproducts_name` (`name`),
  CONSTRAINT `FK_registeredproducts_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
  KEY `FK_registeredproducts_classificator` (`classificator`),
  CONSTRAINT `FK_registeredproducts_classificator` FOREIGN KEY (`classificator`) REFERENCES `stringculture` (`id`),
  KEY `FK_registeredproducts_country_ref` (`country_id`),
  CONSTRAINT `FK_registeredproducts_country_ref` FOREIGN KEY (`country_id`) REFERENCES `countrybook` (`id`),
  KEY `FK_registeredproducts_producer_ref` (`cargo_producer_id`),
  CONSTRAINT `FK_registeredproducts_producer_ref` FOREIGN KEY (`cargo_producer_id`) REFERENCES `cargo_producer` (`id`),
    KEY `registered_products_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник перечня препаратов, зарегистрированных в Украине';

CREATE TABLE  `department` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Наименование подразделения',
    `parent_id` bigint(20) NULL COMMENT 'Идентификатор вышестоящего подразделения',
    `custom_point_id` bigint(20) NULL COMMENT 'Место таможенного оформления грузов',
    `level` int(2) NOT NULL COMMENT 'Уровень данного подразделения в 3-х уровневой иерархии',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_department_name` (`name`),
    CONSTRAINT `FK_department_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `FK_department_parent` (`parent_id`),
    CONSTRAINT `FK_department_parent` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`),
    KEY `FK_department_custom_point` (`custom_point_id`),
    CONSTRAINT `FK_department_custom_point` FOREIGN KEY (`custom_point_id`) REFERENCES `customs_point` (`id`),
    KEY `department_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник структурных единиц';

CREATE TABLE  `cargo_sender` (
--     `id` bigint(20) NOT NULL auto_increment,
--     `name` varchar(100) NOT NULL,
--     `country_id` bigint(20) NOT NULL,
--     PRIMARY KEY (`id`),
--     KEY `FK_cargo_sender_country_ref` (`country_id`),
--     CONSTRAINT `FK_cargo_sender_country_ref` FOREIGN KEY (`country_id`) REFERENCES `countrybook` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  `cargo_receiver` (
--     `id` bigint(20) NOT NULL auto_increment,
--     `name` varchar(100) NOT NULL,
--     `address` varchar(100) NOT NULL,
--     PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  `customs_point` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Наименование',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_customs_point_name` (`name`),
    CONSTRAINT `FK_customs_point_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `customs_point_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник мест таможенного оформления грузов';

CREATE TABLE  `cargo_producer` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Наименование',
    `country_id` bigint(20) NOT NULL COMMENT 'Страна производителя',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_cargo_producer_name` (`name`),
    CONSTRAINT `FK_cargo_producer_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `FK_cargo_producer_country` (`country_id`),
    CONSTRAINT `FK_cargo_producer_country` FOREIGN KEY (`country_id`) REFERENCES `countrybook` (`id`),
    KEY `cargo_producer_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник производителей';

CREATE TABLE  `cargo_type` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Наименование категории грузов',
    `ukt_zed_code` VARCHAR(10) NOT NULL COMMENT 'Уникальный УКТ ЗЕД код категории грузов',
    `updated` timestamp NOT NULL COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`ukt_zed_code`),
    KEY `FK_cargo_type_name` (`name`),
    CONSTRAINT `FK_cargo_type_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `cargo_type_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник категорий(типов) грузов';

CREATE TABLE  `cargo_mode_cargo_type` (
    `cargo_mode_id` bigint(20) NOT NULL COMMENT 'Идентификатор вида грузов',
    `cargo_type_id` bigint(20) NOT NULL COMMENT 'Идентификатор категории(типа) груза',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    PRIMARY KEY (`cargo_mode_id`, `cargo_type_id`),
    KEY `FK_cargo_mode_cargo_type_cargo_mode_id` (`cargo_mode_id`),
    CONSTRAINT `FK_cargo_mode_cargo_type_cargo_mode_id` FOREIGN KEY (`cargo_mode_id`) REFERENCES `cargo_mode` (`id`),
    KEY `FK_cargo_mode_cargo_type_cargo_type_id` (`cargo_type_id`),
    CONSTRAINT `FK_cargo_mode_cargo_type_cargo_type_id` FOREIGN KEY (`cargo_type_id`) REFERENCES `cargo_type` (`id`),
    KEY `cargo_mode_cargo_type_updated_INDEX` (`updated`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица, связывающая виды грузов и категории грузов';

CREATE TABLE  `cargo_mode` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Наименование вида грузов',
    `parent_id` bigint(20) NULL COMMENT 'Идентификатор родителького вида грузов в 2-х уровневой иерархии видов грузов',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_cargo_mode_name` (`name`),
    CONSTRAINT `FK_cargo_mode_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `FK_cargo_mode_parent` (`parent_id`),
    CONSTRAINT `FK_cargo_mode` FOREIGN KEY (`parent_id`) REFERENCES `cargo_mode` (`id`),
    KEY `cargo_mode_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник видов грузов';

CREATE TABLE  `cargo_mode_unit_type` (
    `cargo_mode_id` bigint(20) NOT NULL COMMENT 'Идентификатор вида грузов',
    `unit_type_id` bigint(20) NOT NULL COMMENT 'Идентификатор единицы измерения',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    PRIMARY KEY (`cargo_mode_id`, `unit_type_id`),
    KEY `FK_cargo_mode_unit_type_cargo_mode_id` (`cargo_mode_id`),
    CONSTRAINT `FK_cargo_mode_unit_type_cargo_mode_id` FOREIGN KEY (`cargo_mode_id`) REFERENCES `cargo_mode` (`id`),
    KEY `FK_cargo_mode_unit_type_unit_type_id` (`unit_type_id`),
    CONSTRAINT `FK_cargo_mode_unit_type_unit_type_id` FOREIGN KEY (`unit_type_id`) REFERENCES `unit_type` (`id`),
    KEY `cargo_mode_unit_type_updated_INDEX` (`updated`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица, связывающая виды грузов и единицы измерения';

CREATE TABLE  `unit_type` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Наименование единицы измерения',
    `short_name` bigint(20) NOT NULL COMMENT 'Сокращенное название единицы измерения',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_unit_type_name` (`name`),
    CONSTRAINT `FK_unit_type_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `FK_unit_type_short_name` (`short_name`),
    CONSTRAINT `FK_unit_type_short_name` FOREIGN KEY (`short_name`) REFERENCES `stringculture` (`id`),
    KEY `unit_type_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник единиц измерения';

CREATE TABLE  `job` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Название должности',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_job_name` (`name`),
    CONSTRAINT `FK_job_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `job_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник должностей';

CREATE TABLE  `arrest_reason` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Наименование причины',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_arrest_reason_name` (`name`),
    CONSTRAINT `FK_arrest_reason_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `arrest_reason_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник причин задержания грузов';

CREATE TABLE  `bad_epizootic_situation` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` bigint(20) NOT NULL COMMENT 'Название страны',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_bad_epizootic_situation_name` (`name`),
    CONSTRAINT `FK_bad_epizootic_situation_name` FOREIGN KEY (`name`) REFERENCES `stringculture` (`id`),
    KEY `bad_epizootic_situation_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник стран с неблагоприятной эпизоотической ситуацией';

CREATE TABLE  `passing_border_point` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` varchar(100) NOT NULL COMMENT 'Название пункта',
    `department_id` bigint(20) NOT NULL COMMENT 'Подразделение, к которому относится данный пункт пропуска',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `FK_passing_border_point_department` (`department_id`),
    CONSTRAINT `FK_passing_border_point_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
    KEY `passing_border_point_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник пунктов пропуска через границу';

CREATE TABLE  `container_validator` (
    `id` bigint(20) NOT NULL auto_increment,
    `prefix` varchar(4) NOT NULL COMMENT 'Уникальный 4-х значный префикс кода контейнера',
    `carrier_abbr` varchar(50) NULL COMMENT 'Аббравиатура фирмы-производителя контейнера',
    `carrier_name` varchar(100) NOT NULL COMMENT 'Полное название фирмы-производителя контейнера',
    `updated` timestamp NOT NULL DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `disabled` tinyint(1) NOT NULL default '0' COMMENT 'Состояние объекта. Если значение равно 1, то объект деактивирован, если 0 - то активирован',
    PRIMARY KEY (`id`),
    KEY `container_validator_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник кодов контейнеров';

CREATE TABLE `cargo_mode_report` (
    `cargo_mode_id` bigint(20) NOT NULL COMMENT 'Идентификатор вида грузов',
    `report_id` VARCHAR(50) NOT NULL COMMENT 'Идентификатор отчета',
    PRIMARY KEY (`cargo_mode_id`, `report_id`),
    KEY `FK_cargo_mode_report_cargo_mode` (`cargo_mode_id`),
    CONSTRAINT `FK_cargo_mode_report_cargo_mode` FOREIGN KEY (`cargo_mode_id`) REFERENCES `cargo_mode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вспомогательная таблица связывающая таблицу видов грузов и таблицу отчетов. Показывает какие виды грузов используются в каких отчетах';

CREATE TABLE `reports` (
    `id` VARCHAR(50) NOT NULL COMMENT 'Уникальный идентификатор отчета',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица, перечисляющая все отчеты в системе. Используется например в таблице `cargo_mode_report`';

CREATE TABLE `document_cargo` (
  `id` bigint(20) NOT NULL COMMENT 'Суррогатный идентификатор',
  `client_id` bigint(20) NOT NULL COMMENT 'Идентификатор удаленного клиента',
  `department_id` bigint(20) NOT NULL COMMENT 'Подразделение',
  `creator_id` bigint(20) NOT NULL COMMENT 'Идентификатор пользователя, создавшего карточку',
  `created` timestamp NOT NULL COMMENT 'Дата создания карточки',
  `updated` timestamp NOT NULL COMMENT 'Дата последней модификации(создание/обновление) записи',
  `movement_type` VARCHAR(15) NOT NULL COMMENT 'Тип передвижения. Все возможные значения - \'IMPORT\'(импорт), \'EXPORT\'(экпорт), \'TRANSIT\'(транзит), \'IMPORT_TRANSIT\'(импортный транзит) - перечислены в MovementType.class',
  `vehicle_type` varchar(10) NOT NULL COMMENT 'Тип транспортного средства. Все возможные значения - \'CAR\'(автомобиль), \'SHIP\'(корабль), \'CONTAINER\'(контейнер), \'CARRIAGE\'(вагон), \'AIRCRAFT\'(самолет) - перечислены в VehicleType.class',
  `cargo_mode_id` bigint(20) NOT NULL COMMENT 'Вид груза',
  `cargo_sender_name` varchar(255) NOT NULL COMMENT 'Наименование отправителя грузов',
  `cargo_sender_country_id` bigint(20) NOT NULL COMMENT 'Страна отправителя',
  `cargo_receiver_name` varchar(255) NOT NULL COMMENT 'Наименование получателя',
  `cargo_receiver_address` varchar(255) NOT NULL COMMENT 'Адрес получателя',
  `passing_border_point_id` bigint(20) DEFAULT NULL COMMENT 'Пункт пропуска через границу, на котором была оформлена данная карточка',
  `details` varchar(1024) DEFAULT NULL COMMENT 'Замечания',
  `sync_status` varchar(64) DEFAULT NULL COMMENT 'Статус синронизации с сервером. Все возможные значения - \'SYNCHRONIZED\'(синхронизировано), \'NOT_SYNCHRONIZED\'(не синхронизировано), \'PROCESSING\'(в процессе синхронизации) - перечислены в Synchronized.SyncStatus.class',
  PRIMARY KEY (`id`,`department_id`,`client_id`),
  KEY `FK_department_0` (`department_id`),
  KEY `FK_client_0` (`client_id`),
  KEY `FK_creator_id` (`creator_id`),
  KEY `FK_document_cargo_cargo_sender_country_id` (`cargo_sender_country_id`),
  KEY `FK_document_cargo_passing_border_point` (`passing_border_point_id`),
  KEY `FK_document_cargo_cargo_mode_id` (`cargo_mode_id`),
  KEY `INDEX_cargo_receiver_name` (`cargo_receiver_name`),
  KEY `INDEX_cargo_receiver_address` (`cargo_receiver_address`),
  CONSTRAINT `FK_department_0` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_client_0` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_document_cargo_cargo_sender_country_id` FOREIGN KEY (`cargo_sender_country_id`) REFERENCES `countrybook` (`id`),
  CONSTRAINT `FK_document_cargo_passing_border_point` FOREIGN KEY (`passing_border_point_id`) REFERENCES `passing_border_point` (`id`),
  CONSTRAINT `FK_document_cargo_cargo_mode_id` FOREIGN KEY (`cargo_mode_id`) REFERENCES `cargo_mode` (`id`),
    KEY `document_cargo_updated_INDEX` (`updated`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Карточка на груз';

CREATE TABLE  `cargo` (
  `id` bigint(20) NOT NULL COMMENT 'Суррогатный идентификатор',
  `client_id` bigint(20) NOT NULL COMMENT 'Идентификатор удаленного клиента',
  `department_id` bigint(20) NOT NULL COMMENT 'Подразделение',
  `document_cargo_id` bigint(20) NOT NULL COMMENT 'Суррогатный идентификатор карточки на грузы, к которой данный груз принадлежит',
  `cargo_type_id` bigint(20) NOT NULL COMMENT 'Категория груза',
  `unit_type_id` bigint(20) NOT NULL COMMENT 'Единица измерения',
  `cargo_producer_id` bigint(20) NOT NULL COMMENT 'Производитель груза',
  `vehicle_id` bigint(20) NOT NULL COMMENT 'Суррогатный идентификатор транспортного средства',
  `count` DOUBLE (11,2) DEFAULT NULL COMMENT 'Количество груза',
  `certificate_date` date NOT NULL COMMENT 'Дата сертификации груза',
  `certificate_details` varchar(255) NOT NULL COMMENT 'Детали сертификации груза',
  `updated` timestamp DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
  `sync_status` varchar(64) DEFAULT NULL COMMENT 'Статус синронизации с сервером. Все возможные значения - \'SYNCHRONIZED\'(синхронизировано), \'NOT_SYNCHRONIZED\'(не синхронизировано), \'PROCESSING\'(в процессе синхронизации) - перечислены в Synchronized.SyncStatus.class',
  PRIMARY KEY (`id`,`department_id`,`client_id`),
  KEY `FK_department_1` (`department_id`),
  KEY `FK_client_1` (`client_id`),
  KEY `FK_cargo_type` (`cargo_type_id`),
  KEY `FK_unit_type` (`unit_type_id`),
  KEY `FK_cargo_producer` (`cargo_producer_id`),
  KEY `FK_document_cargo` (`document_cargo_id`,`department_id`,`client_id`),
  KEY `FK_cargo_vehicle` (`vehicle_id`),
  CONSTRAINT `FK_department_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_client_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_cargo_type` FOREIGN KEY (`cargo_type_id`) REFERENCES `cargo_type` (`id`),
  CONSTRAINT `FK_unit_type` FOREIGN KEY (`unit_type_id`) REFERENCES `unit_type` (`id`),
  CONSTRAINT `FK_cargo_producer` FOREIGN KEY (`cargo_producer_id`) REFERENCES `cargo_producer` (`id`),
  CONSTRAINT `FK_document_cargo` FOREIGN KEY (`document_cargo_id`, `department_id`, `client_id`) REFERENCES `document_cargo` (`id`, `department_id`, `client_id`),
  CONSTRAINT `FK_cargo_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  KEY `cargo_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Грузы';

CREATE TABLE  `vehicle` (
    `id` bigint(20) NOT NULL COMMENT 'Суррогатный идентификатор',
    `client_id` bigint(20) NOT NULL COMMENT 'Идентификатор удаленного клиента',
    `department_id` bigint(20) NOT NULL COMMENT 'Подразделение',
    `document_cargo_id` bigint(20) NOT NULL COMMENT 'Суррогатный идентификатор карточки на грузы, которой данное транспортное средство принадлежит',
    `vehicle_type` varchar(10) NOT NULL COMMENT 'Тип транспортного средства. Все возможные значения - \'CAR\'(автомобиль), \'SHIP\'(корабль), \'CONTAINER\'(контейнер), \'CARRIAGE\'(вагон), \'AIRCRAFT\'(самолет) - перечислены в VehicleType.class',
    `vehicle_details` varchar(255) NOT NULL COMMENT 'Детали транспортного средства(например, номер автомобиля)',
    `updated` timestamp DEFAULT NOW() COMMENT 'Дата последней модификации(создание/обновление) записи',
    `sync_status` varchar(64) DEFAULT NULL COMMENT 'Статус синронизации с сервером. Все возможные значения - \'SYNCHRONIZED\'(синхронизировано), \'NOT_SYNCHRONIZED\'(не синхронизировано), \'PROCESSING\'(в процессе синхронизации) - перечислены в Synchronized.SyncStatus.class',
    PRIMARY KEY (`id`,`department_id`,`client_id`),
    KEY `FK_vehicle_client` (`client_id`),
    KEY `FK_vehicle_department` (`department_id`),
    KEY `FK_vehicle_document_cargo` (`document_cargo_id`,`department_id`,`client_id`),
    CONSTRAINT `FK_vehicle_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
    CONSTRAINT `FK_vehicle_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
    CONSTRAINT `FK_vehicle_document_cargo` FOREIGN KEY (`document_cargo_id`, `department_id`, `client_id`) REFERENCES `document_cargo` (`id`, `department_id`, `client_id`),
    KEY `vehicle_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица транспортных средств';

CREATE TABLE  `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) DEFAULT NULL COMMENT 'Идентификатор удаленного клиента',
  `date` datetime DEFAULT NULL COMMENT 'Дата',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Пользователь, инициировавший логирование некоторой операции',
  `controller_class` varchar(255) DEFAULT NULL COMMENT 'Класс страницы(или другого объекта), в котором произошла некая операция, подлежащая логированию',
  `model_class` varchar(255) DEFAULT NULL COMMENT 'Класс объекта, над которым произошла операция',
  `event` varchar(255) DEFAULT NULL COMMENT 'Тип операции. Все возможные значения - \'SYSTEM_START\', \'SYSTEM_STOP\', \'USER_LOGIN\', \'USER_LOGOUT\', \'LIST\', \'VIEW\', \'EDIT\', \'CREATE_AS_NEW\', \'REMOVE\', \'SYNC\', \'SYNC_COMMIT\', \'DISABLE\', \'ENABLE\', \'SYNC_UPDATED\', \'SYNC_DELETED\' - перечислены в Log.EVENT.class',
  `module` varchar(255) DEFAULT NULL COMMENT 'Модуль, в котором произошла операция. Все возможные значения - \'COMMONS\'(ядро), \'USER\'(пользователи), \'DOCUMENT\'(документы), \'INFORMATION\'(справочники), \'REPORT\'(отчеты), \'SYNC_CLIENT\'(клиент), \'SYNC_SERVER\'(сервер) - перечислены в Log.MODULE.class',
  `status` varchar(255) DEFAULT NULL COMMENT 'Успешность завершения операции. Все возможные значения - \'OK\'(успешно), \'ERROR\'(ошибка) - перечислены в Log.STATUS.class',
  `description` varchar(255) DEFAULT NULL COMMENT 'Дополнительное описание',
  PRIMARY KEY (`id`),
  KEY `FK_user` (`user_id`),
  KEY `Index_date` (`date`),
  KEY `Index_controller_class` (`controller_class`),
  KEY `Index_model_class` (`model_class`),
  KEY `Index_event` (`event`),
  KEY `Index_module` (`module`),
  KEY `Index_status` (`status`),
  KEY `Index_description` (`description`),
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  KEY `FK_log_client_id` (`client_id`),
  CONSTRAINT `FK_log_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Журнал логов приложения';

CREATE TABLE `change_detail` (
    `change_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
    `log_id` bigint(20) NOT NULL,
    `collection_object_id` VARCHAR(500) NULL,
    `property_name` VARCHAR(50) NULL,
    `collection_property` VARCHAR(50) NULL,
    `old_value` VARCHAR(500) NULL,
    `new_value` VARCHAR(500) NULL,
    `locale` VARCHAR(10) NULL,
    `collection_modification_status` VARCHAR(15) NULL,
    PRIMARY KEY (`change_detail_id`),
    KEY `FK_change_detail_log` (`log_id`),
    CONSTRAINT `FK_change_detail_log`FOREIGN KEY (`log_id`) REFERENCES `log` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Детали изменений сущности';

CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) NOT NULL COMMENT 'Подразделение',
  `passing_border_point_id` bigint(20) DEFAULT NULL COMMENT 'Пункт пропуска через границу',
  `ip` varchar(64) NOT NULL COMMENT 'IP адрес клиента',
  `mac` varchar(64) NOT NULL COMMENT 'MAC адрес клиента',
  `secure_key` varchar(64) NOT NULL COMMENT 'Защитный ключ',
  `created` timestamp NOT NULL COMMENT 'Дата создания клиента',
  `updated` timestamp NOT NULL COMMENT 'Дата последней модификации(создание/обновление) записи',
  `last_sync` DATETIME DEFAULT NULL COMMENT 'Дата последней синхронизации с сервером',
  `sync_status` varchar(64) DEFAULT NULL COMMENT 'Статус синронизации с сервером. Все возможные значения - \'SYNCHRONIZED\'(синхронизировано), \'NOT_SYNCHRONIZED\'(не синхронизировано), \'PROCESSING\'(в процессе синхронизации) - перечислены в Synchronized.SyncStatus.class',
  `version` varchar(64) DEFAULT NULL COMMENT 'Версия клиента',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac` (`mac`),
  UNIQUE KEY `secure_key` (`secure_key`),
  KEY `FK_department` (`department_id`),
  CONSTRAINT `FK_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  KEY `FK_passing_border_point` (`passing_border_point_id`),
  CONSTRAINT `FK_passing_border_point` FOREIGN KEY (`passing_border_point_id`) REFERENCES `passing_border_point` (`id`),
  KEY `client_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Объект удаленного клиента';

CREATE TABLE `deleted_embedded_id` (
  `id` VARCHAR(100) NOT NULL COMMENT 'Идентификатор удаленной записи',
  `entity` VARCHAR(100) NOT NULL COMMENT 'Наименование удаленной сущности',
  `deleted` TIMESTAMP NOT NULL COMMENT 'Дата удаления',
  PRIMARY KEY (`id`, `entity`),
    KEY `deleted_embedded_id_deleted_INDEX` (`deleted`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Удаленные из других таблиц записи, идентификаторы которых имеют сложное строение. Используется при синхронизации, например.';

CREATE TABLE `deleted_long_id` (
  `id` bigint(20) NOT NULL COMMENT 'Идентификатор удаленной записи',
  `entity` VARCHAR(100) NOT NULL COMMENT 'Наименование удаленной сущности',
  `deleted` TIMESTAMP NOT NULL COMMENT 'Дата удаления',
  PRIMARY KEY (`id`, `entity`),
    KEY `deleted_long_id_deleted_INDEX` (`deleted`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Удаленные из других таблиц записи, идентификаторы которых имеют простое строение. Используется при синхронизации, например.';

CREATE TABLE  `client_update` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL COMMENT 'Является ли активным обновление',
  `created` datetime NOT NULL COMMENT 'Дата обновления',
  `type` varchar(64) NOT NULL COMMENT 'Критичность обновления. Все возможные значения - \'CRITICAL\'(критичное), \'NOT_CRITICAL\'(не критичное) - перечислены в Update.TYPE.class',
  `version` varchar(64) NOT NULL COMMENT 'Версия обновления',
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Обновление клиента';

CREATE TABLE  `client_update_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Наименование',
  `update_id` bigint(20) NOT NULL COMMENT 'Идентификатор обновления',
  `created` datetime NOT NULL COMMENT 'Дата обновления',
  `packaging` varchar(64) NOT NULL COMMENT 'Тип файла с обновлениями. Все возможные значения - \'WAR\'(war файл), \'JAR\'(jar файл), \'SQL\'(sql скрипт), \'SQL_ZIP\'(архивированный sql скрипт) - перечислены в UpdateItem.PACKAGING.class',
  `check_sum` varchar(64) NOT NULL COMMENT 'Контрольная сумма файла обновления',
  PRIMARY KEY (`id`),
  KEY `FK_update_id` (`update_id`),
  CONSTRAINT `FK_update_id` FOREIGN KEY (`update_id`) REFERENCES `client_update` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отдельный файл обновления';

CREATE TABLE `arrest_document` (
    `id` bigint(20) NOT NULL COMMENT 'Суррогатный идентификатор',
    `client_id` bigint(20) NOT NULL COMMENT 'Идентификатор удаленного клиента',
    `department_id` bigint(20) NOT NULL COMMENT 'Подразделение',
    `creator_id` bigint(20) NOT NULL COMMENT 'Идентификатор пользователя, создавшего документ',
    `arrest_date` TIMESTAMP NOT NULL COMMENT 'Дата задержания',
    `arrest_reason_id` bigint(20) NOT NULL COMMENT 'Причина задержания',
    `arrest_reason_details` VARCHAR(1024) DEFAULT NULL COMMENT 'Детали задержания',
    `passing_border_point_id` bigint(20) DEFAULT NULL COMMENT 'Пункт пропуска через границу',
    `count` DOUBLE (11,2) DEFAULT NULL COMMENT 'Количество груза',
    `cargo_mode_id` bigint(20) NOT NULL COMMENT 'Вид груза',
    `certificate_date` DATE NOT NULL COMMENT 'Дата сертификации груза',
    `certificate_details` VARCHAR(255) NOT NULL COMMENT 'Детали сертификации груза',
    `cargo_sender_name` VARCHAR(255) NOT NULL COMMENT 'Наименование отправителя грузов',
    `cargo_sender_country_id` bigint(20) NOT NULL COMMENT 'Страна отправителя',
    `cargo_receiver_name` VARCHAR(255) NOT NULL COMMENT 'Наименование получателя',
    `cargo_receiver_address` VARCHAR(255) NOT NULL COMMENT 'Адрес получателя',
    `cargo_type_id` bigint(20) NOT NULL COMMENT 'Категория груза',
    `unit_type_id` bigint(20) DEFAULT NULL COMMENT 'Единица измерения',
    `vehicle_type` VARCHAR(10) NOT NULL COMMENT 'Тип транспортного средства. Все возможные значения - \'CAR\'(автомобиль), \'SHIP\'(корабль), \'CONTAINER\'(контейнер), \'CARRIAGE\'(вагон), \'AIRCRAFT\'(самолет) - перечислены в VehicleType.class',
    `vehicle_details` VARCHAR(255) NOT NULL COMMENT 'Детали транспортного средства(например, номер автомобиля)',
    `document_cargo_created` TIMESTAMP NOT NULL COMMENT 'Дата создания карточки на грузы, груз которой был задержан',
    `updated` TIMESTAMP NOT NULL COMMENT 'Дата последней модификации(создание/обновление) записи',
    `sync_status` VARCHAR(64) DEFAULT NULL COMMENT 'Статус синронизации с сервером. Все возможные значения - \'SYNCHRONIZED\'(синхронизировано), \'NOT_SYNCHRONIZED\'(не синхронизировано), \'PROCESSING\'(в процессе синхронизации) - перечислены в Synchronized.SyncStatus.class',
    PRIMARY KEY (`id`, `client_id`, `department_id`),
    KEY `FK_arrest_client` (`client_id`),
    CONSTRAINT `FK_arrest_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
    KEY `FK_arrest_department` (`department_id`),
    CONSTRAINT `FK_arrest_cargo` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
    KEY `FK_arrest_reason` (`arrest_reason_id`),
    CONSTRAINT `FK_arrest_reason` FOREIGN KEY (`arrest_reason_id`) REFERENCES `arrest_reason` (`id`),
    KEY `FK_arrest_passing_border_point` (`passing_border_point_id`),
    CONSTRAINT `FK_arrest_passing_border_point` FOREIGN KEY (`passing_border_point_id`) REFERENCES `passing_border_point` (`id`),
    KEY `FK_arrest_cargo_mode` (`cargo_mode_id`),
    CONSTRAINT `FK_arrest_cargo_mode` FOREIGN KEY (`cargo_mode_id`) REFERENCES `cargo_mode` (`id`),
    KEY `FK_arrest_cargo_sender_country` (`cargo_sender_country_id`),
    CONSTRAINT `FK_arrest_cargo_sender_country` FOREIGN KEY (`cargo_sender_country_id`) REFERENCES `countrybook` (`id`),
    KEY `FK_arrest_cargo_type` (`cargo_type_id`),
    CONSTRAINT `FK_arrest_cargo_type` FOREIGN KEY (`cargo_type_id`) REFERENCES `cargo_type` (`id`),
    KEY `FK_arrest_unit_type` (`unit_type_id`),
    CONSTRAINT `FK_arrest_unit_type` FOREIGN KEY (`unit_type_id`) REFERENCES `unit_type` (`id`),
    KEY `arrest_updated_INDEX` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица задержаний грузов';

