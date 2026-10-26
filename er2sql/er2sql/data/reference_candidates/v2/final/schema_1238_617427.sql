-- Source: https://github.com/lomahs/A0121I1---BuiThanhBao/blob/e46ae96358718b7ff51f45b29e1cfba4a1698a62/Module%203/3.%20Thao%20t%C3%A1c%20v%E1%BB%9Bi%20CSDL/Th%E1%BB%B1c%20h%C3%A0nh/Truy%20v%E1%BA%A5n%20d%E1%BB%AF%20li%E1%BB%87u%20t%E1%BB%AB%20nhi%E1%BB%81u%20b%E1%BA%A3ng/car_shop_management.sql?raw=true
-- Tables detected: 7 | FK constraints: 6
CREATE TABLE "Customer" (
    "cusNumber" int NOT NULL,
    "cusName" varchar(50) NOT NULL,
    "contactLastName" varchar(50) NOT NULL,
    "contactFirstName" varchar(50) NOT NULL,
    "phone" varchar(50) NOT NULL,
    "addressLine1" varchar(50) NOT NULL,
    "addressLine2" varchar(50) DEFAULT NULL,
    "city" varchar(50) NOT NULL,
    "state" varchar(50) NOT NULL,
    "postalCode" varchar(15) NOT NULL,
    "country" varchar(50) NOT NULL,
    "creditLimit" DOUBLE PRECISION DEFAULT NULL,
    "salesRepEmployeeNumber" int NOT NULL,
    PRIMARY KEY ("cusNumber"),
    KEY "salesRepEmployeeNumber" ("salesRepEmployeeNumber"),
    CONSTRAINT "customer_ibfk_1" FOREIGN KEY ("salesRepEmployeeNumber") REFERENCES "Employee" ("employeeNumber")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "Employee" (
    "employeeNumber" int NOT NULL,
    "lastName" varchar(50) NOT NULL,
    "firstName" varchar(50) NOT NULL,
    "email" varchar(100) NOT NULL,
    "jobTitle" varchar(50) NOT NULL,
    "reportTo" int NOT NULL,
    "officeCode" varchar(10) NOT NULL,
    PRIMARY KEY ("employeeNumber"),
    KEY "reportTo" ("reportTo"),
    KEY "officeCode" ("officeCode"),
    CONSTRAINT "employee_ibfk_1" FOREIGN KEY ("reportTo") REFERENCES "Employee" ("employeeNumber"),
    CONSTRAINT "employee_ibfk_2" FOREIGN KEY ("officeCode") REFERENCES "Office" ("officeCode")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "Office" (
    "officeCode" varchar(10) NOT NULL,
    "city" varchar(50) NOT NULL,
    "phone" varchar(50) NOT NULL,
    "addressLine1" varchar(50) NOT NULL,
    "addressLine2" varchar(50) DEFAULT NULL,
    "state" varchar(50) DEFAULT NULL,
    "country" varchar(50) NOT NULL,
    "postalCode" varchar(15) NOT NULL,
    PRIMARY KEY ("officeCode")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "Order" (
    "orderNumber" int NOT NULL,
    "orderDate" date NOT NULL,
    "requiredDate" date NOT NULL,
    "shippedDate" date DEFAULT NULL,
    "status" varchar(15) NOT NULL,
    "comments" text,
    "quantityOrdered" int NOT NULL,
    "priceEach" DOUBLE PRECISION NOT NULL,
    "cusNumber" int NOT NULL,
    PRIMARY KEY ("orderNumber"),
    KEY "Order" ("cusNumber"),
    CONSTRAINT "order_ibfk_1" FOREIGN KEY ("cusNumber") REFERENCES "Customer" ("cusNumber")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "Payment" (
    "cusNumber" int NOT NULL,
    "checkNumber" varchar(50) NOT NULL,
    "paymentDate" date NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    KEY "cusNumber" ("cusNumber"),
    CONSTRAINT "payment_ibfk_1" FOREIGN KEY ("cusNumber") REFERENCES "Customer" ("cusNumber")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "Product" (
    "productCode" varchar(15) NOT NULL,
    "productName" varchar(70) NOT NULL,
    "productScale" varchar(10) NOT NULL,
    "productLine" varchar(50) NOT NULL,
    "productVendor" varchar(50) NOT NULL,
    "productDescription" text NOT NULL,
    "quantityInStock" int NOT NULL,
    "buyPrice" DOUBLE PRECISION NOT NULL,
    "MSRP" DOUBLE PRECISION NOT NULL,
    PRIMARY KEY ("productCode"),
    KEY "productLine" ("productLine"),
    CONSTRAINT "product_ibfk_1" FOREIGN KEY ("productLine") REFERENCES "ProductLine" ("productLine")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "ProductLine" (
    "productLine" varchar(50) NOT NULL,
    "textDescription" text,
    "image" text,
    PRIMARY KEY ("productLine")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
