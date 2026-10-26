-- Source: https://github.com/MohanishPingale/Phase2FlyAway/blob/5c8fee4c9e4278104d57c5395718b978aca6010b/Database/AirLineTicket.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 1
CREATE TABLE "a_book" (
    "ID" bigint NOT NULL,
    "flightId" bigint DEFAULT NULL,
    "flightName" varchar(225) DEFAULT NULL,
    "firstName" varchar(225) DEFAULT NULL,
    "lastName" varchar(225) DEFAULT NULL,
    "mobileNo" varchar(225) DEFAULT NULL,
    "bookDate" date DEFAULT NULL,
    "emailId" varchar(225) DEFAULT NULL,
    "address" varchar(755) DEFAULT NULL,
    "noOfPerson" bigint DEFAULT NULL,
    "price" bigint DEFAULT NULL,
    "finalPrice" bigint DEFAULT NULL,
    "createdBy" varchar(225) DEFAULT NULL,
    "modifiedBy" varchar(225) DEFAULT NULL,
    "createdDatetime" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "modifiedDatetime" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("ID"),
    CONSTRAINT "FK_a_book" FOREIGN KEY ("flightId") REFERENCES "a_flight" ("ID") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "a_flight" (
    "ID" bigint NOT NULL,
    "flightNo" varchar(225) DEFAULT NULL,
    "fightName" varchar(225) DEFAULT NULL,
    "fromCity" varchar(225) DEFAULT NULL,
    "toCity" varchar(225) DEFAULT NULL,
    "date" date DEFAULT NULL,
    "description" varchar(775) DEFAULT NULL,
    "time" varchar(225) DEFAULT NULL,
    "travelDuraion" varchar(225) DEFAULT NULL,
    "ticketPrice" bigint DEFAULT NULL,
    "airPortName" varchar(225) DEFAULT NULL,
    "createdBy" varchar(225) DEFAULT NULL,
    "modifiedBy" varchar(225) DEFAULT NULL,
    "createdDatetime" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "modifiedDatetime" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("ID")
);

CREATE TABLE "a_user" (
    "ID" bigint NOT NULL,
    "firstName" varchar(225) DEFAULT NULL,
    "lastName" varchar(225) DEFAULT NULL,
    "login" varchar(225) DEFAULT NULL,
    "password" varchar(225) DEFAULT NULL,
    "roleId" bigint DEFAULT NULL,
    "createdBy" varchar(225) DEFAULT NULL,
    "modifiedBy" varchar(225) DEFAULT NULL,
    "createdDatetime" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "modifiedDatetime" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY ("ID")
);
CREATE INDEX ON "a_book" ("flightId");
