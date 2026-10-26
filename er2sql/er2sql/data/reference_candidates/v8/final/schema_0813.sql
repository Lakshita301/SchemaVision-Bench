-- Source: https://github.com/MohanishPingale/Phase2FlyAway/blob/5c8fee4c9e4278104d57c5395718b978aca6010b/Database/AirLineTicket.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 1
CREATE TABLE a_book (
    id bigint NOT NULL,
    flightid bigint DEFAULT NULL,
    flightname varchar(225) DEFAULT NULL,
    firstname varchar(225) DEFAULT NULL,
    lastname varchar(225) DEFAULT NULL,
    mobileno varchar(225) DEFAULT NULL,
    bookdate date DEFAULT NULL,
    emailid varchar(225) DEFAULT NULL,
    address varchar(755) DEFAULT NULL,
    noofperson bigint DEFAULT NULL,
    price bigint DEFAULT NULL,
    finalprice bigint DEFAULT NULL,
    createdby varchar(225) DEFAULT NULL,
    modifiedby varchar(225) DEFAULT NULL,
    createddatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modifieddatetime timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (id)
);

CREATE TABLE a_flight (
    id bigint NOT NULL,
    flightno varchar(225) DEFAULT NULL,
    fightname varchar(225) DEFAULT NULL,
    fromcity varchar(225) DEFAULT NULL,
    tocity varchar(225) DEFAULT NULL,
    date date DEFAULT NULL,
    description varchar(775) DEFAULT NULL,
    time varchar(225) DEFAULT NULL,
    travelduraion varchar(225) DEFAULT NULL,
    ticketprice bigint DEFAULT NULL,
    airportname varchar(225) DEFAULT NULL,
    createdby varchar(225) DEFAULT NULL,
    modifiedby varchar(225) DEFAULT NULL,
    createddatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modifieddatetime timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (id)
);

CREATE TABLE a_user (
    id bigint NOT NULL,
    firstname varchar(225) DEFAULT NULL,
    lastname varchar(225) DEFAULT NULL,
    login varchar(225) DEFAULT NULL,
    password varchar(225) DEFAULT NULL,
    roleid bigint DEFAULT NULL,
    createdby varchar(225) DEFAULT NULL,
    modifiedby varchar(225) DEFAULT NULL,
    createddatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modifieddatetime timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (id)
);
ALTER TABLE a_book ADD CONSTRAINT fk_a_book FOREIGN KEY (flightid) REFERENCES a_flight (id) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX ON a_book (flightid);
