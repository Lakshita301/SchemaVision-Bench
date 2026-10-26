-- Source: https://github.com/Caniro/multicampus-iot/blob/c81444ba5949f0e6c7deceaede9682170a6136ca/02.mariadb/ch06/select.sql?raw=true
-- Tables detected: 4 | FK constraints: 1

create table userTbl -- 회원 테이블
(
    userID      CHAR(8) NOT NULL PRIMARY KEY,
    name        VARCHAR(10) NOT NULL,
    birthYear   INT NOT NULL,
    addr        CHAR(2) NOT NULL,
    mobile1     CHAR(3),
    mobile2     CHAR(8),
    height      SMALLINT,
    mDate       DATE
);

create table buyTbl -- 구매 테이블
(
    num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID      CHAR(8) NOT NULL,
    prodName    CHAR(6) NOT NULL,
    groupName   CHAR(4),
    price       INT NOT NULL,
    amount      SMALLINT NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTbl(userID)
);

CREATE TABLE ... SELECT : 테이블 복사. 제약 조건은 복사 안됨
create table buyTbl2 (select * from buyTbl);

create table buyTbl3 (select userID, prodName from buyTbl);

