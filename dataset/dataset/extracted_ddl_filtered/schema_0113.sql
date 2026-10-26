-- Source: https://github.com/shubhamoscar/OpenfirePlugin/blob/83b4ef33d8f7380a014be3c29bdc5d7519709938/database/openfire_sybase.sql?raw=true
-- Tables detected: 34 | FK/REFERENCES mentions: 2

CREATE TABLE ofUser (
  username NVARCHAR(64) NOT NULL,
  plainPassword NVARCHAR(32) NULL,
  encryptedPassword NVARCHAR(255) NULL,
  name NVARCHAR(100) NULL,
  email VARCHAR(100) NULL,
  creationDate CHAR(15) NOT NULL,
  modificationDate CHAR(15) NOT NULL,
  preference NUMBER(1) NOT NULL,
  CONSTRAINT ofUser_pk PRIMARY KEY (username)
);

CREATE TABLE ofUserProp (
  username NVARCHAR(64) NOT NULL,
  name NVARCHAR(100) NOT NULL,
  propValue TEXT NOT NULL,
  CONSTRAINT ofUserProp_pk PRIMARY KEY (username, name)
);

CREATE TABLE ofUserFlag (
  username NVARCHAR(64) NOT NULL,
  name NVARCHAR(100) NOT NULL,
  startTime CHAR(15),
  endTime CHAR(15),
  CONSTRAINT ofUserFlag_pk PRIMARY KEY (username, name)
);

CREATE TABLE ofPrivate (
  username NVARCHAR(64) NOT NULL,
  name NVARCHAR(100) NOT NULL,
  namespace NVARCHAR(200) NOT NULL,
  privateData TEXT NOT NULL,
  CONSTRAINT ofPrivate_pk PRIMARY KEY (username, name, namespace)
);

CREATE TABLE ofOffline (
  username NVARCHAR(64) NOT NULL,
  messageID INTEGER NOT NULL,
  creationDate CHAR(15) NOT NULL,
  messageSize INTEGER NOT NULL,
  stanza TEXT NOT NULL,
  CONSTRAINT ofOffline_pk PRIMARY KEY (username, messageID)
);

CREATE TABLE ofPresence (
  username NVARCHAR(64) NOT NULL,
  offlinePresence TEXT,
  offlineDate CHAR(15) NOT NULL,
  CONSTRAINT ofPresence_pk PRIMARY KEY (username)
);

CREATE TABLE ofRoster (
  rosterID INTEGER NOT NULL,
  username NVARCHAR(64) NOT NULL,
  jid TEXT NOT NULL,
  sub INTEGER NOT NULL,
  ask INTEGER NOT NULL,
  recv INTEGER NOT NULL,
  nick NVARCHAR(255) NULL,
  CONSTRAINT ofRoster_pk PRIMARY KEY (rosterID)
);

CREATE TABLE ofRosterGroups (
  rosterID INTEGER NOT NULL,
  rank INTEGER NOT NULL,
  groupName NVARCHAR(255) NOT NULL,
  CONSTRAINT ofRosterGroups_pk PRIMARY KEY (rosterID, rank)
);

CREATE TABLE ofVCard (
  username NVARCHAR(64) NOT NULL,
  vcard TEXT NOT NULL,
  CONSTRAINT ofVCard_pk PRIMARY KEY (username)
);

CREATE TABLE ofGroup (
  groupName NVARCHAR(50) NOT NULL,
  description NVARCHAR(255) NULL,
  CONSTRAINT ofGroup_pk PRIMARY KEY (groupName)
);

CREATE TABLE ofGroupProp (
   groupName NVARCHAR(50) NOT NULL,
   name NVARCHAR(100) NOT NULL,
   propValue TEXT NOT NULL,
   CONSTRAINT ofGroupProp_pk PRIMARY KEY (groupName, name)
);

CREATE TABLE ofGroupUser (
  groupName NVARCHAR(50) NOT NULL,
  username NVARCHAR(100) NOT NULL,
  administrator INTEGER NOT NULL,
  CONSTRAINT ofGroupUser_pk PRIMARY KEY (groupName, username, administrator)
);

CREATE TABLE ofID (
  idType INTEGER NOT NULL,
  id INTEGER NOT NULL,
  CONSTRAINT ofID_pk PRIMARY KEY (idType)
);

CREATE TABLE ofProperty (
  name NVARCHAR(100) NOT NULL,
  propValue TEXT NOT NULL,
  CONSTRAINT ofProperty_pk PRIMARY KEY (name)
);

CREATE TABLE ofVersion (
  name NVARCHAR(50) NOT NULL,
  version INTEGER NOT NULL,
  CONSTRAINT ofVersion_pk PRIMARY KEY (name)
);

CREATE TABLE ofExtComponentConf (
  subdomain NVARCHAR(255) NOT NULL,
  wildcard INT NOT NULL,
  secret NVARCHAR(255) NULL,
  permission NVARCHAR(10) NOT NULL,
  CONSTRAINT ofExtComponentConf_pk PRIMARY KEY (subdomain)
);

CREATE TABLE ofRemoteServerConf (
  xmppDomain NVARCHAR(255) NOT NULL,
  remotePort INTEGER NULL,
  permission NVARCHAR(10) NOT NULL,
  CONSTRAINT ofRemoteServerConf_pk PRIMARY KEY (xmppDomain)
);

CREATE TABLE ofPrivacyList (
  username NVARCHAR(64) NOT NULL,
  name NVARCHAR(100) NOT NULL,
  isDefault INT NOT NULL,
  list TEXT NOT NULL,
  CONSTRAINT ofPrivacyList_pk PRIMARY KEY (username, name)
);

CREATE TABLE ofSASLAuthorized (
  username NVARCHAR(64) NOT NULL,
  principal NVARCHAR(4000) NOT NULL,
  CONSTRAINT ofSASLAuthorized_pk PRIMARY KEY (username, principal)
);

CREATE TABLE ofSecurityAuditLog (
  msgID INTEGER NOT NULL,
  username NVARCHAR(64) NOT NULL,
  entryStamp INTEGER NOT NULL,
  summary NVARCHAR(255) NOT NULL,
  node NVARCHAR(255) NOT NULL,
  details TEXT,
  CONSTRAINT ofSecurityAuditLog_pk PRIMARY KEY (msgID)
);

CREATE TABLE ofMucService (
  serviceID INT NOT NULL,
  subdomain NVARCHAR(255) NOT NULL,
  description NVARCHAR(255),
  isHidden INT NOT NULL,
  CONSTRAINT ofMucService_pk PRIMARY KEY (subdomain)
);

CREATE TABLE ofMucServiceProp (
  serviceID INT NOT NULL,
  name NVARCHAR(100) NOT NULL,
  propValue TEXT NOT NULL,
  CONSTRAINT ofMucServiceProp_pk PRIMARY KEY (serviceID, name)
);

CREATE TABLE ofMucRoom (
  serviceID INT NOT NULL,
  roomID INT NOT NULL,
  creationDate CHAR(15) NOT NULL,
  modificationDate CHAR(15) NOT NULL,
  name NVARCHAR(50) NOT NULL,
  naturalName NVARCHAR(255) NOT NULL,
  description NVARCHAR(255) NULL,
  lockedDate CHAR(15) NOT NULL,
  emptyDate CHAR(15) NULL,
  canChangeSubject INT NOT NULL,
  maxUsers INT NOT NULL,
  publicRoom INT NOT NULL,
  moderated INT NOT NULL,
  membersOnly INT NOT NULL,
  canInvite INT NOT NULL,
  roomPassword NVARCHAR(50) NULL,
  canDiscoverJID INT NOT NULL,
  logEnabled INT NOT NULL,
  subject NVARCHAR(100) NULL,
  rolesToBroadcast INT NOT NULL,
  useReservedNick INT NOT NULL,
  canChangeNick INT NOT NULL,
  canRegister INT NOT NULL,
  CONSTRAINT ofMucRoom_pk PRIMARY KEY (serviceID, name)
);

CREATE TABLE ofMucRoomProp (
  roomID INT NOT NULL,
  name NVARCHAR(100) NOT NULL,
  propValue TEXT NOT NULL,
  CONSTRAINT ofMucRoomProp_pk PRIMARY KEY (roomID, name)
);

CREATE TABLE ofMucAffiliation (
  roomID INT NOT NULL,
  jid VARCHAR(255) NOT NULL,
  affiliation INT NOT NULL,
  CONSTRAINT ofMucAffiliation_pk PRIMARY KEY (roomID,jid)
);

CREATE TABLE ofMucMember (
  roomID INT NOT NULL,
  jid NVARCHAR(255) NOT NULL,
  nickname NVARCHAR(255) NULL,
  firstName NVARCHAR(100) NULL,
  lastName NVARCHAR(100) NULL,
  url NVARCHAR(100) NULL,
  email NVARCHAR(100) NULL,
  faqentry NVARCHAR(100) NULL,
  CONSTRAINT ofMucMember_pk PRIMARY KEY (roomID,jid)
);

CREATE TABLE ofMucConversationLog (
  roomID INT NOT NULL,
  sender TEXT NOT NULL,
  nickname NVARCHAR(255) NULL,
  logTime CHAR(15) NOT NULL,
  subject NVARCHAR(255) NULL,
  body TEXT NULL
);

CREATE TABLE ofPubsubNode (
  serviceID NVARCHAR(100) NOT NULL,
  nodeID NVARCHAR(100) NOT NULL,
  leaf INT NOT NULL,
  creationDate CHAR(15) NOT NULL,
  modificationDate CHAR(15) NOT NULL,
  parent NVARCHAR(100) NULL,
  deliverPayloads INT NOT NULL,
  maxPayloadSize INT NULL,
  persistItems INT NULL,
  maxItems INT NULL,
  notifyConfigChanges INT NOT NULL,
  notifyDelete INT NOT NULL,
  notifyRetract INT NOT NULL,
  presenceBased INT NOT NULL,
  sendItemSubscribe INT NOT NULL,
  publisherModel NVARCHAR(15) NOT NULL,
  subscriptionEnabled INT NOT NULL,
  configSubscription INT NOT NULL,
  accessModel NVARCHAR(10) NOT NULL,
  payloadType NVARCHAR(100) NULL,
  bodyXSLT NVARCHAR(100) NULL,
  dataformXSLT NVARCHAR(100) NULL,
  creator NVARCHAR(1024) NOT NULL,
  description NVARCHAR(255) NULL,
  language NVARCHAR(255) NULL,
  name NVARCHAR(50) NULL,
  replyPolicy NVARCHAR(15) NULL,
  associationPolicy NVARCHAR(15) NULL,
  maxLeafNodes INT NULL,
  CONSTRAINT ofPubsubNode_pk PRIMARY KEY (serviceID, nodeID)
);

CREATE TABLE ofPubsubNodeJIDs (
  serviceID NVARCHAR(100) NOT NULL,
  nodeID NVARCHAR(100) NOT NULL,
  jid NVARCHAR(1024) NOT NULL,
  associationType NVARCHAR(20) NOT NULL,
  CONSTRAINT ofPubsubNodeJIDs_pk PRIMARY KEY (serviceID, nodeID, jid)
);

CREATE TABLE ofPubsubNodeGroups (
  serviceID NVARCHAR(100) NOT NULL,
  nodeID NVARCHAR(100) NOT NULL,
  rosterGroup NVARCHAR(100) NOT NULL
);

CREATE TABLE ofPubsubAffiliation (
  serviceID NVARCHAR(100) NOT NULL,
  nodeID NVARCHAR(100) NOT NULL,
  jid NVARCHAR(1024) NOT NULL,
  affiliation NVARCHAR(10) NOT NULL,
  CONSTRAINT ofPubsubAffiliation_pk PRIMARY KEY (serviceID, nodeID, jid)
);

CREATE TABLE ofPubsubItem (
  serviceID NVARCHAR(100) NOT NULL,
  nodeID NVARCHAR(100) NOT NULL,
  id NVARCHAR(100) NOT NULL,
  jid NVARCHAR(1024) NOT NULL,
  creationDate CHAR(15) NOT NULL,
  payload TEXT NULL,
  CONSTRAINT ofPubsubItem_pk PRIMARY KEY (serviceID, nodeID, id)
);

CREATE TABLE ofPubsubSubscription (
  serviceID NVARCHAR(100) NOT NULL,
  nodeID NVARCHAR(100) NOT NULL,
  id NVARCHAR(100) NOT NULL,
  jid NVARCHAR(1024) NOT NULL,
  owner NVARCHAR(1024) NOT NULL,
  state NVARCHAR(15) NOT NULL,
  deliver INT NOT NULL,
  digest INT NOT NULL,
  digest_frequency INT NOT NULL,
  expire CHAR(15) NULL,
  includeBody INT NOT NULL,
  showValues NVARCHAR(30) NOT NULL,
  subscriptionType NVARCHAR(10) NOT NULL,
  subscriptionDepth INT NOT NULL,
  keyword NVARCHAR(200) NULL,
  CONSTRAINT ofPubsubSubscription_pk PRIMARY KEY (serviceID, nodeID, id)
);

CREATE TABLE ofPubsubDefaultConf (
  serviceID NVARCHAR(100) NOT NULL,
  leaf INT NOT NULL,
  deliverPayloads INT NOT NULL,
  maxPayloadSize INT NOT NULL,
  persistItems INT NOT NULL,
  maxItems INT NOT NULL,
  notifyConfigChanges INT NOT NULL,
  notifyDelete INT NOT NULL,
  notifyRetract INT NOT NULL,
  presenceBased INT NOT NULL,
  sendItemSubscribe INT NOT NULL,
  publisherModel NVARCHAR(15) NOT NULL,
  subscriptionEnabled INT NOT NULL,
  accessModel NVARCHAR(10) NOT NULL,
  language NVARCHAR(255) NULL,
  replyPolicy NVARCHAR(15) NULL,
  associationPolicy NVARCHAR(15) NOT NULL,
  maxLeafNodes INT NOT NULL,
  CONSTRAINT ofPubsubDefaultConf_pk PRIMARY KEY (serviceID, leaf)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ofRosterGroups ADD CONSTRAINT ofRosterGroups_rosterID_fk FOREIGN KEY (rosterID) REFERENCES ofRoster;

