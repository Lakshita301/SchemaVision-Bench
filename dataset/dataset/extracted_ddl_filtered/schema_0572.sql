-- Source: https://github.com/Junsik4045/miniproject1/blob/0a3c960990ca92ca5797fc2ca7a6fc10cd180a92/Miniproject.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 24

CREATE TABLE Member (
	member_no int primary key auto_increment,
	board_no	 int,
	comment_no int,
	file_no int,
	member_id varchar(100) not null,
	member_pw varchar(100) not null,
	member_email varchar(100) not null,
	member_name varchar(100) not null,
	member_regDate	datetime not null,
	member_level int not null,
	member_gender varchar(100) not null,
	member_birth varchar(100) not null,
	member_lastupdate datetime not null,
	member_phone int not null
);

CREATE TABLE Board (
	board_no	 int primary key auto_increment,
	comment_no int,
	file_no int,
	board_category varchar(100) not null,
	board_title varchar(255) not null,
	board_content blob,
	board_regDate datetime not null,
	board_vote int default 0,
	board_subscribe int default 0,
	board_writer varchar(100) not null,
	board_header varchar(100) not null
);

CREATE TABLE Board_Manager (
	manager_no int primary key auto_increment,
	board_no int,
	comment_no int,
	file_no int,
	manager_style varchar(255),
	manager_boder varchar(255),
	manager_TOS blob
);

CREATE TABLE Board_File (
	file_no int primary key auto_increment,
	file_name	 varchar(255) not null,
	file_type varchar(100) not null,
	file_path blob
);

CREATE TABLE Comment (
	comment_no int primary key auto_increment,
	comment_content varchar(100) not null,
	comment_regDate datetime,
	comment_vote int default 0,
	comment_parentID int
);

CREATE TABLE Log(
	log_no int primary key auto_increment,
	manager_no int,
	board_no	 int,
	comment_no int,
	file_no int,
	log_title varchar(255) not null,
	log_date datetime,
	log_writer varchar(100) not null
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE Member ADD CONSTRAINT foreign KEY (board_no)
REFERENCES Board(board_no) ON UPDATE CASCADE;

ALTER TABLE Member ADD CONSTRAINT foreign KEY (comment_no)
REFERENCES Comment(comment_no) ON UPDATE CASCADE;

ALTER TABLE Member ADD CONSTRAINT foreign KEY (file_no)
REFERENCES Board_File(file_no) ON UPDATE CASCADE;

ALTER TABLE Board ADD CONSTRAINT foreign KEY (comment_no)
REFERENCES Comment(comment_no) ON UPDATE CASCADE;

ALTER TABLE Board ADD CONSTRAINT foreign KEY (file_no)
REFERENCES Board_File(file_no) ON UPDATE CASCADE;

ALTER TABLE Board_Manager ADD CONSTRAINT foreign KEY (board_no)
REFERENCES Board(board_no) ON UPDATE CASCADE;

ALTER TABLE Board_Manager ADD CONSTRAINT foreign KEY (comment_no)
REFERENCES Comment(comment_no) ON UPDATE CASCADE;

ALTER TABLE Board_Manager ADD CONSTRAINT foreign KEY (file_no)
REFERENCES Board_File(file_no) ON UPDATE CASCADE;

ALTER TABLE Log ADD CONSTRAINT foreign KEY (manager_no)
REFERENCES Board_Manager(manager_no) ON UPDATE CASCADE;

ALTER TABLE Log ADD CONSTRAINT foreign KEY (board_no)
REFERENCES Board(board_no) ON UPDATE CASCADE;

ALTER TABLE Log ADD CONSTRAINT foreign KEY (comment_no)
REFERENCES Comment(comment_no) ON UPDATE CASCADE;

ALTER TABLE Log ADD CONSTRAINT foreign KEY (file_no)
REFERENCES Board_File(file_no) ON UPDATE CASCADE;

