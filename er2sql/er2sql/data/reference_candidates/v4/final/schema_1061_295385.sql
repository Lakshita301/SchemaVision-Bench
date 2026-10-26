-- Source: https://github.com/khh-ini/caltexian-drainit/blob/9a35c33fa00484e733a7d7e59b77b73fdbe25659/drainit-backend/caltexian_drainit.sql?raw=true
-- Tables detected: 16 | FK constraints: 6
CREATE TABLE "admins" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "nama" varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
    "no_hp" varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "admins_email_unique" UNIQUE ("email")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "drainases" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "id_admin" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "nama_jalan" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "panjang" double(10,2) NOT NULL,
    "lebar" double(10,2) NOT NULL,
    "kedalaman" double(10,2) NOT NULL,
    "bahan" varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
    "kondisi" varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
    "arah_alir" varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
    "akhir_pembuangan" varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
    "foto" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tipe_drainase" varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
    "geometry" geometry NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "failed_jobs" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "connection" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "queue" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "payload" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "exception" TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    "failed_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "masyarakats" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "nama" varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
    "foto" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "no_hp" varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
    "alamat" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "masyarakats_email_unique" UNIQUE ("email")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "migrations" (
    "id" int unsigned NOT NULL AUTO_INCREMENT,
    "migration" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "batch" int NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "oauth_access_tokens" (
    "id" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "client_id" bigint unsigned NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "scopes" text COLLATE utf8mb4_unicode_ci,
    "revoked" SMALLINT NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "expires_at" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "oauth_auth_codes" (
    "id" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "user_id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "client_id" bigint unsigned NOT NULL,
    "scopes" text COLLATE utf8mb4_unicode_ci,
    "revoked" SMALLINT NOT NULL,
    "expires_at" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "oauth_clients" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "user_id" bigint unsigned DEFAULT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "secret" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "provider" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "redirect" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "personal_access_client" SMALLINT NOT NULL,
    "password_client" SMALLINT NOT NULL,
    "revoked" SMALLINT NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "oauth_personal_access_clients" (
    "id" bigint unsigned NOT NULL AUTO_INCREMENT,
    "client_id" bigint unsigned NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "oauth_refresh_tokens" (
    "id" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "access_token_id" varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    "revoked" SMALLINT NOT NULL,
    "expires_at" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "password_resets" (
    "email" varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
    "token" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "pengaduans" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "id_masyarakat" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "id_admin" char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "id_petugas" char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "nama_jalan" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "geometry" geometry NOT NULL,
    "foto" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tipe_pengaduan" varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    "deskripsi_pengaduan" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "status_pengaduan" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "laporan_petugas" text COLLATE utf8mb4_unicode_ci,
    "feedback_masyarakat" text COLLATE utf8mb4_unicode_ci,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "petugas" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "nama" varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
    "foto" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "posisi_petugas" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tempat_lahir" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "tgl_lahir" date NOT NULL,
    "alamat" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "no_hp" varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "petugas_email_unique" UNIQUE ("email")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "titik_banjirs" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "id_admin" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "geometry" geometry NOT NULL,
    "nama_jalan" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "kondisi_kerusakan" text COLLATE utf8mb4_unicode_ci NOT NULL,
    "keterangan" text COLLATE utf8mb4_unicode_ci,
    "foto" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "titik_tersumbats" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "id_admin" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "geometry" geometry NOT NULL,
    "nama_jalan" varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    "foto" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "keterangan" text COLLATE utf8mb4_unicode_ci,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "users" (
    "id" char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
    "name" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email" varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    "remember_token" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    CONSTRAINT "users_email_unique" UNIQUE ("email")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE "drainases" ADD CONSTRAINT "drainases_id_admin_foreign" FOREIGN KEY ("id_admin") REFERENCES "admins" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "pengaduans" ADD CONSTRAINT "pengaduans_id_admin_foreign" FOREIGN KEY ("id_admin") REFERENCES "admins" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "pengaduans" ADD CONSTRAINT "pengaduans_id_masyarakat_foreign" FOREIGN KEY ("id_masyarakat") REFERENCES "masyarakats" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "pengaduans" ADD CONSTRAINT "pengaduans_id_petugas_foreign" FOREIGN KEY ("id_petugas") REFERENCES "petugas" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titik_banjirs" ADD CONSTRAINT "titik_banjirs_id_admin_foreign" FOREIGN KEY ("id_admin") REFERENCES "admins" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titik_tersumbats" ADD CONSTRAINT "titik_tersumbats_id_admin_foreign" FOREIGN KEY ("id_admin") REFERENCES "admins" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX ON "drainases" ("id_admin");
CREATE INDEX ON "oauth_access_tokens" ("user_id");
CREATE INDEX ON "oauth_auth_codes" ("user_id");
CREATE INDEX ON "oauth_clients" ("user_id");
CREATE INDEX ON "oauth_refresh_tokens" ("access_token_id");
CREATE INDEX ON "password_resets" ("email");
CREATE INDEX ON "pengaduans" ("id_masyarakat");
CREATE INDEX ON "pengaduans" ("id_admin");
CREATE INDEX ON "pengaduans" ("id_petugas");
CREATE INDEX ON "titik_banjirs" ("id_admin");
CREATE INDEX ON "titik_tersumbats" ("id_admin");
