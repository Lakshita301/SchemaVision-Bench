-- Source: https://github.com/sravanthi657/Department-Store-DBMS/blob/61a3afee2139bee79600c7f8f57c2693a8efe8b7/billing.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 30
create table ADMIN(
    Admin_ID INT NOT NULL,
    Date_On DATE NOT NULL,
    Time_at TIME  NOT NULL,
    Reported_Admin_ID INT NOT NULL,
    CONSTRAINT KEEY PRIMARY KEY (Admin_ID,Date_On),
    CONSTRAINT master FOREIGN KEY (Reported_Admin_ID) REFERENCES ADMIN(Admin_ID)
);

create table CUSTOMER(
    First_Name varchar(30) NOT NULL,
    Last_Name varchar(30) NOT NULL,
    Email_ID varchar(60) NOT NULL,
    Mobile_Number bigint NOT NULL,
    Admin_Assisstance_Feedback ENUM('0','1','2','3','4','5') DEFAULT '5',
    CONSTRAINT ch CHECK((Admin_Assisstance_Feedback)>=0 AND (Admin_Assisstance_Feedback)<=5),
    Date_of_Birth DATE NOT NULL,
    Admin_ID INT NOT NULL,
    PRIMARY KEY (Mobile_Number),
    FOREIGN KEY (Admin_ID) REFERENCES ADMIN(Admin_ID),
    UNIQUE (Email_ID)
);

create table MEMBER(
    Mobile_Number bigint NOT NULL,
    Membership_ID int NOT NULL DEFAULT 0,
    CONSTRAINT mem_key PRIMARY KEY (Mobile_Number,Membership_ID),
    FOREIGN KEY (Mobile_Number) REFERENCES CUSTOMER(Mobile_Number),
    UNIQUE(Membership_ID)
);

create table NON_MEMBER(
    Mobile_Number bigint NOT NULL,
    Points_Redeemed int NOT NULL DEFAULT 0,
    Points_Active int NOT NULL DEFAULT 0,
    PRIMARY KEY (Mobile_Number),
    FOREIGN KEY (Mobile_Number) REFERENCES CUSTOMER(Mobile_Number)
);

create table MEMBERSHIP(
    Membership_ID int NOT NULL,
    Points_Redeemed int NOT NULL DEFAULT 0,
    Membership_Points int NOT NULL DEFAULT 0,
    PRIMARY KEY (Membership_ID),
    FOREIGN KEY (Membership_ID) REFERENCES MEMBER(Membership_ID)
);

create table PRODUCT(
    Product_ID int NOT NULL,
    Price_per_Unit int unsigned DEFAULT 0,
    Unit ENUM('litres','kilograms','dozens', 'units'),
    Admin_ID int NOT NULL,
    UNIQUE(Product_ID),
    PRIMARY KEY (Product_ID),
    FOREIGN KEY (Admin_ID) REFERENCES ADMIN(Admin_ID)
);

create table PAYMENT(
    Customer_Mobile bigint NOT NULL,
    Payment_ID int NOT NULL,
    Mode_of_Payment ENUM('Cash','Debit Card','Credit Card','UPI') NOT NULL,
    Amount_Paid int NOT NULL,
    Balance int DEFAULT 0,
    UNIQUE(Payment_ID),
    CONSTRAINT pay_key PRIMARY KEY (Customer_Mobile,Payment_ID),
    FOREIGN KEY (Customer_Mobile) REFERENCES CUSTOMER(Mobile_Number)
);

create table SALE(
    Customer_Mobile bigint NOT NULL,
    SALE_ID int NOT NULL,
    Amount int NOT NULL,
    Payment_ID int NOT NULL,
    UNIQUE(Sale_ID),
    CONSTRAINT sale_key PRIMARY KEY (Customer_Mobile,Sale_ID),
    FOREIGN KEY (Customer_Mobile) REFERENCES CUSTOMER(Mobile_Number),
    FOREIGN KEY (Payment_ID) REFERENCES PAYMENT(Payment_ID)
);

create table PRODUCTS_OF_SALE(
    Customer_Mobile bigint NOT NULL,
    SALE_ID int NOT NULL,
    Sale_Products varchar(30) NOT NULL,
    CONSTRAINT ps_key PRIMARY KEY (Customer_Mobile,Sale_ID,Sale_Products),
    FOREIGN KEY (Customer_Mobile) REFERENCES CUSTOMER(Mobile_Number),
    FOREIGN KEY (Sale_ID) REFERENCES SALE(Sale_ID)
);

create table BILL(
    Customer_Mobile bigint NOT NULL,
    SALE_ID int NOT NULL,
    Admin_ID int NOT NULL,
    Product_ID int NOT NULL,
    CONSTRAINT bill_key PRIMARY KEY (Customer_Mobile,Sale_ID,Admin_ID,Product_ID),
    FOREIGN KEY (Admin_ID) REFERENCES ADMIN(Admin_ID),
    FOREIGN KEY (Customer_Mobile) REFERENCES CUSTOMER(Mobile_Number),
    FOREIGN KEY (Sale_ID) REFERENCES SALE(Sale_ID),
    FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)
);
