-- Source: https://github.com/nandu2311/devops-projects/blob/ba530d6fa6967a20123f644b3564c26f018e3d3a/vprofile-project-vp-rem/src/main/resources/db_backup.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 2
CREATE TABLE "role" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(45) DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "user" (
    "id" int NOT NULL AUTO_INCREMENT,
    "username" varchar(255) DEFAULT NULL,
    "userEmail" varchar(255) DEFAULT NULL,
    "profileImg" varchar(255) DEFAULT NULL,
    "profileImgPath" varchar(255) DEFAULT NULL,
    "dateOfBirth" varchar(255) DEFAULT NULL,
    "fatherName" varchar(255) DEFAULT NULL,
    "motherName" varchar(255) DEFAULT NULL,
    "gender" varchar(255) DEFAULT NULL,
    "maritalStatus" varchar(255) DEFAULT NULL,
    "permanentAddress" varchar(255) DEFAULT NULL,
    "tempAddress" varchar(255) DEFAULT NULL,
    "primaryOccupation" varchar(255) DEFAULT NULL,
    "secondaryOccupation" varchar(255) DEFAULT NULL,
    "skills" varchar(255) DEFAULT NULL,
    "phoneNumber" varchar(255) DEFAULT NULL,
    "secondaryPhoneNumber" varchar(255) DEFAULT NULL,
    "nationality" varchar(255) DEFAULT NULL,
    "language" varchar(255) DEFAULT NULL,
    "workingExperience" varchar(255) DEFAULT NULL,
    "password" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE "user_role" (
    "user_id" int NOT NULL,
    "role_id" int NOT NULL,
    PRIMARY KEY ("user_id","role_id"),
    KEY "fk_user_role_roleid_idx" ("role_id"),
    CONSTRAINT "fk_user_role_roleid" FOREIGN KEY ("role_id") REFERENCES "role" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "fk_user_role_userid" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
