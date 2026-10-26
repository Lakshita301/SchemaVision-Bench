-- Source: https://github.com/gvanastasov/DB-Basics/blob/9f5684f37be9a8518c4c5f674514b0a6e9f8197c/Ex1_DATATYPES.sql?raw=true
-- Tables detected: 20 | FK constraints: 4

CREATE TABLE Minions
(
[Id] int PRIMARY KEY,
[Name] nvarchar(50),
[Age] int
);

CREATE TABLE Towns
(
[Id] int PRIMARY KEY,
[Name] nvarchar(50)
);

Create Table People
CREATE TABLE People
(
[Id] int NOT NULL UNIQUE IDENTITY(1,1),
[Name] nvarchar(200) NOT NULL,
[Picture] varbinary(max),
[Height] decimal(10,2),
[Weight] decimal(10,2),
[Gender] varchar(1) CHECK (Gender IN('m','f')) NOT NULL,
[Birthdate] date NOT NULL,
[Biography] nvarchar(max)
);

Create Table users
CREATE TABLE Users
(
[id] BigInt IDENTITY(1,1) PRIMARY KEY,
[Username] varchar(30) UNIQUE NOT NULL,
[Password] varchar(26) NOT NULL,
[ProfilePicture] varbinary(max) CHECK (DATALENGTH(ProfilePicture) < 900 * 1024),
[LastLoginTime] date,
[IsDeleted] bit 
);

CREATE TABLE Directors(
				Id int PRIMARY KEY IDENTITY(1,1), 
				DirectorName nvarchar(200) UNIQUE NOT NULL,
				Notes nvarchar(max))

CREATE TABLE Genres(
				Id int PRIMARY KEY IDENTITY(1,1),
				GenreName nvarchar(200) UNIQUE NOT NULL,
				Notes nvarchar(max))

CREATE TABLE Categories(
				Id int PRIMARY KEY IDENTITY(1,1),
				CategoryName nvarchar(200) UNIQUE NOT NULL,
				Notes nvarchar(max))

CREATE TABLE Movies(
				Id int PRIMARY KEY IDENTITY(1,1),
				Title nvarchar(200) UNIQUE NOT NULL,
				DirectorId int NOT NULL,
				CopyrightYear int NOT NULL,
				Length int NOT NULL,
				GenreId int NOT NULL,
				CategoryId int NOT NULL,
				Rating decimal(2,1) NOT NULL DEFAULT (0.0),
				Notes nvarchar(max))
GO

ALTER TABLE Movies
ADD 
	FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
	FOREIGN KEY (GenreId) REFERENCES Genres(Id),
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
GO

INSERT INTO Directors (DirectorName) VALUES
('Director 1'), ('Director 2'), ('Director 3'), ('Director 4'), ('Director 5');

CREATE TABLE Categories(
				Id int PRIMARY KEY NOT NULL IDENTITY(1,1),
				CategoryName varchar(50),
				DailyRate decimal (10,2) DEFAULT (0.0) NOT NULL,
				WeeklyRate decimal (10,2) DEFAULT (0.0) NOT NULL,
				MontlyRate decimal (10,2) DEFAULT (0.0) NOT NULL,
				WeekendRate decimal (10,2) DEFAULT (0.0) NOT NULL)

CREATE TABLE Cars(
				Id int PRIMARY KEY NOT NULL IDENTITY(1,1),
				PlateNumber varchar(20) NOT NULL,
				Manufacturer varchar(50) NOT NULL,
				Model varchar(50) NOT NULL,
				CarYear int NOT NULL,
				CategoryId int NOT NULL FOREIGN KEY REFERENCES Categories(Id),
				Doors int CHECK (Doors = 3 OR Doors = 5) NOT NULL,
				Picture varbinary(max),
				Condition varchar(30),
				Available bit NOT NULL)

CREATE TABLE Employees(
				Id int PRIMARY KEY NOT NULL IDENTITY(1,1),
				FirstName nvarchar(200) NOT NULL,
				LastName nvarchar(200) NOT NULL,
				Title nvarchar(200),
				Notes nvarchar(max))

CREATE TABLE Customers(
				Id int PRIMARY KEY NOT NULL IDENTITY(1,1),
				DriverLicenceNumber nvarchar(50) NOT NULL,
				FullName nvarchar (200) NOT NULL,
				Address nvarchar (200),
				City nvarchar (100),
				ZIPCode nvarchar(20),
				Notes nvarchar(max))

CREATE TABLE RentalOrders(
				Id int PRIMARY KEY NOT NULL IDENTITY(1,1),
				EmployeeId int FOREIGN KEY REFERENCES Employees(Id),
				CustomerId int FOREIGN KEY REFERENCES Customers(Id),
				CarId int FOREIGN KEY REFERENCES Cars(Id),
				TankLevel int,
				KilometrageStart int,
				KilometrageEnd int,
				TotalKilometrage int,
				StartDate date,
				EndDate date,
				TotalDays int,
				RateApplied decimal(10,2),
				TaxRate decimal (10,2),
				OrderStatus nvarchar(200),
				Notes nvarchar(max))

INSERT INTO CarRental.dbo.Categories ([CategoryName]) VALUES
				('Minivan'), ('Toy'), ('Sedan')

INSERT INTO CarRental.dbo.Cars 
							(
								[PlateNumber],
								[Manufacturer], 
								[Model],
								[CategoryId], 
								[CarYear], 
								[Doors], 
								[Available]
							) 
			VALUES
				('11111', 'Mercedes', 'CLK63', 3, '2016', 3, 0),
				('HASKUU', 'FORD', 'Closhman', 2, '2016', 3, 0),
				('A0001CH', 'FIAT', 'Closher', 1, '1983', 5, 1)

INSERT INTO CarRental.dbo.Employees
							(
								[FirstName],
								[LastName]
							)
			VALUES
				('Petar', 'Petrov'),
				('Ivan', 'Ivanov'),
				('Alex', 'Alexandrov')

INSERT INTO Customers
				(
					[DriverLicenceNumber],
					[FullName]
				)
		VALUES
			('12345', 'Ivan'),
			('11111', 'Gosho'),
			('55555', 'Todor')

INSERT INTO RentalOrders
				(
					[EmployeeId], [CustomerId], [CarId]
				)
		VALUES
			(1,1,1),
			(2,2,2),
			(3,3,3)

-- 15. Hotel Database

CREATE DATABASE Hotel
GO

USE Hotel

CREATE TABLE Employees(
				Id int PRIMARY KEY IDENTITY(1,1), 
				FirstName nvarchar(100) NOT NULL, 
				LastName nvarchar(100) NOT NULL, 
				Title nvarchar(100) NOT NULL, 
				Notes nvarchar(max))

CREATE TABLE Customers(
				AccountNumber int PRIMARY KEY IDENTITY(1,1), 
				FirstName nvarchar(100) NOT NULL, 
				LastName nvarchar(100) NOT NULL, 
				PhoneNumber nvarchar(20), 
				EmergencyName nvarchar(100), 
				EmergencyNumber nvarchar(100), 
				Notes nvarchar(max))

CREATE TABLE RoomStatus(RoomStatus int PRIMARY KEY, Notes nvarchar(max) NOT NULL)
CREATE TABLE RoomTypes(RoomType int PRIMARY KEY, Notes nvarchar(max) NOT NULL)
CREATE TABLE BedTypes(BedType int PRIMARY KEY, Notes nvarchar(max) NOT NULL)

CREATE TABLE Rooms(
				RoomNumber int PRIMARY KEY,
				RoomType int NOT NULL,
				BedType int NOT NULL,
				Rate decimal (10,2) NOT NULL DEFAULT(0.0),
				RoomStatus int NOT NULL,
				Notes nvarchar(max))

CREATE TABLE Payments(
				Id int PRIMARY KEY, 
				EmployeeId int NOT NULL, 
				PaymentDate date NOT NULL, 
				AccountNumber int NOT NULL, 
				FirstDateOccupied date NOT NULL, 
				LastDateOccupied date NOT NULL, 
				TotalDays int NOT NULL DEFAULT (0), 
				AmountCharged decimal (10,2), 
				TaxRate decimal (10,2), 
				TaxAmount decimal (10,2), 
				PaymentTotal decimal (10,2), 
				Notes nvarchar(max))

CREATE TABLE Occupancies(
				Id int PRIMARY KEY, 
				EmployeeId int NOT NULL, 
				DateOccupied date NOT NULL, 
				AccountNumber int NOT NULL, 
				RoomNumber int NOT NULL, 
				RateApplied decimal (10,2), 
				PhoneCharge decimal (10,2), 
				Notes nvarchar(max))

GO

INSERT INTO Employees ([FirstName], [LastName], [Title]) VALUES
('Tosho', 'Toshov', 'prezident'),
('Tosho', 'Toshov', 'prezident'),
('Tosho', 'Toshov', 'prezident')

INSERT INTO Customers ([FirstName], [LastName]) VALUES
('Gosho', 'Goshov'),
('Gosho', 'Goshov'),
('Gosho', 'Goshov')

INSERT INTO RoomStatus VALUES
		(200, 'free'),
		(500, 'trashed'),
		(300, 'unknown')

INSERT INTO RoomTypes VALUES
				(1, 'kings room'),
				(2, 'beggars room'),
				(3, 'mars panorama')

INSERT INTO BedTypes VALUES
				(1, 'Huge bed'),
				(2, 'No bed'),
				(3, 'Shared bed')

INSERT INTO Rooms VALUES
(1, 1, 1, 50.2, 200, NULL),
(2, 1, 1, 50.2, 200, NULL),
(3, 1, 1, 50.2, 200, 'Hooorrible')

INSERT INTO Payments ([Id], [EmployeeId], [PaymentDate], [AccountNumber], [FirstDateOccupied],
[LastDateOccupied], [TotalDays]) VALUES
(1, 1, '20160101', 1, '20160202', '20160203', 1),
(2, 1, '20160101', 1, '20160202', '20160203', 1),
(3, 1, '20160101', 1, '20160202', '20160203', 1)

INSERT INTO Occupancies VALUES
(1, 1, '19901010', 1, 1, 10.30, 150.99, NULL),
(2, 1, '19901010', 1, 1, 10.30, 150.99, NULL),
(3, 1, '19901010', 1, 1, 10.30, 150.99, NULL)

-- 16.Create SoftUni Database
CREATE DATABASE SoftUni
GO

USE SoftUni

CREATE TABLE Towns
(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(100) UNIQUE NOT NULL
)

CREATE TABLE Addresses
(
	Id int IDENTITY(1,1) PRIMARY KEY,
	AddressText nvarchar(max) NOT NULL,
	TowndId int NOT NULL FOREIGN KEY REFERENCES Towns(Id)
)

CREATE TABLE Departments
(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(200) NOT NULL
)

CREATE TABLE Employees
(
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(200) NOT NULL,
	MiddleName nvarchar(200),
	LastName nvarchar(200) NOT NULL,
	JobTitle nvarchar(200) NOT NULL,
	DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments(Id),
	HireDate date NOT NULL,
	Salary decimal(10,2) NOT NULL,
	AddressId int FOREIGN KEY REFERENCES Addresses(Id)
)


-- 17. Make a BACKUP, delete, then restore
USE Hotel;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE Minions
ADD [TownId] int

ALTER TABLE Minions
ADD FOREIGN KEY (TownId)
REFERENCES Towns(Id)

-- 4 Insert Records in Both Tables
INSERT INTO Towns VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')

INSERT INTO Minions VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2)

-- 5 Truncate Table Minions
TRUNCATE TABLE Minions

-- 6 Drop All Tables
DROP TABLE Minions, Towns

-- 7 Create Table People
CREATE TABLE People
(
[Id] int NOT NULL UNIQUE IDENTITY(1,1),
[Name] nvarchar(200) NOT NULL,
[Picture] varbinary(max),
[Height] decimal(10,2),
[Weight] decimal(10,2),
[Gender] varchar(1) CHECK (Gender IN('m','f')) NOT NULL,
[Birthdate] date NOT NULL,
[Biography] nvarchar(max)
);

ALTER TABLE Users
ADD CONSTRAINT PK_Id PRIMARY KEY (Id)

-- 9. Change Primary Key
ALTER TABLE Users
DROP CONSTRAINT PK_Id

ALTER TABLE Users
ADD PRIMARY KEY (Id, Username)

-- 10.Add check constraint
ALTER TABLE Users
ADD CONSTRAINT CK_Password_Length CHECK (DATALENGTH(Password) > 5)


-- 11.Set Default Value of a Field
ALTER TABLE Users
ADD CONSTRAINT DF_LastLogin DEFAULT GETDATE() FOR [LastLoginTime]

INSERT INTO Users (Username, Password) VALUES
('testuser6','passuser6')

-- 12. Set Unique Field
ALTER TABLE Users
DROP CONSTRAINT [PK__Users__77252061B55B2FF1]

ALTER TABLE Users
ADD PRIMARY KEY (Id)

ALTER TABLE Users
ADD CONSTRAINT UQ_Username CHECK (DATALENGTH(Username) > 3)


-- 13. Movies Database

CREATE DATABASE Movies
GO
USE Movies

CREATE TABLE Directors(
				Id int PRIMARY KEY IDENTITY(1,1), 
				DirectorName nvarchar(200) UNIQUE NOT NULL,
				Notes nvarchar(max))

CREATE TABLE Genres(
				Id int PRIMARY KEY IDENTITY(1,1),
				GenreName nvarchar(200) UNIQUE NOT NULL,
				Notes nvarchar(max))

CREATE TABLE Categories(
				Id int PRIMARY KEY IDENTITY(1,1),
				CategoryName nvarchar(200) UNIQUE NOT NULL,
				Notes nvarchar(max))

CREATE TABLE Movies(
				Id int PRIMARY KEY IDENTITY(1,1),
				Title nvarchar(200) UNIQUE NOT NULL,
				DirectorId int NOT NULL,
				CopyrightYear int NOT NULL,
				Length int NOT NULL,
				GenreId int NOT NULL,
				CategoryId int NOT NULL,
				Rating decimal(2,1) NOT NULL DEFAULT (0.0),
				Notes nvarchar(max))
GO

ALTER TABLE Movies
ADD 
	FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
	FOREIGN KEY (GenreId) REFERENCES Genres(Id),
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
GO

INSERT INTO Directors (DirectorName) VALUES
('Director 1'), ('Director 2'), ('Director 3'), ('Director 4'), ('Director 5');

