-- Source: https://github.com/Eduardo2108/Railspot_BE/blob/c728c73d5e6fbd7fc67c7e375a4bdffaf99daace/glassfish5/glassfish/lib/install/databases/jsr352-sybase-ace.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 8

CREATE TABLE JOBINSTANCEDATA(
  jobinstanceid    BIGINT NOT NULL PRIMARY KEY IDENTITY,
  name    VARCHAR(512), 
  apptag VARCHAR(512)
);

CREATE TABLE EXECUTIONINSTANCEDATA(
  jobexecid     BIGINT NOT NULL PRIMARY KEY IDENTITY, 
  jobinstanceid BIGINT,
  createtime  DATETIME,
  starttime   DATETIME,
  endtime   DATETIME,
  updatetime  DATETIME,
  parameters  VARBINARY,
  batchstatus   VARCHAR(512),
  exitstatus    VARCHAR(512),
  CONSTRAINT JOBINST_JOBEXEC_FK FOREIGN KEY (jobinstanceid) REFERENCES JOBINSTANCEDATA (jobinstanceid)
);

CREATE TABLE STEPEXECUTIONINSTANCEDATA(
  stepexecid     BIGINT NOT NULL PRIMARY KEY IDENTITY, 
  jobexecid      BIGINT, 
  batchstatus         VARCHAR(512),
    exitstatus      VARCHAR(512),
    stepname      VARCHAR(512),
  readcount           INTEGER,
  writecount          INTEGER,
  commitcount         INTEGER,
  rollbackcount       INTEGER,
  readskipcount       INTEGER,
  processskipcount    INTEGER,
  filtercount         INTEGER,
  writeskipcount      INTEGER,
  startTime           DATETIME,
  endTime             DATETIME,
  persistentData    VARBINARY,
  CONSTRAINT JOBEXEC_STEPEXEC_FK FOREIGN KEY (jobexecid) REFERENCES EXECUTIONINSTANCEDATA (jobexecid)
);

CREATE TABLE JOBSTATUS (
  id		BIGINT NOT NULL PRIMARY KEY IDENTITY,
  obj		VARBINARY,
  CONSTRAINT JOBSTATUS_JOBINST_FK FOREIGN KEY (id) REFERENCES JOBINSTANCEDATA (jobinstanceid) ON DELETE CASCADE
);

CREATE TABLE STEPSTATUS(
  id		BIGINT NOT NULL PRIMARY KEY IDENTITY,
  obj		VARBINARY,
  CONSTRAINT STEPSTATUS_STEPEXEC_FK FOREIGN KEY (id) REFERENCES STEPEXECUTIONINSTANCEDATA (stepexecid) ON DELETE CASCADE
);

CREATE TABLE CHECKPOINTDATA(
  id		VARCHAR(512),
  obj		VARBINARY
);

