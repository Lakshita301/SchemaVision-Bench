-- Source: https://github.com/xinghun61/infra/blob/b5d4783f99461438ca9e6a477535617fadab6ba3/appengine/monorail/schema/project.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 51
-- lowercase
-- TODO(jrobbins): Move some of these to UserPrefs.
-- Pref
-- Pref
-- Pref
-- Pref
-- Pref
-- Pref
-- Pref
-- Pref
-- normally empty for read-write.
-- optional reason for doomed project.
-- if set, automatically transition to state deletable.
-- 50 MB default set in python code.
-- names of the cue cards that the user has dismissed.
-- timestamps in seconds since the epoch.
CREATE TABLE "user" (
    user_id INT UNSIGNED NOT NULL,
    email VARCHAR(255) NOT NULL,
    is_site_admin BOOLEAN DEFAULT FALSE,
    obscure_email BOOLEAN DEFAULT TRUE,
    notify_issue_change BOOLEAN DEFAULT TRUE,
    notify_starred_issue_change BOOLEAN DEFAULT TRUE,
    email_compact_subject BOOLEAN DEFAULT FALSE,
    email_view_widget BOOLEAN DEFAULT TRUE,
    notify_starred_ping BOOLEAN DEFAULT FALSE,
    banned VARCHAR(80),
    after_issue_update ENUM (
      'up_to_list', 'stay_same_issue', 'next_in_list'),
    keep_people_perms_open BOOLEAN DEFAULT FALSE,
    preview_on_hover BOOLEAN DEFAULT TRUE,
    ignore_action_limits BOOLEAN DEFAULT FALSE,
    last_visit_timestamp INT,
    email_bounce_timestamp INT,
    vacation_message VARCHAR(80),
    PRIMARY KEY (user_id),
    UNIQUE (email)
);

CREATE TABLE UserPrefs (
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(40),
    value VARCHAR(80),
    UNIQUE (user_id, name)
);

CREATE TABLE UserCommits (
    commit_sha VARCHAR(40),
    author_id INT UNSIGNED NOT NULL,
    commit_time INT NOT NULL,
    commit_message TEXT,
    commit_repo_url VARCHAR(255),
    PRIMARY KEY (commit_sha),
    INDEX (author_id, commit_time),
    INDEX (commit_time)
);

CREATE TABLE Project (
    project_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    project_name VARCHAR(80) NOT NULL,
    summary TEXT,
    description TEXT,
    state ENUM ('live', 'archived', 'deletable') NOT NULL,
    access ENUM ('anyone', 'members_only') NOT NULL,
    read_only_reason VARCHAR(80),
    state_reason VARCHAR(80),
    delete_time INT,
    issue_notify_address VARCHAR(80),
    attachment_bytes_used BIGINT DEFAULT 0,
    attachment_quota BIGINT DEFAULT 0,
    cached_content_timestamp INT,
    recent_activity_timestamp INT,
    moved_to VARCHAR(250),
    process_inbound_email BOOLEAN DEFAULT FALSE,
    only_owners_remove_restrictions BOOLEAN DEFAULT FALSE,
    only_owners_see_contributors BOOLEAN DEFAULT FALSE,
    revision_url_format VARCHAR(250),
    home_page VARCHAR(250),
    docs_url VARCHAR(250),
    source_url VARCHAR(250),
    logo_gcs_id VARCHAR(250),
    logo_file_name VARCHAR(250),
    PRIMARY KEY (project_id),
    UNIQUE (project_name)
);

CREATE TABLE DismissedCues (
    user_id INT UNSIGNED NOT NULL,
    cue VARCHAR(40),
    INDEX (user_id)
);

CREATE TABLE User2Project (
    project_id SMALLINT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    role_name ENUM ('owner', 'committer', 'contributor'),
    PRIMARY KEY (project_id, user_id),
    INDEX (user_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);

CREATE TABLE LinkedAccount (
    parent_id INT UNSIGNED NOT NULL,
    child_id INT UNSIGNED NOT NULL,
    KEY (parent_id),
    UNIQUE (child_id),
    FOREIGN KEY (parent_id) REFERENCES "user"(user_id),
    FOREIGN KEY (child_id) REFERENCES "user"(user_id)
);

CREATE TABLE LinkedAccountInvite (
    parent_id INT UNSIGNED NOT NULL,
    child_id INT UNSIGNED NOT NULL,
    KEY (parent_id),
    UNIQUE (child_id),
    FOREIGN KEY (parent_id) REFERENCES "user"(user_id),
    FOREIGN KEY (child_id) REFERENCES "user"(user_id)
);

CREATE TABLE ExtraPerm (
    project_id SMALLINT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    perm VARCHAR(80),
    PRIMARY KEY (project_id, user_id, perm),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);

CREATE TABLE MemberNotes (
    project_id SMALLINT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    notes TEXT,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);

CREATE TABLE AutocompleteExclusion (
    project_id SMALLINT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    ac_exclude BOOLEAN DEFAULT TRUE,
    no_expand BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);

CREATE TABLE UserStar (
    starred_user_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (starred_user_id, user_id),
    INDEX (user_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id),
    FOREIGN KEY (starred_user_id) REFERENCES "user"(user_id)
);

CREATE TABLE ProjectStar (
    project_id SMALLINT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (project_id, user_id),
    INDEX (user_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

CREATE TABLE UserGroup (
    user_id INT UNSIGNED NOT NULL,
    group_id INT UNSIGNED NOT NULL,
    role ENUM ('owner', 'member') NOT NULL DEFAULT 'member',
    PRIMARY KEY (user_id, group_id),
    INDEX (group_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id),
    FOREIGN KEY (group_id) REFERENCES "user"(user_id)
);

CREATE TABLE UserGroupSettings (
    group_id INT UNSIGNED NOT NULL,
    who_can_view_members ENUM ('owners', 'members', 'anyone'),
    external_group_type ENUM (
      'chrome_infra_auth', 'mdb', 'baggins', 'computed'),
    last_sync_time INT,
    notify_members BOOL DEFAULT TRUE,
    notify_group BOOL DEFAULT FALSE,
    PRIMARY KEY (group_id),
    FOREIGN KEY (group_id) REFERENCES "user"(user_id)
);

CREATE TABLE Group2Project (
    group_id INT UNSIGNED NOT NULL,
    project_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (group_id, project_id),
    FOREIGN KEY (group_id) REFERENCES UserGroupSettings(group_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

CREATE TABLE QuickEditHistory (
    user_id INT UNSIGNED NOT NULL,
    project_id SMALLINT UNSIGNED NOT NULL,
    slot_num SMALLINT UNSIGNED NOT NULL,
    command VARCHAR(255) NOT NULL,
    comment TEXT NOT NULL,
    PRIMARY KEY (user_id, project_id, slot_num),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);

CREATE TABLE QuickEditMostRecent (
    user_id INT UNSIGNED NOT NULL,
    project_id SMALLINT UNSIGNED NOT NULL,
    slot_num SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, project_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);
