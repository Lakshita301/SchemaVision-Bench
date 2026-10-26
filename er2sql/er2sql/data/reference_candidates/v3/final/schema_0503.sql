-- Source: https://github.com/VictoriaCalbet/D12-Group-7/blob/c47d1b59fed47fd90f32016d81e864fd640a6e61/Proyecto%20del%20grupo%20de%20Camila/scriptCreateBattle.sql?raw=true
-- Tables detected: 34 | FK/REFERENCES mentions: 35
CREATE TABLE "actor" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "avatar" varchar(255) DEFAULT NULL,
    "confirmMoment" TIMESTAMP DEFAULT NULL,
    "email" varchar(255) DEFAULT NULL,
    "hasConfirmedTerms" bit(1) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "nickname" varchar(255) DEFAULT NULL,
    "phone" varchar(255) DEFAULT NULL,
    "surname" varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_cgls5lrufx91ufsyh467spwa3" UNIQUE ("userAccount_id"),
    CONSTRAINT "UK_6cwpy57cri0qhnc28qj0qybsn" UNIQUE ("nickname"),
    CONSTRAINT "FK_cgls5lrufx91ufsyh467spwa3" FOREIGN KEY ("userAccount_id") REFERENCES "useraccount" ("id")
);

CREATE TABLE "administrator" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "avatar" varchar(255) DEFAULT NULL,
    "confirmMoment" TIMESTAMP DEFAULT NULL,
    "email" varchar(255) DEFAULT NULL,
    "hasConfirmedTerms" bit(1) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "nickname" varchar(255) DEFAULT NULL,
    "phone" varchar(255) DEFAULT NULL,
    "surname" varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_idt4b4u259p6vs4pyr9lax4eg" UNIQUE ("userAccount_id"),
    CONSTRAINT "UK_7pcwodeblkp8s3tyeniqcx333" UNIQUE ("nickname"),
    CONSTRAINT "FK_idt4b4u259p6vs4pyr9lax4eg" FOREIGN KEY ("userAccount_id") REFERENCES "useraccount" ("id")
);

CREATE TABLE "banned" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "banDate" TIMESTAMP DEFAULT NULL,
    "duration" int DEFAULT NULL,
    "isValid" bit(1) DEFAULT NULL,
    "reason" varchar(255) DEFAULT NULL,
    "actor_id" int NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "battle" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "attackerOwner" bit(1) DEFAULT NULL,
    "balance" varchar(255) DEFAULT NULL,
    "isWon" bit(1) DEFAULT NULL,
    "luckAttacker" DOUBLE PRECISION DEFAULT NULL,
    "luckDeffender" DOUBLE PRECISION DEFAULT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "attacker_id" int NOT NULL,
    "deffender_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_es2fkuwxqq8msuwpdhq96e3ds" FOREIGN KEY ("attacker_id") REFERENCES "keybladewielder" ("id"),
    CONSTRAINT "FK_hmquk2ueg3x8tmhmv1wsr4n7m" FOREIGN KEY ("deffender_id") REFERENCES "keybladewielder" ("id")
);

CREATE TABLE "building" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "extraCostPerLvl" DOUBLE PRECISION DEFAULT NULL,
    "isFinal" bit(1) DEFAULT NULL,
    "maxLvl" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "photo" varchar(255) DEFAULT NULL,
    "timeToConstruct" int DEFAULT NULL,
    "contentManager_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_6rnrpwu52hmaj92tqtnmhbnvp" FOREIGN KEY ("contentManager_id") REFERENCES "contentmanager" ("id")
);

CREATE TABLE "built" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "activationDate" TIMESTAMP DEFAULT NULL,
    "creationDate" TIMESTAMP DEFAULT NULL,
    "lvl" int DEFAULT NULL,
    "building_id" int NOT NULL,
    "gummiShip_id" int DEFAULT NULL,
    "keybladeWielder_id" int NOT NULL,
    "troop_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_97junl37o3m1t1nhf6g5jaky3" FOREIGN KEY ("gummiShip_id") REFERENCES "gummiship" ("id"),
    CONSTRAINT "FK_biwn31vxymhnfsx82s2d4t8pl" FOREIGN KEY ("troop_id") REFERENCES "troop" ("id"),
    CONSTRAINT "FK_ra1behx93p0phfoa56jkusmqn" FOREIGN KEY ("keybladeWielder_id") REFERENCES "keybladewielder" ("id")
);

CREATE TABLE "chatty" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "content" varchar(255) DEFAULT NULL,
    "date" TIMESTAMP DEFAULT NULL,
    "invitation_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_dran7x58nypw2v8hm2g37a9r5" FOREIGN KEY ("invitation_id") REFERENCES "invitation" ("id")
);

CREATE TABLE "configuration" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "baseGummiCoal" int DEFAULT NULL,
    "baseMunny" int DEFAULT NULL,
    "baseMytrhil" int DEFAULT NULL,
    "dailyGummiCoal" int DEFAULT NULL,
    "dailyMunny" int DEFAULT NULL,
    "dailyMytrhil" int DEFAULT NULL,
    "lostLvlsDeffender" int DEFAULT NULL,
    "orgMessages" int DEFAULT NULL,
    "percentageWinAttacker" DOUBLE PRECISION DEFAULT NULL,
    "percentageWinDefender" DOUBLE PRECISION DEFAULT NULL,
    "worldSlots" int DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "contentmanager" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "avatar" varchar(255) DEFAULT NULL,
    "confirmMoment" TIMESTAMP DEFAULT NULL,
    "email" varchar(255) DEFAULT NULL,
    "hasConfirmedTerms" bit(1) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "nickname" varchar(255) DEFAULT NULL,
    "phone" varchar(255) DEFAULT NULL,
    "surname" varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_jkls9gyrwigpi8unmm6p6gv51" UNIQUE ("userAccount_id"),
    CONSTRAINT "UK_id5ivndau3qraqav3gv1glxpm" UNIQUE ("nickname"),
    CONSTRAINT "FK_jkls9gyrwigpi8unmm6p6gv51" FOREIGN KEY ("userAccount_id") REFERENCES "useraccount" ("id")
);

CREATE TABLE "defense" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "extraCostPerLvl" DOUBLE PRECISION DEFAULT NULL,
    "isFinal" bit(1) DEFAULT NULL,
    "maxLvl" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "photo" varchar(255) DEFAULT NULL,
    "timeToConstruct" int DEFAULT NULL,
    "contentManager_id" int NOT NULL,
    "defense" int DEFAULT NULL,
    "extraDefensePerLvl" DOUBLE PRECISION DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_7ucegt7vmim0tht04r9ogkt2y" FOREIGN KEY ("contentManager_id") REFERENCES "contentmanager" ("id")
);

CREATE TABLE "faction" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "extraAttack" DOUBLE PRECISION DEFAULT NULL,
    "extraDefense" DOUBLE PRECISION DEFAULT NULL,
    "extraResources" DOUBLE PRECISION DEFAULT NULL,
    "galaxy" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "powerUpDescription" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "gamemaster" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "avatar" varchar(255) DEFAULT NULL,
    "confirmMoment" TIMESTAMP DEFAULT NULL,
    "email" varchar(255) DEFAULT NULL,
    "hasConfirmedTerms" bit(1) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "nickname" varchar(255) DEFAULT NULL,
    "phone" varchar(255) DEFAULT NULL,
    "surname" varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_lw3n1at3slipc8cee8r9awhg" UNIQUE ("userAccount_id"),
    CONSTRAINT "UK_36gfwf718ymlamy7e1io39de3" UNIQUE ("nickname"),
    CONSTRAINT "FK_lw3n1at3slipc8cee8r9awhg" FOREIGN KEY ("userAccount_id") REFERENCES "useraccount" ("id")
);

CREATE TABLE "gummiship" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "recruiterRequiredLvl" int DEFAULT NULL,
    "slots" int DEFAULT NULL,
    "timeToRecruit" int DEFAULT NULL,
    "recruiter_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_dcyrv2d4x2cc5owo9il8901c6" UNIQUE ("name"),
    CONSTRAINT "FK_bpe54i7i0udsn49gfpgqkh8qs" FOREIGN KEY ("recruiter_id") REFERENCES "recruiter" ("id")
);

CREATE TABLE "hibernate_sequences" (
    "sequence_name" varchar(255) DEFAULT NULL,
    "sequence_next_hi_value" int DEFAULT NULL
);

CREATE TABLE "invitation" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "content" varchar(255) DEFAULT NULL,
    "date" date DEFAULT NULL,
    "invitationStatus" varchar(255) DEFAULT NULL,
    "orgRange" varchar(255) DEFAULT NULL,
    "keybladeWielder_id" int NOT NULL,
    "organization_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_mnp1cm2xsssclt44jm5j8o7wt" FOREIGN KEY ("organization_id") REFERENCES "organization" ("id")
);

CREATE TABLE "item" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "description" varchar(255) DEFAULT NULL,
    "duration" int DEFAULT NULL,
    "expiration" int DEFAULT NULL,
    "extra" DOUBLE PRECISION DEFAULT NULL,
    "munnyCost" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "onSell" bit(1) NOT NULL,
    "type" varchar(255) DEFAULT NULL,
    "contentManager_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_a5hxmfx1a4325hg0uds5ulqdp" UNIQUE ("name"),
    CONSTRAINT "FK_rgx5h3wyhrg3fy5k4iepacrh6" FOREIGN KEY ("contentManager_id") REFERENCES "contentmanager" ("id")
);

CREATE TABLE "keybladewielder" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "avatar" varchar(255) DEFAULT NULL,
    "confirmMoment" TIMESTAMP DEFAULT NULL,
    "email" varchar(255) DEFAULT NULL,
    "hasConfirmedTerms" bit(1) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "nickname" varchar(255) DEFAULT NULL,
    "phone" varchar(255) DEFAULT NULL,
    "surname" varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    "lastConnection" TIMESTAMP DEFAULT NULL,
    "loses" int DEFAULT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "wins" int DEFAULT NULL,
    "x" int DEFAULT NULL,
    "y" int DEFAULT NULL,
    "z" int DEFAULT NULL,
    "worldName" varchar(255) DEFAULT NULL,
    "faction_id" int NOT NULL,
    "shield_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_2p7covt8b041f18p9rky9n2a9" UNIQUE ("userAccount_id"),
    CONSTRAINT "UK_mn080mjc05f31iq71yhijr4eb" UNIQUE ("worldName"),
    CONSTRAINT "UK_49p0qgqd62xyulwm4lh2j9pwm" UNIQUE ("nickname"),
    CONSTRAINT "FK_2p7covt8b041f18p9rky9n2a9" FOREIGN KEY ("userAccount_id") REFERENCES "useraccount" ("id"),
    CONSTRAINT "FK_fxww30xulx45d0xlek9qbcqvd" FOREIGN KEY ("faction_id") REFERENCES "faction" ("id"),
    CONSTRAINT "FK_lq6c56d23q5dmybsgvgsmvau8" FOREIGN KEY ("shield_id") REFERENCES "shield" ("id")
);

CREATE TABLE "legaltext" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "body" TEXT,
    "codeLanguage" varchar(255) DEFAULT NULL,
    "type" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "livelihood" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "extraCostPerLvl" DOUBLE PRECISION DEFAULT NULL,
    "isFinal" bit(1) DEFAULT NULL,
    "maxLvl" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "photo" varchar(255) DEFAULT NULL,
    "timeToConstruct" int DEFAULT NULL,
    "contentManager_id" int NOT NULL,
    "extraMaterialsPerLvl" DOUBLE PRECISION DEFAULT NULL,
    "lessTimePerLvl" DOUBLE PRECISION DEFAULT NULL,
    "collectedGummiCoal" int DEFAULT NULL,
    "collectedMunny" int DEFAULT NULL,
    "collectedMytrhil" int DEFAULT NULL,
    "timeToRecollect" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_ackl04e3jgv0uk6n9encdd8vc" FOREIGN KEY ("contentManager_id") REFERENCES "contentmanager" ("id")
);

CREATE TABLE "organization" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "creationDate" TIMESTAMP DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "prize" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "date" TIMESTAMP DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "keybladeWielder_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_2u4vbgeqtq8yo5gf5xowvpi1v" FOREIGN KEY ("keybladeWielder_id") REFERENCES "keybladewielder" ("id")
);

CREATE TABLE "purchase" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "activationDate" TIMESTAMP DEFAULT NULL,
    "expirationDate" TIMESTAMP DEFAULT NULL,
    "purchaseDate" date DEFAULT NULL,
    "item_id" int NOT NULL,
    "player_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_9jmud92x8qm28js0lloqod7bc" FOREIGN KEY ("player_id") REFERENCES "keybladewielder" ("id"),
    CONSTRAINT "FK_m8nebt839m2w55qk0dxcrnnnw" FOREIGN KEY ("item_id") REFERENCES "item" ("id")
);

CREATE TABLE "recruited" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "gummiShip_id" int DEFAULT NULL,
    "storageBuilding_id" int NOT NULL,
    "troop_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_363v4589sr2895tlpm6va73n5" FOREIGN KEY ("troop_id") REFERENCES "troop" ("id"),
    CONSTRAINT "FK_aj8fktrnyfhbljlgwu53yvnoe" FOREIGN KEY ("storageBuilding_id") REFERENCES "built" ("id"),
    CONSTRAINT "FK_i943aw5urm3iegjwt7c51iuxq" FOREIGN KEY ("gummiShip_id") REFERENCES "gummiship" ("id")
);

CREATE TABLE "recruiter" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "extraCostPerLvl" DOUBLE PRECISION DEFAULT NULL,
    "isFinal" bit(1) DEFAULT NULL,
    "maxLvl" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "photo" varchar(255) DEFAULT NULL,
    "timeToConstruct" int DEFAULT NULL,
    "contentManager_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_ev3n49ifl082qx37ap1qq4mbf" FOREIGN KEY ("contentManager_id") REFERENCES "contentmanager" ("id")
);

CREATE TABLE "report" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "content" varchar(255) DEFAULT NULL,
    "date" date DEFAULT NULL,
    "isBug" bit(1) NOT NULL,
    "status" varchar(255) DEFAULT NULL,
    "title" varchar(255) DEFAULT NULL,
    "keybladeWielder_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_oe0r6s550sr6cmgdstosytnpv" FOREIGN KEY ("keybladeWielder_id") REFERENCES "keybladewielder" ("id")
);

CREATE TABLE "report_photos" (
    "Report_id" int NOT NULL,
    "photos" varchar(255) DEFAULT NULL,
    CONSTRAINT "FK_fd13a90x7k7j80d8xye1x2rfx" FOREIGN KEY ("Report_id") REFERENCES "report" ("id")
);

CREATE TABLE "report_reportupdate" (
    "Report_id" int NOT NULL,
    "reportUpdates_id" int NOT NULL,
    CONSTRAINT "UK_43xicbjikgjminaei0arhats1" UNIQUE ("reportUpdates_id"),
    CONSTRAINT "FK_43xicbjikgjminaei0arhats1" FOREIGN KEY ("reportUpdates_id") REFERENCES "reportupdate" ("id"),
    CONSTRAINT "FK_srd13vb4jj76g5mjqllbug76j" FOREIGN KEY ("Report_id") REFERENCES "report" ("id")
);

CREATE TABLE "reportupdate" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "content" varchar(255) DEFAULT NULL,
    "date" TIMESTAMP DEFAULT NULL,
    "isSuspicious" bit(1) DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "administrator_id" int DEFAULT NULL,
    "gameMaster_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_6lbvciwghn3w9px3s8e92qp6v" FOREIGN KEY ("administrator_id") REFERENCES "administrator" ("id"),
    CONSTRAINT "FK_mh33ijgwkf614b636i02jqrq5" FOREIGN KEY ("gameMaster_id") REFERENCES "gamemaster" ("id")
);

CREATE TABLE "requirement" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "lvl" int DEFAULT NULL,
    "mainBuilding_id" int NOT NULL,
    "requiredBuilding_id" int NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "shield" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "date" TIMESTAMP DEFAULT NULL,
    "duration" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "troop" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "attack" int DEFAULT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "defense" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "recruiterRequiredLvl" int DEFAULT NULL,
    "timeToRecruit" int DEFAULT NULL,
    "recruiter_id" int NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_d63lj6ow3pqb1ke6npwi875fh" UNIQUE ("name"),
    CONSTRAINT "FK_1ry11t999tbcg2buhdgdal0m2" FOREIGN KEY ("recruiter_id") REFERENCES "recruiter" ("id")
);

CREATE TABLE "useraccount" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "enabled" bit(1) NOT NULL,
    "password" varchar(255) DEFAULT NULL,
    "username" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "UK_csivo9yqa08nrbkog71ycilh5" UNIQUE ("username")
);

CREATE TABLE "useraccount_authorities" (
    "UserAccount_id" int NOT NULL,
    "authority" varchar(255) DEFAULT NULL,
    CONSTRAINT "FK_b63ua47r0u1m7ccc9lte2ui4r" FOREIGN KEY ("UserAccount_id") REFERENCES "useraccount" ("id")
);

CREATE TABLE "warehouse" (
    "id" int NOT NULL,
    "version" int NOT NULL,
    "gummiCoal" int DEFAULT NULL,
    "munny" int DEFAULT NULL,
    "mytrhil" int DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "extraCostPerLvl" DOUBLE PRECISION DEFAULT NULL,
    "isFinal" bit(1) DEFAULT NULL,
    "maxLvl" int DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "photo" varchar(255) DEFAULT NULL,
    "timeToConstruct" int DEFAULT NULL,
    "contentManager_id" int NOT NULL,
    "extraSlotsPerLvl" DOUBLE PRECISION DEFAULT NULL,
    "gummiSlots" int DEFAULT NULL,
    "gummiCoalSlots" int DEFAULT NULL,
    "munnySlots" int DEFAULT NULL,
    "mytrhilSlots" int DEFAULT NULL,
    "troopSlots" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "FK_mp4xkqm4jf2oxr9q7cdno2mna" FOREIGN KEY ("contentManager_id") REFERENCES "contentmanager" ("id")
);
CREATE INDEX ON "banned" ("isValid");
CREATE INDEX ON "banned" ("actor_id");
CREATE INDEX ON "battle" ("attacker_id");
CREATE INDEX ON "battle" ("deffender_id");
CREATE INDEX ON "building" ("isFinal");
CREATE INDEX ON "building" ("contentManager_id");
CREATE INDEX ON "built" ("lvl");
CREATE INDEX ON "built" ("gummiShip_id");
CREATE INDEX ON "built" ("keybladeWielder_id");
CREATE INDEX ON "built" ("troop_id");
CREATE INDEX ON "chatty" ("date");
CREATE INDEX ON "chatty" ("invitation_id");
CREATE INDEX ON "defense" ("isFinal");
CREATE INDEX ON "defense" ("contentManager_id");
CREATE INDEX ON "gummiship" ("recruiterRequiredLvl");
CREATE INDEX ON "gummiship" ("recruiter_id");
CREATE INDEX ON "invitation" ("date","invitationStatus","orgRange");
CREATE INDEX ON "invitation" ("organization_id");
CREATE INDEX ON "item" ("contentManager_id");
CREATE INDEX ON "keybladewielder" ("faction_id");
CREATE INDEX ON "keybladewielder" ("shield_id");
CREATE INDEX ON "livelihood" ("isFinal");
CREATE INDEX ON "livelihood" ("contentManager_id");
CREATE INDEX ON "prize" ("date");
CREATE INDEX ON "prize" ("keybladeWielder_id");
CREATE INDEX ON "purchase" ("item_id");
CREATE INDEX ON "purchase" ("player_id");
CREATE INDEX ON "recruited" ("gummiShip_id");
CREATE INDEX ON "recruited" ("storageBuilding_id");
CREATE INDEX ON "recruited" ("troop_id");
CREATE INDEX ON "recruiter" ("isFinal");
CREATE INDEX ON "recruiter" ("contentManager_id");
CREATE INDEX ON "report" ("keybladeWielder_id");
CREATE INDEX ON "report_photos" ("Report_id");
CREATE INDEX ON "report_reportupdate" ("Report_id");
CREATE INDEX ON "reportupdate" ("administrator_id");
CREATE INDEX ON "reportupdate" ("gameMaster_id");
CREATE INDEX ON "requirement" ("lvl");
CREATE INDEX ON "troop" ("recruiterRequiredLvl");
CREATE INDEX ON "troop" ("recruiter_id");
CREATE INDEX ON "useraccount_authorities" ("UserAccount_id");
CREATE INDEX ON "warehouse" ("isFinal");
CREATE INDEX ON "warehouse" ("contentManager_id");
