-- Source: https://github.com/SONAM-2020/DCSI_technology/blob/59c3e285fa5f17fe21c7e903817bd7b809f9ab42/csitechnology_db.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 5

CREATE TABLE `t_category_master` (
  `Id` int(11) NOT NULL auto_increment,
  `Category_Name` varchar(200) NOT NULL,
  `Description` text,
  `Image` varchar(200) default NULL,
  `Status` enum('Active','InActive') NOT NULL default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `t_company_details` (
  `Id` int(11) NOT NULL auto_increment,
  `Name` varchar(255) NOT NULL,
  `Contact_Number` varchar(200) default NULL,
  `Email_Address` varchar(200) default NULL,
  `Location_Address` varchar(200) default NULL,
  `Fackbook_Link` varchar(200) default NULL,
  `Twitter_Link` varchar(200) default NULL,
  `Youtube_Link` varchar(200) default NULL,
  `Googleplus_Link` varchar(200) default NULL,
  `Logo` varchar(255) default NULL,
  `Company_Description` text,
  `status` enum('Active','InActive') default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `t_country_master` (
  `Id` int(11) NOT NULL auto_increment,
  `Country_Name` varchar(200) NOT NULL,
  `Status` enum('Active','inActive') NOT NULL default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;

CREATE TABLE `t_image_slider` (
  `Id` int(11) NOT NULL auto_increment,
  `Image` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Links` varchar(255) default NULL,
  `Status` enum('Active','InActive') NOT NULL default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

CREATE TABLE `t_mail_template` (
  `Template_Id` bigint(11) NOT NULL auto_increment,
  `Template_Subject` varchar(250) default NULL,
  `Template_Module` varchar(250) default NULL,
  `Template_Mail_Body` text,
  PRIMARY KEY  (`Template_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `t_news_announcement` (
  `Id` int(20) NOT NULL auto_increment,
  `News_title` text,
  `Description` text,
  `Image` blob,
  `Post_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Status` enum('Active','InActive') default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `t_order_details` (
  `Id` int(11) NOT NULL auto_increment,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Contact_No` varchar(100) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Submitted_Date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `t_partner_details` (
  `Id` int(11) NOT NULL auto_increment,
  `Name` varchar(200) default NULL,
  `Image` varchar(255) default NULL,
  `Description` text,
  `status` enum('Active','InActive') default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `t_product_images` (
  `Id` int(11) NOT NULL auto_increment,
  `Image_Name` varchar(200) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_t_product_images_mappng` (`Product_Id`),
  CONSTRAINT `FK_t_product_images_mappng` FOREIGN KEY (`Product_Id`) REFERENCES `t_products_master` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

CREATE TABLE `t_products_master` (
  `Id` int(50) NOT NULL auto_increment,
  `Product_Name` varchar(255) NOT NULL,
  `Category_Id` int(11) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Price` varchar(255) NOT NULL,
  `Model_No` varchar(255) default NULL,
  `Description` text,
  `Last_Updated_Date` datetime NOT NULL,
  `Status` enum('Active','InActive') NOT NULL default 'Active',
  PRIMARY KEY  (`Id`),
  KEY `FK_t_products_category_mapping` (`Category_Id`),
  CONSTRAINT `FK_t_products_category_mapping` FOREIGN KEY (`Category_Id`) REFERENCES `t_category_master` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `t_request_equipment_details` (
  `Id` int(11) NOT NULL auto_increment,
  `Equipment_Name` varchar(200) NOT NULL,
  `Description` text,
  `Quantity` int(11) default NULL,
  `Estimated_Price` varchar(100) default NULL,
  `Request_Personal_Id` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `t_request_personal_details` (
  `Id` int(11) NOT NULL auto_increment,
  `Name` varchar(200) NOT NULL,
  `Address` text NOT NULL,
  `Contact_No` varchar(100) NOT NULL,
  `Email` varchar(200) default NULL,
  `Submission_Date` datetime default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `t_role_master` (
  `Id` int(11) NOT NULL auto_increment,
  `Role_Name` varchar(100) NOT NULL,
  `Status` enum('Active','InActive') NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `t_status_master` (
  `Id` int(11) NOT NULL auto_increment,
  `Status_Name` varchar(200) NOT NULL,
  `Status` enum('Active','InActive') NOT NULL default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `t_supplier_company` (
  `Id` int(11) NOT NULL auto_increment,
  `Supplier_Type_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Company_Name` varchar(255) NOT NULL,
  `Country_Id` int(11) default NULL,
  `City` varchar(255) default NULL,
  `Postal_Code` varchar(255) default NULL,
  `License_No` varchar(255) default NULL,
  `License_Img` blob,
  `Telephone_No` varchar(255) default NULL,
  `License_Registration_Date` date default NULL,
  `Company_Address` text,
  `Company_Description` text,
  `Company_Website` varchar(200) default NULL,
  `Submitted_Date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Update_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `Updated_By` int(11) default NULL,
  `Remarks` text,
  `Status_Id` int(11) NOT NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_t_supplier_status_mapping` (`Status_Id`),
  KEY `FK_t_supplier_company` (`Country_Id`),
  CONSTRAINT `FK_t_supplier_company` FOREIGN KEY (`Country_Id`) REFERENCES `t_country_master` (`Id`),
  CONSTRAINT `FK_t_supplier_status_mapping` FOREIGN KEY (`Status_Id`) REFERENCES `t_status_master` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `t_supplier_type` (
  `Id` int(11) NOT NULL auto_increment,
  `Supplier_Type` varchar(200) NOT NULL,
  `Status` enum('Active','InActive') NOT NULL default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `t_technology_request` (
  `Id` int(11) NOT NULL auto_increment,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(200) default NULL,
  `Contact_No` varchar(200) default NULL,
  `Present_Address` text,
  `Equipment_Name` varchar(255) default NULL,
  `Equipment_Description` text,
  `Submitted_Date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Response` text,
  `Status` enum('Active','InActive') default 'Active',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `t_user_master` (
  `Id` int(50) NOT NULL auto_increment,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Image` tinyblob,
  `Contact_No` varchar(8) NOT NULL,
  `Designation` varchar(200) default NULL,
  `Role_Id` int(11) NOT NULL,
  `Status` enum('Active','InActive') NOT NULL default 'Active',
  PRIMARY KEY  (`Id`),
  KEY `FK_t_user_role_mapping` (`Role_Id`),
  CONSTRAINT `FK_t_user_role_mapping` FOREIGN KEY (`Role_Id`) REFERENCES `t_role_master` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

