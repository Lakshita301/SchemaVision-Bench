-- Source: https://github.com/mafulong/databaseExper-hotelMaster/blob/b1c1afe6cb4443edd38715d2b1c81b2d201a84c2/%E6%95%B0%E6%8D%AE%E5%BA%93%E4%BB%A3%E7%A0%81/hotelCreateDB.sql?raw=true
-- Tables detected: 9 | FK constraints: 7

CREATE TABLE systemAdministrator
(
	# 用户ID
	userID varchar(10), # varchar 
	# 用户名
	userName VARCHAR(32) NOT NULL,
	# 登录密码
	userPassword VARCHAR(32) NOT NULL,
	# 主键
	PRIMARY KEY (userID)
) ENGINE=InnoDB;

CREATE TABLE waiter
(
	# 工号
	waiterID varchar(10), #varchar
	# 姓名
	waiterName VARCHAR(32) NOT NULL,
	# 出生日期
	waiterBirthday DATE NOT NULL,
	# 身份证
	waiterIDCard CHAR(18) NOT NULL UNIQUE,
	# 系统登录密码
	waiterPassword VARCHAR(32) NOT NULL,
	# 入职日期
	waiterJoinDate DATE NOT NULL,
	# 手机
	waiterPhoneNumber CHAR(11) UNIQUE,
	# 备注
	remarks VARCHAR(32),
	# 主键
	PRIMARY KEY (waiterID)
) ENGINE=InnoDB;

CREATE TABLE VIPLevel
(
	# 会员等级（主码）
	level smallint,  # smallint  LV 1-10
	# 享受折扣
	discount decimal(10,2) unsigned,
	# 等级对应消费金额
	totalAmount bigint, # bigint
	# 备注
	remarks VARCHAR(32),
	# 主键
	PRIMARY KEY (level)
) ENGINE=InnoDB;

CREATE TABLE roomTypeAndPrice
(
	# 房间类型（主码）
	roomType VARCHAR(32),
	# 价格
	price INT UNSIGNED NOT NULL,
	
	`desc` VARCHAR(100),
	url varchar(40),
	# 主键
	PRIMARY KEY (roomType)

) ENGINE=InnoDB;

CREATE TABLE customers
(
	# 顾客身份证
	customerIDCard CHAR(18),
	# 性别
	customerGender CHAR(4) check (customerGender ='男' or customerGender='女'),  # 限制 男或女  
	# 姓名
	customerName VARCHAR(16) NOT NULL,  
	# 出生日期
	customerBirthday DATE, 
	# 会员等级
	customerVIPLevel smallint, # 改成 smallint 
	# 手机号码
	customerPhoneNumber CHAR(11) , 
	# 消费金额
	totalAmount INT UNSIGNED,  
	# 备注
	remarks VARCHAR(32),  
	# 主键
	PRIMARY KEY (customerIDCard),
	# 外键
	FOREIGN KEY (customerVIPLevel) REFERENCES VIPLevel(level)

) ENGINE=InnoDB;

CREATE TABLE room
(
	# 房间号（主码）
	roomNumber CHAR(6),
	# 房间类型
	roomType VARCHAR(32) NOT NULL,
	# 状态
	roomStatus CHAR(6) check (roomStatus='空' or roomStatus='非空'), # 空/非空 
	# 备注
	remarks VARCHAR(32),
	# 主键
	PRIMARY KEY (roomNumber),
	# 外键
	FOREIGN KEY (roomType) REFERENCES roomTypeAndPrice(roomType)
	
) ENGINE=InnoDB;

CREATE TABLE orders
(
	# 订单号
	orderNumber CHAR(32) NOT NULL  , 
	# 订单状态
	orderStatus CHAR(18) check (value in ('预订中','已入住','已退房')) ,
	# 客户身份证
	customerIDCard CHAR(18),
	# 入住房间号
	roomNumber CHAR(6) NOT NULL,
	# 入住时间
	checkInTime DATE NOT NULL,
	# 离店时间
	checkOutTime DATE NOT NULL,
	# 需付金额(由于可能续费，不能作为外键)
	totalMoney INT UNSIGNED NOT NULL,
	# 服务员工号
	waiterID VARCHAR(10) NOT NULL,
	# 备注
	remarks VARCHAR(32),
	orderTime DATE NOT NULL,
	# 主键
	PRIMARY KEY (orderNumber),
	# 外键
	FOREIGN KEY (customerIDCard) REFERENCES customers(customerIDCard),

	FOREIGN KEY (roomNumber) REFERENCES room(roomNumber),

	FOREIGN KEY (waiterID) REFERENCES waiter(waiterID)

) ENGINE=InnoDB;

CREATE TABLE orderTracking
(
	# 订单号
	orderNumber CHAR(32),
	# 预定时间（订单表中一旦有预定订单加入，那么本表新增一条记录，本字段不可能为空）
	orderTime DATE NOT NULL,
	# 实际入住时间
	checkInTime DATE,
	# 实际退房时间
	checkOutTime DATE,
	# 备注
	remarks VARCHAR(32),
	# 主键
	PRIMARY KEY (orderNumber),
	# 同时作为外键
	FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)

) ENGINE=InnoDB;

CREATE TABLE timeExtension    
(
	# 操作记录号
	operatingID INT UNSIGNED AUTO_INCREMENT,
	# 操作的订单号(是记录中的订单号，外码，参照订单表)
	orderNumber CHAR(32),
	# 住房原到期日期
	oldExpiryDate DATE NOT NULL,
	# 住房新到期日期
	newExpiryDate DATE NOT NULL,
	# 需要添加的金额
	addedMoney INT UNSIGNED NOT NULL,
	# 主键
	PRIMARY KEY (operatingID),
	# 外键
	FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)

) ENGINE=InnoDB;

