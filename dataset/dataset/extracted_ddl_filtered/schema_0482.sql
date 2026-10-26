-- Source: https://github.com/sangellozn/gs.app/blob/9672ba6351f5e1d307c561cdcda3b7f04093e557/sql/00_init_db.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4

CREATE TABLE `product` (
    `id`               VARCHAR(36) NOT NULL CHECK(length(id) = 36),
    `name`             VARCHAR(100) NOT NULL,
    `description`      VARCHAR(255) NOT NULL,
    `ean13`            VARCHAR(13) NOT NULL CHECK(length(ean13) = 13),
    `stock_qty`        DECIMAL(10,2) NOT NULL,
    `min_stock_qty`    DECIMAL(10,2) NOT NULL,
    `target_stock_qty` DECIMAL(10,2) NOT NULL CHECK(target_stock_qty > min_stock_qty),
    `created_at`       INTEGER NOT NULL,
    `updated_at`       INTEGER,
    `version`          INTEGER NOT NULL DEFAULT 1,
    `deleted`          INTEGER NOT NULL CHECK(deleted in (0,1)),
    PRIMARY KEY(`id`)
);

CREATE TABLE `shopping_list` (
    `id`         VARCHAR(36) NOT NULL CHECK(length(id) = 36),
    `comment`    VARCHAR(255) NOT NULL,
    `state`      CHAR(6) NOT NULL CHECK(`state` in ('OPENED', 'CLOSED')),
    `created_at` INTEGER NOT NULL,
    `updated_at` INTEGER,
    `version`    INTEGER NOT NULL DEFAULT 1,
    `deleted`    INTEGER NOT NULL CHECK(deleted in (0,1)),
    PRIMARY KEY(`id`)
);

CREATE TABLE `shopping_list_item` (
    `id`               VARCHAR(36) NOT NULL CHECK(length(id) = 36),
    `shopping_list_id` VARCHAR(36) NOT NULL CHECK(length(id) = 36),
    `product_id`       VARCHAR(36) NOT NULL CHECK(length(id) = 36),
    `qty`              DECIMAL(10,2) NOT NULL,
    `created_at`       INTEGER NOT NULL,
    `updated_at`       INTEGER,
    `version`          INTEGER NOT NULL DEFAULT 1,
    `deleted`          INTEGER NOT NULL CHECK(deleted in (0,1)),
    PRIMARY KEY(`id`),
    FOREIGN KEY(product_id) REFERENCES product(id),
    FOREIGN KEY(shopping_list_id) REFERENCES shopping_list(id)
);

CREATE TABLE DomainEventEntry (
    globalIndex INTEGER PRIMARY KEY AUTOINCREMENT,
    aggregateIdentifier VARCHAR(255) NOT NULL,
    sequenceNumber BIGINT NOT NULL,
    `type` VARCHAR(255),
    eventIdentifier VARCHAR(255) NOT NULL,
    metaData blob,
    payload blob NOT NULL,
    payloadRevision VARCHAR(255),
    payloadType VARCHAR(255) NOT NULL,
    timeStamp VARCHAR(255) NOT NULL,
    UNIQUE (aggregateIdentifier, sequenceNumber),
    UNIQUE (eventIdentifier)
);

