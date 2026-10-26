-- Source: https://github.com/niefermar/faces-spring-hibernate/blob/fbba871b35da47d898888ed9d1bc4c21eb796a8c/Proyectos/03-security-solution/src/main/resources/accounts/testdb/reward.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 4
CREATE TABLE "app_user" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "account_expired" bit(1) NOT NULL,
    "account_locked" bit(1) NOT NULL,
    "address" varchar(150) DEFAULT NULL,
    "city" varchar(50) DEFAULT NULL,
    "country" varchar(100) DEFAULT NULL,
    "postal_code" varchar(15) DEFAULT NULL,
    "province" varchar(100) DEFAULT NULL,
    "credentials_expired" bit(1) NOT NULL,
    "email" varchar(255) NOT NULL,
    "account_enabled" bit(1) DEFAULT NULL,
    "first_name" varchar(50) NOT NULL,
    "last_name" varchar(50) NOT NULL,
    "password" varchar(255) NOT NULL,
    "password_hint" varchar(255) DEFAULT NULL,
    "phone_number" varchar(255) DEFAULT NULL,
    "username" varchar(50) NOT NULL,
    "version" int DEFAULT NULL,
    "website" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "email" ("email"),
    UNIQUE KEY "username" ("username")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE "role" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "description" varchar(64) DEFAULT NULL,
    "name" varchar(20) DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE "t_account" (
    "ID" bigint NOT NULL AUTO_INCREMENT,
    "NUMBER" varchar(9) DEFAULT NULL,
    "NAME" varchar(50) NOT NULL,
    PRIMARY KEY ("ID"),
    UNIQUE KEY "NUMBER" ("NUMBER")
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

CREATE TABLE "t_account_beneficiary" (
    "ID" bigint NOT NULL AUTO_INCREMENT,
    "ACCOUNT_ID" bigint DEFAULT NULL,
    "NAME" varchar(50) DEFAULT NULL,
    "ALLOCATION_PERCENTAGE" DOUBLE PRECISION NOT NULL,
    "SAVINGS" DOUBLE PRECISION NOT NULL,
    PRIMARY KEY ("ID"),
    UNIQUE KEY "ACCOUNT_ID" ("ACCOUNT_ID","NAME"),
    CONSTRAINT "FK_t_account_beneficiary" FOREIGN KEY ("ACCOUNT_ID") REFERENCES "t_account" ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

CREATE TABLE "t_account_credit_card" (
    "ID" bigint NOT NULL AUTO_INCREMENT,
    "ACCOUNT_ID" bigint DEFAULT NULL,
    "NUMBER" varchar(16) DEFAULT NULL,
    PRIMARY KEY ("ID"),
    UNIQUE KEY "ACCOUNT_ID" ("ACCOUNT_ID","NUMBER"),
    CONSTRAINT "FK_t_account_credit_card" FOREIGN KEY ("ACCOUNT_ID") REFERENCES "t_account" ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

CREATE TABLE "t_restaurant" (
    "ID" bigint NOT NULL,
    "MERCHANT_NUMBER" varchar(10) NOT NULL,
    "NAME" varchar(80) NOT NULL,
    "BENEFIT_PERCENTAGE" DOUBLE PRECISION NOT NULL,
    "BENEFIT_AVAILABILITY_POLICY" varchar(1) NOT NULL,
    PRIMARY KEY ("ID"),
    UNIQUE KEY "MERCHANT_NUMBER" ("MERCHANT_NUMBER")
);

CREATE TABLE "t_reward" (
    "ID" bigint NOT NULL AUTO_INCREMENT,
    "CONFIRMATION_NUMBER" varchar(25) NOT NULL,
    "REWARD_AMOUNT" DOUBLE PRECISION NOT NULL,
    "REWARD_DATE" date NOT NULL,
    "ACCOUNT_NUMBER" varchar(9) NOT NULL,
    "DINING_AMOUNT" DOUBLE PRECISION NOT NULL,
    "DINING_MERCHANT_NUMBER" varchar(10) NOT NULL,
    "DINING_DATE" date NOT NULL,
    PRIMARY KEY ("ID"),
    UNIQUE KEY "CONFIRMATION_NUMBER" ("CONFIRMATION_NUMBER")
);

CREATE TABLE "user_role" (
    "user_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    PRIMARY KEY ("user_id","role_id"),
    KEY "FK143BF46A9B523CC9" ("role_id"),
    KEY "FK143BF46A407D00A9" ("user_id"),
    CONSTRAINT "FK143BF46A407D00A9" FOREIGN KEY ("user_id") REFERENCES "app_user" ("id"),
    CONSTRAINT "FK143BF46A9B523CC9" FOREIGN KEY ("role_id") REFERENCES "role" ("id")
);
