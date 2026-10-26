-- Source: https://github.com/vaneks/CRUD_Hibernate/blob/0d210cddfdf5d2f8cf59478a0d9e09b8c66ad779/src/main/resources/Dump20210410.sql?raw=true
-- Tables detected: 5 | FK constraints: 2
CREATE TABLE "dev_skills" (
    "id" int NOT NULL AUTO_INCREMENT,
    "dev_id" int NOT NULL,
    "skill_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "id_UNIQUE" ("id"),
    KEY "devId_idx" ("dev_id"),
    CONSTRAINT "devId" FOREIGN KEY ("dev_id") REFERENCES "developers" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "developers" (
    "id" int NOT NULL AUTO_INCREMENT,
    "firstName" varchar(50) NOT NULL,
    "lastName" varchar(50) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "id_UNIQUE" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "skills" (
    "id" int NOT NULL AUTO_INCREMENT,
    "skillName" varchar(150) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "id_UNIQUE" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "team_dev" (
    "id" int NOT NULL AUTO_INCREMENT,
    "team_id" int NOT NULL,
    "dev_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "id_UNIQUE" ("id"),
    KEY "teamId_idx" ("team_id"),
    CONSTRAINT "teamId" FOREIGN KEY ("team_id") REFERENCES "teams" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE "teams" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(100) NOT NULL,
    "status" enum('ACTIVE','UNDER_REVIEW','DELETED') NOT NULL DEFAULT 'ACTIVE',
    PRIMARY KEY ("id"),
    UNIQUE KEY "id_UNIQUE" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
