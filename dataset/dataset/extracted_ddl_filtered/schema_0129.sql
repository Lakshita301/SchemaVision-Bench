-- Source: https://github.com/GGupta101/GGupta101/blob/32e1d24add9ec2a34887238c16c7d1b4181cfbae/COEN%20178L/Lab%202/lab2_part1.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE customer(
  	custid		varchar(5),
  	firstname	varchar(10),
  	lastname	varchar(10),
  	city		varchar(10),
	PRIMARY KEY 	(custid)
);

CREATE TABLE deliveryservice(
  	serviceid	varchar(10),
  	item		varchar(15),
  	location	varchar(15),
  	servicefee	decimal(4,2),
  	PRIMARY KEY	(serviceid)
);

CREATE TABLE schedule(
  	serviceid	varchar(10),
  	custid		varchar(5),
  	day			varchar(2)
  	CHECK		(day in ('m','t','w','r','f'))
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE schedule ADD FOREIGN KEY (serviceid) REFERENCES deliveryservice(serviceid);

ALTER TABLE schedule ADD FOREIGN KEY (custid) REFERENCES customer(custid);

