-- Source: https://github.com/dittmar/school_projects/blob/c9032428269bc00fe0a48103c01d8baef29945af/ELVIS_BACKUP/source_html/db/OLD_DUMPS/Dump20150427-1.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 8
CREATE TABLE "author" (
    "authorID" int NOT NULL AUTO_INCREMENT,
    "author_fname" varchar(45) NOT NULL,
    "author_lname" varchar(45) NOT NULL,
    "email" varchar(45) NOT NULL,
    PRIMARY KEY ("authorID")
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

CREATE TABLE "book" (
    "ISBN" char(13) NOT NULL,
    "title" varchar(45) NOT NULL,
    "price" decimal(10,2) NOT NULL,
    "stock" int NOT NULL,
    "publisher_ID" int NOT NULL,
    "date_published" date NOT NULL,
    PRIMARY KEY ("ISBN"),
    KEY "publisher_ID" ("publisher_ID"),
    CONSTRAINT "publisher_ID" FOREIGN KEY ("publisher_ID") REFERENCES "publisher" ("publisher_ID") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "contains" (
    "orderID" int NOT NULL,
    "ISBN" char(13) NOT NULL,
    "quantity" int unsigned NOT NULL,
    PRIMARY KEY ("orderID","ISBN"),
    KEY "ISBN" ("ISBN"),
    CONSTRAINT "ISBN" FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "orderID" FOREIGN KEY ("orderID") REFERENCES "orders" ("orderID") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "customer" (
    "customerID" int NOT NULL AUTO_INCREMENT,
    "Fname" varchar(45) NOT NULL,
    "Lname" varchar(45) NOT NULL,
    "street" varchar(45) NOT NULL,
    "city" varchar(45) NOT NULL,
    "state" char(2) NOT NULL,
    "zip" char(5) NOT NULL,
    "gender" char(1) NOT NULL,
    "pass" varchar(45) NOT NULL DEFAULT 'password',
    PRIMARY KEY ("customerID")
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

CREATE TABLE "genre" (
    "genrename" varchar(45) NOT NULL,
    PRIMARY KEY ("genrename")
);

CREATE TABLE "in" (
    "ISBN" char(13) NOT NULL,
    "genrename" varchar(45) NOT NULL,
    PRIMARY KEY ("ISBN","genrename"),
    KEY "in_ibfk_2_idx" ("genrename"),
    CONSTRAINT "in_ibfk_1" FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "in_ibfk_2" FOREIGN KEY ("genrename") REFERENCES "genre" ("genrename") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "orders" (
    "orderID" int NOT NULL AUTO_INCREMENT,
    "payment_type" varchar(45) NOT NULL,
    "card_number" char(16) NOT NULL,
    "date" date NOT NULL,
    "status" varchar(45) NOT NULL,
    "customerID" int NOT NULL,
    PRIMARY KEY ("orderID"),
    KEY "customerID" ("customerID"),
    CONSTRAINT "customerID" FOREIGN KEY ("customerID") REFERENCES "customer" ("customerID") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

CREATE TABLE "publisher" (
    "publisher_ID" int NOT NULL AUTO_INCREMENT,
    "publisher_name" varchar(45) NOT NULL,
    "phone" char(10) NOT NULL,
    PRIMARY KEY ("publisher_ID")
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE "wrote" (
    "authorID" int NOT NULL,
    "ISBN" char(13) NOT NULL,
    PRIMARY KEY ("authorID","ISBN"),
    KEY "ISBN_idx" ("ISBN"),
    CONSTRAINT "wrote_ibfk_1" FOREIGN KEY ("authorID") REFERENCES "author" ("authorID") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "wrote_ibfk_2" FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN") ON DELETE CASCADE ON UPDATE CASCADE
);
