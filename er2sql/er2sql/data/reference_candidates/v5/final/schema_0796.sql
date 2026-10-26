-- Source: https://github.com/mdmartinvega/Proyecto_Server/blob/0b8f5ab9007cb4d5e70993c618b649cdb8d39374/be_buddy.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 7
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "city" (
    "id" int NOT NULL,
    "name" varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "doctrine_migration_versions" (
    "version" varchar(191) COLLATE utf8_unicode_ci NOT NULL,
    "executed_at" TIMESTAMP DEFAULT NULL,
    "execution_time" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "interest" (
    "id" int NOT NULL,
    "tag" varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "language" (
    "id" int NOT NULL,
    "name" varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "message" (
    "id" int NOT NULL,
    "sender_id" int NOT NULL,
    "receiver_id" int NOT NULL,
    "message" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" TIMESTAMP NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user" (
    "id" int NOT NULL,
    "email" varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
    "roles" TEXT COLLATE utf8mb4_unicode_ci NOT NULL ,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "name" varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_name" varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
    "age" smallint DEFAULT NULL,
    "bio" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "years_living" int DEFAULT NULL,
    "image" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "city_id" int NOT NULL,
    "avatar" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user_interest" (
    "user_id" int NOT NULL,
    "interest_id" int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user_language" (
    "user_id" int NOT NULL,
    "language_id" int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                          

ALTER TABLE "message"
  ADD CONSTRAINT "FK_B6BD307FCD53EDB6" FOREIGN KEY ("receiver_id") REFERENCES "user" ("id"),
  ADD CONSTRAINT "FK_B6BD307FF624B39D" FOREIGN KEY ("sender_id") REFERENCES "user" ("id");

ALTER TABLE "user"
  ADD CONSTRAINT "FK_8D93D6498BAC62AF" FOREIGN KEY ("city_id") REFERENCES "city" ("id");

ALTER TABLE "user_interest"
  ADD CONSTRAINT "FK_8CB3FE675A95FF89" FOREIGN KEY ("interest_id") REFERENCES "interest" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "FK_8CB3FE67A76ED395" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE;

ALTER TABLE "user_language"
  ADD CONSTRAINT "FK_345695B582F1BAF4" FOREIGN KEY ("language_id") REFERENCES "language" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "FK_345695B5A76ED395" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE;
COMMENT ON COLUMN "message"."created_at" IS '(DC2Type:datetime_immutable)';
COMMENT ON COLUMN "user"."roles" IS '(DC2Type:json)';
