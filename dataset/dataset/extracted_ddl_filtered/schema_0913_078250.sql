-- Source: https://github.com/jpcuencas/examples/blob/fb4ced22346169a33e7cb9e56d92247a175872cf/JAVA/Tutorials/tutorials-master/spring-jooq/src/main/resources/intro_schema.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE author (
  id             INT          NOT NULL PRIMARY KEY,
  first_name     VARCHAR(50),
  last_name      VARCHAR(50)  NOT NULL
);

CREATE TABLE book (
  id             INT          NOT NULL PRIMARY KEY,
  title          VARCHAR(100) NOT NULL
);

CREATE TABLE author_book (
  author_id      INT          NOT NULL,
  book_id        INT          NOT NULL,
  
  PRIMARY KEY (author_id, book_id),
  CONSTRAINT fk_ab_author     FOREIGN KEY (author_id)  REFERENCES author (id)  
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_ab_book       FOREIGN KEY (book_id)    REFERENCES book   (id)
);

