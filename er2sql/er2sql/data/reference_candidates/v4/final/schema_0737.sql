-- Source: https://github.com/Smarty-pro/wornak/blob/8eabd8a179c75c4df4071b19660febc03205c228/Wornak.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 3
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "admin"
(
    "id" int NOT NULL,
    "full_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "mail" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tel" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "address" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "company"
(
    "id" int NOT NULL,
    "roles" TEXT COLLATE utf8mb4_unicode_ci     NOT NULL ,
    "employees_number" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "company_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" TEXT COLLATE utf8mb4_unicode_ci     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "doctrine_migration_versions"
(
    "version" varchar(191) COLLATE utf8_unicode_ci NOT NULL,
    "executed_at" TIMESTAMP DEFAULT NULL,
    "execution_time" int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "job_post"
(
    "id" int NOT NULL,
    "company" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "job_title" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" TEXT COLLATE utf8mb4_unicode_ci     NOT NULL,
    "reference" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "exp_date" date                                    NOT NULL,
    "job_zone" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "training" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "contract_type" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "published_at" TIMESTAMP                                NOT NULL,
    "salary" int NOT NULL,
    "sector" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "study_level_required" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "job_seeker" (
    "id" int NOT NULL,
    "roles" TEXT COLLATE utf8mb4_unicode_ci NOT NULL ,
    "first_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "last_name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "gender" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "birthday_date" date NOT NULL,
    "address" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "mobility" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "handicap" SMALLINT NOT NULL,
    "diploma" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "skills" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "search_bar" (
    "id" int NOT NULL,
    "search_content" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user" (
    "id" int NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "activation_token" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "tel" int DEFAULT NULL,
    "companies_id" int DEFAULT NULL,
    "jobseeker_id" int DEFAULT NULL,
    "uuid" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "roles" TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                          

ALTER TABLE "admin"
    ADD CONSTRAINT "FK_880E0D76A76ED395" FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user"
    ADD CONSTRAINT "FK_8D93D6494CF2B5A9" FOREIGN KEY ("jobseeker_id") REFERENCES "job_seeker" ("id"),
  ADD CONSTRAINT "FK_8D93D6496AE4741E" FOREIGN KEY ("companies_id") REFERENCES "company" ("id");
COMMENT ON COLUMN "company"."roles" IS '(DC2Type:json)';
COMMENT ON COLUMN "job_seeker"."roles" IS '(DC2Type:json)';
COMMENT ON COLUMN "user"."roles" IS '(DC2Type:json)';
