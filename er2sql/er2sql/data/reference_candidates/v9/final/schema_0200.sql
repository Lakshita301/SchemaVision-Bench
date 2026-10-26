-- Source: https://github.com/makter20/Aero-mirates/blob/5519f3da07d60a0fa4e0511650ed882d2a59f47e/DB/createTables.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 16

CREATE TABLE Users(
    userId 	int UNIQUE,
    fname	varchar(100) NOT NULL,
    lname	varchar(100) NOT NULL,
    password	varchar(100) NOT NULL,
    phoneNumber	varchar(100) UNIQUE NOT NULL,
    emailId	varchar(100) PRIMARY KEY,
    userType	varchar(100) NOT NULL,
    DOB		Date
);

CREATE TABLE LoginCredentials(
	userEmail varchar(100) primary key,
    userPassword varchar(100) NOT NULL
);

CREATE TABLE AdminLoginCredentials(
    adminUserName varchar(100) primary key,
    adminPassword varchar(100) NOT NULL
);

CREATE TABLE City(
	cityId varchar(100) primary key,
	cityName varchar(100) NOT NULL
);

CREATE TABLE Airport(
	airportId varchar(100) primary key,
	airportName varchar(100) NOT NULL,
	city varchar(100) NOT NULL,
    FOREIGN KEY(city) REFERENCES City(cityId)
);

CREATE TABLE Airline(
    airlineCode varchar(3) primary key,  -- 3 letter ICAO code
	airlineName varchar(100) NOT NULL
);

CREATE TABLE Flight(
	flightId varchar(100) primary key,
	flightName varchar(100) NOT NULL,
    airlineCode varchar(3) NOT NULL,
    FOREIGN KEY(airlineCode) REFERENCES Airline(airlineCode)
);

CREATE TABLE Schedules(
	scheduleId varchar(100) primary key,
	sourceId varchar(100) NOT NULL,
	destinationId varchar(100) NOT NULL,
    capacity int NOT NULL,
    scheduledDate date NOT NULL,
    scheduledtime TIMESTAMP NOT NULL,
    returnDate date NOT NULL,
    flightId varchar(100) NOT NULL,
    FOREIGN KEY(sourceId) REFERENCES Airport(airportId),
    FOREIGN KEY(destinationId) REFERENCES Airport(airportId),
    FOREIGN KEY(flightId) REFERENCES Flight(flightId)
);

CREATE TABLE Booking(
	bookingId varchar(100) primary key,
	emailId varchar(100) NOT NULL,
	scheduleId varchar(100) NOT NULL,
    bookingDate date NOT NULL,
    seatNumber varchar(10) NOT NULL,
    FOREIGN KEY(emailId) REFERENCES Users(emailId),
    FOREIGN KEY(scheduleId) REFERENCES Schedules(scheduleId)
);

CREATE TABLE Payment(
	paymentId varchar(100) primary key,
	paymentMode varchar(100) NOT NULL,
	amount varchar(100) NOT NULL,
    bookingId varchar(100) NOT NULL,
    FOREIGN KEY(bookingId) REFERENCES Booking(bookingId)
);

