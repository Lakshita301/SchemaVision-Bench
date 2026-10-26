-- Source: https://github.com/EEMO22/SQL/blob/e691e2e7ee711f79089bef9b543f318ca66d818f/03-DDL-and-DCL.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 2

CREATE TABLE: 테이블 생성
CREATE TABLE book (
    book_id NUMBER(5),
    title VARCHAR2(50),
    author VARCHAR2(10),
    pub_date DATE DEFAULT SYSDATE
);

CREATE TABLE it_emps AS(
    SELECT * FROM hr.employees
    WHERE job_id LIKE 'IT_%'
);

CREATE TABLE author (
    author_id NUMBER(10),
    author_name VARCHAR2(50) NOT NULL,
    author_desc VARCHAR2(500),
    PRIMARY KEY (author_id) -- 테이블 제약
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE book
ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id)
                            REFERENCES author(author_id)
                            ON DELETE CASCADE;

