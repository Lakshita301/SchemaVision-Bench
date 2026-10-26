-- Source: https://github.com/DAINTINESS-Group/Schema_Evolution_Datasets/blob/9a5b20bd52424fc31e41d22c50f3847e1c7574ad/SchemaEvolutionDatasets2017/CERN/EGEE/mySQL/processed%20schemata/rev_1.10.sql?raw=true
-- Tables detected: 8 | FK constraints: 1
--
-- Name of the channel
--
-- Source Site name
--
-- Destination Site name
--
-- Email contact of the channel responsibile
--
-- Maximum bandwidth, capacity, in Mbits/s
--
-- The target number of concurrent streams on the network
--
-- The target number of concurrent files on the network
--
-- The target throughput for the system (Mbits/s)
--
-- The state of the channel ("Active", "Inactive", "Drain", "Stopped")
--
-- The date the channel was last active
--
-- the name of the channel
--
-- The name of the VO
--
-- The percentage of the channel resources associated to the VO
--
-- Set primary key
--
-- the name of the channel
--
-- The principal name
--
-- Set Primary Key
--
-- the job_id is a IETF UUID in string form.
--
-- The state a job is currently in
--
-- Transport specific parameters
--
-- Source Site/SE name - the source cluster name
--
-- Dest Site/SE name - the destination cluster name
--
-- the DN of the user starting the job - they are the only one
-- who can sumbit/cancel
--
-- the DN of the agent currently servicing the job
--
-- the user credentials passphrase. This is passed to the movement service in
-- order to retrieve the appropriate user proxy to do the transfers
--
-- Blob to store user capabilites and groups
--
-- The VO that owns this job
--
-- the name of the transfer channel for this job
--
-- The reason the job is in the current state
--
-- The date that the job was submitted
--
-- Priority for Intra-VO Scheduling
-- file_id is a unique identifier for a (source, destination) pair with a
-- job.  It is created automatically.
--
--
-- job_id (used in joins with file table)
--
-- The state of this file
--
-- The Source Logical Name
--
-- The Source
--
-- The Destination
--
-- The agent who is transferring the file. This is only valid when the file
-- is in 'Active' state
-- 
-- The class for the reason field
--
-- The reason the file is in this state
--
-- Number of Failures
--
-- the nominal size of the file (bytes)
--
-- the user-defined checksum of the file "checksum_type:checksum"
--
--
-- transfer request id
--
-- Identifier of the file to transfer
-- 
-- transfer identifier within the request. It could be used for ordering
--
-- The state of this file
--
-- The Source TURL
--
-- The Destination TURL
--
-- the time at which the file was transferred
--
-- the transfer duration in seconds
--
-- the number of bytes written to the destination
--
-- The class for the reason field
--
-- The reason the transfer is in this state
--
-- Set primary key
--
-- message_id is a unique identifier for the entry.
-- It is created automatically.
--
-- transfer request id
--
-- Identifier of the file to transfer
--
-- trace timestamp
--
-- trace content
-- 
-- Set Constraint
CREATE TABLE t_channel (
    channel_name VARCHAR(32) PRIMARY KEY NOT NULL,
    source_site VARCHAR(100) NOT NULL,
    dest_site VARCHAR(100) NOT NULL,
    contact VARCHAR(255),
    bandwidth INTEGER,
    nostreams INTEGER,
    nofiles INTEGER,
    nominal_throughput INTEGER,
    channel_state VARCHAR(30),
    last_active TIMESTAMP
) TYPE=INNODB;

CREATE TABLE t_channel_vo_share (
    channel_name VARCHAR(32) NOT NULL,
    vo_name VARCHAR(50) NOT NULL,
    channel_share INTEGER DEFAULT 0,
    PRIMARY KEY (channel_name, vo_name)
) TYPE=INNODB;

CREATE TABLE t_channel_acl (
    channel_name VARCHAR(32) NOT NULL,
    principal VARCHAR(255) NOT NULL,
    PRIMARY KEY (channel_name, principal)
);

CREATE TABLE t_job (
    job_id CHAR(36) NOT NULL PRIMARY KEY,
    job_state VARCHAR(13) NOT NULL,
    job_params VARCHAR(250),
    source VARCHAR(250),
    dest VARCHAR(250),
    user_dn TEXT NOT NULL,
    agent_dn TEXT NOT NULL,
    user_cred VARCHAR(250),
    voms_cred BYTEA,
    vo_name VARCHAR(50),
    channel_name VARCHAR(32)
                    	REFERENCES t_channel(channel_name),
    reason VARCHAR(255),
    submit_time TIMESTAMP,
    priority INTEGER DEFAULT 3
) TYPE=INNODB;

CREATE TABLE t_file (
    file_id INTEGER NOT NULL PRIMARY KEY,
    job_id CHAR(36) NOT NULL
                    	REFERENCES t_job(job_id),
    file_state VARCHAR(29) NOT NULL,
    logical_name TEXT,
    source_surl TEXT NOT NULL,
    dest_surl TEXT NOT NULL,
    agent_dn TEXT,
    reason_class VARCHAR(32),
    reason VARCHAR(255),
    num_failures INTEGER,
    filesize BIGINT,
    checksum VARCHAR(100)
) TYPE=INNODB;

CREATE TABLE t_transfer (
    request_id VARCHAR(255) NOT NULL,
    file_id INTEGER NOT NULL
		        REFERENCES t_file(file_id),
    transfer_id INTEGER NOT NULL,
    transfer_state VARCHAR(29) NOT NULL,
    source_turl TEXT,
    dest_turl TEXT,
    transfer_time TIMESTAMP(0),
    duration REAL,
    bytes_written INTEGER,
    reason_class VARCHAR(32),
    reason TEXT,
    PRIMARY KEY (request_id, file_id)
);

CREATE TABLE t_trace (
    trace_id INTEGER NOT NULL PRIMARY KEY,
    request_id VARCHAR(255),
    file_id INTEGER,
    trace_timestamp TIMESTAMP,
    content TEXT,
    FOREIGN KEY (request_id, file_id)
    REFERENCES t_transfer(request_id,file_id)
);

CREATE TABLE t_schema_vers (
    major INTEGER NOT NULL,
    minor INTEGER NOT NULL,
    patch INTEGER NOT NULL
) TYPE=INNODB;
