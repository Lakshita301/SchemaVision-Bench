-- Source: https://github.com/alokkras/DBMS-Lab/blob/517424ba1c741b686c4b8fff1ca102caa4c8a280/Lab4/student_faculty.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6

CREATE TABLE student(
	snum INT,
	sname VARCHAR(10),
	major VARCHAR(2),
	lvl VARCHAR(2),
	age INT, primary key(snum));

CREATE TABLE faculty(
	fid INT,fname VARCHAR(20),
	deptid INT,
    PRIMARY KEY(fid));

CREATE TABLE class(
	cname VARCHAR(20),
	metts_at TIMESTAMP,
	room VARCHAR(10),
    fid INT,
	PRIMARY KEY(cname),
	FOREIGN KEY(fid) REFERENCES faculty(fid));

CREATE TABLE enrolled(
	snum INT,
	cname VARCHAR(20),
	PRIMARY KEY(snum,cname),
	FOREIGN KEY(snum) REFERENCES student(snum),
	FOREIGN KEY(cname) REFERENCES class(cname));

