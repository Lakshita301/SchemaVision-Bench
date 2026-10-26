-- Source: https://github.com/Sage35/Reviews/blob/201fe9f9a465cbbe806a9641a7a37d1618d05bcf/db/init.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE reviews (
  product INT NOT NULL,
  review_id SERIAL PRIMARY KEY,
  rating INT NOT NULL,
  summary VARCHAR,
  recommend BOOLEAN NOT NULL,
  body VARCHAR,
  date DATE NOT NULL DEFAULT CURRENT_DATE,
  reviewer_name VARCHAR NOT NULL,
  email VARCHAR,
  helpfulness INT NOT NULL DEFAULT 0,
  reported BOOLEAN NOT NULL DEFAULT false,
  response VARCHAR
);

CREATE TABLE photos (
  review_id INT NOT NULL,
  id SERIAL,
  url VARCHAR,
  FOREIGN KEY(review_id)
  REFERENCES reviews(review_id)
);

CREATE TABLE chars (
  product_id INT NOT NULL,
  name VARCHAR NOT NULL,
  id SERIAL PRIMARY KEY
);

CREATE TABLE char_info (
  char_id INT NOT NULL,
  review_id INT NOT NULL,
  value DECIMAL,
  FOREIGN KEY(char_id)
  REFERENCES chars(id),
  FOREIGN KEY(review_id)
  REFERENCES reviews(review_id)
);

