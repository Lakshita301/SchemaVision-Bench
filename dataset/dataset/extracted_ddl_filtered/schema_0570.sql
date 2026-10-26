-- Source: https://github.com/v-rawang/Rally.IO/blob/002c815295845e4f225a89ee58aa7ae45d3e8acb/RallyFramework/DB/db_edge_nuclide-mysql-06102001.sql?raw=true
-- Tables detected: 29 | FK/REFERENCES mentions: 3

CREATE TABLE `accounts` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(252) NOT NULL,
  `FirstName` varchar(252) DEFAULT NULL,
  `LastName` varchar(252) DEFAULT NULL,
  `NickName` varchar(252) NOT NULL,
  `Gender` tinyint(1) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Title` varchar(252) DEFAULT NULL,
  `SID` varchar(252) DEFAULT NULL,
  `Alias` varchar(252) DEFAULT NULL,
  `Address` varchar(252) DEFAULT NULL,
  `ZipCode` varchar(252) DEFAULT NULL,
  `Email` varchar(252) DEFAULT NULL,
  `Mobile` varchar(252) DEFAULT NULL,
  `PhoneNumber` varchar(252) DEFAULT NULL,
  `BloodType` varchar(4) DEFAULT NULL,
  `Constellation` varchar(16) DEFAULT NULL,
  `Hobby` varchar(100) DEFAULT NULL,
  `PoliticsStatus` varchar(152) DEFAULT NULL,
  `Education` varchar(152) DEFAULT NULL,
  `Industry` varchar(152) DEFAULT NULL,
  `Organization` varchar(252) DEFAULT NULL,
  `Department` varchar(252) DEFAULT NULL,
  `WorkGroup` varchar(252) DEFAULT NULL,
  `Position` varchar(252) DEFAULT NULL,
  `Headline` varchar(252) DEFAULT NULL,
  `Biography` longtext,
  `Description` varchar(500) DEFAULT NULL,
  `HeadImageFileID` varchar(252) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `applicationsettings` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `PlatformIpAddress` varchar(20) DEFAULT NULL,
  `PlatformPortNumber` int(11) DEFAULT NULL,
  `AlarmMode` int(11) DEFAULT NULL,
  `AlarmSound` varchar(20) DEFAULT NULL,
  `NotificationMode` int(11) DEFAULT NULL,
  `NotificationSound` varchar(20) DEFAULT NULL,
  `Language` int(11) DEFAULT NULL,
  `Protocol` varchar(30) DEFAULT NULL,
  `name2` varchar(30) DEFAULT NULL,
  `PlatformIpAddress2` varchar(30) DEFAULT NULL,
  `PlatformPortNumber2` varchar(30) DEFAULT NULL,
  `Protocol2` varchar(30) DEFAULT NULL,
  `name3` varchar(30) DEFAULT NULL,
  `PlatformIpAddress3` varchar(30) DEFAULT NULL,
  `PlatformPortNumber3` varchar(30) DEFAULT NULL,
  `Protocol3` varchar(30) DEFAULT NULL,
  `name4` varchar(30) DEFAULT NULL,
  `PlatformIpAddress4` varchar(30) DEFAULT NULL,
  `PlatformPortNumber4` varchar(30) DEFAULT NULL,
  `Protocol4` varchar(30) DEFAULT NULL,
  `theme` varchar(30) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `Duration2` varchar(30) DEFAULT NULL,
  `Duration1` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `BgValArchFrequency` int DEFAULT NULL comment '本底数据归档周期', 
  `ImageCapturingMode` int DEFAULT NULL comment '是否抓拍照片',
  `ImageCapturingCount` int DEFAULT NULL comment '抓拍照片数量',
  `VideoCapturingMode` int DEFAULT NULL comment '是否录制视频',
  `VideoCapturingLength` int DEFAULT NULL comment '录制视频长度',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `datascopes` (
  `Id` varchar(250) NOT NULL,
  `ScopeName` varchar(250) NOT NULL,
  `ScopeType` varchar(250) NOT NULL,
  `DataType` varchar(250) NOT NULL,
  `DataIdentifier` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `files` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `FilePath` varchar(1200) NOT NULL,
  `FileName` varchar(250) NOT NULL,
  `FileType` varchar(20) NOT NULL,
  `FileSize` varchar(20) DEFAULT NULL,
  `Version` varchar(20) DEFAULT NULL,
  `FileCreationTime` datetime NOT NULL,
  `FileOwner` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

CREATE TABLE `instrumentcamerasettings` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `InstrumentID` bigint(20) NOT NULL,
  `CameraType` int(1) DEFAULT NULL,
  `ConnectionType` int(1) DEFAULT NULL,
  `Model` varchar(200) DEFAULT NULL,
  `SerialNumber` varchar(200) DEFAULT NULL,
  `Manufacturer` varchar(200) DEFAULT NULL,
  `Brand` varchar(200) DEFAULT NULL,
  `SKU` varchar(200) DEFAULT NULL,
  `IpAddress` varchar(200) DEFAULT NULL,
  `PortNumber` int(11) DEFAULT NULL,
  `LoginName` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AssemblyName` varchar(200) DEFAULT NULL,
  `AssemblyPath` varchar(200) DEFAULT NULL,
  `ClassName` varchar(200) DEFAULT NULL,
  `Version` varchar(200) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `Index` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE `instrumentcommnunicationsettings` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `InstrumentID` bigint(200) NOT NULL,
  `Type` int(1) DEFAULT NULL,
  `IpAddress` varchar(200) DEFAULT NULL,
  `PortNumber` int(11) DEFAULT NULL,
  `SerialPortName` varchar(200) DEFAULT NULL,
  `SerialPortBaudRate` int(11) DEFAULT NULL,
  `BluetoothDeviceName` varchar(200) DEFAULT NULL,
  `BluetoothAddress` varchar(200) DEFAULT NULL,
  `BluetoothKey` varchar(200) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `Protocol` varchar(200) DEFAULT NULL,
  `AssemblyName` varchar(200) DEFAULT NULL,
  `AssemblyPath` varchar(200) DEFAULT NULL,
  `ClassName` varchar(200) DEFAULT NULL,
  `Version` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `instrumentfaults` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `InstrumentID` bigint(20) NOT NULL,
  `FaultTime` datetime NOT NULL,
  `FaultType` int(11) NOT NULL,
  `FaultCode` varchar(20) DEFAULT NULL,
  `FaultMessage` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `instruments` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Alias` varchar(20) DEFAULT NULL,
  `Type` int(1) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `SerialNumber` varchar(20) DEFAULT NULL,
  `Manufacturer` varchar(20) DEFAULT NULL,
  `Brand` varchar(20) DEFAULT NULL,
  `SKU` varchar(20) DEFAULT NULL,
  `WarrantyPeriod` int(11) DEFAULT NULL,
  `ShipmentDate` datetime DEFAULT NULL,
  `PurchaseDate` datetime DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `InstallationDate` datetime DEFAULT NULL,
  `AcceptanceDate` datetime DEFAULT NULL,
  `Organization` varchar(20) DEFAULT NULL,
  `Department` varchar(20) DEFAULT NULL,
  `WorkGroup` varchar(20) DEFAULT NULL,
  `Index` int(2) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime NOT NULL,
  `Category` varchar(25) DEFAULT NULL,
  `LogLevel` varchar(25) NOT NULL,
  `CallSite` varchar(5000) DEFAULT NULL,
  `Message` longtext,
  `StackTrace` varchar(5000) DEFAULT NULL,
  `Exception` varchar(5000) DEFAULT NULL,
  `MachineName` varchar(30) DEFAULT NULL,
  `Identity` varchar(40) DEFAULT NULL,
  `ProcessName` varchar(40) DEFAULT NULL,
  `ThreadName` varchar(40) DEFAULT NULL,
  `LoggerName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `maintenanceorderattachments` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `OrderID` bigint(20) NOT NULL,
  `FileID` bigint(20) NOT NULL,
  `FileCreationTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `maintenanceorderlineitems` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `OrderID` bigint(20) NOT NULL,
  `FulfillmentDate` datetime NOT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  `RepairResult` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `maintenanceorders` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `InstrumentID` bigint(20) NOT NULL,
  `OrderRefID` varchar(20) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `FaultTime` datetime NOT NULL,
  `WarrantyStatus` int(1) NOT NULL,
  `Cost` varchar(20) DEFAULT NULL,
  `FaultCode` varchar(20) DEFAULT NULL,
  `FaultDescription` varchar(20) DEFAULT NULL,
  `RepairResult` varchar(20) DEFAULT NULL,
  `RepairDescription` varchar(200) DEFAULT NULL,
  `UserComment` varchar(20) DEFAULT NULL,
  `CommentContent` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `objectoperationauthitems` (
  `Id` varchar(250) NOT NULL,
  `ObjectId` varchar(250) NOT NULL,
  `ActorId` varchar(250) NOT NULL,
  `OperationId` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_FK_OperationObjectOperationAuthItem` (`OperationId`),
  CONSTRAINT `FK_OperationObjectOperationAuthItem` FOREIGN KEY (`OperationId`) REFERENCES `operations` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `operations` (
  `Id` varchar(250) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `DataType` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reportsettings` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Title` varchar(20) DEFAULT NULL,
  `TemplateID` bigint(20) NOT NULL,
  `TemplateName` varchar(200) DEFAULT NULL,
  `AlarmMode` int(11) DEFAULT NULL,
  `Printer` varchar(200) DEFAULT NULL,
  `AutoPrintOnAlarm` int(11) NOT NULL,
  `AutoPrintOnMeasurement` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roleactors` (
  `Id` varchar(250) NOT NULL,
  `RoleId` varchar(250) NOT NULL,
  `ActorId` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roledatascopes` (
  `Id` varchar(250) NOT NULL,
  `RoleId` varchar(250) NOT NULL,
  `DataScopeId` varchar(250) NOT NULL,
  `ScopeValue` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_FK_DataScopeRoleDataScope` (`DataScopeId`),
  CONSTRAINT `FK_DataScopeRoleDataScope` FOREIGN KEY (`DataScopeId`) REFERENCES `datascopes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roleoperations` (
  `Id` varchar(250) NOT NULL,
  `RoleId` varchar(250) NOT NULL,
  `OperationId` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_FK_OperationRoleOperation` (`OperationId`),
  CONSTRAINT `FK_OperationRoleOperation` FOREIGN KEY (`OperationId`) REFERENCES `operations` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `Id` varchar(250) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `RoleType` varchar(250) NOT NULL,
  `Description` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `Id` varchar(128) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `UserType` int(1) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `PasswordSalt` varchar(128) NOT NULL,
  `PasswordRev` int(11) NOT NULL,
  `SecurityStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(18) NOT NULL,
  `Description` longtext,
  `CreateDate` datetime DEFAULT NULL,
  `ConfirmationToken` varchar(128) DEFAULT NULL,
  `IsConfirmed` tinyint(1) NOT NULL,
  `LastPasswordFailureDate` datetime DEFAULT NULL,
  `PasswordFailuresSinceLastSuccess` int(11) DEFAULT NULL,
  `PasswordChangedDate` datetime DEFAULT NULL,
  `PasswordVerificationToken` varchar(128) DEFAULT NULL,
  `PasswordVerificationTokenExpirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rawfiles` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `AlarmID` varchar(128) NOT NULL,
  `FilePath` varchar(1200) NOT NULL,
  `FileName` varchar(250) NOT NULL,
  `FileType` varchar(20) NOT NULL,
  `Version` varchar(20) DEFAULT NULL,
  `FileCreationTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

CREATE TABLE `measurementdataitems` (
  `ID` varchar(128) NOT NULL,
  `MeasurementTime` datetime DEFAULT NULL,
  `InstrumentID` bigint(20) NOT NULL,
  `DetectorType` varchar(20) DEFAULT NULL,
  `DetectorNo` varchar(20) DEFAULT NULL,
  `CameraNo` varchar(20) DEFAULT NULL,
  `VehicleType` varchar(20) DEFAULT NULL,
  `VehicleNo` varchar(20) DEFAULT NULL,
  `VehicleSpeed` float(255,8) DEFAULT NULL,
  `OperatorID` varchar(20) DEFAULT NULL,
  `BackgroundValue` float(255,8) DEFAULT NULL,
  `AlarmThresholdOne` float(255,8) DEFAULT NULL,
  `AlarmThresholdTwo` float(255,8) DEFAULT NULL,
  `MeasuredValue` float(255,8) DEFAULT NULL,
  `NuclideCategory` int DEFAULT NULL,
  `Nuclide1` varchar(20) DEFAULT NULL,
  `Credibility1`  float(255,8) DEFAULT NULL,
  `Nuclide2` varchar(20) DEFAULT NULL,
  `Credibility2`  float(255,8) DEFAULT NULL,
  `Nuclide3` varchar(20) DEFAULT NULL,
  `Credibility3`  float(255,8) DEFAULT NULL,
  `Result` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `WindSpeed` float(255,8) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `alarmdataitems` (
  `ID` varchar(128) NOT NULL,
  `MeasurementTime` datetime DEFAULT NULL,
  `InstrumentID` bigint(20) NOT NULL,
  `DetectorType` varchar(20) DEFAULT NULL,
  `DetectorNo` varchar(20) DEFAULT NULL,
  `CameraNo` varchar(20) DEFAULT NULL,
  `VehicleType` varchar(20) DEFAULT NULL,
  `VehicleNo` varchar(20) DEFAULT NULL,
  `VehicleSpeed` float(255,8) DEFAULT NULL,
  `OperatorID` varchar(20) DEFAULT NULL,
  `BackgroundValue` float(255,8) DEFAULT NULL,
  `AlarmThresholdOne` float(255,8) DEFAULT NULL,
  `AlarmThresholdTwo` float(255,8) DEFAULT NULL,
  `MeasuredValue` float(255,8) DEFAULT NULL,
  `NuclideCategory` int DEFAULT NULL,
  `Nuclide1` varchar(20) DEFAULT NULL,
  `Credibility1`  float(255,8) DEFAULT NULL,
  `Nuclide2` varchar(20) DEFAULT NULL,
  `Credibility2`  float(255,8) DEFAULT NULL,
  `Nuclide3` varchar(20) DEFAULT NULL,
  `Credibility3`  float(255,8) DEFAULT NULL,
  `Result` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `WindSpeed` float(255,8) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `IsByMistake` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `nuclide`  (
  `ID` int(10) NOT NULL,
  `No` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Symbol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Type` int(10) NULL DEFAULT NULL,
  `Category` int(10) NULL DEFAULT NULL,
  `Energy1` float(255, 8) NULL DEFAULT NULL,
  `BranchingRatio1` float(255, 8) NULL DEFAULT NULL,
  `Channel1` float(255, 8) NULL DEFAULT NULL,
  `Energy2` float(255, 8) NULL DEFAULT NULL,
  `BranchingRatio2` float(255, 8) NULL DEFAULT NULL,
  `Channel2` float(255, 8) NULL DEFAULT NULL,
  `Energy3` float(255, 8) NULL DEFAULT NULL,
  `BranchingRatio3` float(255, 8) NULL DEFAULT NULL,
  `Channel3` float(255, 8) NULL DEFAULT NULL,
  `HalfLife` float(255, 8) NULL DEFAULT NULL,
  `HalfLifeUnit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HalfAddress` varchar(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE `energycalibration` (
  `ID` varchar(128) NOT NULL,
  `Time` datetime DEFAULT NULL,
  `OperatorID` varchar(128) DEFAULT NULL,
  `InstrumentNo` varchar(20) DEFAULT NULL,
  `NuclideBoardNo` varchar(20) DEFAULT NULL,
  `Channel1` float(255,8) DEFAULT NULL,
  `Energy1` float(255,8) DEFAULT NULL,
  `Channel2` float(255,8) DEFAULT NULL,
  `Energy2` float(255,8) DEFAULT NULL,
  `Channel3` float(255,8) DEFAULT NULL,
  `Energy3` float(255,8) DEFAULT NULL,
  `Channel4` float(255,8) DEFAULT NULL,
  `Energy4` float(255,8) DEFAULT NULL,
  `Channel5` float(255,8) DEFAULT NULL,
  `Energy5` float(255,8) DEFAULT NULL,
  `CoefficientA` float(255,8) DEFAULT NULL,
  `CoefficientB` float(255,8) DEFAULT NULL,
  `CoefficientC` float(255,8) DEFAULT NULL,
  `EnergyResolution` float(255,8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `circuitconfigs` (
  `ID` varchar(128) NOT NULL,
  `CircuitName` varchar(128) DEFAULT NULL,
  `CircuitNo` varchar(128) DEFAULT NULL,
  `Address` varchar(128) DEFAULT NULL,
  `Port` int DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `backgrounddataitems` (
  `ID` varchar(128) NOT NULL,
  `MeasurementTime` datetime DEFAULT NULL,
  `InstrumentID` bigint(20) NOT NULL,
  `DetectorType` varchar(20) DEFAULT NULL,
  `DetectorNo` varchar(20) DEFAULT NULL,
  `BackgroundValue` float(255,8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `backgrounddailyaverages` (
  `ID` varchar(128) NOT NULL,
  `StatTime` datetime DEFAULT NULL,
  `InstrumentID` bigint(20) NOT NULL,
  `DetectorType` varchar(20) DEFAULT NULL,
  `DetectorNo` varchar(20) DEFAULT NULL,
  `BackgroundValue` float(255,8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `backgroundmonthlyaverages` (
  `ID` varchar(128) NOT NULL,
  `StatTime` datetime DEFAULT NULL,
  `InstrumentID` bigint(20) NOT NULL,
  `DetectorType` varchar(20) DEFAULT NULL,
  `DetectorNo` varchar(20) DEFAULT NULL,
  `BackgroundValue` float(255,8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

