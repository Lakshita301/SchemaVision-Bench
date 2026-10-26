-- Source: https://github.com/210104-msbi-reston/Dmitrii-Lutcenko-P1/blob/4c3b0f202c375a75036f3ae1e3285253d1d2a5ad/CreateDB.sql?raw=true
-- Tables detected: 17 | FK/REFERENCES mentions: 40

CREATE TABLE ZoneType (
    id INT IDENTITY(1,1) PRIMARY KEY,	
	[name] VARCHAR(255) NOT NULL
);

CREATE TABLE [Zone] (
    id INT IDENTITY(1,1) PRIMARY KEY,	
	[name] VARCHAR(255) NOT NULL,
	zone_type_id INT NOT NULL,
	FOREIGN KEY (zone_type_id) REFERENCES ZoneType
);

CREATE TABLE ProductionHouse (
    id INT IDENTITY(1,1) PRIMARY KEY,	
    [name] VARCHAR(255) NOT NULL,
	zone_id INT NOT NULL,
	FOREIGN KEY (zone_id) REFERENCES [Zone]
);

CREATE TABLE Warehouse (
    id INT IDENTITY(1,1) PRIMARY KEY,	
    [name] VARCHAR(255) NOT NULL,
	zone_id INT NOT NULL,
	FOREIGN KEY (zone_id) REFERENCES [Zone]
);

CREATE TABLE VendorType (
    id INT IDENTITY(1,1) PRIMARY KEY,
	[name] VARCHAR(255) NOT NULL,
);

CREATE TABLE Vendor (
    id INT IDENTITY(1,1) PRIMARY KEY,	
    [name] VARCHAR(255) NOT NULL,
	zone_id INT NOT NULL,
	vendor_type_id INT,
	FOREIGN KEY (zone_id) REFERENCES [Zone],
	FOREIGN KEY (vendor_type_id) REFERENCES VendorType
);

CREATE TABLE Model (
    id INT IDENTITY(1,1) PRIMARY KEY,
	[name] VARCHAR(255) NOT NULL, 
);

CREATE TABLE Product (
    id INT IDENTITY(1,1) PRIMARY KEY,	
	serial_number VARCHAR(50) NOT NULL UNIQUE,
	model_id INT,
	FOREIGN KEY (model_id) REFERENCES Model	
);

CREATE TABLE WarehouseStock (
    id INT IDENTITY(1,1) PRIMARY KEY,
	product_id INT NOT NULL,
	price MONEY NOT NULL,
	warehouse_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES Product,	
	FOREIGN KEY (warehouse_id) REFERENCES Warehouse
);

CREATE TABLE VendorStock (
    id INT IDENTITY(1,1) PRIMARY KEY,   
	price MONEY NOT NULL,									
	product_id INT NOT NULL,
	vendor_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES Product,	
	FOREIGN KEY (vendor_id) REFERENCES Vendor
);

CREATE TABLE Customer (
    id INT IDENTITY(1,1) PRIMARY KEY,	
    [name] VARCHAR(255)	
);

CREATE TABLE DeliveryOrder (
    id INT IDENTITY(1,1) PRIMARY KEY,
	date_time DATETIME,
	production_house_id INT,
	warehouse_id INT,
	FOREIGN KEY (production_house_id) REFERENCES ProductionHouse,
	FOREIGN KEY (warehouse_id) REFERENCES Warehouse
);

CREATE TABLE DeliveryOrderLine (
    id INT IDENTITY(1,1) PRIMARY KEY,
	product_id INT NOT NULL,
	price MONEY NOT NULL,
	delivery_order_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES Product,
	FOREIGN KEY (delivery_order_id) REFERENCES DeliveryOrder
);

CREATE TABLE VendorOrder (
    id INT IDENTITY(1,1) PRIMARY KEY,
	from_vendor_id INT,
	to_vendor_id INT,
	date_time datetime,	
	FOREIGN KEY (from_vendor_id) REFERENCES Vendor,
	FOREIGN KEY (to_vendor_id) REFERENCES Vendor
);

CREATE TABLE VendorOrderLine (
    id INT IDENTITY(1,1) PRIMARY KEY,	
    product_id INT NOT NULL,	
	price MONEY NOT NULL,
	vendor_order_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES Product,
	FOREIGN KEY (vendor_order_id) REFERENCES VendorOrder	
);

CREATE TABLE [Order] (
    id INT IDENTITY(1,1) PRIMARY KEY,
	vendor_id INT,
	customer_id INT,
	date_time datetime,
	FOREIGN KEY (vendor_id) REFERENCES Vendor,
	FOREIGN KEY (customer_id) REFERENCES Customer
);

CREATE TABLE OrderLine (
    id INT IDENTITY(1,1) PRIMARY KEY,	
    product_id INT NOT NULL,
	price MONEY NOT NULL,
	order_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES Product,
	FOREIGN KEY (order_id) REFERENCES [Order]
);

