-- Source: https://github.com/Bohdankhrysanfov/kratosAuthService/blob/a14b1575c8293821b5713a590d13848417071330/persistence/sql/migrations/legacy/20191100000001_identities.mysql.up.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 3
CREATE TABLE "identities" (
    "id" char(36) NOT NULL,
    PRIMARY KEY("id"),
    "traits_schema_id" VARCHAR (2048) NOT NULL,
    "traits" JSON NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL
);

CREATE TABLE "identity_credential_types" (
    "id" char(36) NOT NULL,
    PRIMARY KEY("id"),
    "name" VARCHAR (32) NOT NULL
);

CREATE TABLE "identity_credentials" (
    "id" char(36) NOT NULL,
    PRIMARY KEY("id"),
    "config" JSON NOT NULL,
    "identity_credential_type_id" char(36) NOT NULL,
    "identity_id" char(36) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    FOREIGN KEY ("identity_id") REFERENCES "identities" ("id") ON DELETE cascade,
    FOREIGN KEY ("identity_credential_type_id") REFERENCES "identity_credential_types" ("id") ON DELETE cascade
);

CREATE TABLE "identity_credential_identifiers" (
    "id" char(36) NOT NULL,
    PRIMARY KEY("id"),
    "identifier" VARCHAR (255) NOT NULL,
    "identity_credential_id" char(36) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    FOREIGN KEY ("identity_credential_id") REFERENCES "identity_credentials" ("id") ON DELETE cascade
);
