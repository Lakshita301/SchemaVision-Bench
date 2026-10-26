-- Source: https://github.com/dimitrov9/newmansexercise/blob/30388b8e5dd480138bd80a434c699c614c0bef7a/Back%20End/SQL%20and%20ASpNET/Pool%20System%20App/SQL/Creating%20The%20Tables.sql?raw=true
-- Tables detected: 9 | FK constraints: 7

CREATE TABLE Employee (
	Id int Identity(1,1) Primary Key Not Null,
	FirstName nvarchar(50) Not Null,
	LastName nvarchar(50) Not Null,
	[Address] nvarchar(100) Not Null,
	Phone varchar(10) Not Null,
	StillWorksHere bit Default(1)
);

Create Table Administrator(
	--Foreign Key
	Id int Primary Key Not Null,
	Email nvarchar(100) Not Null,
	UserName nvarchar(50) Not Null,
	[PassWord] nvarchar(50) Not Null,
	Constraint FK_AdministratorEmployee 
		Foreign Key (Id) References Employee(Id),
	Constraint CK_Administrator_Password_Length 
		Check (len([PassWord]) >= 6)
);

Create Table PaymentType(
	Id int Identity(1,1) Primary Key Not Null,
	Type nvarchar(50) Not Null
);

Create Table CardInfo(
	Id int Identity(1,1) Primary Key Not Null,
	Name nvarchar(50) Not Null,
	Duration nvarchar(4) Not Null,
	VisitsInWeek int Not Null,
	Constraint CK_CardInfo_VisitsInWeek_LessThan_7
		Check (VisitsInWeek<=7),

);

Create Table [Card](
	Id int Identity(1,1) Primary Key Not Null,
	StartDate DateTime Not Null,
	EndDate DateTime Not Null,
	--Foreign key
	CardInfoId int Not Null,
	FOREIGN KEY (CardInfoId) REFERENCES CardInfo(Id),
	Constraint CK_StartDate_LessThan_EndDate
		Check (StartDate < EndDate)
);

Create Table Locker(
	Id int Identity(1,1) Primary Key Not Null,
	Number int Not Null,
	IsForMale bit Not Null,
	Constraint UC_Locker_Number_IsForMale
		Unique (Number,IsForMale)
);

Create Table Visit(
	Id int Identity(1,1) Primary Key Not Null,
	ArrivalDateTime Datetime Not Null,
	LeaveDateTime datetime Not Null,
	--Foreign Keys
	CardId int Not Null,
	LockerId int Not Null,
	--Foreign Keys Constrains
	FOREIGN KEY (CardId) REFERENCES [Card](Id),
	FOREIGN KEY (LockerId) REFERENCES Locker(Id),
	Constraint CK_Visit_Arrival_LessThan_Leave
		Check (ArrivalDateTime < LeaveDateTime),

);

Create Table Member(
	--Nullable??
	Id int Identity(1,1) Primary Key Not Null,
	FirstName nvarchar(50) Not Null,
	LastName nvarchar(50) Not Null,
	[Address] nvarchar(100) Not Null,
	Phone varchar(10) Not Null,
	IsDeleted bit Default(0)
);

Create Table Payment(
	Id int Identity(1,1) Primary Key Not Null,
	CreatedOn Datetime not Null,
	--Foreign Keys
	PaymentTypeId int Not Null,
	CardId int Not Null,
	AdministratorId int Not Null,
	MemberId int Null
	--Foreign Keys Constrains
	FOREIGN KEY (PaymentTypeId) REFERENCES PaymentType(Id),
	FOREIGN KEY (CardId) REFERENCES [Card](Id),
	FOREIGN KEY (AdministratorId) REFERENCES Administrator(Id),
	FOREIGN KEY (MemberId) REFERENCES Member(Id),
);

Create Table Pricing(
	Id int Identity(1,1) Primary Key Not Null,
	FromDateTime datetime Not Null,
	ToDateTime datetime Not Null,
	Price float Not Null,
	--Foreign key
	CardInfoId int Not Null
	--Constraints
	FOREIGN KEY (CardInfoId) REFERENCES CardInfo(Id),
	Constraint CK_Pricing_FromDate_LessThan_ToDate
		Check (FromDateTime < ToDateTime),
	Constraint CK_Pricing_Price_Positive
		Check (Price>=0)
);

