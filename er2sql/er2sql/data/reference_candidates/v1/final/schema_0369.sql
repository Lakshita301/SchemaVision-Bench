-- Source: https://github.com/ismailcherri/movieapi/blob/7664b5ab1c681951ea758cf64548b063851fa76f/demo.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 2
CREATE TABLE "category" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "movie" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "description" TEXT,
    "image" varchar(255) DEFAULT NULL,
    "title" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "movie_category" (
    "movie_id" bigint NOT NULL,
    "category_id" bigint NOT NULL,
    KEY "FKhkem46gi7yq1019e1j8hlvp9y" ("category_id"),
    KEY "FKdhlw8bp2rx2bhkp1orkg12lor" ("movie_id"),
    CONSTRAINT "FKdhlw8bp2rx2bhkp1orkg12lor" FOREIGN KEY ("movie_id") REFERENCES "movie" ("id"),
    CONSTRAINT "FKhkem46gi7yq1019e1j8hlvp9y" FOREIGN KEY ("category_id") REFERENCES "category" ("id")
);
