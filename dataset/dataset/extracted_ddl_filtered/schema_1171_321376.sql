-- Source: https://github.com/grape0919/singlePage/blob/d670cbfdde66551e62ab8f487d8a21846b2fb564/rdbms/1.CREATE_TABLES.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

create table COMPOSITION(
	COM_ID INTEGER PRIMARY KEY,
	COM_NM CHAR(10) not null
	);

create table DESCRIPTION(
	COM_ID INTEGER not null,
	DESC_ID INTEGER not null,
	DESCRIPT TEXT not null,
	CONSTRAINT DESCRIPTION_FK FOREIGN KEY(COM_ID)
	REFERENCES COMPOSITION(COM_ID)
	PRIMARY KEY(COM_ID, DESC_ID)
	);

