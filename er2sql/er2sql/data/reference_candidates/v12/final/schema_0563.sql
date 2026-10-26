-- Source: https://github.com/evandowning/deepreflect/blob/9343e80ab4cc792dffb34fd06c1c1aca941ed8df/db/create.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6
/* SHA256 hash of sample */
/* Family label */
/* Function address */
/* Cluster that function belongs to */
/* DeepReflect score of function */
/* Define unique entries */
/* Define keys */
/* Label's plain name */
/* Define unique entries */
/* Define keys */
/* Analyst's username */
/* Analyst's email */
/* Analyst's plain name */
/* Define unique entries */
/* Define keys */
/* Function id */
/* Label id */
/* Analyst id */
/* Timestamp of entry */
/* when user began looking at this function */
/* when user made their final decision about this function */
/* Define keys */
CREATE TABLE functions(
    id INT GENERATED ALWAYS AS IDENTITY,
    hash CHAR(64) NOT NULL,
    family VARCHAR(128) DEFAULT 'unknown',
    func_addr VARCHAR(18) NOT NULL,
    cid INT DEFAULT -2,
    score REAL DEFAULT -1,
    UNIQUE (hash,family,func_addr),
    PRIMARY KEY(id)
);

CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(128) NOT NULL,
    UNIQUE (name),
    PRIMARY KEY(id)
);

CREATE TABLE analysts(
    id INT GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL,
    name VARCHAR(64) NOT NULL,
    UNIQUE (username),
    PRIMARY KEY(id)
);

CREATE TABLE reviews(
    id INT GENERATED ALWAYS AS IDENTITY,
    function_id INT NOT NULL,
    label_id INT NOT NULL,
    analyst_id INT NOT NULL,
    ts_start TIMESTAMP NOT NULL,
    ts_end TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT fk_functions
        FOREIGN KEY(function_id)
            REFERENCES functions(id)
            ON DELETE CASCADE,
    CONSTRAINT fk_labels
        FOREIGN KEY(label_id)
            REFERENCES labels(id)
            ON DELETE CASCADE,
    CONSTRAINT fk_analysts
        FOREIGN KEY(analyst_id)
        REFERENCES analysts(id)
        ON DELETE SET NULL
);
