-- Source: https://github.com/appletreeisyellow/Film-Rating-System/blob/440b47a93598198306e604562a1334c241421e5d/sql/create.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 24

CREATE TABLE Movie(
	id 			int NOT NULL, 
	title 		varchar(100) NOT NULL, 
	year 		int NOT NULL, 
	rating 		varchar(10) NOT NULL, 
	company 	varchar(50) NOT NULL,
	PRIMARY KEY(id),
	CHECK(LENGTH(title) > 0),
	CHECK(LENGTH(company) > 0),
	CHECK (rating = "G" OR rating = "PG" OR rating = "PG-13" OR rating = "R" OR rating = "NC-17")
);

CREATE TABLE Actor(
	id 			int NOT NULL, 
	last 		varchar(20) NOT NULL, 
	first 		varchar(20) NOT NULL, 
	sex 		varchar(6) NOT NULL, 
	dob 		date NOT NULL, 
	dod 		date,
	PRIMARY KEY(id),
	CHECK(LENGTH(last) > 0),
	CHECK(LENGTH(first) > 0),
	CHECK(sex in ('Male','Female'))
);

CREATE TABLE Sales(
	mid 		int NOT NULL, 
	ticketsSold int NOT NULL, 
	totalIncome int NOT NULL,
	UNIQUE(mid),
	FOREIGN KEY (mid) references Movie(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE Director(
	id 		int NOT NULL, 
	last 	varchar(20) NOT NULL, 
	first 	varchar(20) NOT NULL, 
	dob 	date NOT NULL, 
	dod 	date,
	PRIMARY KEY (id),
	CHECK(LENGTH(last) > 0),
	CHECK(LENGTH(first) > 0)
);

CREATE TABLE MovieGenre(
	mid 	int NOT NULL, 
	genre 	varchar(20) NOT NULL,
	UNIQUE(mid),
	CHECK(LENGTH(genre) > 0),
	FOREIGN KEY (mid) references Movie(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE MovieDirector(
	mid 	int NOT NULL, 
	did 	int NOT NULL,
	UNIQUE(mid),
	FOREIGN KEY (mid) references Movie(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (did) references Director(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE MovieActor(
	mid 	int NOT NULL, 
	aid 	int NOT NULL, 
	role 	varchar(50) NOT NULL,
	CHECK(LENGTH(role) > 0),
	FOREIGN KEY (mid) references Movie(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (aid) references Actor(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE MovieRating(
	mid 	int NOT NULL, 
	imdb 	int NOT NULL, 
	rot 	int NOT NULL,
	UNIQUE(mid),
	FOREIGN KEY (mid) references Movie(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CHECK (imdb >= 1 AND imdb <= 100),
	CHECK (rot >= 1 AND rot <= 100)
) ENGINE = INNODB;

CREATE TABLE Review(
	name 	varchar(20) NOT NULL, 
	time 	timestamp NOT NULL, 
	mid 	int NOT NULL, 
	rating 	int NOT NULL, 
	comment varchar(500) NOT NULL,
	CHECK(LENGTH(name) > 0),
	CHECK(LENGTH(comment) > 0),
	FOREIGN KEY (mid) references Movie(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CHECK (rating >= 0 AND rating <=5)
) ENGINE = INNODB;

CREATE TABLE MaxPersonID(
	id 		int NOT NULL,
	UNIQUE(id)
);

CREATE TABLE MaxMovieID(
	id 		int NOT NULL,
	UNIQUE(id)
);

