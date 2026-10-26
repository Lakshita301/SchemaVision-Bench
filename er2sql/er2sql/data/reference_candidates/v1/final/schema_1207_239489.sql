-- Source: https://github.com/Daksh-Vatyani/Farmvilla/blob/3c5e49700413113a3fe1d947333f327585ec60a1/id17103288_farmvilla.sql?raw=true
-- Tables detected: 3 | FK constraints: 1
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "guard" (
    "email" text COLLATE utf8_unicode_ci NOT NULL,
    "password" text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "Guests" (
    "email" varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
    "Guest" text COLLATE utf8_unicode_ci DEFAULT NULL,
    "Status" text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE "profile" (
    "email" varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    "password" text COLLATE utf8_unicode_ci NOT NULL,
    "fname" varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    "lname" varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    "mobile" varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    "property" varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    "photo" text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


                          

ALTER TABLE "Guests"
  ADD CONSTRAINT "Guests_ibfk_1" FOREIGN KEY ("email") REFERENCES "profile" ("email") ON DELETE CASCADE ON UPDATE CASCADE;
