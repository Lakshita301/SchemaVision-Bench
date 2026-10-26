-- Source: https://github.com/epavlick/esl-errors/blob/b9fb53c66c71a6f1dc8b0d59cb7423121ad3f216/backend/db/database.sql?raw=true
-- Tables detected: 6 | FK constraints: 4

CREATE TABLE languages (
    id serial NOT NULL,
    name character varying,
    prefix character varying
);

CREATE TABLE dictionary (
    id serial NOT NULL,
    word character varying,
    sentences character varying,
    language_id integer,
    translation character varying
);

CREATE TABLE vocabulary (
    id serial NOT NULL,
    word character varying,
    sentences text,
    language_id integer
);

CREATE TABLE hittypes (
    id serial NOT NULL,
    name character varying,
	hittypeid character varying
);

CREATE TABLE vocabularyhits (
    id serial NOT NULL,
    hitid character varying,
	hittype_id integer,
	uuid character varying
);

CREATE TABLE vocabularyhitsdata (
    id serial NOT NULL,
    hit_id integer,
	word_id integer,
	type character varying
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ONLY dictionary
    ADD CONSTRAINT dictionary_language_id_fk FOREIGN KEY (language_id) REFERENCES languages(id);

ALTER TABLE ONLY vocabulary
    ADD CONSTRAINT vocabulary_language_id_fk FOREIGN KEY (language_id) REFERENCES languages(id);

ALTER TABLE ONLY vocabularyhits
    ADD CONSTRAINT vocabularyhits_hittypes_id_fk FOREIGN KEY (hittype_id) REFERENCES hittypes(id);

ALTER TABLE ONLY vocabularyhitsdata
    ADD CONSTRAINT vocabularyhitsdata_vocabularyhits_id_fk FOREIGN KEY (hit_id) REFERENCES vocabularyhits(id);

