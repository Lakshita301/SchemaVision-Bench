-- Source: https://github.com/DARIO34E/SISTEMA-DE-PELICULA/blob/a6043ea3e65d2490a56dcd6b148cb5d387b82666/database/example.sql?raw=true
-- Tables detected: 9 | FK constraints: 13
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "categories" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "status_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "category_movie" (
    "id" int UNSIGNED NOT NULL,
    "movie_id" int UNSIGNED NOT NULL,
    "category_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "movies" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "description" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" int UNSIGNED NOT NULL,
    "status_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "movie_rental" (
    "id" int UNSIGNED NOT NULL,
    "movie_id" int UNSIGNED NOT NULL,
    "rental_id" int UNSIGNED NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "observations" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "rentals" (
    "id" int UNSIGNED NOT NULL,
    "start_date" timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    "end_date" timestamp NULL DEFAULT NULL,
    "total" DOUBLE PRECISION DEFAULT NULL,
    "user_id" int UNSIGNED NOT NULL,
    "status_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "roles" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "status_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "statuses" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "type_status_id" int UNSIGNED NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "type_statuses" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" int UNSIGNED NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "status_id" int UNSIGNED NOT NULL,
    "role_id" int UNSIGNED NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                          

ALTER TABLE "categories"
  ADD CONSTRAINT "categories_status_id_foreign" FOREIGN KEY ("status_id") REFERENCES "statuses" ("id") ON UPDATE CASCADE;

ALTER TABLE "category_movie"
  ADD CONSTRAINT "category_movie_category_id_foreign" FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON UPDATE CASCADE,
  ADD CONSTRAINT "category_movie_movie_id_foreign" FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") ON UPDATE CASCADE;

ALTER TABLE "movies"
  ADD CONSTRAINT "movies_status_id_foreign" FOREIGN KEY ("status_id") REFERENCES "statuses" ("id") ON UPDATE CASCADE,
  ADD CONSTRAINT "movies_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE CASCADE;

ALTER TABLE "movie_rental"
  ADD CONSTRAINT "movie_rental_movie_id_foreign" FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") ON UPDATE CASCADE,
  ADD CONSTRAINT "movie_rental_rental_id_foreign" FOREIGN KEY ("rental_id") REFERENCES "rentals" ("id") ON UPDATE CASCADE;

ALTER TABLE "rentals"
  ADD CONSTRAINT "rentals_status_id_foreign" FOREIGN KEY ("status_id") REFERENCES "statuses" ("id") ON UPDATE CASCADE,
  ADD CONSTRAINT "rentals_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE CASCADE;

ALTER TABLE "roles"
  ADD CONSTRAINT "roles_status_id_foreign" FOREIGN KEY ("status_id") REFERENCES "statuses" ("id") ON UPDATE CASCADE;

ALTER TABLE "statuses"
  ADD CONSTRAINT "statuses_type_status_id_foreign" FOREIGN KEY ("type_status_id") REFERENCES "type_statuses" ("id") ON UPDATE CASCADE;

ALTER TABLE "users"
  ADD CONSTRAINT "users_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON UPDATE CASCADE,
  ADD CONSTRAINT "users_status_id_foreign" FOREIGN KEY ("status_id") REFERENCES "statuses" ("id") ON UPDATE CASCADE;
