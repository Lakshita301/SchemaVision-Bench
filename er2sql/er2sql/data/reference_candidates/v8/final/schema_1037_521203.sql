-- Source: https://github.com/maximusblade/msunery/blob/4015f3e1d1083de01395da3548ee29d7c2f48d09/flarum.sql?raw=true
-- Tables detected: 24 | FK constraints: 37
CREATE TABLE access_tokens (
    token varchar(40) NOT NULL,
    user_id BIGINT NOT NULL,
    last_activity_at TIMESTAMP NOT NULL,
    lifetime_seconds int NOT NULL,
    created_at TIMESTAMP NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE api_keys (
    key varchar(100) NOT NULL,
    id BIGINT NOT NULL,
    allowed_ips varchar(255) DEFAULT NULL,
    scopes varchar(255) DEFAULT NULL,
    user_id BIGINT DEFAULT NULL,
    created_at TIMESTAMP NOT NULL,
    last_activity_at TIMESTAMP DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE discussions (
    id BIGINT NOT NULL,
    title varchar(200) NOT NULL,
    comment_count BIGINT NOT NULL DEFAULT '0',
    participant_count BIGINT NOT NULL DEFAULT '0',
    post_number_index BIGINT NOT NULL DEFAULT '0',
    created_at TIMESTAMP NOT NULL,
    user_id BIGINT DEFAULT NULL,
    first_post_id BIGINT DEFAULT NULL,
    last_posted_at TIMESTAMP DEFAULT NULL,
    last_posted_user_id BIGINT DEFAULT NULL,
    last_post_id BIGINT DEFAULT NULL,
    last_post_number BIGINT DEFAULT NULL,
    hidden_at TIMESTAMP DEFAULT NULL,
    hidden_user_id BIGINT DEFAULT NULL,
    slug varchar(255) NOT NULL,
    is_private SMALLINT NOT NULL DEFAULT '0',
    is_approved SMALLINT NOT NULL DEFAULT '1',
    is_locked SMALLINT NOT NULL DEFAULT '0',
    is_sticky SMALLINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE discussion_tag (
    discussion_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE discussion_user (
    user_id BIGINT NOT NULL,
    discussion_id BIGINT NOT NULL,
    last_read_at TIMESTAMP DEFAULT NULL,
    last_read_post_number BIGINT DEFAULT NULL,
    subscription TEXT DEFAULT NULL CHECK (subscription IN ('follow', 'ignore'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE email_tokens (
    token varchar(100) NOT NULL,
    email varchar(150) NOT NULL,
    user_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE flags (
    id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    type varchar(255) NOT NULL,
    user_id BIGINT DEFAULT NULL,
    reason varchar(255) DEFAULT NULL,
    reason_detail varchar(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE groups (
    id BIGINT NOT NULL,
    name_singular varchar(100) NOT NULL,
    name_plural varchar(100) NOT NULL,
    color varchar(20) DEFAULT NULL,
    icon varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE group_permission (
    group_id BIGINT NOT NULL,
    permission varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE group_user (
    user_id BIGINT NOT NULL,
    group_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE login_providers (
    id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    provider varchar(100) NOT NULL,
    identifier varchar(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    last_login_at TIMESTAMP DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE migrations (
    migration varchar(255) NOT NULL,
    extension varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE notifications (
    id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    from_user_id BIGINT DEFAULT NULL,
    type varchar(100) NOT NULL,
    subject_id BIGINT DEFAULT NULL,
    data BYTEA,
    created_at TIMESTAMP NOT NULL,
    is_deleted SMALLINT NOT NULL DEFAULT '0',
    read_at TIMESTAMP DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE password_tokens (
    token varchar(100) NOT NULL,
    user_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE posts (
    id BIGINT NOT NULL,
    discussion_id BIGINT NOT NULL,
    number BIGINT DEFAULT NULL,
    created_at TIMESTAMP NOT NULL,
    user_id BIGINT DEFAULT NULL,
    type varchar(100) DEFAULT NULL,
    content TEXT,
    edited_at TIMESTAMP DEFAULT NULL,
    edited_user_id BIGINT DEFAULT NULL,
    hidden_at TIMESTAMP DEFAULT NULL,
    hidden_user_id BIGINT DEFAULT NULL,
    ip_address varchar(45) DEFAULT NULL,
    is_private SMALLINT NOT NULL DEFAULT '0',
    is_approved SMALLINT NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE post_likes (
    post_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE post_mentions_post (
    post_id BIGINT NOT NULL,
    mentions_post_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE post_mentions_user (
    post_id BIGINT NOT NULL,
    mentions_user_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE post_user (
    post_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE registration_tokens (
    token varchar(100) NOT NULL,
    payload text,
    created_at TIMESTAMP DEFAULT NULL,
    provider varchar(255) NOT NULL,
    identifier varchar(255) NOT NULL,
    user_attributes text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE settings (
    key varchar(100) NOT NULL,
    value text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE tags (
    id BIGINT NOT NULL,
    name varchar(100) NOT NULL,
    slug varchar(100) NOT NULL,
    description text,
    color varchar(50) DEFAULT NULL,
    background_path varchar(100) DEFAULT NULL,
    background_mode varchar(100) DEFAULT NULL,
    position int DEFAULT NULL,
    parent_id BIGINT DEFAULT NULL,
    default_sort varchar(50) DEFAULT NULL,
    is_restricted SMALLINT NOT NULL DEFAULT '0',
    is_hidden SMALLINT NOT NULL DEFAULT '0',
    discussion_count BIGINT NOT NULL DEFAULT '0',
    last_posted_at TIMESTAMP DEFAULT NULL,
    last_posted_discussion_id BIGINT DEFAULT NULL,
    last_posted_user_id BIGINT DEFAULT NULL,
    icon varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE tag_user (
    user_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    marked_as_read_at TIMESTAMP DEFAULT NULL,
    is_hidden SMALLINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE users (
    id BIGINT NOT NULL,
    username varchar(100) NOT NULL,
    email varchar(150) NOT NULL,
    is_email_confirmed SMALLINT NOT NULL DEFAULT '0',
    password varchar(100) NOT NULL,
    bio text,
    avatar_url varchar(100) DEFAULT NULL,
    preferences BYTEA,
    joined_at TIMESTAMP DEFAULT NULL,
    last_seen_at TIMESTAMP DEFAULT NULL,
    marked_all_as_read_at TIMESTAMP DEFAULT NULL,
    read_notifications_at TIMESTAMP DEFAULT NULL,
    discussion_count BIGINT NOT NULL DEFAULT '0',
    comment_count BIGINT NOT NULL DEFAULT '0',
    read_flags_at TIMESTAMP DEFAULT NULL,
    suspended_until TIMESTAMP DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE access_tokens ADD CONSTRAINT access_tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE api_keys ADD CONSTRAINT api_keys_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE discussions ADD CONSTRAINT discussions_first_post_id_foreign FOREIGN KEY (first_post_id) REFERENCES posts (id) ON DELETE SET NULL;
ALTER TABLE discussions ADD CONSTRAINT discussions_hidden_user_id_foreign FOREIGN KEY (hidden_user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE discussions ADD CONSTRAINT discussions_last_post_id_foreign FOREIGN KEY (last_post_id) REFERENCES posts (id) ON DELETE SET NULL;
ALTER TABLE discussions ADD CONSTRAINT discussions_last_posted_user_id_foreign FOREIGN KEY (last_posted_user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE discussions ADD CONSTRAINT discussions_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE discussion_tag ADD CONSTRAINT discussion_tag_discussion_id_foreign FOREIGN KEY (discussion_id) REFERENCES discussions (id) ON DELETE CASCADE;
ALTER TABLE discussion_tag ADD CONSTRAINT discussion_tag_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE;
ALTER TABLE discussion_user ADD CONSTRAINT discussion_user_discussion_id_foreign FOREIGN KEY (discussion_id) REFERENCES discussions (id) ON DELETE CASCADE;
ALTER TABLE discussion_user ADD CONSTRAINT discussion_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE email_tokens ADD CONSTRAINT email_tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE flags ADD CONSTRAINT flags_post_id_foreign FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE;
ALTER TABLE flags ADD CONSTRAINT flags_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE group_permission ADD CONSTRAINT group_permission_group_id_foreign FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE;
ALTER TABLE group_user ADD CONSTRAINT group_user_group_id_foreign FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE;
ALTER TABLE group_user ADD CONSTRAINT group_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE login_providers ADD CONSTRAINT login_providers_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE notifications ADD CONSTRAINT notifications_from_user_id_foreign FOREIGN KEY (from_user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE notifications ADD CONSTRAINT notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE password_tokens ADD CONSTRAINT password_tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE posts ADD CONSTRAINT posts_edited_user_id_foreign FOREIGN KEY (edited_user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE posts ADD CONSTRAINT posts_hidden_user_id_foreign FOREIGN KEY (hidden_user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE posts ADD CONSTRAINT posts_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE post_likes ADD CONSTRAINT post_likes_post_id_foreign FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE;
ALTER TABLE post_likes ADD CONSTRAINT post_likes_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE post_mentions_post ADD CONSTRAINT post_mentions_post_mentions_post_id_foreign FOREIGN KEY (mentions_post_id) REFERENCES posts (id) ON DELETE CASCADE;
ALTER TABLE post_mentions_post ADD CONSTRAINT post_mentions_post_post_id_foreign FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE;
ALTER TABLE post_mentions_user ADD CONSTRAINT post_mentions_user_mentions_user_id_foreign FOREIGN KEY (mentions_user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE post_mentions_user ADD CONSTRAINT post_mentions_user_post_id_foreign FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE;
ALTER TABLE post_user ADD CONSTRAINT post_user_post_id_foreign FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE;
ALTER TABLE post_user ADD CONSTRAINT post_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE tags ADD CONSTRAINT tags_last_posted_discussion_id_foreign FOREIGN KEY (last_posted_discussion_id) REFERENCES discussions (id) ON DELETE SET NULL;
ALTER TABLE tags ADD CONSTRAINT tags_last_posted_user_id_foreign FOREIGN KEY (last_posted_user_id) REFERENCES users (id) ON DELETE SET NULL;
ALTER TABLE tags ADD CONSTRAINT tags_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES tags (id) ON DELETE SET NULL;
ALTER TABLE tag_user ADD CONSTRAINT tag_user_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE;
ALTER TABLE tag_user ADD CONSTRAINT tag_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
COMMENT ON COLUMN posts.content IS ' ';
