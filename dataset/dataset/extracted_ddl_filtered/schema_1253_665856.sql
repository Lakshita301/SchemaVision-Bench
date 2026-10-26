-- Source: https://github.com/bluezio/activebpel-ucase/blob/fb4afa45d2dd31fd075272214339c61fe6ab9df2/ddl.org.activebpel/ddl/ActiveBPEL-Informix.sql?raw=true
-- Tables detected: 13 | FK constraints: 8

CREATE TABLE AeMetaInfo (
   PropertyName VARCHAR(255) NOT NULL,
   PropertyValue VARCHAR(255) NOT NULL,
   PRIMARY KEY (PropertyName)
) LOCK MODE ROW;

CREATE TABLE AeCounter (
   CounterName VARCHAR(255) NOT NULL,
   CounterValue INT8 NOT NULL,
   PRIMARY KEY (CounterName)
) LOCK MODE ROW;

CREATE TABLE AeProcess
(
   ProcessId INT8 NOT NULL,
   PlanId INT NOT NULL,
   ProcessName VARCHAR(255) NOT NULL,
   ProcessNamespace VARCHAR(255) NOT NULL,
   ProcessDocument CLOB,
   ProcessState INT NOT NULL,
   ProcessStateReason INT,
   StartDate DATETIME YEAR TO SECOND,
   EndDate DATETIME YEAR TO SECOND,
   PendingInvokesCount INT,
   ModifiedDate DATETIME YEAR TO SECOND,
   ModifiedCount INT DEFAULT 0,
   PRIMARY KEY (ProcessId)
) PUT ProcessDocument IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

CREATE TABLE AeProcessLog
(
   ProcessId INT8 NOT NULL,
   ProcessLog CLOB,
   Counter SERIAL NOT NULL,
   LineCount INT NOT NULL,
   FOREIGN KEY (ProcessId) REFERENCES AeProcess(ProcessId) ON DELETE CASCADE,
   PRIMARY KEY (ProcessId, Counter)
) PUT ProcessLog IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

CREATE TABLE AeVariable
(
   ProcessId INT8 NOT NULL,
   LocationId INT NOT NULL,
   VersionNumber INT NOT NULL,
   VariableDocument CLOB NOT NULL,
   FOREIGN KEY (ProcessId) REFERENCES AeProcess(ProcessId) ON DELETE CASCADE,
   PRIMARY KEY (ProcessId, LocationId, VersionNumber)
) PUT VariableDocument IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

CREATE TABLE AeAlarm (
   ProcessId INT8 NOT NULL,
   LocationPathId INT NOT NULL,
   Deadline DATETIME YEAR TO SECOND NOT NULL,
   DeadlineMillis INT8 NOT NULL,
   GroupId INT NOT NULL,
   AlarmId INT8 NOT NULL,
   FOREIGN KEY (ProcessId) REFERENCES AeProcess(ProcessId) ON DELETE CASCADE,
   PRIMARY KEY (ProcessId, LocationPathId, AlarmId)
) LOCK MODE ROW;

CREATE TABLE AeQueuedReceive (
   QueuedReceiveId INT NOT NULL,
   ProcessId INT8 NOT NULL,
   LocationPathId INT NOT NULL,
   Operation VARCHAR(255) NOT NULL,
   PartnerLinkName VARCHAR(255) NOT NULL,
   PortTypeNamespace VARCHAR(255) NOT NULL,
   PortTypeLocalPart VARCHAR(255) NOT NULL,
   CorrelationProperties CLOB NOT NULL,
   MatchHash INT NOT NULL,
   CorrelateHash INT NOT NULL,
   GroupId INT NOT NULL,
   PartnerLinkId INT NOT NULL,
   AllowsConcurrency SMALLINT NOT NULL,
   FOREIGN KEY (ProcessId) REFERENCES AeProcess(ProcessId) ON DELETE CASCADE,
   PRIMARY KEY (QueuedReceiveId)
) PUT CorrelationProperties IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

CREATE TABLE AeProcessJournal (
   JournalId INT8 NOT NULL,
   ProcessId INT8 NOT NULL,
   Counter SERIAL8 NOT NULL,
   LocationId INT NOT NULL,
   EntryType SMALLINT NOT NULL,
   EntryDocument CLOB,
   FOREIGN KEY (ProcessId) REFERENCES AeProcess(ProcessId) ON DELETE CASCADE,
   PRIMARY KEY (JournalId)
) PUT EntryDocument IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

CREATE TABLE AeURNValues (
   URN VARCHAR(255) NOT NULL,
   URL CLOB NOT NULL,
   PRIMARY KEY (URN)
) PUT URL IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

CREATE TABLE AeCoordination
(
   CoordinationPk INT NOT NULL,
   CoordinationType VARCHAR(255) NOT NULL,
   CoordinationRole INT NOT NULL,
   CoordinationId VARCHAR(255) NOT NULL,
   State VARCHAR(255) NOT NULL,
   ProcessId INT8 NOT NULL,
   LocationPath LVARCHAR(4000) NOT NULL,
   CoordinationDocument CLOB,
   StartDate DATETIME YEAR TO SECOND,
   ModifiedDate DATETIME YEAR TO SECOND,
   FOREIGN KEY (ProcessId) REFERENCES AeProcess(ProcessId) ON DELETE CASCADE,
   PRIMARY KEY (CoordinationPk)
) PUT CoordinationDocument IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

CREATE TABLE AeTransmissionTracker
(
   TransmissionId INT8 NOT NULL,
   State INT NOT NULL,
   MessageId  VARCHAR(255),
   PRIMARY KEY (TransmissionId)
) LOCK MODE ROW;

CREATE TABLE AeProcessAttachment (
   AttachmentGroupId INT8 NOT NULL,
   ProcessId INT8,
   PRIMARY KEY (AttachmentGroupId),
   FOREIGN Key (ProcessId) REFERENCES AeProcess (ProcessId) ON DELETE CASCADE
) LOCK MODE ROW;

CREATE TABLE AeAttachment (
   AttachmentGroupId INT8 NOT NULL,
   AttachmentItemId INT8 NOT NULL,
   AttachmentHeader CLOB,
   AttachmentContent BLOB NOT NULL,
   PRIMARY KEY (AttachmentItemId),
   FOREIGN Key (AttachmentGroupId) REFERENCES AeProcessAttachment (AttachmentGroupId) ON DELETE CASCADE
) PUT AttachmentHeader IN (ae_clob_space), 
      AttachmentContent IN (ae_clob_space) (LOG)
  LOCK MODE ROW;

