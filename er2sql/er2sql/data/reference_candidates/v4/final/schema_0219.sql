-- Source: https://github.com/MunandarAris/Test_Kompetensi_DW/blob/394dc4ec448d5b517f4c78c548248b9ae1569d70/db_task_collections.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 2
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "collections_tb" (
    "id" int NOT NULL,
    "name" varchar(30) NOT NULL,
    "user_id" int NOT NULL
);

CREATE TABLE "task_tb" (
    "id" int NOT NULL,
    "name" varchar(30) NOT NULL,
    "is_done" SMALLINT NOT NULL,
    "collections_id" int NOT NULL
);

CREATE TABLE "users_tb" (
    "id" int NOT NULL,
    "email" varchar(30) NOT NULL,
    "username" varchar(30) NOT NULL,
    "password" varchar(30) NOT NULL
);


                          

ALTER TABLE "collections_tb"
  ADD CONSTRAINT "collections_tb_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users_tb" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "task_tb"
  ADD CONSTRAINT "task_tb_ibfk_1" FOREIGN KEY ("collections_id") REFERENCES "collections_tb" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
