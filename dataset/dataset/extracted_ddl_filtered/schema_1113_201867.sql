-- Source: https://github.com/Hunter3787/Saturday-Solution/blob/4a1938a6fbcb3a98363f201b3b3d526a6db211e2/Documents/Design%20Documents/Diagrams/Entity%20Relation%20Diagrams/Product%20ER/AutobuildProductSQL.sql?raw=true
-- Tables detected: 6 | FK constraints: 5

CREATE TABLE Products(
  
 productID BIGINT NOT NULL,
 productType varchar(20),
 productName varchar(20),
 manufacturerName varchar(20),
 
  CONSTRAINT Products_PK PRIMARY KEY(productID)
 
 
 );

CREATE TABLE VendorClub(

  vendorID BIGINT NOT NULL IDENTITY(0,2),
  vendorName varchar(20),
  createdAt DATETIME,
  CONSTRAINT vendorClub_PK PRIMARY KEY(vendorID)
 );

CREATE TABLE userAccounts(

 userID BIGINT NOT NULL IDENTITY(0,2),
 vendorID BIGINT,
 email varchar(30),
 firstName varchar(20),
 lastName varchar(20),
 createdAt DATETIME,
 modifiedAt DATETIME,
 modifiedBy DATETIME,
-- primary key
CONSTRAINT userAccounts_PK PRIMARY KEY(userID),
CONSTRAINT userAccounts_CK UNIQUE(email),
CONSTRAINT	userAcccount_Vendor_FK FOREIGN KEY
(vendorID) REFERENCES VendorClub(vendorID),

 );

CREATE TABLE Vendor_Product_Junction(

 productVendorID BIGINT NOT NULL IDENTITY(0,2),
 vendorID BIGINT NOT NULL,
 productID BIGINT NOT NULL,
 VendorLinkURL varchar(40),
 productStatus varchar(40) CHECK (productStatus IN ('AVAILABLE', 'NOT AVAILABLE')),
 productDescription varchar(40),
 productPrice float,

 CONSTRAINT Vendor_Product_PK PRIMARY KEY(productVendorID),
 
CONSTRAINT	Vendor_Product_Vendor_FK FOREIGN KEY
(vendorID) REFERENCES VendorClub(vendorID),

CONSTRAINT	Vendor_Product_Product_FK FOREIGN KEY
(productID) REFERENCES Products(productID),

 CONSTRAINT Vendor_Product_CK UNIQUE(productID, vendorID)
 );

CREATE TABLE Products_Specs(

 product_spec_ID BIGINT NOT NULL,
 productID BIGINT NOT NULL,
 productSpecs varchar(20) NOT NULL,
 prductSpecValue varchar(20) NOT NULL,
 CONSTRAINT Products_SpecS_CK UNIQUE(productSpecs, prductSpecValue),

 
CONSTRAINT	products_specs_FK FOREIGN KEY
(productID) REFERENCES Products(productID)

 )




 CREATE TABLE Products_modelNumber
 (
 productID BIGINT NOT NULL IDENTITY(0,1),
 modelNumber varchar(20),

 CONSTRAINT products_modelNumber_PK PRIMARY KEY (modelNumber),
 
CONSTRAINT	products_modelNumber_FK FOREIGN KEY
(productID) REFERENCES Products(productID)

 );

