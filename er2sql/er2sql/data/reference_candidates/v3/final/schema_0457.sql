-- Source: https://github.com/fenggeorgeyu/monetdb-dev/blob/a4a07ba50b0cc29072e6a48915f0cf9ad489d7fb/sql/test/BugDay_2005-10-06_2.8/Tests/JdbcClient_create_tables.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE allnewtriples (
	id integer NOT NULL,
	subject integer NOT NULL,
	predicate integer NOT NULL,
	object integer NOT NULL,
	explicit boolean NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT unique_key UNIQUE(subject, predicate, object)
);

CREATE TABLE "foreign" (
	id integer NOT NULL,
	subject integer NOT NULL,
	predicate integer NOT NULL,
	object integer NOT NULL,
	FOREIGN KEY (id) REFERENCES allnewtriples (id),
	FOREIGN KEY (subject, predicate, object) REFERENCES allnewtriples (subject, predicate, object)
);

CREATE TABLE "triples" (
	"id"        int NOT NULL,
	"subject"   int NOT NULL,
	"predicate" int NOT NULL,
	"object"    int NOT NULL,
	"explicit"  boolean     NOT NULL,
	CONSTRAINT "triples_subject_predicate_object_unique" UNIQUE ("subject", "predicate", "object")
);

