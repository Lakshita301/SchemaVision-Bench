-- Source: https://github.com/andrew-p-kilgore/GameLibrary/blob/f9cb37632f48abaf5fb7140569eee5b763cf1517/SQL/GameLibraryDB.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE VideoGame (
	GameId INT PRIMARY KEY AUTO_INCREMENT,
    GameName VARCHAR(50) NOT NULL,
    Genre VARCHAR(15),
    Platform VARCHAR(5) NOT NULL,
    GameYear VARCHAR(4),
    Publisher VARCHAR(50)
);

CREATE TABLE Customer (
	CustomerId INT PRIMARY KEY auto_increment,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(25),
    PhoneNumber VARCHAR(14),
    Address VARCHAR(50) NOT NULL,
    CardNumber VARCHAR(16) NOT NULL
);

CREATE TABLE GameLoans (
	LoanId INT auto_increment,
    GameId INT NOT NULL,
    CustomerId INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Cost DECIMAL(7,3) NOT NULL,
    PRIMARY KEY (LoanId, GameId, CustomerId),
    CONSTRAINT FOREIGN KEY (GameId) REFERENCES VideoGame(GameId)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY (CustomerId) references Customer(CustomerId)
		ON UPDATE CASCADE ON DELETE CASCADE
);

