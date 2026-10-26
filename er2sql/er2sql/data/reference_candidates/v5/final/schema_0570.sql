-- Source: https://github.com/v-rawang/Rally.IO/blob/002c815295845e4f225a89ee58aa7ae45d3e8acb/RallyFramework/DB/db_edge_nuclide-mysql-06102001.sql?raw=true
-- Tables detected: 29 | FK/REFERENCES mentions: 3
CREATE TABLE "accounts" (
    "Id" varchar(128) NOT NULL,
    "Name" varchar(252) NOT NULL,
    "FirstName" varchar(252) DEFAULT NULL,
    "LastName" varchar(252) DEFAULT NULL,
    "NickName" varchar(252) NOT NULL,
    "Gender" SMALLINT DEFAULT NULL,
    "BirthDate" TIMESTAMP DEFAULT NULL,
    "Title" varchar(252) DEFAULT NULL,
    "SID" varchar(252) DEFAULT NULL,
    "Alias" varchar(252) DEFAULT NULL,
    "Address" varchar(252) DEFAULT NULL,
    "ZipCode" varchar(252) DEFAULT NULL,
    "Email" varchar(252) DEFAULT NULL,
    "Mobile" varchar(252) DEFAULT NULL,
    "PhoneNumber" varchar(252) DEFAULT NULL,
    "BloodType" varchar(4) DEFAULT NULL,
    "Constellation" varchar(16) DEFAULT NULL,
    "Hobby" varchar(100) DEFAULT NULL,
    "PoliticsStatus" varchar(152) DEFAULT NULL,
    "Education" varchar(152) DEFAULT NULL,
    "Industry" varchar(152) DEFAULT NULL,
    "Organization" varchar(252) DEFAULT NULL,
    "Department" varchar(252) DEFAULT NULL,
    "WorkGroup" varchar(252) DEFAULT NULL,
    "Position" varchar(252) DEFAULT NULL,
    "Headline" varchar(252) DEFAULT NULL,
    "Biography" TEXT,
    "Description" varchar(500) DEFAULT NULL,
    "HeadImageFileID" varchar(252) DEFAULT NULL,
    "ModifiedDate" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "applicationsettings" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "PlatformIpAddress" varchar(20) DEFAULT NULL,
    "PlatformPortNumber" int DEFAULT NULL,
    "AlarmMode" int DEFAULT NULL,
    "AlarmSound" varchar(20) DEFAULT NULL,
    "NotificationMode" int DEFAULT NULL,
    "NotificationSound" varchar(20) DEFAULT NULL,
    "Language" int DEFAULT NULL,
    "Protocol" varchar(30) DEFAULT NULL,
    "name2" varchar(30) DEFAULT NULL,
    "PlatformIpAddress2" varchar(30) DEFAULT NULL,
    "PlatformPortNumber2" varchar(30) DEFAULT NULL,
    "Protocol2" varchar(30) DEFAULT NULL,
    "name3" varchar(30) DEFAULT NULL,
    "PlatformIpAddress3" varchar(30) DEFAULT NULL,
    "PlatformPortNumber3" varchar(30) DEFAULT NULL,
    "Protocol3" varchar(30) DEFAULT NULL,
    "name4" varchar(30) DEFAULT NULL,
    "PlatformIpAddress4" varchar(30) DEFAULT NULL,
    "PlatformPortNumber4" varchar(30) DEFAULT NULL,
    "Protocol4" varchar(30) DEFAULT NULL,
    "theme" varchar(30) DEFAULT NULL,
    "time" varchar(100) DEFAULT NULL,
    "type" varchar(100) DEFAULT NULL,
    "Duration2" varchar(30) DEFAULT NULL,
    "Duration1" varchar(30) DEFAULT NULL,
    "name" varchar(30) DEFAULT NULL,
    "BgValArchFrequency" int DEFAULT NULL,
    "ImageCapturingMode" int DEFAULT NULL,
    "ImageCapturingCount" int DEFAULT NULL,
    "VideoCapturingMode" int DEFAULT NULL,
    "VideoCapturingLength" int DEFAULT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE "datascopes" (
    "Id" varchar(250) NOT NULL,
    "ScopeName" varchar(250) NOT NULL,
    "ScopeType" varchar(250) NOT NULL,
    "DataType" varchar(250) NOT NULL,
    "DataIdentifier" varchar(250) NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "files" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "FilePath" varchar(1200) NOT NULL,
    "FileName" varchar(250) NOT NULL,
    "FileType" varchar(20) NOT NULL,
    "FileSize" varchar(20) DEFAULT NULL,
    "Version" varchar(20) DEFAULT NULL,
    "FileCreationTime" TIMESTAMP NOT NULL,
    "FileOwner" varchar(128) NOT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

CREATE TABLE "instrumentcamerasettings" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "InstrumentID" bigint NOT NULL,
    "CameraType" int DEFAULT NULL,
    "ConnectionType" int DEFAULT NULL,
    "Model" varchar(200) DEFAULT NULL,
    "SerialNumber" varchar(200) DEFAULT NULL,
    "Manufacturer" varchar(200) DEFAULT NULL,
    "Brand" varchar(200) DEFAULT NULL,
    "SKU" varchar(200) DEFAULT NULL,
    "IpAddress" varchar(200) DEFAULT NULL,
    "PortNumber" int DEFAULT NULL,
    "LoginName" varchar(200) DEFAULT NULL,
    "Password" varchar(200) DEFAULT NULL,
    "AssemblyName" varchar(200) DEFAULT NULL,
    "AssemblyPath" varchar(200) DEFAULT NULL,
    "ClassName" varchar(200) DEFAULT NULL,
    "Version" varchar(200) DEFAULT NULL,
    "Remarks" varchar(200) DEFAULT NULL,
    "Index" int DEFAULT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE "instrumentcommnunicationsettings" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "InstrumentID" bigint NOT NULL,
    "Type" int DEFAULT NULL,
    "IpAddress" varchar(200) DEFAULT NULL,
    "PortNumber" int DEFAULT NULL,
    "SerialPortName" varchar(200) DEFAULT NULL,
    "SerialPortBaudRate" int DEFAULT NULL,
    "BluetoothDeviceName" varchar(200) DEFAULT NULL,
    "BluetoothAddress" varchar(200) DEFAULT NULL,
    "BluetoothKey" varchar(200) DEFAULT NULL,
    "Remarks" varchar(200) DEFAULT NULL,
    "Protocol" varchar(200) DEFAULT NULL,
    "AssemblyName" varchar(200) DEFAULT NULL,
    "AssemblyPath" varchar(200) DEFAULT NULL,
    "ClassName" varchar(200) DEFAULT NULL,
    "Version" varchar(200) DEFAULT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE "instrumentfaults" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "InstrumentID" bigint NOT NULL,
    "FaultTime" TIMESTAMP NOT NULL,
    "FaultType" int NOT NULL,
    "FaultCode" varchar(20) DEFAULT NULL,
    "FaultMessage" varchar(20) NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "instruments" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "Name" varchar(20) NOT NULL,
    "Alias" varchar(20) DEFAULT NULL,
    "Type" int DEFAULT NULL,
    "Model" varchar(20) DEFAULT NULL,
    "SerialNumber" varchar(20) DEFAULT NULL,
    "Manufacturer" varchar(20) DEFAULT NULL,
    "Brand" varchar(20) DEFAULT NULL,
    "SKU" varchar(20) DEFAULT NULL,
    "WarrantyPeriod" int DEFAULT NULL,
    "ShipmentDate" TIMESTAMP DEFAULT NULL,
    "PurchaseDate" TIMESTAMP DEFAULT NULL,
    "Latitude" varchar(20) DEFAULT NULL,
    "Longitude" varchar(20) DEFAULT NULL,
    "Location" varchar(20) DEFAULT NULL,
    "InstallationDate" TIMESTAMP DEFAULT NULL,
    "AcceptanceDate" TIMESTAMP DEFAULT NULL,
    "Organization" varchar(20) DEFAULT NULL,
    "Department" varchar(20) DEFAULT NULL,
    "WorkGroup" varchar(20) DEFAULT NULL,
    "Index" int DEFAULT NULL,
    "Remarks" varchar(200) DEFAULT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE "logs" (
    "ID" int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "TimeStamp" TIMESTAMP NOT NULL,
    "Category" varchar(25) DEFAULT NULL,
    "LogLevel" varchar(25) NOT NULL,
    "CallSite" varchar(5000) DEFAULT NULL,
    "Message" TEXT,
    "StackTrace" varchar(5000) DEFAULT NULL,
    "Exception" varchar(5000) DEFAULT NULL,
    "MachineName" varchar(30) DEFAULT NULL,
    "Identity" varchar(40) DEFAULT NULL,
    "ProcessName" varchar(40) DEFAULT NULL,
    "ThreadName" varchar(40) DEFAULT NULL,
    "LoggerName" varchar(40) DEFAULT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "maintenanceorderattachments" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "OrderID" bigint NOT NULL,
    "FileID" bigint NOT NULL,
    "FileCreationTime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "maintenanceorderlineitems" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "OrderID" bigint NOT NULL,
    "FulfillmentDate" TIMESTAMP NOT NULL,
    "Notes" varchar(200) DEFAULT NULL,
    "RepairResult" varchar(200) DEFAULT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE "maintenanceorders" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "InstrumentID" bigint NOT NULL,
    "OrderRefID" varchar(20) NOT NULL,
    "OrderDate" TIMESTAMP NOT NULL,
    "FaultTime" TIMESTAMP NOT NULL,
    "WarrantyStatus" int NOT NULL,
    "Cost" varchar(20) DEFAULT NULL,
    "FaultCode" varchar(20) DEFAULT NULL,
    "FaultDescription" varchar(20) DEFAULT NULL,
    "RepairResult" varchar(20) DEFAULT NULL,
    "RepairDescription" varchar(200) DEFAULT NULL,
    "UserComment" varchar(20) DEFAULT NULL,
    "CommentContent" varchar(200) DEFAULT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE "objectoperationauthitems" (
    "Id" varchar(250) NOT NULL,
    "ObjectId" varchar(250) NOT NULL,
    "ActorId" varchar(250) NOT NULL,
    "OperationId" varchar(250) NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "operations" (
    "Id" varchar(250) NOT NULL,
    "Name" varchar(250) NOT NULL,
    "DataType" varchar(250) NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "reportsettings" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "Title" varchar(20) DEFAULT NULL,
    "TemplateID" bigint NOT NULL,
    "TemplateName" varchar(200) DEFAULT NULL,
    "AlarmMode" int DEFAULT NULL,
    "Printer" varchar(200) DEFAULT NULL,
    "AutoPrintOnAlarm" int NOT NULL,
    "AutoPrintOnMeasurement" int NOT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "roleactors" (
    "Id" varchar(250) NOT NULL,
    "RoleId" varchar(250) NOT NULL,
    "ActorId" varchar(250) NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "roledatascopes" (
    "Id" varchar(250) NOT NULL,
    "RoleId" varchar(250) NOT NULL,
    "DataScopeId" varchar(250) NOT NULL,
    "ScopeValue" varchar(250) NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "roleoperations" (
    "Id" varchar(250) NOT NULL,
    "RoleId" varchar(250) NOT NULL,
    "OperationId" varchar(250) NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "roles" (
    "Id" varchar(250) NOT NULL,
    "Name" varchar(250) NOT NULL,
    "RoleType" varchar(250) NOT NULL,
    "Description" varchar(250) NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "users" (
    "Id" varchar(128) NOT NULL,
    "UserName" varchar(256) NOT NULL,
    "UserType" int DEFAULT NULL,
    "Email" varchar(256) DEFAULT NULL,
    "EmailConfirmed" SMALLINT NOT NULL,
    "PasswordHash" TEXT,
    "PasswordSalt" varchar(128) NOT NULL,
    "PasswordRev" int NOT NULL,
    "SecurityStamp" TEXT,
    "PhoneNumber" TEXT,
    "PhoneNumberConfirmed" SMALLINT NOT NULL,
    "TwoFactorEnabled" SMALLINT NOT NULL,
    "LockoutEndDateUtc" TIMESTAMP DEFAULT NULL,
    "LockoutEnabled" SMALLINT NOT NULL,
    "AccessFailedCount" int NOT NULL,
    "Description" TEXT,
    "CreateDate" TIMESTAMP DEFAULT NULL,
    "ConfirmationToken" varchar(128) DEFAULT NULL,
    "IsConfirmed" SMALLINT NOT NULL,
    "LastPasswordFailureDate" TIMESTAMP DEFAULT NULL,
    "PasswordFailuresSinceLastSuccess" int DEFAULT NULL,
    "PasswordChangedDate" TIMESTAMP DEFAULT NULL,
    "PasswordVerificationToken" varchar(128) DEFAULT NULL,
    "PasswordVerificationTokenExpirationDate" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE "rawfiles" (
    "ID" bigint unsigned zerofill NOT NULL AUTO_INCREMENT,
    "AlarmID" varchar(128) NOT NULL,
    "FilePath" varchar(1200) NOT NULL,
    "FileName" varchar(250) NOT NULL,
    "FileType" varchar(20) NOT NULL,
    "Version" varchar(20) DEFAULT NULL,
    "FileCreationTime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("ID")
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

CREATE TABLE "measurementdataitems" (
    "ID" varchar(128) NOT NULL,
    "MeasurementTime" TIMESTAMP DEFAULT NULL,
    "InstrumentID" bigint NOT NULL,
    "DetectorType" varchar(20) DEFAULT NULL,
    "DetectorNo" varchar(20) DEFAULT NULL,
    "CameraNo" varchar(20) DEFAULT NULL,
    "VehicleType" varchar(20) DEFAULT NULL,
    "VehicleNo" varchar(20) DEFAULT NULL,
    "VehicleSpeed" float(255,8) DEFAULT NULL,
    "OperatorID" varchar(20) DEFAULT NULL,
    "BackgroundValue" float(255,8) DEFAULT NULL,
    "AlarmThresholdOne" float(255,8) DEFAULT NULL,
    "AlarmThresholdTwo" float(255,8) DEFAULT NULL,
    "MeasuredValue" float(255,8) DEFAULT NULL,
    "NuclideCategory" int DEFAULT NULL,
    "Nuclide1" varchar(20) DEFAULT NULL,
    "Credibility1" float(255,8) DEFAULT NULL,
    "Nuclide2" varchar(20) DEFAULT NULL,
    "Credibility2" float(255,8) DEFAULT NULL,
    "Nuclide3" varchar(20) DEFAULT NULL,
    "Credibility3" float(255,8) DEFAULT NULL,
    "Result" varchar(20) DEFAULT NULL,
    "State" varchar(20) DEFAULT NULL,
    "Latitude" varchar(20) DEFAULT NULL,
    "Longitude" varchar(20) DEFAULT NULL,
    "WindSpeed" float(255,8) DEFAULT NULL,
    "Remarks" varchar(200) DEFAULT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "alarmdataitems" (
    "ID" varchar(128) NOT NULL,
    "MeasurementTime" TIMESTAMP DEFAULT NULL,
    "InstrumentID" bigint NOT NULL,
    "DetectorType" varchar(20) DEFAULT NULL,
    "DetectorNo" varchar(20) DEFAULT NULL,
    "CameraNo" varchar(20) DEFAULT NULL,
    "VehicleType" varchar(20) DEFAULT NULL,
    "VehicleNo" varchar(20) DEFAULT NULL,
    "VehicleSpeed" float(255,8) DEFAULT NULL,
    "OperatorID" varchar(20) DEFAULT NULL,
    "BackgroundValue" float(255,8) DEFAULT NULL,
    "AlarmThresholdOne" float(255,8) DEFAULT NULL,
    "AlarmThresholdTwo" float(255,8) DEFAULT NULL,
    "MeasuredValue" float(255,8) DEFAULT NULL,
    "NuclideCategory" int DEFAULT NULL,
    "Nuclide1" varchar(20) DEFAULT NULL,
    "Credibility1" float(255,8) DEFAULT NULL,
    "Nuclide2" varchar(20) DEFAULT NULL,
    "Credibility2" float(255,8) DEFAULT NULL,
    "Nuclide3" varchar(20) DEFAULT NULL,
    "Credibility3" float(255,8) DEFAULT NULL,
    "Result" varchar(20) DEFAULT NULL,
    "State" varchar(20) DEFAULT NULL,
    "Latitude" varchar(20) DEFAULT NULL,
    "Longitude" varchar(20) DEFAULT NULL,
    "WindSpeed" float(255,8) DEFAULT NULL,
    "Remarks" varchar(200) DEFAULT NULL,
    "IsByMistake" int DEFAULT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "nuclide"  (
    "ID" int NOT NULL,
    "No" varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    "Name" varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    "Symbol" varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    "Type" int NULL DEFAULT NULL,
    "Category" int NULL DEFAULT NULL,
    "Energy1" float(255, 8) NULL DEFAULT NULL,
    "BranchingRatio1" float(255, 8) NULL DEFAULT NULL,
    "Channel1" float(255, 8) NULL DEFAULT NULL,
    "Energy2" float(255, 8) NULL DEFAULT NULL,
    "BranchingRatio2" float(255, 8) NULL DEFAULT NULL,
    "Channel2" float(255, 8) NULL DEFAULT NULL,
    "Energy3" float(255, 8) NULL DEFAULT NULL,
    "BranchingRatio3" float(255, 8) NULL DEFAULT NULL,
    "Channel3" float(255, 8) NULL DEFAULT NULL,
    "HalfLife" float(255, 8) NULL DEFAULT NULL,
    "HalfLifeUnit" varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    "HalfAddress" varchar(20) NULL DEFAULT NULL,
    PRIMARY KEY ("ID")
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE "energycalibration" (
    "ID" varchar(128) NOT NULL,
    "Time" TIMESTAMP DEFAULT NULL,
    "OperatorID" varchar(128) DEFAULT NULL,
    "InstrumentNo" varchar(20) DEFAULT NULL,
    "NuclideBoardNo" varchar(20) DEFAULT NULL,
    "Channel1" float(255,8) DEFAULT NULL,
    "Energy1" float(255,8) DEFAULT NULL,
    "Channel2" float(255,8) DEFAULT NULL,
    "Energy2" float(255,8) DEFAULT NULL,
    "Channel3" float(255,8) DEFAULT NULL,
    "Energy3" float(255,8) DEFAULT NULL,
    "Channel4" float(255,8) DEFAULT NULL,
    "Energy4" float(255,8) DEFAULT NULL,
    "Channel5" float(255,8) DEFAULT NULL,
    "Energy5" float(255,8) DEFAULT NULL,
    "CoefficientA" float(255,8) DEFAULT NULL,
    "CoefficientB" float(255,8) DEFAULT NULL,
    "CoefficientC" float(255,8) DEFAULT NULL,
    "EnergyResolution" float(255,8) DEFAULT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "circuitconfigs" (
    "ID" varchar(128) NOT NULL,
    "CircuitName" varchar(128) DEFAULT NULL,
    "CircuitNo" varchar(128) DEFAULT NULL,
    "Address" varchar(128) DEFAULT NULL,
    "Port" int DEFAULT NULL,
    "Status" int DEFAULT NULL,
    "Remarks" varchar(200) DEFAULT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "backgrounddataitems" (
    "ID" varchar(128) NOT NULL,
    "MeasurementTime" TIMESTAMP DEFAULT NULL,
    "InstrumentID" bigint NOT NULL,
    "DetectorType" varchar(20) DEFAULT NULL,
    "DetectorNo" varchar(20) DEFAULT NULL,
    "BackgroundValue" float(255,8) DEFAULT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "backgrounddailyaverages" (
    "ID" varchar(128) NOT NULL,
    "StatTime" TIMESTAMP DEFAULT NULL,
    "InstrumentID" bigint NOT NULL,
    "DetectorType" varchar(20) DEFAULT NULL,
    "DetectorNo" varchar(20) DEFAULT NULL,
    "BackgroundValue" float(255,8) DEFAULT NULL,
    PRIMARY KEY ("ID")
);

CREATE TABLE "backgroundmonthlyaverages" (
    "ID" varchar(128) NOT NULL,
    "StatTime" TIMESTAMP DEFAULT NULL,
    "InstrumentID" bigint NOT NULL,
    "DetectorType" varchar(20) DEFAULT NULL,
    "DetectorNo" varchar(20) DEFAULT NULL,
    "BackgroundValue" float(255,8) DEFAULT NULL,
    PRIMARY KEY ("ID")
);
ALTER TABLE "objectoperationauthitems" ADD CONSTRAINT "FK_OperationObjectOperationAuthItem" FOREIGN KEY ("OperationId") REFERENCES "operations" ("Id");
ALTER TABLE "roledatascopes" ADD CONSTRAINT "FK_DataScopeRoleDataScope" FOREIGN KEY ("DataScopeId") REFERENCES "datascopes" ("Id");
ALTER TABLE "roleoperations" ADD CONSTRAINT "FK_OperationRoleOperation" FOREIGN KEY ("OperationId") REFERENCES "operations" ("Id");
CREATE INDEX ON "objectoperationauthitems" ("OperationId");
CREATE INDEX ON "roledatascopes" ("DataScopeId");
CREATE INDEX ON "roleoperations" ("OperationId");
COMMENT ON COLUMN "applicationsettings"."BgValArchFrequency" IS '本底数据归档周期';
COMMENT ON COLUMN "applicationsettings"."ImageCapturingMode" IS '是否抓拍照片';
COMMENT ON COLUMN "applicationsettings"."ImageCapturingCount" IS '抓拍照片数量';
COMMENT ON COLUMN "applicationsettings"."VideoCapturingMode" IS '是否录制视频';
COMMENT ON COLUMN "applicationsettings"."VideoCapturingLength" IS '录制视频长度';
