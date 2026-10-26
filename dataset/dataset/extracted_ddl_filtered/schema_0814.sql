-- Source: https://github.com/hkgttime/Overflow/blob/ed1765794c3182ee93c4ec025c801c7220e1143b/app/common/target/classes/sql/oj.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 10

CREATE TABLE USERS
(
    uuid          VARCHAR(100),
    name          VARCHAR(10)  NOT NULL,
    password      VARCHAR(32)  NOT NULL,
    emails        VARCHAR(100) NOT NULL,
    avatar        VARCHAR(100),
    motto         VARCHAR(300),
    commitTotal   INT,
    acceptedTotal INT,
    status        INT(1) DEFAULT 1,
    score         LONG         NOT NULL,
    creatDate     DATE         NOT NULL,
    PRIMARY KEY (uuid, name, emails)
);

CREATE TABLE PROBLEMS
(
    pid             VARCHAR(32),
    title           VARCHAR(100),
    description     VARCHAR(1000),
    inputFormat     VARCHAR(1000),
    outputFormat    VARCHAR(1000),
    hint            VARCHAR(1000),
    sampleTestcases VARCHAR(1000),
    status          INT(1) DEFAULT 1,
    score           LONG        NOT NULL,
    provider        VARCHAR(32) NOT NULL,
    PRIMARY KEY (pid),
    FOREIGN KEY (provider) REFERENCES USERS (uuid)
);

CREATE TABLE LIMIT
(
    pid      VARCHAR(32),
    cpulimit long,
    mmlimit  long,
    rtime    long,
    PRIMARY KEY (pid)
);

CREATE TABLE OUTINTEMS
(
    tid       VARCHAR(32) NOT NULL,
    pid       VARCHAR(32) NOT NULL,
    uid       VARCHAR(32) NOT NULL,
    temName   VARCHAR(10) NOT NULL,
    temPath   VARCHAR(20) NOT NULL,
    creatDate DATE        NOT NULL,
    FOREIGN KEY (uid) REFERENCES USERS (uuid),
    FOREIGN KEY (pid) REFERENCES PROBLEMS (pid)
);

CREATE TABLE EXETS
(
    eid      VARCHAR(32)   NOT NULL,
    pid      VARCHAR(32)   NOT NULL,
    uid      VARCHAR(32)   NOT NULL,
    language int(1)        NOT NULL,
    date     VARCHAR(1000) NOT NULL,
    status   INT(1) DEFAULT 0,
    FOREIGN KEY (uid) REFERENCES USERS (uuid),
    FOREIGN KEY (pid) REFERENCES PROBLEMS (pid)
);

