-- Source: https://github.com/VictoriaCalbet/D12-Group-7/blob/c47d1b59fed47fd90f32016d81e864fd640a6e61/Proyecto%20del%20grupo%20de%20Camila/scriptCreateBattle.sql?raw=true
-- Tables detected: 34 | FK/REFERENCES mentions: 35
CREATE TABLE actor (
    id int NOT NULL,
    version int NOT NULL,
    avatar varchar(255) DEFAULT NULL,
    confirmmoment TIMESTAMP DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    hasconfirmedterms bit(1) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    nickname varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    surname varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_cgls5lrufx91ufsyh467spwa3 UNIQUE ("userAccount_id"),
    CONSTRAINT uk_6cwpy57cri0qhnc28qj0qybsn UNIQUE (nickname)
);

CREATE TABLE administrator (
    id int NOT NULL,
    version int NOT NULL,
    avatar varchar(255) DEFAULT NULL,
    confirmmoment TIMESTAMP DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    hasconfirmedterms bit(1) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    nickname varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    surname varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_idt4b4u259p6vs4pyr9lax4eg UNIQUE ("userAccount_id"),
    CONSTRAINT uk_7pcwodeblkp8s3tyeniqcx333 UNIQUE (nickname)
);

CREATE TABLE banned (
    id int NOT NULL,
    version int NOT NULL,
    bandate TIMESTAMP DEFAULT NULL,
    duration int DEFAULT NULL,
    isvalid bit(1) DEFAULT NULL,
    reason varchar(255) DEFAULT NULL,
    actor_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE battle (
    id int NOT NULL,
    version int NOT NULL,
    attackerowner bit(1) DEFAULT NULL,
    balance varchar(255) DEFAULT NULL,
    iswon bit(1) DEFAULT NULL,
    luckattacker DOUBLE PRECISION DEFAULT NULL,
    luckdeffender DOUBLE PRECISION DEFAULT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    attacker_id int NOT NULL,
    deffender_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE building (
    id int NOT NULL,
    version int NOT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    extracostperlvl DOUBLE PRECISION DEFAULT NULL,
    isfinal bit(1) DEFAULT NULL,
    maxlvl int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    photo varchar(255) DEFAULT NULL,
    timetoconstruct int DEFAULT NULL,
    contentmanager_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE built (
    id int NOT NULL,
    version int NOT NULL,
    activationdate TIMESTAMP DEFAULT NULL,
    creationdate TIMESTAMP DEFAULT NULL,
    lvl int DEFAULT NULL,
    building_id int NOT NULL,
    gummiship_id int DEFAULT NULL,
    keybladewielder_id int NOT NULL,
    troop_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE chatty (
    id int NOT NULL,
    version int NOT NULL,
    content varchar(255) DEFAULT NULL,
    date TIMESTAMP DEFAULT NULL,
    invitation_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE configuration (
    id int NOT NULL,
    version int NOT NULL,
    basegummicoal int DEFAULT NULL,
    basemunny int DEFAULT NULL,
    basemytrhil int DEFAULT NULL,
    dailygummicoal int DEFAULT NULL,
    dailymunny int DEFAULT NULL,
    dailymytrhil int DEFAULT NULL,
    lostlvlsdeffender int DEFAULT NULL,
    orgmessages int DEFAULT NULL,
    percentagewinattacker DOUBLE PRECISION DEFAULT NULL,
    percentagewindefender DOUBLE PRECISION DEFAULT NULL,
    worldslots int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE contentmanager (
    id int NOT NULL,
    version int NOT NULL,
    avatar varchar(255) DEFAULT NULL,
    confirmmoment TIMESTAMP DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    hasconfirmedterms bit(1) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    nickname varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    surname varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_jkls9gyrwigpi8unmm6p6gv51 UNIQUE ("userAccount_id"),
    CONSTRAINT uk_id5ivndau3qraqav3gv1glxpm UNIQUE (nickname)
);

CREATE TABLE defense (
    id int NOT NULL,
    version int NOT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    extracostperlvl DOUBLE PRECISION DEFAULT NULL,
    isfinal bit(1) DEFAULT NULL,
    maxlvl int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    photo varchar(255) DEFAULT NULL,
    timetoconstruct int DEFAULT NULL,
    contentmanager_id int NOT NULL,
    defense int DEFAULT NULL,
    extradefenseperlvl DOUBLE PRECISION DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE faction (
    id int NOT NULL,
    version int NOT NULL,
    extraattack DOUBLE PRECISION DEFAULT NULL,
    extradefense DOUBLE PRECISION DEFAULT NULL,
    extraresources DOUBLE PRECISION DEFAULT NULL,
    galaxy int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    powerupdescription varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE gamemaster (
    id int NOT NULL,
    version int NOT NULL,
    avatar varchar(255) DEFAULT NULL,
    confirmmoment TIMESTAMP DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    hasconfirmedterms bit(1) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    nickname varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    surname varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_lw3n1at3slipc8cee8r9awhg UNIQUE ("userAccount_id"),
    CONSTRAINT uk_36gfwf718ymlamy7e1io39de3 UNIQUE (nickname)
);

CREATE TABLE gummiship (
    id int NOT NULL,
    version int NOT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    recruiterrequiredlvl int DEFAULT NULL,
    slots int DEFAULT NULL,
    timetorecruit int DEFAULT NULL,
    recruiter_id int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_dcyrv2d4x2cc5owo9il8901c6 UNIQUE (name)
);

CREATE TABLE hibernate_sequences (
    sequence_name varchar(255) DEFAULT NULL,
    sequence_next_hi_value int DEFAULT NULL
);

CREATE TABLE invitation (
    id int NOT NULL,
    version int NOT NULL,
    content varchar(255) DEFAULT NULL,
    date date DEFAULT NULL,
    invitationstatus varchar(255) DEFAULT NULL,
    orgrange varchar(255) DEFAULT NULL,
    keybladewielder_id int NOT NULL,
    organization_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE item (
    id int NOT NULL,
    version int NOT NULL,
    description varchar(255) DEFAULT NULL,
    duration int DEFAULT NULL,
    expiration int DEFAULT NULL,
    extra DOUBLE PRECISION DEFAULT NULL,
    munnycost int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    onsell bit(1) NOT NULL,
    type varchar(255) DEFAULT NULL,
    contentmanager_id int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_a5hxmfx1a4325hg0uds5ulqdp UNIQUE (name)
);

CREATE TABLE keybladewielder (
    id int NOT NULL,
    version int NOT NULL,
    avatar varchar(255) DEFAULT NULL,
    confirmmoment TIMESTAMP DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    hasconfirmedterms bit(1) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    nickname varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    surname varchar(255) DEFAULT NULL,
    "userAccount_id" int NOT NULL,
    lastconnection TIMESTAMP DEFAULT NULL,
    loses int DEFAULT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    wins int DEFAULT NULL,
    x int DEFAULT NULL,
    y int DEFAULT NULL,
    z int DEFAULT NULL,
    worldname varchar(255) DEFAULT NULL,
    faction_id int NOT NULL,
    shield_id int DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_2p7covt8b041f18p9rky9n2a9 UNIQUE ("userAccount_id"),
    CONSTRAINT uk_mn080mjc05f31iq71yhijr4eb UNIQUE (worldname),
    CONSTRAINT uk_49p0qgqd62xyulwm4lh2j9pwm UNIQUE (nickname)
);

CREATE TABLE legaltext (
    id int NOT NULL,
    version int NOT NULL,
    body TEXT,
    codelanguage varchar(255) DEFAULT NULL,
    type varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE livelihood (
    id int NOT NULL,
    version int NOT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    extracostperlvl DOUBLE PRECISION DEFAULT NULL,
    isfinal bit(1) DEFAULT NULL,
    maxlvl int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    photo varchar(255) DEFAULT NULL,
    timetoconstruct int DEFAULT NULL,
    contentmanager_id int NOT NULL,
    extramaterialsperlvl DOUBLE PRECISION DEFAULT NULL,
    lesstimeperlvl DOUBLE PRECISION DEFAULT NULL,
    collectedgummicoal int DEFAULT NULL,
    collectedmunny int DEFAULT NULL,
    collectedmytrhil int DEFAULT NULL,
    timetorecollect int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE organization (
    id int NOT NULL,
    version int NOT NULL,
    creationdate TIMESTAMP DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE prize (
    id int NOT NULL,
    version int NOT NULL,
    date TIMESTAMP DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    keybladewielder_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE purchase (
    id int NOT NULL,
    version int NOT NULL,
    activationdate TIMESTAMP DEFAULT NULL,
    expirationdate TIMESTAMP DEFAULT NULL,
    purchasedate date DEFAULT NULL,
    item_id int NOT NULL,
    player_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE recruited (
    id int NOT NULL,
    version int NOT NULL,
    gummiship_id int DEFAULT NULL,
    storagebuilding_id int NOT NULL,
    troop_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE recruiter (
    id int NOT NULL,
    version int NOT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    extracostperlvl DOUBLE PRECISION DEFAULT NULL,
    isfinal bit(1) DEFAULT NULL,
    maxlvl int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    photo varchar(255) DEFAULT NULL,
    timetoconstruct int DEFAULT NULL,
    contentmanager_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE report (
    id int NOT NULL,
    version int NOT NULL,
    content varchar(255) DEFAULT NULL,
    date date DEFAULT NULL,
    isbug bit(1) NOT NULL,
    status varchar(255) DEFAULT NULL,
    title varchar(255) DEFAULT NULL,
    keybladewielder_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE report_photos (
    report_id int NOT NULL,
    photos varchar(255) DEFAULT NULL
);

CREATE TABLE report_reportupdate (
    report_id int NOT NULL,
    reportupdates_id int NOT NULL,
    CONSTRAINT uk_43xicbjikgjminaei0arhats1 UNIQUE (reportupdates_id)
);

CREATE TABLE reportupdate (
    id int NOT NULL,
    version int NOT NULL,
    content varchar(255) DEFAULT NULL,
    date TIMESTAMP DEFAULT NULL,
    issuspicious bit(1) DEFAULT NULL,
    status varchar(255) DEFAULT NULL,
    administrator_id int DEFAULT NULL,
    gamemaster_id int DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE requirement (
    id int NOT NULL,
    version int NOT NULL,
    lvl int DEFAULT NULL,
    mainbuilding_id int NOT NULL,
    requiredbuilding_id int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE shield (
    id int NOT NULL,
    version int NOT NULL,
    date TIMESTAMP DEFAULT NULL,
    duration int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE troop (
    id int NOT NULL,
    version int NOT NULL,
    attack int DEFAULT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    defense int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    recruiterrequiredlvl int DEFAULT NULL,
    timetorecruit int DEFAULT NULL,
    recruiter_id int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_d63lj6ow3pqb1ke6npwi875fh UNIQUE (name)
);

CREATE TABLE useraccount (
    id int NOT NULL,
    version int NOT NULL,
    enabled bit(1) NOT NULL,
    password varchar(255) DEFAULT NULL,
    username varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_csivo9yqa08nrbkog71ycilh5 UNIQUE (username)
);

CREATE TABLE useraccount_authorities (
    "UserAccount_id" int NOT NULL,
    authority varchar(255) DEFAULT NULL
);

CREATE TABLE warehouse (
    id int NOT NULL,
    version int NOT NULL,
    gummicoal int DEFAULT NULL,
    munny int DEFAULT NULL,
    mytrhil int DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    extracostperlvl DOUBLE PRECISION DEFAULT NULL,
    isfinal bit(1) DEFAULT NULL,
    maxlvl int DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    photo varchar(255) DEFAULT NULL,
    timetoconstruct int DEFAULT NULL,
    contentmanager_id int NOT NULL,
    extraslotsperlvl DOUBLE PRECISION DEFAULT NULL,
    gummislots int DEFAULT NULL,
    gummicoalslots int DEFAULT NULL,
    munnyslots int DEFAULT NULL,
    mytrhilslots int DEFAULT NULL,
    troopslots int DEFAULT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE actor ADD CONSTRAINT fk_cgls5lrufx91ufsyh467spwa3 FOREIGN KEY ("userAccount_id") REFERENCES useraccount (id);
ALTER TABLE administrator ADD CONSTRAINT fk_idt4b4u259p6vs4pyr9lax4eg FOREIGN KEY ("userAccount_id") REFERENCES useraccount (id);
ALTER TABLE battle ADD CONSTRAINT fk_es2fkuwxqq8msuwpdhq96e3ds FOREIGN KEY (attacker_id) REFERENCES keybladewielder (id);
ALTER TABLE battle ADD CONSTRAINT fk_hmquk2ueg3x8tmhmv1wsr4n7m FOREIGN KEY (deffender_id) REFERENCES keybladewielder (id);
ALTER TABLE building ADD CONSTRAINT fk_6rnrpwu52hmaj92tqtnmhbnvp FOREIGN KEY (contentmanager_id) REFERENCES contentmanager (id);
ALTER TABLE built ADD CONSTRAINT fk_97junl37o3m1t1nhf6g5jaky3 FOREIGN KEY (gummiship_id) REFERENCES gummiship (id);
ALTER TABLE built ADD CONSTRAINT fk_biwn31vxymhnfsx82s2d4t8pl FOREIGN KEY (troop_id) REFERENCES troop (id);
ALTER TABLE built ADD CONSTRAINT fk_ra1behx93p0phfoa56jkusmqn FOREIGN KEY (keybladewielder_id) REFERENCES keybladewielder (id);
ALTER TABLE chatty ADD CONSTRAINT fk_dran7x58nypw2v8hm2g37a9r5 FOREIGN KEY (invitation_id) REFERENCES invitation (id);
ALTER TABLE contentmanager ADD CONSTRAINT fk_jkls9gyrwigpi8unmm6p6gv51 FOREIGN KEY ("userAccount_id") REFERENCES useraccount (id);
ALTER TABLE defense ADD CONSTRAINT fk_7ucegt7vmim0tht04r9ogkt2y FOREIGN KEY (contentmanager_id) REFERENCES contentmanager (id);
ALTER TABLE gamemaster ADD CONSTRAINT fk_lw3n1at3slipc8cee8r9awhg FOREIGN KEY ("userAccount_id") REFERENCES useraccount (id);
ALTER TABLE gummiship ADD CONSTRAINT fk_bpe54i7i0udsn49gfpgqkh8qs FOREIGN KEY (recruiter_id) REFERENCES recruiter (id);
ALTER TABLE invitation ADD CONSTRAINT fk_mnp1cm2xsssclt44jm5j8o7wt FOREIGN KEY (organization_id) REFERENCES organization (id);
ALTER TABLE item ADD CONSTRAINT fk_rgx5h3wyhrg3fy5k4iepacrh6 FOREIGN KEY (contentmanager_id) REFERENCES contentmanager (id);
ALTER TABLE keybladewielder ADD CONSTRAINT fk_2p7covt8b041f18p9rky9n2a9 FOREIGN KEY ("userAccount_id") REFERENCES useraccount (id);
ALTER TABLE keybladewielder ADD CONSTRAINT fk_fxww30xulx45d0xlek9qbcqvd FOREIGN KEY (faction_id) REFERENCES faction (id);
ALTER TABLE keybladewielder ADD CONSTRAINT fk_lq6c56d23q5dmybsgvgsmvau8 FOREIGN KEY (shield_id) REFERENCES shield (id);
ALTER TABLE livelihood ADD CONSTRAINT fk_ackl04e3jgv0uk6n9encdd8vc FOREIGN KEY (contentmanager_id) REFERENCES contentmanager (id);
ALTER TABLE prize ADD CONSTRAINT fk_2u4vbgeqtq8yo5gf5xowvpi1v FOREIGN KEY (keybladewielder_id) REFERENCES keybladewielder (id);
ALTER TABLE purchase ADD CONSTRAINT fk_9jmud92x8qm28js0lloqod7bc FOREIGN KEY (player_id) REFERENCES keybladewielder (id);
ALTER TABLE purchase ADD CONSTRAINT fk_m8nebt839m2w55qk0dxcrnnnw FOREIGN KEY (item_id) REFERENCES item (id);
ALTER TABLE recruited ADD CONSTRAINT fk_363v4589sr2895tlpm6va73n5 FOREIGN KEY (troop_id) REFERENCES troop (id);
ALTER TABLE recruited ADD CONSTRAINT fk_aj8fktrnyfhbljlgwu53yvnoe FOREIGN KEY (storagebuilding_id) REFERENCES built (id);
ALTER TABLE recruited ADD CONSTRAINT fk_i943aw5urm3iegjwt7c51iuxq FOREIGN KEY (gummiship_id) REFERENCES gummiship (id);
ALTER TABLE recruiter ADD CONSTRAINT fk_ev3n49ifl082qx37ap1qq4mbf FOREIGN KEY (contentmanager_id) REFERENCES contentmanager (id);
ALTER TABLE report ADD CONSTRAINT fk_oe0r6s550sr6cmgdstosytnpv FOREIGN KEY (keybladewielder_id) REFERENCES keybladewielder (id);
ALTER TABLE report_photos ADD CONSTRAINT fk_fd13a90x7k7j80d8xye1x2rfx FOREIGN KEY (report_id) REFERENCES report (id);
ALTER TABLE report_reportupdate ADD CONSTRAINT fk_43xicbjikgjminaei0arhats1 FOREIGN KEY (reportupdates_id) REFERENCES reportupdate (id);
ALTER TABLE report_reportupdate ADD CONSTRAINT fk_srd13vb4jj76g5mjqllbug76j FOREIGN KEY (report_id) REFERENCES report (id);
ALTER TABLE reportupdate ADD CONSTRAINT fk_6lbvciwghn3w9px3s8e92qp6v FOREIGN KEY (administrator_id) REFERENCES administrator (id);
ALTER TABLE reportupdate ADD CONSTRAINT fk_mh33ijgwkf614b636i02jqrq5 FOREIGN KEY (gamemaster_id) REFERENCES gamemaster (id);
ALTER TABLE troop ADD CONSTRAINT fk_1ry11t999tbcg2buhdgdal0m2 FOREIGN KEY (recruiter_id) REFERENCES recruiter (id);
ALTER TABLE useraccount_authorities ADD CONSTRAINT fk_b63ua47r0u1m7ccc9lte2ui4r FOREIGN KEY ("UserAccount_id") REFERENCES useraccount (id);
ALTER TABLE warehouse ADD CONSTRAINT fk_mp4xkqm4jf2oxr9q7cdno2mna FOREIGN KEY (contentmanager_id) REFERENCES contentmanager (id);
CREATE INDEX ON banned (isvalid);
CREATE INDEX ON banned (actor_id);
CREATE INDEX ON battle (attacker_id);
CREATE INDEX ON battle (deffender_id);
CREATE INDEX ON building (isfinal);
CREATE INDEX ON building (contentmanager_id);
CREATE INDEX ON built (lvl);
CREATE INDEX ON built (gummiship_id);
CREATE INDEX ON built (keybladewielder_id);
CREATE INDEX ON built (troop_id);
CREATE INDEX ON chatty (date);
CREATE INDEX ON chatty (invitation_id);
CREATE INDEX ON defense (isfinal);
CREATE INDEX ON defense (contentmanager_id);
CREATE INDEX ON gummiship (recruiterrequiredlvl);
CREATE INDEX ON gummiship (recruiter_id);
CREATE INDEX ON invitation (date,invitationstatus,orgrange);
CREATE INDEX ON invitation (organization_id);
CREATE INDEX ON item (contentmanager_id);
CREATE INDEX ON keybladewielder (faction_id);
CREATE INDEX ON keybladewielder (shield_id);
CREATE INDEX ON livelihood (isfinal);
CREATE INDEX ON livelihood (contentmanager_id);
CREATE INDEX ON prize (date);
CREATE INDEX ON prize (keybladewielder_id);
CREATE INDEX ON purchase (item_id);
CREATE INDEX ON purchase (player_id);
CREATE INDEX ON recruited (gummiship_id);
CREATE INDEX ON recruited (storagebuilding_id);
CREATE INDEX ON recruited (troop_id);
CREATE INDEX ON recruiter (isfinal);
CREATE INDEX ON recruiter (contentmanager_id);
CREATE INDEX ON report (keybladewielder_id);
CREATE INDEX ON report_photos (report_id);
CREATE INDEX ON report_reportupdate (report_id);
CREATE INDEX ON reportupdate (administrator_id);
CREATE INDEX ON reportupdate (gamemaster_id);
CREATE INDEX ON requirement (lvl);
CREATE INDEX ON troop (recruiterrequiredlvl);
CREATE INDEX ON troop (recruiter_id);
CREATE INDEX ON useraccount_authorities ("UserAccount_id");
CREATE INDEX ON warehouse (isfinal);
CREATE INDEX ON warehouse (contentmanager_id);
