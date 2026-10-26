-- Source: https://github.com/struct622/Football-IN/blob/9036c76bde7ec57f92542cef3bfb97afe20fe75f/Football_In2.2.1/target/classes/football.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

create table board(
	bno int not null auto_increment,
	title varchar(200) not null,
	content text null,
	writer varchar(50) not null,
	regdate timestamp not null default now(),
	viewcnt int default 0,
	primary key(bno)
)engine=InnoDB;

create table reply(
	rno int not null auto_increment,
	bno int not null default 0,
	replytext varchar(1000) not null,
	replyer varchar(50) not null,
	regdate Timestamp not null default now(),
    primary key(rno)
);

create table user(
	uid varchar(20) not null,
	upw varchar(20) not null,
	uname varchar(20) not null,
	location varchar(50) not null,
	regdate timestamp not null default now(),
	primary key(uid)
);

-- Foreign keys added via ALTER TABLE:
alter table reply add constraint fk_board
foreign key(bno) references board(bno);

