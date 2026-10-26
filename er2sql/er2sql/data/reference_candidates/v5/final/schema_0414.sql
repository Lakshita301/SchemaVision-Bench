-- Source: https://github.com/amulyahc/Python_Vul/blob/00b5200ef87656407a3dafa3fae1fa6f9280b5a3/migrations/000-init-schema.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 6

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  middle_name TEXT,
  last_name TEXT NOT NULL,
  username TEXT NOT NULL,
  pwd_hash TEXT NOT NULL,
  is_admin BOOLEAN DEFAULT FALSE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT
);

CREATE TABLE marks (
  id SERIAL PRIMARY KEY,
  date TIMESTAMP WITH TIME ZONE DEFAULT now(),
  student_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  points INTEGER NOT NULL
);

CREATE TABLE course_reviews (
  id SERIAL PRIMARY KEY,
  date TIMESTAMP WITH TIME ZONE DEFAULT now(),
  course_id INTEGER NOT NULL,
  review_text TEXT
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE marks ADD FOREIGN KEY (student_id) REFERENCES students(id);

ALTER TABLE marks ADD FOREIGN KEY (course_id) REFERENCES courses(id);

ALTER TABLE course_reviews ADD FOREIGN KEY (course_id) REFERENCES courses (id);

