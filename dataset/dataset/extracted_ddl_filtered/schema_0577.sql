-- Source: https://github.com/devin040/battuta/blob/c3aed442a34ed81bcd10ae57d5b469aefbabfb2a/dbutil/SqlScripts/initdbtableschema.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 6

create table routes (routeid int primary key auto_increment, fromPort VARCHAR(3), toPort VARCHAR(3), routeStr VARCHAR(6));

CREATE TABLE flightPrices(_id int primary key auto_increment, routeid int, carrier VARCHAR(255), depTime int(11), arrTime int (11), price real, 
    layovers int, FOREIGN KEY (routeid) REFERENCES routes(routeid));

create table flightlegs (_id int primary key auto_increment, priceID int, airline VARCHAR(255), flightno VARCHAR(10), routeid int, fromPort VARCHAR(3), 
  toPort VARCHAR(3), depTime int(11), arrTime int(11), FOREIGN KEY (routeid) REFERENCES routes(routeid), 
 FOREIGN KEY (priceID) REFERENCES flightPrices(_id));

