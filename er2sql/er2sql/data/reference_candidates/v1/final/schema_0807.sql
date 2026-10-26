-- Source: https://github.com/raymunkohli/AbsoluteConsultancy/blob/57423261d92eba605d882742015c836f2afc7937/implementation/sqlBackups/2017-12-23%2020-49.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 16
CREATE TABLE "band" (
    "BandID" int NOT NULL AUTO_INCREMENT,
    "lowerBound" DOUBLE PRECISION NOT NULL,
    "upperBound" DOUBLE PRECISION NOT NULL,
    "discount" DOUBLE PRECISION NOT NULL,
    "flexiblediscount_DiscountdiscountID" int NOT NULL,
    PRIMARY KEY ("BandID"),
    KEY "fk_band_flexiblediscount1_idx" ("flexiblediscount_DiscountdiscountID"),
    CONSTRAINT "fk_band_flexiblediscount1" FOREIGN KEY ("flexiblediscount_DiscountdiscountID") REFERENCES "flexiblediscount" ("DiscountdiscountID") ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE "basetask" (
    "taskName" varchar(255) NOT NULL,
    "department" varchar(255) NOT NULL,
    "description" varchar(255) NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "baseTaskID" int NOT NULL AUTO_INCREMENT,
    "duration" int NOT NULL DEFAULT '0',
    "disabled" varchar(45) NOT NULL DEFAULT '0',
    PRIMARY KEY ("baseTaskID")
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE "cardpayment" (
    "PaymentJobJobID" int NOT NULL,
    "cardNo" int NOT NULL,
    "expDate" varchar(5) NOT NULL,
    "type" varchar(30) NOT NULL,
    PRIMARY KEY ("PaymentJobJobID"),
    KEY "FKcardPaymen338903" ("PaymentJobJobID"),
    CONSTRAINT "FKcardPaymen338903" FOREIGN KEY ("PaymentJobJobID") REFERENCES "payment" ("JobJobID")
);

CREATE TABLE "customer" (
    "customerID" int NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    "surname" varchar(255) NOT NULL,
    "phoneNo" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "address" varchar(255) NOT NULL,
    "postcode" varchar(255) NOT NULL,
    "holder" varchar(45) NOT NULL,
    PRIMARY KEY ("customerID")
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE "defaultcustomer" (
    "suspendedCustomerValuedCustomerCustomercustomerID" int NOT NULL,
    "alert" varchar(45) NOT NULL DEFAULT '0',
    "paid" varchar(45) NOT NULL DEFAULT '0',
    PRIMARY KEY ("suspendedCustomerValuedCustomerCustomercustomerID"),
    KEY "FKdefaultCus575149" ("suspendedCustomerValuedCustomerCustomercustomerID"),
    CONSTRAINT "FKdefaultCus575149" FOREIGN KEY ("suspendedCustomerValuedCustomerCustomercustomerID") REFERENCES "suspendedcustomer" ("ValuedCustomerCustomercustomerID")
);

CREATE TABLE "discount" (
    "discountID" int NOT NULL AUTO_INCREMENT,
    "discountType" varchar(255) NOT NULL,
    PRIMARY KEY ("discountID")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE "enquire" (
    "TasktaskID" int NOT NULL,
    "enquireNumber" int NOT NULL,
    "information" varchar(255) NOT NULL,
    PRIMARY KEY ("TasktaskID","enquireNumber"),
    KEY "FKenquire217603" ("TasktaskID"),
    CONSTRAINT "FKenquire217603" FOREIGN KEY ("TasktaskID") REFERENCES "task" ("taskID")
);

CREATE TABLE "fixeddiscount" (
    "DiscountdiscountID" int NOT NULL,
    "percentDiscount" int DEFAULT NULL,
    PRIMARY KEY ("DiscountdiscountID"),
    KEY "FKFixedDisco316205" ("DiscountdiscountID"),
    CONSTRAINT "FKFixedDisco316205" FOREIGN KEY ("DiscountdiscountID") REFERENCES "discount" ("discountID")
);

CREATE TABLE "flexiblediscount" (
    "DiscountdiscountID" int NOT NULL,
    "aquiredValue" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("DiscountdiscountID"),
    KEY "FKflexibleDi276331" ("DiscountdiscountID"),
    CONSTRAINT "FKflexibleDi276331" FOREIGN KEY ("DiscountdiscountID") REFERENCES "discount" ("discountID")
);

CREATE TABLE "job" (
    "JobID" int NOT NULL AUTO_INCREMENT,
    "CustomercustomerID" int NOT NULL,
    "orderDate" TIMESTAMP NOT NULL,
    "collectionDate" TIMESTAMP DEFAULT NULL,
    "specInstructions" varchar(255) NOT NULL,
    "deadline" TIMESTAMP NOT NULL,
    "value" decimal(10,2) NOT NULL,
    "finished" SMALLINT DEFAULT '0',
    "surcharge" varchar(45) NOT NULL,
    "alert" SMALLINT DEFAULT '0',
    "deadlineExceed" SMALLINT DEFAULT '0',
    "number" int DEFAULT '1',
    "started" varchar(45) NOT NULL DEFAULT '0',
    PRIMARY KEY ("JobID"),
    KEY "FKJob102033" ("CustomercustomerID"),
    CONSTRAINT "FKJob102033" FOREIGN KEY ("CustomercustomerID") REFERENCES "customer" ("customerID")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE "payment" (
    "JobJobID" int NOT NULL,
    "paymentDate" date NOT NULL,
    PRIMARY KEY ("JobJobID"),
    KEY "FKPayment170102" ("JobJobID"),
    CONSTRAINT "FKPayment170102" FOREIGN KEY ("JobJobID") REFERENCES "job" ("JobID")
);

CREATE TABLE "staff" (
    "staffID" int NOT NULL AUTO_INCREMENT,
    "firstName" varchar(255) NOT NULL,
    "surName" varchar(255) NOT NULL,
    "employeeType" varchar(255) NOT NULL,
    "password" varchar(45) NOT NULL,
    PRIMARY KEY ("staffID")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE "suspendedcustomer" (
    "ValuedCustomerCustomercustomerID" int NOT NULL,
    "alert" varchar(45) NOT NULL DEFAULT '0',
    PRIMARY KEY ("ValuedCustomerCustomercustomerID"),
    KEY "FKsuspendedC671399" ("ValuedCustomerCustomercustomerID"),
    CONSTRAINT "FKsuspendedC671399" FOREIGN KEY ("ValuedCustomerCustomercustomerID") REFERENCES "valuedcustomer" ("CustomercustomerID")
);

CREATE TABLE "task" (
    "taskID" int NOT NULL AUTO_INCREMENT,
    "shelf" varchar(10) DEFAULT NULL,
    "startDate" TIMESTAMP DEFAULT NULL,
    "endDate" TIMESTAMP DEFAULT NULL,
    "StaffstaffID" int DEFAULT NULL,
    "JobJobID" int NOT NULL,
    "baseTaskbaseTaskID" int NOT NULL,
    PRIMARY KEY ("taskID"),
    KEY "FKTask954031" ("StaffstaffID"),
    KEY "FKTask543586" ("JobJobID"),
    KEY "FKTask168614" ("baseTaskbaseTaskID"),
    CONSTRAINT "FKTask168614" FOREIGN KEY ("baseTaskbaseTaskID") REFERENCES "basetask" ("baseTaskID"),
    CONSTRAINT "FKTask543586" FOREIGN KEY ("JobJobID") REFERENCES "job" ("JobID"),
    CONSTRAINT "FKTask954031" FOREIGN KEY ("StaffstaffID") REFERENCES "staff" ("staffID")
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

CREATE TABLE "technicianroom" (
    "staff_staffID" int NOT NULL,
    "technicianroom" varchar(45) NOT NULL,
    PRIMARY KEY ("staff_staffID"),
    KEY "fk_technicianroom_staff1_idx" ("staff_staffID"),
    CONSTRAINT "fk_technicianroom_staff1" FOREIGN KEY ("staff_staffID") REFERENCES "staff" ("staffID") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "valuedcustomer" (
    "CustomercustomerID" int NOT NULL,
    "DiscountdiscountID" int DEFAULT NULL,
    PRIMARY KEY ("CustomercustomerID"),
    KEY "FKValuedCust496434" ("DiscountdiscountID"),
    KEY "FKValuedCust741192" ("CustomercustomerID"),
    CONSTRAINT "FKValuedCust496434" FOREIGN KEY ("DiscountdiscountID") REFERENCES "discount" ("discountID"),
    CONSTRAINT "FKValuedCust741192" FOREIGN KEY ("CustomercustomerID") REFERENCES "customer" ("customerID")
);

CREATE TABLE "valuedjob" (
    "job_JobID" int NOT NULL,
    "alertdate" date NOT NULL,
    "alertknown" SMALLINT NOT NULL DEFAULT '0',
    "firstreminder" date NOT NULL,
    "firstalert" varchar(45) NOT NULL DEFAULT '0',
    "firstbulk" varchar(45) NOT NULL DEFAULT '0',
    "secondreminder" date NOT NULL,
    "defaultd" date NOT NULL,
    "secondbulk" varchar(45) NOT NULL DEFAULT '0',
    PRIMARY KEY ("job_JobID"),
    KEY "fk_valuedJob_job1_idx" ("job_JobID"),
    CONSTRAINT "fk_valuedJob_job1" FOREIGN KEY ("job_JobID") REFERENCES "job" ("JobID") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE "variablediscount" (
    "DiscountdiscountID" int NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "basetask_baseTaskID" int NOT NULL,
    PRIMARY KEY ("DiscountdiscountID","basetask_baseTaskID"),
    KEY "FKvariableDi1347" ("DiscountdiscountID"),
    KEY "fk_variablediscount_basetask1_idx" ("basetask_baseTaskID")
);
