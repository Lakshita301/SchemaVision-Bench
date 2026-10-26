-- Source: https://github.com/WamdamProject/WaMDaM_Information_Model/blob/9af0106ba5341eed67251cb079893bd59a30d60e/database_schemas/MySQL/Blank_db_copy/wamdamMySQL.sql?raw=true
-- Tables detected: 41 | FK/REFERENCES mentions: 46

CREATE TABLE `AttributeCategories` (
  `AttributeCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeCategoryName` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`AttributeCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Attributes` (
  `AttributeID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeName` varchar(255) NOT NULL,
  `AttributeNameCV` varchar(255) DEFAULT NULL,
  `ObjectTypeID` int(11) NOT NULL,
  `UnitName` varchar(255) NOT NULL,
  `UnitNameCV` varchar(255) DEFAULT NULL,
  `AttributeDataTypeCV` varchar(255) NOT NULL,
  `AttributeCategoryID` int(11) DEFAULT NULL,
  `ModelInputOrOutput` char(50) DEFAULT NULL,
  `AttributeDescription` text,
  PRIMARY KEY (`AttributeID`),
  KEY `fk_Attributes_CV_AttributeName` (`AttributeNameCV`),
  KEY `fk_Attributes_CV_AttributeType` (`AttributeDataTypeCV`),
  KEY `fk_Attributes_CV_Units` (`UnitNameCV`),
  KEY `fk_Attributes_ObjectTypes` (`ObjectTypeID`),
  KEY `fk_ObjectAttributes_AttributeCategory` (`AttributeCategoryID`),
  CONSTRAINT `fk_Attributes_CV_AttributeName` FOREIGN KEY (`AttributeNameCV`) REFERENCES `CV_AttributeName` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_CV_AttributeType` FOREIGN KEY (`AttributeDataTypeCV`) REFERENCES `CV_AttributeDataType` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_CV_Units` FOREIGN KEY (`UnitNameCV`) REFERENCES `CV_Units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_ObjectTypes` FOREIGN KEY (`ObjectTypeID`) REFERENCES `ObjectTypes` (`ObjectTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectAttributes_AttributeCategory` FOREIGN KEY (`AttributeCategoryID`) REFERENCES `AttributeCategories` (`AttributeCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_AggregationStatistic` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_AttributeDataType` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_AttributeName` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_DescriptorValues` (
  `Term` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `AttributeName` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_DualValueMeaning` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `BooleanValue` tinyint(1) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_ElectronicFileFormat` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_ElevationDatum` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_InstanceName` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_MethodType` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_ObjectType` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_ObjectTypology` (
  `Name` varchar(50) NOT NULL,
  `Term` varchar(50) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_SeasonName` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_SpatialReference` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CV_Units` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) NOT NULL,
  `UnitSystem` varchar(255) DEFAULT NULL,
  `UnitAbbreviation` char(50) NOT NULL,
  `SourceVocabularyURI` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Connections` (
  `ConnectivityID` int(11) NOT NULL AUTO_INCREMENT,
  `LinkInstanceID` int(11) NOT NULL,
  `StartNodeInstanceID` int(11) NOT NULL,
  `EndNodeInstanceID` int(11) NOT NULL,
  PRIMARY KEY (`ConnectivityID`),
  KEY `fk_Connections_Instances` (`EndNodeInstanceID`),
  KEY `fk_Connections_Instances_Link` (`LinkInstanceID`),
  KEY `fk_Connections_Instances_startNode` (`StartNodeInstanceID`),
  CONSTRAINT `fk_Connections_Instances` FOREIGN KEY (`EndNodeInstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Connections_Instances_Link` FOREIGN KEY (`LinkInstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Connections_Instances_startNode` FOREIGN KEY (`StartNodeInstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DataValuesMapper` (
  `DataValuesMapperID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`DataValuesMapperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Datasets` (
  `DatasetID` int(11) NOT NULL AUTO_INCREMENT,
  `DatasetName` varchar(255) NOT NULL,
  `DatasetAcronym` varchar(255) NOT NULL,
  `SourceID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`DatasetID`),
  KEY `fk_Datasets_Sources` (`SourceID`),
  CONSTRAINT `fk_Datasets_Sources` FOREIGN KEY (`SourceID`) REFERENCES `Sources` (`SourceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DescriptorValues` (
  `DescriptorValueID` int(11) NOT NULL AUTO_INCREMENT,
  `DescriptorValue` varchar(500) NOT NULL,
  `DescriptorValueCV` varchar(255) DEFAULT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`DescriptorValueID`),
  KEY `fk_DescriptorValues_CV_DescriptorValues` (`DescriptorValueCV`),
  KEY `fk_DescriptorValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_DescriptorValues_CV_DescriptorValues` FOREIGN KEY (`DescriptorValueCV`) REFERENCES `CV_DescriptorValues` (`Term`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DescriptorValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DualValues` (
  `DualValueID` int(11) NOT NULL AUTO_INCREMENT,
  `DualValue` tinyint(1) NOT NULL,
  `DualValueMeaningCV` varchar(255) NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`DualValueID`),
  KEY `fk_BooleanValues_CV_BooleanValueMeaning` (`DualValueMeaningCV`),
  KEY `fk_DualValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_BooleanValues_CV_BooleanValueMeaning` FOREIGN KEY (`DualValueMeaningCV`) REFERENCES `CV_DualValueMeaning` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DualValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ElectronicFiles` (
  `ElectronicFileID` int(11) NOT NULL AUTO_INCREMENT,
  `ElectronicFileName` varchar(255) NOT NULL,
  `ElectronicFile` blob NOT NULL,
  `ElectronicFileFormatCV` varchar(255) NOT NULL,
  `Description` text,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`ElectronicFileID`),
  KEY `fk_ElectronicFiles_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_Files_CV_FileFormat` (`ElectronicFileFormatCV`),
  CONSTRAINT `fk_ElectronicFiles_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Files_CV_FileFormat` FOREIGN KEY (`ElectronicFileFormatCV`) REFERENCES `CV_ElectronicFileFormat` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `InstanceCategories` (
  `InstanceCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `InstanceCategory` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`InstanceCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Instances` (
  `InstanceID` int(11) NOT NULL AUTO_INCREMENT,
  `InstanceName` varchar(255) NOT NULL,
  `InstanceNameCV` varchar(255) DEFAULT NULL,
  `Longitude_x` float DEFAULT NULL,
  `Latitude_y` float DEFAULT NULL,
  `Description` text,
  `InstanceCategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`InstanceID`),
  KEY `fk_Instances_CV_InstanceName` (`InstanceNameCV`),
  KEY `fk_Instances_InstanceCategory` (`InstanceCategoryID`),
  CONSTRAINT `fk_Instances_CV_InstanceName` FOREIGN KEY (`InstanceNameCV`) REFERENCES `CV_InstanceName` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instances_InstanceCategory` FOREIGN KEY (`InstanceCategoryID`) REFERENCES `InstanceCategories` (`InstanceCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Mappings` (
  `MappingID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeID` int(11) NOT NULL,
  `InstanceID` int(11) NOT NULL,
  `SourceID` int(11) NOT NULL,
  `MethodID` int(11) NOT NULL,
  `DataValuesMapperID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MappingID`),
  KEY `fk_Mapping_Attributes` (`AttributeID`),
  KEY `fk_Mapping_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_Mapping_Instances` (`InstanceID`),
  KEY `fk_Mapping_Methods` (`MethodID`),
  KEY `fk_Mapping_Sources` (`SourceID`),
  CONSTRAINT `fk_Mapping_Attributes` FOREIGN KEY (`AttributeID`) REFERENCES `Attributes` (`AttributeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Instances` FOREIGN KEY (`InstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Methods` FOREIGN KEY (`MethodID`) REFERENCES `Methods` (`MethodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Sources` FOREIGN KEY (`SourceID`) REFERENCES `Sources` (`SourceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `MasterNetworks` (
  `MasterNetworkID` int(11) NOT NULL AUTO_INCREMENT,
  `MasterNetworkName` varchar(255) NOT NULL,
  `SpatialReferenceNameCV` varchar(255) NOT NULL,
  `VerticalDatumCV` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`MasterNetworkID`),
  KEY `fk_MasterNetworks_CV_SpatialReference` (`SpatialReferenceNameCV`),
  KEY `fk_MasterNetworks_CV_VerticalDatum` (`VerticalDatumCV`),
  CONSTRAINT `fk_MasterNetworks_CV_SpatialReference` FOREIGN KEY (`SpatialReferenceNameCV`) REFERENCES `CV_SpatialReference` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MasterNetworks_CV_VerticalDatum` FOREIGN KEY (`VerticalDatumCV`) REFERENCES `CV_ElevationDatum` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Methods` (
  `MethodID` int(11) NOT NULL AUTO_INCREMENT,
  `MethodName` varchar(255) NOT NULL,
  `MethodWebpage` varchar(255) DEFAULT NULL,
  `MethodCitation` varchar(500) DEFAULT NULL,
  `MethodTypeCV` varchar(255) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`MethodID`),
  KEY `fk_Methods_CV_MethodType` (`MethodTypeCV`),
  KEY `fk_Methods_People` (`PersonID`),
  CONSTRAINT `fk_Methods_CV_MethodType` FOREIGN KEY (`MethodTypeCV`) REFERENCES `CV_MethodType` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Methods_People` FOREIGN KEY (`PersonID`) REFERENCES `People` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `MultiAttributeSeries` (
  `MultiAttributeSeriesID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeNameID` int(11) NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`MultiAttributeSeriesID`),
  KEY `fk_MultiAttributeSeries_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_MultiColumnArray_DataValuesMapper` (`AttributeNameID`),
  CONSTRAINT `fk_MultiAttributeSeries_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MultiColumnArray_DataValuesMapper` FOREIGN KEY (`AttributeNameID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `MultiAttributeSeriesValues` (
  `MultiAttributeSeriesValueID` int(11) NOT NULL AUTO_INCREMENT,
  `MultiAttributeSeriesID` int(11) NOT NULL,
  `Value` varchar(255) NOT NULL,
  `ValueOrder` int(11) NOT NULL,
  PRIMARY KEY (`MultiAttributeSeriesValueID`),
  KEY `fk_MultiAttributeSeriesValues_MultiAttributeSeries` (`MultiAttributeSeriesID`),
  CONSTRAINT `fk_MultiAttributeSeriesValues_MultiAttributeSeries` FOREIGN KEY (`MultiAttributeSeriesID`) REFERENCES `MultiAttributeSeries` (`MultiAttributeSeriesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `NumericValues` (
  `NumericValueID` int(11) NOT NULL AUTO_INCREMENT,
  `NumericValue` float NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`NumericValueID`),
  KEY `fk_NumericValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_NumericValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ObjectCategories` (
  `ObjectCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectCategoryName` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`ObjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ObjectTypes` (
  `ObjectTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectType` varchar(255) NOT NULL,
  `ObjectTypeCV` varchar(255) DEFAULT NULL,
  `ObjectTypologyCV` varchar(50) NOT NULL,
  `Icon` blob,
  `Description` text,
  `ObjectCategoryID` int(11) DEFAULT NULL,
  `DatasetID` int(11) NOT NULL,
  PRIMARY KEY (`ObjectTypeID`),
  KEY `fk_ObjectTypes_CV_ObjectTopology` (`ObjectTypologyCV`),
  KEY `fk_ObjectTypes_CV_ObjectTypes` (`ObjectTypeCV`),
  KEY `fk_ObjectTypes_Datasets` (`DatasetID`),
  KEY `fk_ObjectTypes_ObjectCategory` (`ObjectCategoryID`),
  CONSTRAINT `fk_ObjectTypes_CV_ObjectTopology` FOREIGN KEY (`ObjectTypologyCV`) REFERENCES `CV_ObjectTypology` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_CV_ObjectTypes` FOREIGN KEY (`ObjectTypeCV`) REFERENCES `CV_ObjectType` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_Datasets` FOREIGN KEY (`DatasetID`) REFERENCES `Datasets` (`DatasetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_ObjectCategory` FOREIGN KEY (`ObjectCategoryID`) REFERENCES `ObjectCategories` (`ObjectCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Organizations` (
  `OrganizationID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationName` varchar(255) NOT NULL,
  `OrganizationType` varchar(255) DEFAULT NULL,
  `OrganizationWebpage` varchar(255) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`OrganizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `People` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `PersonName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `PersonWebpage` varchar(255) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `OrganizationID` int(11) NOT NULL,
  PRIMARY KEY (`PersonID`),
  KEY `fk_People_Organizations` (`OrganizationID`),
  CONSTRAINT `fk_People_Organizations` FOREIGN KEY (`OrganizationID`) REFERENCES `Organizations` (`OrganizationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ScenarioMappings` (
  `ScenarioMappingID` int(11) NOT NULL AUTO_INCREMENT,
  `ScenarioID` int(11) NOT NULL,
  `MappingID` int(11) NOT NULL,
  PRIMARY KEY (`ScenarioMappingID`),
  KEY `fk_ScenarioMapping_Mapping` (`MappingID`),
  KEY `fk_ScenarioMapping_Scenarios` (`ScenarioID`),
  CONSTRAINT `fk_ScenarioMapping_Mapping` FOREIGN KEY (`MappingID`) REFERENCES `Mappings` (`MappingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ScenarioMapping_Scenarios` FOREIGN KEY (`ScenarioID`) REFERENCES `Scenarios` (`ScenarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Scenarios` (
  `ScenarioID` int(11) NOT NULL AUTO_INCREMENT,
  `ScenarioName` varchar(255) NOT NULL,
  `ScenarioStartDate` varchar(255) DEFAULT NULL,
  `ScenarioEndDate` datetime DEFAULT NULL,
  `TimeStepValue` int(11) DEFAULT NULL,
  `TimeStepUnitCV` varchar(255) DEFAULT NULL,
  `MasterNetworkID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ScenarioID`),
  KEY `fk_Scenarios_CV_Units` (`TimeStepUnitCV`),
  KEY `fk_Scenarios_MasterNetworks` (`MasterNetworkID`),
  CONSTRAINT `fk_Scenarios_CV_Units` FOREIGN KEY (`TimeStepUnitCV`) REFERENCES `CV_Units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Scenarios_MasterNetworks` FOREIGN KEY (`MasterNetworkID`) REFERENCES `MasterNetworks` (`MasterNetworkID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SeasonalNumericValues` (
  `SeasonalNumericValueID` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonName` varchar(255) NOT NULL,
  `SeasonOrder` int(11) NOT NULL,
  `SeasonNameCV` varchar(255) DEFAULT NULL,
  `SeasonNumericValue` float NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`SeasonalNumericValueID`),
  KEY `fk_SeasonalNumericValues_CV_SeasonName` (`SeasonNameCV`),
  KEY `fk_SeasonalNumericValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_SeasonalNumericValues_CV_SeasonName` FOREIGN KEY (`SeasonNameCV`) REFERENCES `CV_SeasonName` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SeasonalNumericValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Sources` (
  `SourceID` int(11) NOT NULL AUTO_INCREMENT,
  `SourceName` varchar(500) NOT NULL,
  `SourceWebpage` varchar(500) DEFAULT NULL,
  `SourceCitation` varchar(500) DEFAULT NULL,
  `PersonID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`SourceID`),
  KEY `fk_Sources_People` (`PersonID`),
  CONSTRAINT `fk_Sources_People` FOREIGN KEY (`PersonID`) REFERENCES `People` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TimeSeries` (
  `TimeSeriesID` int(11) NOT NULL AUTO_INCREMENT,
  `YearType` varchar(50) NOT NULL,
  `AggregationStatistiCV` varchar(255) NOT NULL,
  `AggregationInterval` double NOT NULL,
  `IntervalTimeUnitCV` varchar(255) NOT NULL,
  `BeginDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `IsRegular` tinyint(1) DEFAULT NULL,
  `NoDataValue` varchar(50) DEFAULT NULL,
  `Description` text,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`TimeSeriesID`),
  KEY `fk_TimeSeries_CV_AggregationStatistic` (`AggregationStatistiCV`),
  KEY `fk_TimeSeries_CV_Units` (`IntervalTimeUnitCV`),
  KEY `fk_TimeSeries_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_TimeSeries_CV_AggregationStatistic` FOREIGN KEY (`AggregationStatistiCV`) REFERENCES `CV_AggregationStatistic` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeSeries_CV_Units` FOREIGN KEY (`IntervalTimeUnitCV`) REFERENCES `CV_Units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeSeries_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TimeSeriesValues` (
  `TimeSeriesValueID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeSeriesID` int(11) NOT NULL,
  `DateTimeStamp` datetime NOT NULL,
  `Value` float NOT NULL,
  PRIMARY KEY (`TimeSeriesValueID`),
  KEY `fk_TimeSeriesValues_TimeSeries` (`TimeSeriesID`),
  CONSTRAINT `fk_TimeSeriesValues_TimeSeries` FOREIGN KEY (`TimeSeriesID`) REFERENCES `TimeSeries` (`TimeSeriesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `WaMDaMVersion` (
  `VersionNumber` decimal(2,0) NOT NULL,
  PRIMARY KEY (`VersionNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

