-- Source: https://github.com/remonalbear/CMMS/blob/a7c6b30fb9edbbd84bceb9462874589b583db59c/cmms%20(2).sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 15

CREATE TABLE `AgentSuppliers` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Adress` varchar(255) NOT NULL,
  `Phone` bigint(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Notes` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `BreakDowns` (
  `Code` int(11) NOT NULL,
  `Reason` text NOT NULL,
  `DATE` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ClinicalEnginners` (
  `DSSN` bigint(20) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `Phone` bigint(20) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Adress` varchar(255) NOT NULL,
  `WorkHours` int(11) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `DepartmentCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Departments` (
  `Code` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `DialyInspections` (
  `Code` int(11) NOT NULL,
  `DATE` varchar(255) NOT NULL,
  `Q1` varchar(255) NOT NULL,
  `Q2` varchar(255) NOT NULL,
  `Q3` varchar(255) NOT NULL,
  `Q4` varchar(255) NOT NULL,
  `Q5` varchar(255) NOT NULL,
  `Q6` varchar(255) NOT NULL,
  `Q7` varchar(255) NOT NULL,
  `Q8` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int(11) DEFAULT NULL,
  `ClinicalEnginnerDSSN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Equipment` (
  `Code` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Cost` bigint(12) NOT NULL,
  `Model` varchar(255) NOT NULL,
  `SerialNumber` varchar(255) NOT NULL,
  `InstallationDate` text NOT NULL,
  `ArrivalDate` text NOT NULL,
  `WarrantyDate` text NOT NULL,
  `Manufacturer` text DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `PM` varchar(255) NOT NULL,
  `Notes` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AgentSupplierId` int(11) DEFAULT NULL,
  `DepartmentCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Maintenances` (
  `Id` int(11) NOT NULL,
  `StartDate` varchar(255) NOT NULL,
  `EndDate` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `BreakDownCode` int(11) DEFAULT NULL,
  `ClinicalEnginnerDSSN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PpmQuestions` (
  `Code` int(11) NOT NULL,
  `Q1` text DEFAULT NULL,
  `Q2` text DEFAULT NULL,
  `Q3` text DEFAULT NULL,
  `Q4` text DEFAULT NULL,
  `Q5` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PPMs` (
  `Code` int(11) NOT NULL,
  `DATE` varchar(255) NOT NULL,
  `Q1` varchar(255) NOT NULL,
  `Q2` varchar(255) NOT NULL,
  `Q3` varchar(255) NOT NULL,
  `Q4` varchar(255) NOT NULL,
  `Q5` varchar(255) NOT NULL,
  `N1` text DEFAULT NULL,
  `N2` text DEFAULT NULL,
  `N3` text DEFAULT NULL,
  `N4` text DEFAULT NULL,
  `N5` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int(11) DEFAULT NULL,
  `ClinicalEnginnerDSSN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `SpareParts` (
  `Code` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Amount` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AgentSupplierId` int(11) DEFAULT NULL,
  `EquipmentCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `WorkOrders` (
  `Code` int(11) NOT NULL,
  `StartDate` text NOT NULL,
  `EndDate` text NOT NULL,
  `Description` text NOT NULL,
  `Cost` int(11) NOT NULL,
  `Priority` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ClinicalEnginnerDSSN` bigint(20) DEFAULT NULL,
  `EquipmentCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `BreakDowns`
  ADD CONSTRAINT `BreakDowns_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `Equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `ClinicalEnginners`
  ADD CONSTRAINT `ClinicalEnginners_ibfk_1` FOREIGN KEY (`DepartmentCode`) REFERENCES `Departments` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `DialyInspections`
  ADD CONSTRAINT `DialyInspections_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `Equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DialyInspections_ibfk_2` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `ClinicalEnginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `Equipment`
  ADD CONSTRAINT `Equipment_ibfk_1` FOREIGN KEY (`AgentSupplierId`) REFERENCES `AgentSuppliers` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Equipment_ibfk_2` FOREIGN KEY (`DepartmentCode`) REFERENCES `Departments` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `Maintenances`
  ADD CONSTRAINT `Maintenances_ibfk_1` FOREIGN KEY (`BreakDownCode`) REFERENCES `BreakDowns` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Maintenances_ibfk_2` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `ClinicalEnginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `PpmQuestions`
  ADD CONSTRAINT `PpmQuestions_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `Equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `PPMs`
  ADD CONSTRAINT `PPMs_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `Equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PPMs_ibfk_2` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `ClinicalEnginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `SpareParts`
  ADD CONSTRAINT `SpareParts_ibfk_1` FOREIGN KEY (`AgentSupplierId`) REFERENCES `AgentSuppliers` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SpareParts_ibfk_2` FOREIGN KEY (`EquipmentCode`) REFERENCES `Equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `WorkOrders`
  ADD CONSTRAINT `WorkOrders_ibfk_1` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `ClinicalEnginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `WorkOrders_ibfk_2` FOREIGN KEY (`EquipmentCode`) REFERENCES `Equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

