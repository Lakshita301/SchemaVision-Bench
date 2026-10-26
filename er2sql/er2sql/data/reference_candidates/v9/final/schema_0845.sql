-- Source: https://github.com/tanykoo/log4j/blob/c5f4279081091e562c44bb753f6e52dc6be5fa52/src/main/java/org/apache/log4j/db/dialect/postgresql.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE logging_event 
  (
    sequence_number   BIGINT NOT NULL,
    timestamp         BIGINT NOT NULL,
    rendered_message  TEXT NOT NULL,
    logger_name       VARCHAR(254) NOT NULL,
    level_string      VARCHAR(254) NOT NULL,
    ndc               TEXT,
    thread_name       VARCHAR(254),
    reference_flag    SMALLINT,
    caller_filename   VARCHAR(254) NOT NULL,
    caller_class      VARCHAR(254) NOT NULL,
    caller_method     VARCHAR(254) NOT NULL,
    caller_line       CHAR(4) NOT NULL,
    event_id          INT DEFAULT nextval('logging_event_id_seq') PRIMARY KEY
  );

CREATE TABLE logging_event_property
  (
    event_id	      INT NOT NULL,
    mapped_key        VARCHAR(254) NOT NULL,
    mapped_value      VARCHAR(1024),
    PRIMARY KEY(event_id, mapped_key),
    FOREIGN KEY (event_id) REFERENCES logging_event(event_id)
  );

CREATE TABLE logging_event_exception
  (
    event_id         INT NOT NULL,
    i                SMALLINT NOT NULL,
    trace_line       VARCHAR(254) NOT NULL,
    PRIMARY KEY(event_id, i),
    FOREIGN KEY (event_id) REFERENCES logging_event(event_id)
  );

