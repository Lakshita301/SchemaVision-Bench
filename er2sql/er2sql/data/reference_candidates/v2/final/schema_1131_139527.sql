-- Source: https://github.com/johnnypi6/Ashe_dashboardapp/blob/968fb31082b501dc154cffed53c88764b8d05133/Database/Dump20190325_2.sql?raw=true
-- Tables detected: 13 | FK constraints: 9
CREATE TABLE "__efmigrationshistory" (
    "MigrationId" varchar(95) NOT NULL,
    "ProductVersion" varchar(32) NOT NULL,
    PRIMARY KEY ("MigrationId")
);

CREATE TABLE "aspnetroleclaims" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "RoleId" int NOT NULL,
    "ClaimType" TEXT,
    "ClaimValue" TEXT,
    PRIMARY KEY ("Id"),
    KEY "IX_AspNetRoleClaims_RoleId" ("RoleId"),
    CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "role" ("Id") ON DELETE CASCADE
);

CREATE TABLE "aspnetuserclaims" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "UserId" int NOT NULL,
    "ClaimType" TEXT,
    "ClaimValue" TEXT,
    PRIMARY KEY ("Id"),
    KEY "IX_AspNetUserClaims_UserId" ("UserId"),
    CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "user" ("Id") ON DELETE CASCADE
);

CREATE TABLE "aspnetuserlogins" (
    "LoginProvider" varchar(128) NOT NULL,
    "ProviderKey" varchar(128) NOT NULL,
    "ProviderDisplayName" TEXT,
    "UserId" int NOT NULL,
    PRIMARY KEY ("LoginProvider","ProviderKey"),
    KEY "IX_AspNetUserLogins_UserId" ("UserId"),
    CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "user" ("Id") ON DELETE CASCADE
);

CREATE TABLE "aspnetuserroles" (
    "UserId" int NOT NULL,
    "RoleId" int NOT NULL,
    PRIMARY KEY ("UserId","RoleId"),
    KEY "IX_AspNetUserRoles_RoleId" ("RoleId"),
    CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "role" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "user" ("Id") ON DELETE CASCADE
);

CREATE TABLE "aspnetusertokens" (
    "UserId" int NOT NULL,
    "LoginProvider" varchar(128) NOT NULL,
    "Name" varchar(128) NOT NULL,
    "Value" TEXT,
    PRIMARY KEY ("UserId","LoginProvider","Name"),
    CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "user" ("Id") ON DELETE CASCADE
);

CREATE TABLE "device" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "UserId" int NOT NULL,
    "LocationId" int NOT NULL,
    "IMEI" varchar(256) NOT NULL,
    "SIMCard" varchar(256) DEFAULT NULL,
    "DeviceTypeId" int DEFAULT NULL,
    "Status" int DEFAULT NULL,
    PRIMARY KEY ("Id"),
    KEY "IX_Device_UserId" ("UserId"),
    KEY "IX_Device_LocationId" ("LocationId"),
    CONSTRAINT "FK_Device_Location_LocationId" FOREIGN KEY ("LocationId") REFERENCES "location" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Device_User_UserId" FOREIGN KEY ("UserId") REFERENCES "user" ("Id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE "devicetype" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "Name" varchar(256) DEFAULT NULL,
    PRIMARY KEY ("Id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE "location" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "Name" varchar(256) NOT NULL,
    "Latitude" DOUBLE PRECISION NOT NULL,
    "Longitude" DOUBLE PRECISION NOT NULL,
    PRIMARY KEY ("Id"),
    UNIQUE KEY "IX_Location_Name" ("Name")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE "role" (
    "Id" int NOT NULL,
    "Name" varchar(256) DEFAULT NULL,
    "NormalizedName" varchar(256) DEFAULT NULL,
    "DisplayName" varchar(256) DEFAULT NULL,
    "ConcurrencyStamp" TEXT,
    PRIMARY KEY ("Id")
);

CREATE TABLE "sensor" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "DeviceId" int NOT NULL,
    "SensorTypeId" int NOT NULL,
    "SerialNumber" varchar(256) DEFAULT NULL,
    "HighThreshold" varchar(256) DEFAULT NULL,
    "LowThreshold" varchar(256) DEFAULT NULL,
    "RelayOperation" int DEFAULT NULL,
    "Status" int DEFAULT NULL,
    PRIMARY KEY ("Id"),
    KEY "IX_Sensor_DeviceId" ("DeviceId"),
    KEY "IX_Sensor_Type" ("SensorTypeId"),
    CONSTRAINT "FK_Sensor_Device_Id" FOREIGN KEY ("DeviceId") REFERENCES "device" ("Id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE "sensortype" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "Name" varchar(256) DEFAULT NULL,
    PRIMARY KEY ("Id")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE "user" (
    "Id" int NOT NULL AUTO_INCREMENT,
    "UserName" varchar(256) NOT NULL,
    "NormalizedUserName" varchar(256) NOT NULL,
    "PasswordHash" varchar(256) NOT NULL,
    "Email" varchar(256) DEFAULT NULL,
    "NormalizedEmail" varchar(256) DEFAULT NULL,
    "Phone" varchar(256) DEFAULT NULL,
    "Mobile" varchar(256) DEFAULT NULL,
    "Address" varchar(256) DEFAULT NULL,
    "Company" varchar(256) DEFAULT NULL,
    "ContactPerson" varchar(256) DEFAULT NULL,
    "SecurityStamp" TEXT,
    "ConcurrencyStamp" TEXT,
    PRIMARY KEY ("Id"),
    UNIQUE KEY "UserNameIndex" ("NormalizedUserName"),
    UNIQUE KEY "UserEmailIndex" ("NormalizedEmail")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
