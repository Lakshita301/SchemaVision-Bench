-- Source: https://github.com/cyongkypranowo/Laravel-RESTAPI-MongoDB-VS-MysqlDB-/blob/9b035c7995b02be3f0687ce95587e8a9c6cd2b90/dbfile/train.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 8
CREATE TABLE "dt_schedule"  (
    "id" int NOT NULL COMMENT 'ID of Schedule',
    "train_id" int NOT NULL COMMENT 'Train ID of Schedule',
    "class_id" int NOT NULL COMMENT 'Class ID of Schedule',
    "station_departure_id" int NOT NULL COMMENT 'Station Departure of Schedule',
    "station_arrived_id" int NOT NULL COMMENT 'Station Arrived of Schedule',
    "departure_time" time(0) NOT NULL COMMENT 'Departure Time of Schedule',
    "arrived_time" time(0) NOT NULL COMMENT 'Arrived Time of Schedule',
    "created_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Created of record',
    "updated_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Update of record',
    "deleted_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Deleted of record',
    PRIMARY KEY ("id") USING BTREE,
    INDEX "train_id"("train_id") USING BTREE,
    INDEX "class_id"("class_id") USING BTREE,
    INDEX "station_departure_id"("station_departure_id") USING BTREE,
    INDEX "station_arrived_id"("station_arrived_id") USING BTREE,
    CONSTRAINT "dt_schedule_ibfk_1" FOREIGN KEY ("train_id") REFERENCES "mst_train" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT "dt_schedule_ibfk_2" FOREIGN KEY ("class_id") REFERENCES "mst_class" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT "dt_schedule_ibfk_3" FOREIGN KEY ("station_departure_id") REFERENCES "mst_station" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT "dt_schedule_ibfk_4" FOREIGN KEY ("station_arrived_id") REFERENCES "mst_train" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE "dt_transact"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'ID of Transact',
    "user_id" int NULL DEFAULT NULL COMMENT 'ID User',
    "dt_schedule_id" int NULL DEFAULT NULL COMMENT 'Schedule ID',
    "phone_number" varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Phone Number',
    "adult" int NULL DEFAULT NULL COMMENT 'Total Adult',
    "child" int NULL DEFAULT NULL COMMENT 'Total Child',
    "payment_status" enum('success','failed','pending') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Status of payment',
    "dt_created" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Created of record',
    "dt_updated" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Update of record',
    "dt_deleted" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Deleted of record',
    PRIMARY KEY ("id") USING BTREE,
    INDEX "user_id"("user_id") USING BTREE,
    INDEX "dt_schedule_id"("dt_schedule_id") USING BTREE,
    CONSTRAINT "dt_transact_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "mst_users" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT "dt_transact_ibfk_2" FOREIGN KEY ("dt_schedule_id") REFERENCES "dt_schedule" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE "mst_area"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'ID of Area',
    "area_name" varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Name of Area',
    "created_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Created of record',
    "updated_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Updated of record',
    "deleted_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Deleted of record',
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE "mst_class"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'ID of Class',
    "class_name" varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Name of class',
    "created_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Created of record',
    "updated_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Updated of record',
    "deleted_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Deleted of record',
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE "mst_station"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'ID of station',
    "station_name" varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Name of station',
    "station_abbreviation" varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Abbreviation of station',
    "created_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Created of record',
    "updated_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Updated of record',
    "deleted_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Deleted of record',
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE "mst_train"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'ID of train',
    "train_name" varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Name of train',
    "train_class_id" int NOT NULL COMMENT 'Class ID of train',
    "train_area_id" int NOT NULL COMMENT 'Area ID of train',
    "created_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Created of record',
    "updated_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Updated of record',
    "deleted_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Deleted of record',
    PRIMARY KEY ("id") USING BTREE,
    INDEX "train_class_id"("train_class_id") USING BTREE,
    INDEX "train_area_id"("train_area_id") USING BTREE,
    CONSTRAINT "mst_train_ibfk_1" FOREIGN KEY ("train_class_id") REFERENCES "mst_class" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT "mst_train_ibfk_2" FOREIGN KEY ("train_area_id") REFERENCES "mst_area" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE "mst_users"  (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'ID of User',
    "user_name" varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of Iser',
    "user_email" varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email of User',
    "user_email_verified_at" timestamp(0) NULL DEFAULT NULL COMMENT 'Email Verified ',
    "user_password" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Password of User',
    "user_remember_token" varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Token Remember',
    "created_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Created of record',
    "updated_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Update of record',
    "deleted_at" TIMESTAMP(0) NULL DEFAULT NULL COMMENT 'Date Deleted of record',
    PRIMARY KEY ("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
