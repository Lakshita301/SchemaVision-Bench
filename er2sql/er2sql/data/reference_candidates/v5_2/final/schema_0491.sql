-- Source: https://github.com/stanalexandrucode/ask-mate-2/blob/b1ac0720ece3ca8f6aba57e2b0a6194224b51134/sample_data/askmatepart2-sample-data.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 20
CREATE TABLE question (
    id serial NOT NULL,
    submission_time timestamp without time zone,
    view_number integer,
    vote_number integer,
    title text,
    message text,
    image text
);
CREATE TABLE answer (
    id serial NOT NULL,
    submission_time timestamp without time zone,
    vote_number integer,
    question_id integer,
    message text,
    image text
);
CREATE TABLE comment (
    id serial NOT NULL,
    question_id integer,
    answer_id integer,
    message text,
    submission_time timestamp without time zone,
    edited_count integer
);
CREATE TABLE question_tag (
    question_id integer NOT NULL,
    tag_id integer NOT NULL
);
CREATE TABLE tag (
    id serial NOT NULL,
    name text
);
ALTER TABLE answer ADD CONSTRAINT fk_question_id FOREIGN KEY (question_id) REFERENCES question(id);
ALTER TABLE answer ADD CONSTRAINT fk_question_id
 FOREIGN KEY (question_id)
 REFERENCES question(id)
 ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE comment ADD CONSTRAINT fk_answer_id FOREIGN KEY (answer_id) REFERENCES answer(id);
ALTER TABLE comment ADD CONSTRAINT fk_question_id FOREIGN KEY (question_id) REFERENCES question(id);
ALTER TABLE comment ADD CONSTRAINT fk_question_id
 FOREIGN KEY (question_id)
 REFERENCES question(id)
 ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE comment ADD CONSTRAINT fk_answer_id
 FOREIGN KEY (answer_id)
 REFERENCES answer(id)
 ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE question_tag ADD CONSTRAINT fk_question_id FOREIGN KEY (question_id) REFERENCES question(id);
ALTER TABLE question_tag ADD CONSTRAINT fk_tag_id FOREIGN KEY (tag_id) REFERENCES tag(id);
ALTER TABLE question_tag ADD CONSTRAINT fk_question_id
 FOREIGN KEY (question_id)
 REFERENCES question(id)
 ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE question_tag ADD CONSTRAINT fk_tag_id
 FOREIGN KEY (tag_id)
 REFERENCES tag(id)
 ON DELETE CASCADE ON UPDATE CASCADE;
