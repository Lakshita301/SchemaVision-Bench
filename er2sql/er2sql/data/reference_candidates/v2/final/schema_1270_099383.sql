-- Source: https://github.com/L29/PlantZo/blob/e9d137d12447c71e5286f40af7b8df7422b71858/api/plantzo.sql?raw=true
-- Tables detected: 5 | FK constraints: 6
CREATE TABLE "cart" (
    "uid" int DEFAULT NULL,
    "pid" int DEFAULT NULL,
    "total" int DEFAULT NULL,
    KEY "uid" ("uid"),
    KEY "pid" ("pid"),
    CONSTRAINT "cart_ibfk_1" FOREIGN KEY ("uid") REFERENCES "users" ("uid"),
    CONSTRAINT "cart_ibfk_2" FOREIGN KEY ("pid") REFERENCES "product" ("pid")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "comment" (
    "postid" int NOT NULL AUTO_INCREMENT,
    "uid" int DEFAULT NULL,
    "pid" int DEFAULT NULL,
    "rating" int DEFAULT NULL,
    "comment" varchar(255) NOT NULL,
    PRIMARY KEY ("postid"),
    KEY "uid" ("uid"),
    KEY "pid" ("pid"),
    CONSTRAINT "comment_ibfk_1" FOREIGN KEY ("uid") REFERENCES "users" ("uid"),
    CONSTRAINT "comment_ibfk_2" FOREIGN KEY ("pid") REFERENCES "product" ("pid")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "history" (
    "tid" int NOT NULL AUTO_INCREMENT,
    "uid" int DEFAULT NULL,
    "pid" int DEFAULT NULL,
    "total_cost" int DEFAULT NULL,
    "date" date NOT NULL,
    "ticket" int DEFAULT NULL,
    PRIMARY KEY ("tid"),
    KEY "uid" ("uid"),
    KEY "pid" ("pid"),
    CONSTRAINT "history_ibfk_1" FOREIGN KEY ("uid") REFERENCES "users" ("uid"),
    CONSTRAINT "history_ibfk_2" FOREIGN KEY ("pid") REFERENCES "product" ("pid")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "product" (
    "pid" int NOT NULL AUTO_INCREMENT,
    "name" varchar(70) DEFAULT NULL,
    "image" varchar(255) NOT NULL,
    "price" int DEFAULT NULL,
    "rating" int DEFAULT NULL,
    "description" varchar(500) DEFAULT NULL,
    "quantity" int DEFAULT NULL,
    "checked" SMALLINT DEFAULT NULL,
    PRIMARY KEY ("pid")
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "users" (
    "uid" int NOT NULL AUTO_INCREMENT,
    "email" varchar(50) NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "password" char(60) NOT NULL,
    "address" varchar(100) DEFAULT NULL,
    "handphone" char(20) DEFAULT NULL,
    PRIMARY KEY ("uid")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
