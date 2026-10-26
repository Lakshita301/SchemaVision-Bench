-- Source: https://github.com/emoclewkim/inger/blob/b0cf8142124724ea5015df401f080df92a195a31/exec/DB_dump_%ED%8C%8C%EC%9D%BC_Inger.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 7
CREATE TABLE "calendar" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "date" date DEFAULT NULL,
    "diary" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "promise" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "study_time" int DEFAULT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "FKcox0v4xnhs8qc7g4m34yuyvkq" ("user_id"),
    CONSTRAINT "FKcox0v4xnhs8qc7g4m34yuyvkq" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "common_code" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "kind" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "conference" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "category" int DEFAULT NULL,
    "end_room_date" date DEFAULT NULL,
    "end_room_time" time DEFAULT NULL,
    "max_people" int DEFAULT NULL,
    "now_people" int DEFAULT NULL,
    "session" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "start_room_date" date DEFAULT NULL,
    "start_room_time" time DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "details_code" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "name" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "type" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "FKd30oetvyu88avc523e90c73cv" ("type"),
    CONSTRAINT "FKd30oetvyu88avc523e90c73cv" FOREIGN KEY ("type") REFERENCES "common_code" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "notify" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "handling" int DEFAULT NULL,
    "notify_date" date DEFAULT NULL,
    "reason" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "FKfbw0pi68o4g3n1whir7ig8q9f" ("user_id"),
    CONSTRAINT "FKfbw0pi68o4g3n1whir7ig8q9f" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "todo_list" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "date" date DEFAULT NULL,
    "is_finish" SMALLINT DEFAULT '0',
    "todo" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "todoindex" int DEFAULT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "FK4xtg62i076eelmwvp7mcjchko" ("user_id"),
    CONSTRAINT "FK4xtg62i076eelmwvp7mcjchko" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "todo_list_detail" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "detail" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "detailindex" int DEFAULT NULL,
    "is_finish" bit(1) DEFAULT NULL,
    "todo_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "FK49uwwpchw4wunng6xuydqrs82" ("todo_id"),
    CONSTRAINT "FK49uwwpchw4wunng6xuydqrs82" FOREIGN KEY ("todo_id") REFERENCES "todo_list" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "user" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "category" int DEFAULT NULL,
    "is_open" SMALLINT DEFAULT '0',
    "kakao_id_num" varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    "usercode" int DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE "user_history" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "enter_date" date DEFAULT NULL,
    "enter_time" time DEFAULT NULL,
    "exit_date" date DEFAULT NULL,
    "exit_time" time DEFAULT NULL,
    "type" int DEFAULT NULL,
    "conference_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "FK93rjn0x83br1j83xr47jgr3k2" ("conference_id"),
    KEY "FKaa6ilb6iqih95bntoeyysb2pc" ("user_id"),
    CONSTRAINT "FK93rjn0x83br1j83xr47jgr3k2" FOREIGN KEY ("conference_id") REFERENCES "conference" ("id") ON DELETE CASCADE,
    CONSTRAINT "FKaa6ilb6iqih95bntoeyysb2pc" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
