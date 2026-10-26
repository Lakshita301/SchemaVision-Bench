-- Source: https://github.com/rohanmali/land/blob/0256b2cb9dfd80c632893e80624efb52d762c9ab/maintenance/mssql/tables.sql?raw=true
-- Tables detected: 48 | FK/REFERENCES mentions: 9

CREATE TABLE /*_*/mwuser (
   user_id           INT           NOT NULL  PRIMARY KEY IDENTITY(0,1),
   user_name         NVARCHAR(255)  NOT NULL UNIQUE DEFAULT '',
   user_real_name    NVARCHAR(255)  NOT NULL DEFAULT '',
   user_password     NVARCHAR(255)  NOT NULL DEFAULT '',
   user_newpassword  NVARCHAR(255)  NOT NULL DEFAULT '',
   user_newpass_time varchar(14) NULL DEFAULT NULL,
   user_email        NVARCHAR(255)  NOT NULL DEFAULT '',
   user_touched      varchar(14)      NOT NULL DEFAULT '',
   user_token        NCHAR(32)      NOT NULL DEFAULT '',
   user_email_authenticated varchar(14) DEFAULT NULL,
   user_email_token  NCHAR(32) DEFAULT '',
   user_email_token_expires varchar(14) DEFAULT NULL,
   user_registration varchar(14) DEFAULT NULL,
   user_editcount    INT NULL DEFAULT NULL,
   user_password_expires varchar(14) DEFAULT NULL
);

CREATE TABLE /*_*/user_groups (
   ug_user  INT     NOT NULL REFERENCES /*_*/mwuser(user_id) ON DELETE CASCADE,
   ug_group NVARCHAR(255) NOT NULL DEFAULT '',
);

CREATE TABLE /*_*/user_former_groups (
  ufg_user INT NOT NULL REFERENCES /*_*/mwuser(user_id) ON DELETE CASCADE,
  ufg_group nvarchar(255) NOT NULL default ''
);

CREATE TABLE /*_*/user_newtalk (
   user_id INT         NOT NULL REFERENCES /*_*/mwuser(user_id) ON DELETE CASCADE,
   user_ip NVARCHAR(40) NOT NULL DEFAULT '',
   user_last_timestamp varchar(14) DEFAULT NULL,
);

CREATE TABLE /*_*/user_properties (
	up_user INT NOT NULL REFERENCES /*_*/mwuser(user_id) ON DELETE CASCADE,
	up_property NVARCHAR(255) NOT NULL,
	up_value NVARCHAR(MAX),
);

CREATE TABLE /*_*/bot_passwords (
	bp_user int NOT NULL REFERENCES /*_*/mwuser(user_id) ON DELETE CASCADE,
	bp_app_id nvarchar(32) NOT NULL,
	bp_password nvarchar(255) NOT NULL,
	bp_token nvarchar(255) NOT NULL,
	bp_restrictions nvarchar(max) NOT NULL,
	bp_grants nvarchar(max) NOT NULL,
	PRIMARY KEY (bp_user, bp_app_id)
);

CREATE TABLE /*_*/page (
   page_id        INT          NOT NULL  PRIMARY KEY IDENTITY(0,1),
   page_namespace INT          NOT NULL,
   page_title     NVARCHAR(255)  NOT NULL,
   page_restrictions NVARCHAR(255) NOT NULL,
   page_is_redirect BIT           NOT NULL DEFAULT 0,
   page_is_new BIT                NOT NULL DEFAULT 0,
   page_random real     NOT NULL DEFAULT RAND(),
   page_touched varchar(14) NOT NULL default '',
   page_links_updated varchar(14) DEFAULT NULL,
   page_latest INT, -- FK inserted later
   page_len INT NOT NULL,
   page_content_model nvarchar(32) default null,
   page_lang VARBINARY(35) DEFAULT NULL
);

CREATE TABLE /*_*/revision (
   rev_id INT NOT NULL UNIQUE IDENTITY(0,1),
   rev_page INT NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,
   rev_text_id INT  NOT NULL, -- FK added later
   rev_comment NVARCHAR(255) NOT NULL,
   rev_user INT REFERENCES /*_*/mwuser(user_id) ON DELETE SET NULL,
   rev_user_text NVARCHAR(255) NOT NULL DEFAULT '',
   rev_timestamp varchar(14) NOT NULL default '',
   rev_minor_edit BIT NOT NULL DEFAULT 0,
   rev_deleted TINYINT  NOT NULL DEFAULT 0,
   rev_len INT,
   rev_parent_id INT DEFAULT NULL REFERENCES /*_*/revision(rev_id),
   rev_sha1 nvarchar(32) not null default '',
   rev_content_model nvarchar(32) default null,
   rev_content_format nvarchar(64) default null
);

CREATE TABLE /*_*/text (
   old_id INT NOT NULL  PRIMARY KEY IDENTITY(0,1),
   old_text nvarchar(max) NOT NULL,
   old_flags NVARCHAR(255) NOT NULL,
);

CREATE TABLE /*_*/archive (
   ar_id int NOT NULL PRIMARY KEY IDENTITY,
   ar_namespace SMALLINT NOT NULL DEFAULT 0,
   ar_title NVARCHAR(255) NOT NULL DEFAULT '',
   ar_text NVARCHAR(MAX) NOT NULL,
   ar_comment NVARCHAR(255) NOT NULL,
   ar_user INT CONSTRAINT ar_user__user_id__fk FOREIGN KEY REFERENCES /*_*/mwuser(user_id),
   ar_user_text NVARCHAR(255) NOT NULL,
   ar_timestamp varchar(14) NOT NULL default '',
   ar_minor_edit BIT NOT NULL DEFAULT 0,
   ar_flags NVARCHAR(255) NOT NULL,
   ar_rev_id INT NULL, -- NOT a FK, the row gets deleted from revision and moved here
   ar_text_id INT CONSTRAINT ar_text_id__old_id__fk FOREIGN KEY REFERENCES /*_*/text(old_id) ON DELETE CASCADE,
   ar_deleted TINYINT NOT NULL DEFAULT 0,
   ar_len INT,
   ar_page_id INT NULL, -- NOT a FK, the row gets deleted from page and moved here
   ar_parent_id INT NULL, -- NOT FK
   ar_sha1 nvarchar(32) default null,
   ar_content_model nvarchar(32) DEFAULT NULL,
  ar_content_format nvarchar(64) DEFAULT NULL
);

CREATE TABLE /*_*/pagelinks (
   pl_from INT NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,
   pl_from_namespace int NOT NULL DEFAULT 0,
   pl_namespace INT NOT NULL DEFAULT 0,
   pl_title NVARCHAR(255) NOT NULL DEFAULT '',
);

CREATE TABLE /*_*/templatelinks (
  tl_from int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,
  tl_from_namespace int NOT NULL default 0,
  tl_namespace int NOT NULL default 0,
  tl_title nvarchar(255) NOT NULL default ''
);

CREATE TABLE /*_*/imagelinks (
  -- Key to page_id of the page containing the image / media link.
  il_from int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,
  il_from_namespace int NOT NULL default 0,

  -- Filename of target image.
  -- This is also the page_title of the file's description page;

CREATE TABLE /*_*/categorylinks (
  -- Key to page_id of the page defined as a category member.
  cl_from int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,

  -- Name of the category.
  -- This is also the page_title of the category's description page;

CREATE TABLE /*_*/category (
  -- Primary key
  cat_id int NOT NULL PRIMARY KEY IDENTITY,

  -- Name of the category, in the same form as page_title (with underscores).
  -- If there is a category page corresponding to this category, by definition,
  -- it has this name (in the Category namespace).
  cat_title nvarchar(255) NOT NULL,

  -- The numbers of member pages (including categories and media), subcatego-
  -- ries, and Image: namespace members, respectively.  These are signed to
  -- make underflow more obvious.  We make the first number include the second
  -- two for better sorting: subtracting for display is easy, adding for order-
  -- ing is not.
  cat_pages int NOT NULL default 0,
  cat_subcats int NOT NULL default 0,
  cat_files int NOT NULL default 0
);

CREATE TABLE /*_*/externallinks (
  -- Primary key
  el_id int NOT NULL PRIMARY KEY IDENTITY,

  -- page_id of the referring page
  el_from int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,

  -- The URL
  el_to nvarchar(max) NOT NULL,

  -- In the case of HTTP URLs, this is the URL with any username or password
  -- removed, and with the labels in the hostname reversed and converted to
  -- lower case. An extra dot is added to allow for matching of either
  -- example.com or *.example.com in a single scan.
  -- Example:
  --      http://user:password@sub.example.com/page.html
  --   becomes
  --      http://com.example.sub./page.html
  -- which allows for fast searching for all pages under example.com with the
  -- clause:
  --      WHERE el_index LIKE 'http://com.example.%'
  el_index nvarchar(450) NOT NULL
);

CREATE TABLE /*_*/langlinks (
  -- page_id of the referring page
  ll_from int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,

  -- Language code of the target
  ll_lang nvarchar(20) NOT NULL default '',

  -- Title of the target, including namespace
  ll_title nvarchar(255) NOT NULL default ''
);

CREATE TABLE /*_*/iwlinks (
  -- page_id of the referring page
  iwl_from int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,

  -- Interwiki prefix code of the target
  iwl_prefix nvarchar(20) NOT NULL default '',

  -- Title of the target, including namespace
  iwl_title nvarchar(255) NOT NULL default ''
);

CREATE TABLE /*_*/site_stats (
  -- The single row should contain 1 here.
  ss_row_id int NOT NULL,

  -- Total number of edits performed.
  ss_total_edits bigint default 0,

  -- An approximate count of pages matching the following criteria:
  -- * in namespace 0
  -- * not a redirect
  -- * contains the text '[['
  -- See Article::isCountable() in includes/Article.php
  ss_good_articles bigint default 0,

  -- Total pages, theoretically equal to SELECT COUNT(*) FROM page;

CREATE TABLE /*_*/ipblocks (
  -- Primary key, introduced for privacy.
  ipb_id int NOT NULL PRIMARY KEY IDENTITY,

  -- Blocked IP address in dotted-quad form or user name.
  ipb_address nvarchar(255) NOT NULL,

  -- Blocked user ID or 0 for IP blocks.
  ipb_user int REFERENCES /*_*/mwuser(user_id),

  -- User ID who made the block.
  ipb_by int REFERENCES /*_*/mwuser(user_id) ON DELETE CASCADE,

  -- User name of blocker
  ipb_by_text nvarchar(255) NOT NULL default '',

  -- Text comment made by blocker.
  ipb_reason nvarchar(255) NOT NULL,

  -- Creation (or refresh) date in standard YMDHMS form.
  -- IP blocks expire automatically.
  ipb_timestamp varchar(14) NOT NULL default '',

  -- Indicates that the IP address was banned because a banned
  -- user accessed a page through it. If this is 1, ipb_address
  -- will be hidden, and the block identified by block ID number.
  ipb_auto bit NOT NULL default 0,

  -- If set to 1, block applies only to logged-out users
  ipb_anon_only bit NOT NULL default 0,

  -- Block prevents account creation from matching IP addresses
  ipb_create_account bit NOT NULL default 1,

  -- Block triggers autoblocks
  ipb_enable_autoblock bit NOT NULL default 1,

  -- Time at which the block will expire.
  -- May be "infinity"
  ipb_expiry varchar(14) NOT NULL,

  -- Start and end of an address range, in hexadecimal
  -- Size chosen to allow IPv6
  -- FIXME: these fields were originally blank for single-IP blocks,
  -- but now they are populated. No migration was ever done. They
  -- should be fixed to be blank again for such blocks (bug 49504).
  ipb_range_start varchar(255) NOT NULL,
  ipb_range_end varchar(255) NOT NULL,

  -- Flag for entries hidden from users and Sysops
  ipb_deleted bit NOT NULL default 0,

  -- Block prevents user from accessing Special:Emailuser
  ipb_block_email bit NOT NULL default 0,

  -- Block allows user to edit their own talk page
  ipb_allow_usertalk bit NOT NULL default 0,

  -- ID of the block that caused this block to exist
  -- Autoblocks set this to the original block
  -- so that the original block being deleted also
  -- deletes the autoblocks
  ipb_parent_block_id int default NULL REFERENCES /*_*/ipblocks(ipb_id)

);

CREATE TABLE /*_*/image (
  -- Filename.
  -- This is also the title of the associated description page,
  -- which will be in namespace 6 (NS_FILE).
  img_name nvarchar(255) NOT NULL default '' PRIMARY KEY,

  -- File size in bytes.
  img_size int NOT NULL default 0,

  -- For images, size in pixels.
  img_width int NOT NULL default 0,
  img_height int NOT NULL default 0,

  -- Extracted Exif metadata stored as a serialized PHP array.
  img_metadata varbinary(max) NOT NULL,

  -- For images, bits per pixel if known.
  img_bits int NOT NULL default 0,

  -- Media type as defined by the MEDIATYPE_xxx constants
  img_media_type varchar(16) default null,

  -- major part of a MIME media type as defined by IANA
  -- see http://www.iana.org/assignments/media-types/
  img_major_mime varchar(16) not null default 'unknown',

  -- minor part of a MIME media type as defined by IANA
  -- the minor parts are not required to adher to any standard
  -- but should be consistent throughout the database
  -- see http://www.iana.org/assignments/media-types/
  img_minor_mime nvarchar(100) NOT NULL default 'unknown',

  -- Description field as entered by the uploader.
  -- This is displayed in image upload history and logs.
  img_description nvarchar(255) NOT NULL,

  -- user_id and user_name of uploader.
  img_user int REFERENCES /*_*/mwuser(user_id) ON DELETE SET NULL,
  img_user_text nvarchar(255) NOT NULL,

  -- Time of the upload.
  img_timestamp nvarchar(14) NOT NULL default '',

  -- SHA-1 content hash in base-36
  img_sha1 nvarchar(32) NOT NULL default '',

  CONSTRAINT img_major_mime_ckc check (img_major_mime IN('unknown', 'application', 'audio', 'image', 'text', 'video', 'message', 'model', 'multipart', 'chemical')),
  CONSTRAINT img_media_type_ckc check (img_media_type in('UNKNOWN', 'BITMAP', 'DRAWING', 'AUDIO', 'VIDEO', 'MULTIMEDIA', 'OFFICE', 'TEXT', 'EXECUTABLE', 'ARCHIVE'))
);

CREATE TABLE /*_*/oldimage (
  -- Base filename: key to image.img_name
  -- Not a FK because deleting images removes them from image
  oi_name nvarchar(255) NOT NULL default '',

  -- Filename of the archived file.
  -- This is generally a timestamp and '!' prepended to the base name.
  oi_archive_name nvarchar(255) NOT NULL default '',

  -- Other fields as in image...
  oi_size int NOT NULL default 0,
  oi_width int NOT NULL default 0,
  oi_height int NOT NULL default 0,
  oi_bits int NOT NULL default 0,
  oi_description nvarchar(255) NOT NULL,
  oi_user int REFERENCES /*_*/mwuser(user_id),
  oi_user_text nvarchar(255) NOT NULL,
  oi_timestamp varchar(14) NOT NULL default '',

  oi_metadata varbinary(max) NOT NULL,
  oi_media_type varchar(16) default null,
  oi_major_mime varchar(16) not null default 'unknown',
  oi_minor_mime nvarchar(100) NOT NULL default 'unknown',
  oi_deleted tinyint NOT NULL default 0,
  oi_sha1 nvarchar(32) NOT NULL default '',

  CONSTRAINT oi_major_mime_ckc check (oi_major_mime IN('unknown', 'application', 'audio', 'image', 'text', 'video', 'message', 'model', 'multipart', 'chemical')),
  CONSTRAINT oi_media_type_ckc check (oi_media_type IN('UNKNOWN', 'BITMAP', 'DRAWING', 'AUDIO', 'VIDEO', 'MULTIMEDIA', 'OFFICE', 'TEXT', 'EXECUTABLE', 'ARCHIVE'))
);

CREATE TABLE /*_*/filearchive (
  -- Unique row id
  fa_id int NOT NULL PRIMARY KEY IDENTITY,

  -- Original base filename;

CREATE TABLE /*_*/uploadstash (
  us_id int NOT NULL PRIMARY KEY IDENTITY,

  -- the user who uploaded the file.
  us_user int REFERENCES /*_*/mwuser(user_id) ON DELETE SET NULL,

  -- file key. this is how applications actually search for the file.
  -- this might go away, or become the primary key.
  us_key nvarchar(255) NOT NULL,

  -- the original path
  us_orig_path nvarchar(255) NOT NULL,

  -- the temporary path at which the file is actually stored
  us_path nvarchar(255) NOT NULL,

  -- which type of upload the file came from (sometimes)
  us_source_type nvarchar(50),

  -- the date/time on which the file was added
  us_timestamp varchar(14) NOT NULL,

  us_status nvarchar(50) NOT NULL,

  -- chunk counter starts at 0, current offset is stored in us_size
  us_chunk_inx int NULL,

  -- Serialized file properties from FSFile::getProps()
  us_props nvarchar(max),

  -- file size in bytes
  us_size int NOT NULL,
  -- this hash comes from FSFile::getSha1Base36(), and is 31 characters
  us_sha1 nvarchar(31) NOT NULL,
  us_mime nvarchar(255),
  -- Media type as defined by the MEDIATYPE_xxx constants, should duplicate definition in the image table
  us_media_type varchar(16) default null,
  -- image-specific properties
  us_image_width int,
  us_image_height int,
  us_image_bits smallint,

  CONSTRAINT us_media_type_ckc check (us_media_type in('UNKNOWN', 'BITMAP', 'DRAWING', 'AUDIO', 'VIDEO', 'MULTIMEDIA', 'OFFICE', 'TEXT', 'EXECUTABLE', 'ARCHIVE'))
);

CREATE TABLE /*_*/recentchanges (
  rc_id int NOT NULL CONSTRAINT recentchanges__pk PRIMARY KEY IDENTITY,
  rc_timestamp varchar(14) not null default '',

  -- As in revision
  rc_user int NOT NULL default 0 CONSTRAINT rc_user__user_id__fk FOREIGN KEY REFERENCES /*_*/mwuser(user_id),
  rc_user_text nvarchar(255) NOT NULL,

  -- When pages are renamed, their RC entries do _not_ change.
  rc_namespace int NOT NULL default 0,
  rc_title nvarchar(255) NOT NULL default '',

  -- as in revision...
  rc_comment nvarchar(255) NOT NULL default '',
  rc_minor bit NOT NULL default 0,

  -- Edits by user accounts with the 'bot' rights key are
  -- marked with a 1 here, and will be hidden from the
  -- default view.
  rc_bot bit NOT NULL default 0,

  -- Set if this change corresponds to a page creation
  rc_new bit NOT NULL default 0,

  -- Key to page_id (was cur_id prior to 1.5).
  -- This will keep links working after moves while
  -- retaining the at-the-time name in the changes list.
  rc_cur_id int, -- NOT FK

  -- rev_id of the given revision
  rc_this_oldid int, -- NOT FK

  -- rev_id of the prior revision, for generating diff links.
  rc_last_oldid int, -- NOT FK

  -- The type of change entry (RC_EDIT,RC_NEW,RC_LOG,RC_EXTERNAL)
  rc_type tinyint NOT NULL default 0,

  -- The source of the change entry (replaces rc_type)
  -- default of '' is temporary, needed for initial migration
  rc_source nvarchar(16) not null default '',

  -- If the Recent Changes Patrol option is enabled,
  -- users may mark edits as having been reviewed to
  -- remove a warning flag on the RC list.
  -- A value of 1 indicates the page has been reviewed.
  rc_patrolled bit NOT NULL default 0,

  -- Recorded IP address the edit was made from, if the
  -- $wgPutIPinRC option is enabled.
  rc_ip nvarchar(40) NOT NULL default '',

  -- Text length in characters before
  -- and after the edit
  rc_old_len int,
  rc_new_len int,

  -- Visibility of recent changes items, bitfield
  rc_deleted tinyint NOT NULL default 0,

  -- Value corresponding to log_id, specific log entries
  rc_logid int, -- FK added later
  -- Store log type info here, or null
  rc_log_type nvarchar(255) NULL default NULL,
  -- Store log action or null
  rc_log_action nvarchar(255) NULL default NULL,
  -- Log params
  rc_params nvarchar(max) NULL
);

CREATE TABLE /*_*/watchlist (
  wl_id int NOT NULL PRIMARY KEY IDENTITY,
  -- Key to user.user_id
  wl_user int NOT NULL REFERENCES /*_*/mwuser(user_id) ON DELETE CASCADE,

  -- Key to page_namespace/page_title
  -- Note that users may watch pages which do not exist yet,
  -- or existed in the past but have been deleted.
  wl_namespace int NOT NULL default 0,
  wl_title nvarchar(255) NOT NULL default '',

  -- Timestamp used to send notification e-mails and show "updated since last visit" markers on
  -- history and recent changes / watchlist. Set to NULL when the user visits the latest revision
  -- of the page, which means that they should be sent an e-mail on the next change.
  wl_notificationtimestamp varchar(14)

);

CREATE TABLE /*_*/searchindex (
  -- Key to page_id
  si_page int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,

  -- Munged version of title
  si_title nvarchar(255) NOT NULL default '',

  -- Munged version of body text
  si_text nvarchar(max) NOT NULL
);

CREATE TABLE /*_*/interwiki (
  -- The interwiki prefix, (e.g. "Meatball", or the language prefix "de")
  iw_prefix nvarchar(32) NOT NULL,

  -- The URL of the wiki, with "$1" as a placeholder for an article name.
  -- Any spaces in the name will be transformed to underscores before
  -- insertion.
  iw_url nvarchar(max) NOT NULL,

  -- The URL of the file api.php
  iw_api nvarchar(max) NOT NULL,

  -- The name of the database (for a connection to be established with wfGetLB( 'wikiid' ))
  iw_wikiid nvarchar(64) NOT NULL,

  -- A boolean value indicating whether the wiki is in this project
  -- (used, for example, to detect redirect loops)
  iw_local bit NOT NULL,

  -- Boolean value indicating whether interwiki transclusions are allowed.
  iw_trans bit NOT NULL default 0
);

CREATE TABLE /*_*/querycache (
  -- A key name, generally the base name of of the special page.
  qc_type nvarchar(32) NOT NULL,

  -- Some sort of stored value. Sizes, counts...
  qc_value int NOT NULL default 0,

  -- Target namespace+title
  qc_namespace int NOT NULL default 0,
  qc_title nvarchar(255) NOT NULL default ''
);

CREATE TABLE /*_*/objectcache (
  keyname nvarchar(255) NOT NULL default '' PRIMARY KEY,
  value varbinary(max),
  exptime varchar(14)
);

CREATE TABLE /*_*/transcache (
  tc_url nvarchar(255) NOT NULL,
  tc_contents nvarchar(max),
  tc_time varchar(14) NOT NULL
);

CREATE TABLE /*_*/logging (
  -- Log ID, for referring to this specific log entry, probably for deletion and such.
  log_id int NOT NULL PRIMARY KEY IDENTITY(0,1),

  -- Symbolic keys for the general log type and the action type
  -- within the log. The output format will be controlled by the
  -- action field, but only the type controls categorization.
  log_type nvarchar(32) NOT NULL default '',
  log_action nvarchar(32) NOT NULL default '',

  -- Timestamp. Duh.
  log_timestamp varchar(14) NOT NULL default '',

  -- The user who performed this action;

CREATE TABLE /*_*/log_search (
  -- The type of ID (rev ID, log ID, rev timestamp, username)
  ls_field nvarchar(32) NOT NULL,
  -- The value of the ID
  ls_value nvarchar(255) NOT NULL,
  -- Key to log_id
  ls_log_id int REFERENCES /*_*/logging(log_id) ON DELETE CASCADE
);

CREATE TABLE /*_*/job (
  job_id int NOT NULL PRIMARY KEY IDENTITY,

  -- Command name
  -- Limited to 60 to prevent key length overflow
  job_cmd nvarchar(60) NOT NULL default '',

  -- Namespace and title to act on
  -- Should be 0 and '' if the command does not operate on a title
  job_namespace int NOT NULL,
  job_title nvarchar(255) NOT NULL,

  -- Timestamp of when the job was inserted
  -- NULL for jobs added before addition of the timestamp
  job_timestamp nvarchar(14) NULL default NULL,

  -- Any other parameters to the command
  -- Stored as a PHP serialized array, or an empty string if there are no parameters
  job_params nvarchar(max) NOT NULL,

  -- Random, non-unique, number used for job acquisition (for lock concurrency)
  job_random int NOT NULL default 0,

  -- The number of times this job has been locked
  job_attempts int NOT NULL default 0,

  -- Field that conveys process locks on rows via process UUIDs
  job_token nvarchar(32) NOT NULL default '',

  -- Timestamp when the job was locked
  job_token_timestamp varchar(14) NULL default NULL,

  -- Base 36 SHA1 of the job parameters relevant to detecting duplicates
  job_sha1 nvarchar(32) NOT NULL default ''
);

CREATE TABLE /*_*/querycache_info (
  -- Special page name
  -- Corresponds to a qc_type value
  qci_type nvarchar(32) NOT NULL default '',

  -- Timestamp of last update
  qci_timestamp varchar(14) NOT NULL default ''
);

CREATE TABLE /*_*/redirect (
  -- Key to the page_id of the redirect page
  rd_from int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,

  -- Key to page_namespace/page_title of the target page.
  -- The target page may or may not exist, and due to renames
  -- and deletions may refer to different page records as time
  -- goes by.
  rd_namespace int NOT NULL default 0,
  rd_title nvarchar(255) NOT NULL default '',
  rd_interwiki nvarchar(32) default NULL,
  rd_fragment nvarchar(255) default NULL
);

CREATE TABLE /*_*/querycachetwo (
  -- A key name, generally the base name of of the special page.
  qcc_type nvarchar(32) NOT NULL,

  -- Some sort of stored value. Sizes, counts...
  qcc_value int NOT NULL default 0,

  -- Target namespace+title
  qcc_namespace int NOT NULL default 0,
  qcc_title nvarchar(255) NOT NULL default '',

  -- Target namespace+title2
  qcc_namespacetwo int NOT NULL default 0,
  qcc_titletwo nvarchar(255) NOT NULL default ''
);

CREATE TABLE /*_*/page_restrictions (
  -- Field for an ID for this restrictions row (sort-key for Special:ProtectedPages)
  pr_id int NOT NULL PRIMARY KEY IDENTITY,
  -- Page to apply restrictions to (Foreign Key to page).
  pr_page int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,
  -- The protection type (edit, move, etc)
  pr_type nvarchar(60) NOT NULL,
  -- The protection level (Sysop, autoconfirmed, etc)
  pr_level nvarchar(60) NOT NULL,
  -- Whether or not to cascade the protection down to pages transcluded.
  pr_cascade bit NOT NULL,
  -- Field for future support of per-user restriction.
  pr_user int NULL,
  -- Field for time-limited protection.
  pr_expiry varchar(14) NULL
);

CREATE TABLE /*_*/protected_titles (
  pt_namespace int NOT NULL,
  pt_title nvarchar(255) NOT NULL,
  pt_user int REFERENCES /*_*/mwuser(user_id) ON DELETE SET NULL,
  pt_reason nvarchar(255),
  pt_timestamp varchar(14) NOT NULL,
  pt_expiry varchar(14) NOT NULL,
  pt_create_perm nvarchar(60) NOT NULL
);

CREATE TABLE /*_*/page_props (
  pp_page int NOT NULL REFERENCES /*_*/page(page_id) ON DELETE CASCADE,
  pp_propname nvarchar(60) NOT NULL,
  pp_value nvarchar(max) NOT NULL,
  pp_sortkey float DEFAULT NULL
);

CREATE TABLE /*_*/updatelog (
  ul_key nvarchar(255) NOT NULL PRIMARY KEY,
  ul_value nvarchar(max)
);

CREATE TABLE /*_*/change_tag (
  ct_id int NOT NULL PRIMARY KEY IDENTITY,
  -- RCID for the change
  ct_rc_id int NULL REFERENCES /*_*/recentchanges(rc_id),
  -- LOGID for the change
  ct_log_id int NULL REFERENCES /*_*/logging(log_id),
  -- REVID for the change
  ct_rev_id int NULL REFERENCES /*_*/revision(rev_id),
  -- Tag applied
  ct_tag nvarchar(255) NOT NULL,
  -- Parameters for the tag, presently unused
  ct_params nvarchar(max) NULL
);

CREATE TABLE /*_*/tag_summary (
  ts_id int NOT NULL PRIMARY KEY IDENTITY,
  -- RCID for the change
  ts_rc_id int NULL REFERENCES /*_*/recentchanges(rc_id),
  -- LOGID for the change
  ts_log_id int NULL REFERENCES /*_*/logging(log_id),
  -- REVID for the change
  ts_rev_id int NULL REFERENCES /*_*/revision(rev_id),
  -- Comma-separated list of tags
  ts_tags nvarchar(max) NOT NULL
);

CREATE TABLE /*_*/valid_tag (
  vt_tag nvarchar(255) NOT NULL PRIMARY KEY
);

CREATE TABLE /*_*/l10n_cache (
  -- Language code
  lc_lang nvarchar(32) NOT NULL,
  -- Cache key
  lc_key nvarchar(255) NOT NULL,
  -- Value
  lc_value varbinary(max) NOT NULL
);

CREATE TABLE /*_*/module_deps (
  -- Module name
  md_module nvarchar(255) NOT NULL,
  -- Skin name
  md_skin nvarchar(32) NOT NULL,
  -- JSON nvarchar(max) with file dependencies
  md_deps nvarchar(max) NOT NULL
);

CREATE TABLE /*_*/sites (
  -- Numeric id of the site
  site_id                    int        NOT NULL PRIMARY KEY IDENTITY,

  -- Global identifier for the site, ie 'enwiktionary'
  site_global_key            nvarchar(32)       NOT NULL,

  -- Type of the site, ie 'mediawiki'
  site_type                  nvarchar(32)       NOT NULL,

  -- Group of the site, ie 'wikipedia'
  site_group                 nvarchar(32)       NOT NULL,

  -- Source of the site data, ie 'local', 'wikidata', 'my-magical-repo'
  site_source                nvarchar(32)       NOT NULL,

  -- Language code of the sites primary language.
  site_language              nvarchar(32)       NOT NULL,

  -- Protocol of the site, ie 'http://', 'irc://', '//'
  -- This field is an index for lookups and is build from type specific data in site_data.
  site_protocol              nvarchar(32)       NOT NULL,

  -- Domain of the site in reverse order, ie 'org.mediawiki.www.'
  -- This field is an index for lookups and is build from type specific data in site_data.
  site_domain                NVARCHAR(255)        NOT NULL,

  -- Type dependent site data.
  site_data                  nvarchar(max)                NOT NULL,

  -- If site.tld/path/key:pageTitle should forward users to  the page on
  -- the actual site, where "key" is the local identifier.
  site_forward              bit                NOT NULL,

  -- Type dependent site config.
  -- For instance if template transclusion should be allowed if it's a MediaWiki.
  site_config               nvarchar(max)                NOT NULL
);

CREATE TABLE /*_*/site_identifiers (
  -- Key on site.site_id
  si_site                    int        NOT NULL REFERENCES /*_*/sites(site_id) ON DELETE CASCADE,

  -- local key type, ie 'interwiki' or 'langlink'
  si_type                    nvarchar(32)       NOT NULL,

  -- local key value, ie 'en' or 'wiktionary'
  si_key                     nvarchar(32)       NOT NULL
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE /*_*/page ADD CONSTRAINT FK_page_latest_page_id FOREIGN KEY (page_latest) REFERENCES /*_*/revision(rev_id);

ALTER TABLE /*_*/revision ADD CONSTRAINT FK_rev_text_id_old_id FOREIGN KEY (rev_text_id) REFERENCES /*_*/text(old_id) ON DELETE CASCADE;

ALTER TABLE /*_*/recentchanges ADD CONSTRAINT rc_logid__log_id__fk FOREIGN KEY (rc_logid) REFERENCES /*_*/logging(log_id) ON DELETE CASCADE;

