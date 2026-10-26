-- Source: https://github.com/DeneefBert/RCCarTracking/blob/ed0cbea2a27168ca96c5e03c5aca717aef45a9eb/Code/Database-export/RCCarTracking.sql?raw=true
-- Tables detected: 3 | FK constraints: 2
CREATE TABLE "actions" (
    "idactions" int NOT NULL,
    "description" varchar(200) NOT NULL,
    PRIMARY KEY ("idactions")
);

CREATE TABLE "devices" (
    "iddevices" int NOT NULL,
    "abbreviation" varchar(5) NOT NULL,
    "code" varchar(15) DEFAULT NULL,
    "manufacturer" varchar(45) DEFAULT NULL,
    "description" varchar(200) NOT NULL,
    "type" SMALLINT NOT NULL,
    "cost" float DEFAULT NULL,
    "unit" varchar(10) DEFAULT NULL,
    PRIMARY KEY ("iddevices"),
    CONSTRAINT "abbreviation_UNIQUE" UNIQUE ("abbreviation")
);

CREATE TABLE "history" (
    "idhistory" int NOT NULL,
    "date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "value" float DEFAULT NULL,
    "comments" varchar(200) DEFAULT NULL,
    "deviceid" int NOT NULL,
    "actionid" int NOT NULL,
    PRIMARY KEY ("idhistory"),
    CONSTRAINT "actionid" FOREIGN KEY ("actionid") REFERENCES "actions" ("idactions"),
    CONSTRAINT "deviceid" FOREIGN KEY ("deviceid") REFERENCES "devices" ("iddevices")
);
CREATE INDEX ON "history" ("deviceid");
CREATE INDEX ON "history" ("actionid");
