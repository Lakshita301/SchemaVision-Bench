-- Source: https://github.com/FlyingIsland/e-Arth-Solutions/blob/2565c6d98b7c44c09dfedc398964cef227f3b1b6/S-006_TxnImp/sql/schema.sql?raw=true
-- Tables detected: 4 | FK constraints: 2
CREATE TABLE "account" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "number" int unsigned NOT NULL,
    "bank" int unsigned NOT NULL,
    "type" varchar(64) NOT NULL,
    "currency" varchar(4) NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "id_UNIQUE" UNIQUE ("id"),
    CONSTRAINT "number_UNIQUE" UNIQUE ("number")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE "bank" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "name" varchar(127) NOT NULL,
    "shortname" varchar(31) NOT NULL,
    "website" varchar(45) NOT NULL,
    PRIMARY KEY ("id","shortname"),
    CONSTRAINT "id_UNIQUE" UNIQUE ("id"),
    CONSTRAINT "name_UNIQUE" UNIQUE ("name"),
    CONSTRAINT "website_UNIQUE" UNIQUE ("shortname")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE "transaction" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "account" int unsigned NOT NULL,
    "date" TIMESTAMP NOT NULL,
    "amount" decimal(10,2) NOT NULL,
    "description" varchar(255) NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "id_UNIQUE" UNIQUE ("id"),
    CONSTRAINT "unique_index" UNIQUE ("account","date","amount","description")
);

CREATE TABLE "company" (
    "cik" varchar(50) DEFAULT NULL,
    "name" varchar(300) DEFAULT NULL,
    "state" varchar(2) DEFAULT NULL,
    "sic" varchar(5) DEFAULT NULL,
    "created" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT "asin" UNIQUE ("cik")
);
ALTER TABLE "account" ADD CONSTRAINT "account_bank" FOREIGN KEY ("bank") REFERENCES "bank" ("id") ON UPDATE CASCADE;
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_account" FOREIGN KEY ("account") REFERENCES "account" ("id") ON UPDATE CASCADE;
CREATE INDEX ON "account" ("bank");
CREATE INDEX ON "transaction" ("account");
