-- Source: https://github.com/javpla/openfire/blob/c0c6cda099c51e99db707d7bf1d9e258db2b4917/src/database/openfire_oracle.sql?raw=true
-- Tables detected: 34 | FK constraints: 1

CREATE TABLE ofUser (
  username              VARCHAR2(64)     NOT NULL,
  plainPassword         VARCHAR2(32),
  encryptedPassword     VARCHAR2(255),
  name                  VARCHAR2(100),
  email                 VARCHAR2(100),
  creationDate          CHAR(15)        NOT NULL,
  modificationDate      CHAR(15)        NOT NULL,
  CONSTRAINT ofUser_pk PRIMARY KEY (username)
);

CREATE TABLE ofUserProp (
  username              VARCHAR2(64)    NOT NULL,
  name                  VARCHAR2(100)   NOT NULL,
  propValue             VARCHAR2(1024)  NOT NULL,
  CONSTRAINT ofUserProp_pk PRIMARY KEY (username, name)
);

CREATE TABLE ofUserFlag (
  username              VARCHAR2(64)    NOT NULL,
  name                  VARCHAR2(100)   NOT NULL,
  startTime             CHAR(15),
  endTime               CHAR(15),
  CONSTRAINT ofUserFlag_pk PRIMARY KEY (username, name)
);

CREATE TABLE ofPrivate (
  username              VARCHAR2(64)    NOT NULL,
  name                  VARCHAR2(100)   NOT NULL,
  namespace             VARCHAR2(200)   NOT NULL,
  privateData           LONG            NOT NULL,
  CONSTRAINT ofPrivate_pk PRIMARY KEY (username, name, namespace)
);

CREATE TABLE ofOffline (
  username              VARCHAR2(64)    NOT NULL,
  messageID             INTEGER         NOT NULL,
  creationDate          CHAR(15)        NOT NULL,
  messageSize           INTEGER         NOT NULL,
  stanza                LONG            NOT NULL,
  CONSTRAINT ofOffline_pk PRIMARY KEY (username, messageID)
);

CREATE TABLE ofPresence (
  username              VARCHAR2(64)    NOT NULL,
  offlinePresence       LONG,
  offlineDate           CHAR(15)        NOT NULL,
  CONSTRAINT ofPresence_pk PRIMARY KEY (username)
);

CREATE TABLE ofRoster (
  rosterID              INTEGER         NOT NULL,
  username              VARCHAR2(64)    NOT NULL,
  jid                   VARCHAR2(1024)  NOT NULL,
  sub                   INTEGER         NOT NULL,
  ask                   INTEGER         NOT NULL,
  recv                  INTEGER         NOT NULL,
  nick                  VARCHAR2(255),
  CONSTRAINT ofRoster_pk PRIMARY KEY (rosterID)
);

CREATE TABLE ofRosterGroups (
  rosterID              INTEGER         NOT NULL,
  rank                  INTEGER         NOT NULL,
  groupName             VARCHAR2(255)   NOT NULL,
  CONSTRAINT ofRosterGroups_pk PRIMARY KEY (rosterID, rank)
);

CREATE TABLE ofVCard (
  username              VARCHAR2(64)    NOT NULL,
  vcard                 LONG            NOT NULL,
  CONSTRAINT ofVCard_pk PRIMARY KEY (username)
);

CREATE TABLE ofGroup (
  groupName             VARCHAR2(50)    NOT NULL,
  description           VARCHAR2(255),
  CONSTRAINT ofGroup_pk PRIMARY KEY (groupName)
);

CREATE TABLE ofGroupProp (
  groupName             VARCHAR(50)     NOT NULL,
  name                  VARCHAR2(100)   NOT NULL,
  propValue             VARCHAR2(4000)  NOT NULL,
  CONSTRAINT ofGroupProp_pk PRIMARY KEY (groupName, name)
);

CREATE TABLE ofGroupUser (
  groupName             VARCHAR(50)     NOT NULL,
  username              VARCHAR2(100)   NOT NULL,
  administrator         INTEGER         NOT NULL,
  CONSTRAINT ofGroupUser_pk PRIMARY KEY (groupName, username, administrator)
);

CREATE TABLE ofID (
  idType                INTEGER         NOT NULL,
  id                    INTEGER         NOT NULL,
  CONSTRAINT ofID_pk PRIMARY KEY (idType)
);

CREATE TABLE ofProperty (
  name        VARCHAR2(100) NOT NULL,
  propValue   VARCHAR2(4000) NOT NULL,
  CONSTRAINT ofProperty_pk PRIMARY KEY (name)
);

CREATE TABLE ofVersion (
  name     VARCHAR2(50)  NOT NULL,
  version  INTEGER  NOT NULL,
  CONSTRAINT ofVersion_pk PRIMARY KEY (name)
);

CREATE TABLE ofExtComponentConf (
  subdomain             VARCHAR2(255)    NOT NULL,
  wildcard              INTEGER          NOT NULL,
  secret                VARCHAR2(255),
  permission            VARCHAR2(10)     NOT NULL,
  CONSTRAINT ofExtComponentConf_pk PRIMARY KEY (subdomain)
);

CREATE TABLE ofRemoteServerConf (
  xmppDomain            VARCHAR2(255)    NOT NULL,
  remotePort            INTEGER,
  permission            VARCHAR2(10)     NOT NULL,
  CONSTRAINT ofRemoteServerConf_pk PRIMARY KEY (xmppDomain)
);

CREATE TABLE ofPrivacyList (
  username              VARCHAR2(64)    NOT NULL,
  name                  VARCHAR2(100)   NOT NULL,
  isDefault             INTEGER         NOT NULL,
  list                  LONG            NOT NULL,
  CONSTRAINT ofPrivacyList_pk PRIMARY KEY (username, name)
);

CREATE TABLE ofSASLAuthorized (
  username            VARCHAR(64)   NOT NULL,
  principal           VARCHAR(4000) NOT NULL,
  CONSTRAINT ofSASLAuthorized_pk PRIMARY KEY (username, principal)
);

CREATE TABLE ofSecurityAuditLog (
  msgID                 INTEGER         NOT NULL,
  username              VARCHAR2(64)    NOT NULL,
  entryStamp            INTEGER         NOT NULL,
  summary               VARCHAR2(255)   NOT NULL,
  node                  VARCHAR2(255)   NOT NULL,
  details               VARCHAR2(4000),
  CONSTRAINT ofSecurityAuditLog_pk PRIMARY KEY (msgID)
);

CREATE TABLE ofMucService (
  serviceID           INT           NOT NULL,
  subdomain           VARCHAR2(255) NOT NULL,
  description         VARCHAR2(255),
  isHidden            INTEGER       NOT NULL,
  CONSTRAINT ofMucService_pk PRIMARY KEY (subdomain)
);

CREATE TABLE ofMucServiceProp (
  serviceID           INT           NOT NULL,
  name                VARCHAR2(100) NOT NULL,
  propValue           VARCHAR2(1024) NOT NULL,
  CONSTRAINT ofMucServiceProp_pk PRIMARY KEY (serviceID, name)
);

CREATE TABLE ofMucRoom(
  serviceID           INT           NOT NULL,
  roomID              INT           NOT NULL,
  creationDate        CHAR(15)      NOT NULL,
  modificationDate    CHAR(15)      NOT NULL,
  name                VARCHAR2(50)  NOT NULL,
  naturalName         VARCHAR2(255) NOT NULL,
  description         VARCHAR2(255),
  lockedDate          CHAR(15)      NOT NULL,
  emptyDate           CHAR(15)      NULL,
  canChangeSubject    INTEGER       NOT NULL,
  maxUsers            INTEGER       NOT NULL,
  publicRoom          INTEGER       NOT NULL,
  moderated           INTEGER       NOT NULL,
  membersOnly         INTEGER       NOT NULL,
  canInvite           INTEGER       NOT NULL,
  roomPassword        VARCHAR2(50)  NULL,
  canDiscoverJID      INTEGER       NOT NULL,
  logEnabled          INTEGER       NOT NULL,
  subject             VARCHAR2(100) NULL,
  rolesToBroadcast    INTEGER       NOT NULL,
  useReservedNick     INTEGER       NOT NULL,
  canChangeNick       INTEGER       NOT NULL,
  canRegister         INTEGER       NOT NULL,
  CONSTRAINT ofMucRoom_pk PRIMARY KEY (serviceID, name)
);

CREATE TABLE ofMucRoomProp (
  roomID                INT             NOT NULL,
  name                  VARCHAR2(100)   NOT NULL,
  propValue             VARCHAR2(1024)  NOT NULL,
  CONSTRAINT ofMucRoomProp_pk PRIMARY KEY (roomID, name)
);

CREATE TABLE ofMucAffiliation (
  roomID              INT            NOT NULL,
  jid                 VARCHAR2(1024) NOT NULL,
  affiliation         INTEGER        NOT NULL,
  CONSTRAINT ofMucAffiliation_pk PRIMARY KEY (roomID, jid)
);

CREATE TABLE ofMucMember (
  roomID              INT            NOT NULL,
  jid                 VARCHAR2(1024) NOT NULL,
  nickname            VARCHAR2(255)  NULL,
  firstName           VARCHAR2(100)  NULL,
  lastName            VARCHAR2(100)  NULL,
  url                 VARCHAR2(100)  NULL,
  email               VARCHAR2(100)  NULL,
  faqentry            VARCHAR2(100)  NULL,
  CONSTRAINT ofMucMember_pk PRIMARY KEY (roomID, jid)
);

CREATE TABLE ofMucConversationLog (
  roomID              INT            NOT NULL,
  sender              VARCHAR2(1024) NOT NULL,
  nickname            VARCHAR2(255)  NULL,
  logTime             CHAR(15)       NOT NULL,
  subject             VARCHAR2(255)  NULL,
  body                VARCHAR2(4000) NULL
);

CREATE TABLE ofPubsubNode (
  serviceID           VARCHAR2(100)  NOT NULL,
  nodeID              VARCHAR2(100)  NOT NULL,
  leaf                INTEGER        NOT NULL,
  creationDate        CHAR(15)       NOT NULL,
  modificationDate    CHAR(15)       NOT NULL,
  parent              VARCHAR2(100)  NULL,
  deliverPayloads     INTEGER        NOT NULL,
  maxPayloadSize      INTEGER        NULL,
  persistItems        INTEGER        NULL,
  maxItems            INTEGER        NULL,
  notifyConfigChanges INTEGER        NOT NULL,
  notifyDelete        INTEGER        NOT NULL,
  notifyRetract       INTEGER        NOT NULL,
  presenceBased       INTEGER        NOT NULL,
  sendItemSubscribe   INTEGER        NOT NULL,
  publisherModel      VARCHAR2(15)   NOT NULL,
  subscriptionEnabled INTEGER        NOT NULL,
  configSubscription  INTEGER        NOT NULL,
  accessModel         VARCHAR2(10)   NOT NULL,
  payloadType         VARCHAR2(100)  NULL,
  bodyXSLT            VARCHAR2(100)  NULL,
  dataformXSLT        VARCHAR2(100)  NULL,
  creator             VARCHAR2(1024) NOT NULL,
  description         VARCHAR2(255)  NULL,
  language            VARCHAR2(255)  NULL,
  name                VARCHAR2(50)   NULL,
  replyPolicy         VARCHAR2(15)   NULL,
  associationPolicy   VARCHAR2(15)   NULL,
  maxLeafNodes        INTEGER        NULL,
  CONSTRAINT ofPubsubNode_pk PRIMARY KEY (serviceID, nodeID)
);

CREATE TABLE ofPubsubNodeJIDs (
  serviceID           VARCHAR2(100)  NOT NULL,
  nodeID              VARCHAR2(100)  NOT NULL,
  jid                 VARCHAR2(1024) NOT NULL,
  associationType     VARCHAR2(20)   NOT NULL,
  CONSTRAINT ofPubsubNodeJIDs_pk PRIMARY KEY (serviceID, nodeID, jid)
);

CREATE TABLE ofPubsubNodeGroups (
  serviceID           VARCHAR2(100)  NOT NULL,
  nodeID              VARCHAR2(100)  NOT NULL,
  rosterGroup         VARCHAR2(100)  NOT NULL
);

CREATE TABLE ofPubsubAffiliation (
  serviceID           VARCHAR2(100)  NOT NULL,
  nodeID              VARCHAR2(100)  NOT NULL,
  jid                 VARCHAR2(1024) NOT NULL,
  affiliation         VARCHAR2(10)   NOT NULL,
  CONSTRAINT ofPubsubAffiliation_pk PRIMARY KEY (serviceID, nodeID, jid)
);

CREATE TABLE ofPubsubItem (
  serviceID           VARCHAR2(100)  NOT NULL,
  nodeID              VARCHAR2(100)  NOT NULL,
  id                  VARCHAR2(100)  NOT NULL,
  jid                 VARCHAR2(1024) NOT NULL,
  creationDate        CHAR(15)       NOT NULL,
  payload             VARCHAR(4000)  NULL,
  CONSTRAINT ofPubsubItem_pk PRIMARY KEY (serviceID, nodeID, id)
);

CREATE TABLE ofPubsubSubscription (
  serviceID           VARCHAR2(100)  NOT NULL,
  nodeID              VARCHAR2(100)  NOT NULL,
  id                  VARCHAR2(100)  NOT NULL,
  jid                 VARCHAR2(1024) NOT NULL,
  owner               VARCHAR2(1024) NOT NULL,
  state               VARCHAR(15)    NOT NULL,
  deliver             INTEGER        NOT NULL,
  digest              INTEGER        NOT NULL,
  digest_frequency    INTEGER        NOT NULL,
  expire              CHAR(15)       NULL,
  includeBody         INTEGER        NOT NULL,
  showValues          VARCHAR(30)    NOT NULL,
  subscriptionType    VARCHAR(10)    NOT NULL,
  subscriptionDepth   INTEGER        NOT NULL,
  keyword             VARCHAR2(200)  NULL,
  CONSTRAINT ofPubsubSubscription_pk PRIMARY KEY (serviceID, nodeID, id)
);

CREATE TABLE ofPubsubDefaultConf (
  serviceID           VARCHAR2(100) NOT NULL,
  leaf                INTEGER       NOT NULL,
  deliverPayloads     INTEGER       NOT NULL,
  maxPayloadSize      INTEGER       NOT NULL,
  persistItems        INTEGER       NOT NULL,
  maxItems            INTEGER       NOT NULL,
  notifyConfigChanges INTEGER       NOT NULL,
  notifyDelete        INTEGER       NOT NULL,
  notifyRetract       INTEGER       NOT NULL,
  presenceBased       INTEGER       NOT NULL,
  sendItemSubscribe   INTEGER       NOT NULL,
  publisherModel      VARCHAR2(15)  NOT NULL,
  subscriptionEnabled INTEGER       NOT NULL,
  accessModel         VARCHAR2(10)  NOT NULL,
  language            VARCHAR2(255) NULL,
  replyPolicy         VARCHAR2(15)  NULL,
  associationPolicy   VARCHAR2(15)  NOT NULL,
  maxLeafNodes        INTEGER       NOT NULL,
  CONSTRAINT ofPubsubDefaultConf_pk PRIMARY KEY (serviceID, leaf)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ofRosterGroups ADD CONSTRAINT ofRosterGroups_rosterID_fk FOREIGN KEY (rosterID) REFERENCES ofRoster INITIALLY DEFERRED DEFERRABLE;

