-- Source: https://github.com/brobo/mumshoppe-dep/blob/fbce0390d8377bd542902a08c26cd8f98b5acadf/app/vendor/league/oauth2-server/sql/mysql.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 11
CREATE TABLE "oauth_clients" (
    "id" CHAR(40) NOT NULL,
    "secret" CHAR(40) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "auto_approve" SMALLINT NOT NULL DEFAULT '0',
    PRIMARY KEY ("id"),
    CONSTRAINT "u_oacl_clse_clid" UNIQUE ("secret","id")
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_client_endpoints" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "client_id" char(40) NOT NULL,
    "redirect_uri" varchar(255) NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "f_oaclen_clid" FOREIGN KEY ("client_id") REFERENCES "oauth_clients" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_sessions" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "client_id" char(40) NOT NULL,
    "owner_type" enum('user','client') NOT NULL DEFAULT 'user',
    "owner_id" varchar(255) NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "f_oase_clid" FOREIGN KEY ("client_id") REFERENCES "oauth_clients" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_session_access_tokens" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "session_id" int unsigned NOT NULL,
    "access_token" char(40) NOT NULL,
    "access_token_expires" int unsigned NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "u_oaseacto_acto_seid" UNIQUE ("access_token","session_id"),
    CONSTRAINT "f_oaseto_seid" FOREIGN KEY ("session_id") REFERENCES "oauth_sessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_session_authcodes" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "session_id" int unsigned NOT NULL,
    "auth_code" char(40) NOT NULL,
    "auth_code_expires" int unsigned NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "oauth_session_authcodes_ibfk_1" FOREIGN KEY ("session_id") REFERENCES "oauth_sessions" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_session_redirects" (
    "session_id" int unsigned NOT NULL,
    "redirect_uri" varchar(255) NOT NULL,
    PRIMARY KEY ("session_id"),
    CONSTRAINT "f_oasere_seid" FOREIGN KEY ("session_id") REFERENCES "oauth_sessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_session_refresh_tokens" (
    "session_access_token_id" int unsigned NOT NULL,
    "refresh_token" char(40) NOT NULL,
    "refresh_token_expires" int unsigned NOT NULL,
    "client_id" char(40) NOT NULL,
    PRIMARY KEY ("session_access_token_id"),
    CONSTRAINT "oauth_session_refresh_tokens_ibfk_1" FOREIGN KEY ("client_id") REFERENCES "oauth_clients" ("id") ON DELETE CASCADE,
    CONSTRAINT "f_oasetore_setoid" FOREIGN KEY ("session_access_token_id") REFERENCES "oauth_session_access_tokens" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_scopes" (
    "id" smallint unsigned NOT NULL AUTO_INCREMENT,
    "scope" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "u_oasc_sc" UNIQUE ("scope")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_session_token_scopes" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "session_access_token_id" int unsigned DEFAULT NULL,
    "scope_id" smallint unsigned NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "u_setosc_setoid_scid" UNIQUE ("session_access_token_id","scope_id"),
    CONSTRAINT "f_oasetosc_scid" FOREIGN KEY ("scope_id") REFERENCES "oauth_scopes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT "f_oasetosc_setoid" FOREIGN KEY ("session_access_token_id") REFERENCES "oauth_session_access_tokens" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE "oauth_session_authcode_scopes" (
    "oauth_session_authcode_id" int unsigned NOT NULL,
    "scope_id" smallint unsigned NOT NULL,
    CONSTRAINT "oauth_session_authcode_scopes_ibfk_2" FOREIGN KEY ("scope_id") REFERENCES "oauth_scopes" ("id") ON DELETE CASCADE,
    CONSTRAINT "oauth_session_authcode_scopes_ibfk_1" FOREIGN KEY ("oauth_session_authcode_id") REFERENCES "oauth_session_authcodes" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;
CREATE INDEX ON "oauth_client_endpoints" ("client_id");
CREATE INDEX ON "oauth_sessions" ("client_id","owner_type","owner_id");
CREATE INDEX ON "oauth_session_access_tokens" ("session_id");
CREATE INDEX ON "oauth_session_authcodes" ("session_id");
CREATE INDEX ON "oauth_session_refresh_tokens" ("client_id");
CREATE INDEX ON "oauth_session_token_scopes" ("scope_id");
CREATE INDEX ON "oauth_session_authcode_scopes" ("oauth_session_authcode_id");
CREATE INDEX ON "oauth_session_authcode_scopes" ("scope_id");
