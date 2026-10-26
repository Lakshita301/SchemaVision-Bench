-- Source: https://github.com/DAINTINESS-Group/Schema_Evolution_Datasets/blob/9a5b20bd52424fc31e41d22c50f3847e1c7574ad/SchemaEvolutionDatasets2017/CERN/EGEE/mySQL/processed%20schemata/rev_1.10.sql?raw=true
-- Tables detected: 8 | FK constraints: 1

CREATE TABLE t_channel (
--
-- Name of the channel
   channel_name     	VARCHAR(32) PRIMARY KEY NOT NULL
--
-- Source Site name
   ,source_site        	VARCHAR(100) NOT NULL
--
-- Destination Site name
   ,dest_site        	VARCHAR(100) NOT NULL
--
-- Email contact of the channel responsibile
   ,contact         	VARCHAR(255)
--
-- Maximum bandwidth, capacity, in Mbits/s
   ,bandwidth       	INTEGER
--
-- The target number of concurrent streams on the network
   ,nostreams       	INTEGER
--
-- The target number of concurrent files on the network
   ,nofiles       	INTEGER
--
-- The target throughput for the system (Mbits/s)
   ,nominal_throughput	INTEGER
--
-- The state of the channel ("Active", "Inactive", "Drain", "Stopped")
   ,channel_state       VARCHAR(30)
--
-- The date the channel was last active
   ,last_active         DATETIME
) TYPE=INNODB;

CREATE TABLE t_channel_vo_share (
--
-- the name of the channel
   channel_name         VARCHAR(32) NOT NULL
--
-- The name of the VO
  ,vo_name              VARCHAR(50) NOT NULL
--
-- The percentage of the channel resources associated to the VO
   ,channel_share       INTEGER DEFAULT 0
--
-- Set primary key
   ,PRIMARY KEY (channel_name, vo_name)
) TYPE=INNODB;

CREATE TABLE t_channel_acl (
--
-- the name of the channel
   channel_name         VARCHAR(32) NOT NULL
--
-- The principal name
  ,principal            VARCHAR(255) NOT NULL
--
-- Set Primary Key
  ,PRIMARY KEY (channel_name, principal)
);

CREATE TABLE t_job (
--
-- the job_id is a IETF UUID in string form.
   job_id		CHAR(36) NOT NULL PRIMARY KEY
--
-- The state a job is currently in
  ,job_state       	VARCHAR(13) NOT NULL
--
-- Transport specific parameters
  ,job_params       	VARCHAR(250)
--
-- Source Site/SE name - the source cluster name
  ,source               VARCHAR(250)
--
-- Dest Site/SE name - the destination cluster name
  ,dest                 VARCHAR(250)
--
-- the DN of the user starting the job - they are the only one
-- who can sumbit/cancel
  ,user_dn          	TEXT NOT NULL
--
-- the DN of the agent currently servicing the job
  ,agent_dn         	TEXT NOT NULL
--
-- the user credentials passphrase. This is passed to the movement service in
-- order to retrieve the appropriate user proxy to do the transfers
  ,user_cred        	VARCHAR(250)
--
-- Blob to store user capabilites and groups
  ,voms_cred            BLOB
--
-- The VO that owns this job
  ,vo_name              VARCHAR(50)
--
-- the name of the transfer channel for this job
  ,channel_name     	VARCHAR(32)
                    	REFERENCES t_channel(channel_name)
--
-- The reason the job is in the current state
  ,reason           	VARCHAR(255)
--
-- The date that the job was submitted
  ,submit_time      	DATETIME
--
-- Priority for Intra-VO Scheduling
  ,priority      	INTEGER DEFAULT 3
) TYPE=INNODB;

CREATE TABLE t_file (
-- file_id is a unique identifier for a (source, destination) pair with a
-- job.  It is created automatically.
--
   file_id              INTEGER NOT NULL PRIMARY KEY
--
-- job_id (used in joins with file table)
   ,job_id		CHAR(36) NOT NULL
                    	REFERENCES t_job(job_id)
--
-- The state of this file
  ,file_state		VARCHAR(29) NOT NULL
--
-- The Source Logical Name
  ,logical_name      	TEXT
--
-- The Source
  ,source_surl      	TEXT NOT NULL
--
-- The Destination
  ,dest_surl		TEXT NOT NULL
--
-- The agent who is transferring the file. This is only valid when the file
-- is in 'Active' state
  ,agent_dn	        TEXT
-- 
-- The class for the reason field
  ,reason_class		VARCHAR(32)
--
-- The reason the file is in this state
  ,reason           	VARCHAR(255)
--
-- Number of Failures
  ,num_failures         INTEGER
--
-- the nominal size of the file (bytes)
  ,filesize         	BIGINT
--
-- the user-defined checksum of the file "checksum_type:checksum"
  ,checksum         	VARCHAR(100)
--
) TYPE=INNODB;

CREATE TABLE t_transfer (
--
-- transfer request id
   request_id           VARCHAR(255) NOT NULL
--
-- Identifier of the file to transfer
  ,file_id              INTEGER NOT NULL
		        REFERENCES t_file(file_id)
-- 
-- transfer identifier within the request. It could be used for ordering
  ,transfer_id          INTEGER NOT NULL
--
-- The state of this file
  ,transfer_state       VARCHAR(29) NOT NULL
--
-- The Source TURL
  ,source_turl          TEXT
--
-- The Destination TURL
  ,dest_turl            TEXT
--
-- the time at which the file was transferred
  ,transfer_time        TIMESTAMP(0)
--
-- the transfer duration in seconds
  ,duration             FLOAT
--
-- the number of bytes written to the destination
  ,bytes_written        INTEGER
--
-- The class for the reason field
  ,reason_class         VARCHAR(32)
--
-- The reason the transfer is in this state
  ,reason               TEXT
--
-- Set primary key
  ,PRIMARY KEY (request_id, file_id)
);

CREATE TABLE t_trace (
--
-- message_id is a unique identifier for the entry.
-- It is created automatically.
   trace_id	        INTEGER NOT NULL PRIMARY KEY
--
-- transfer request id
  ,request_id          VARCHAR(255)
--
-- Identifier of the file to transfer
  ,file_id             INTEGER
--
-- trace timestamp
  ,trace_timestamp     DATETIME
--
-- trace content
  ,content             TEXT
-- 
-- Set Constraint
  ,FOREIGN KEY (request_id, file_id)
    REFERENCES t_transfer(request_id,file_id)
);

CREATE TABLE t_schema_vers (
  major INTEGER NOT NULL,
  minor INTEGER NOT NULL,
  patch INTEGER NOT NULL
) TYPE=INNODB;

