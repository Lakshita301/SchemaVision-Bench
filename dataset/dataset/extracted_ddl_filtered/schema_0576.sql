-- Source: https://github.com/vitorsly/SDIS-Project-2/blob/1b559ace82decdd0ce3a9a0d0fed465091705c45/launchdatabase.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4

CREATE TABLE filesstored(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	fileid VARCHAR(16) NOT NULL,
	responsible BOOLEAN DEFAULT false,
	storing BOOLEAN DEFAULT true,
	requestingpeer VARCHAR(16),
	desiredrepdeg INTEGER,
	lasttimestored TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE peers(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	peerid VARCHAR(16) NOT NULL,
	ip VARCHAR(15) NOT NULL,
	port INT NOT NULL
);

CREATE TABLE backupsrequested(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	fileid VARCHAR(16) NOT NULL,
	filename VARCHAR(128) NOT NULL,
	chunksNum INTEGER NOT NULL,
	desiredrepdeg INTEGER NOT NULL,
	encrypt_key VARCHAR(256)
);

CREATE TABLE chunksstored(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	chunkid INT NOT NULL,
	fileid VARCHAR(16) NOT NULL,
	currentrepdeg INTEGER,
	size INTEGER NOT NULL
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE filesstored
   ADD CONSTRAINT filesstored_FK Foreign Key (requestingpeer)
   REFERENCES peers(peerid);

ALTER TABLE chunksstored
   ADD CONSTRAINT chunksstored_FK Foreign Key (fileid) REFERENCES filesstored(fileid) ON DELETE CASCADE;

