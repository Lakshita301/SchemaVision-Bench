-- Source: https://github.com/adew/amora/blob/b38eb4b87cc0ad1e2ab8af683501e1610f05302e/sql/db_pengarsipan_surat.sql?raw=true
-- Tables detected: 14 | FK constraints: 8

CREATE TABLE `disposisi_surat_masuk` (
  `id` int(11) NOT NULL,
  `tgl_disposisi` date DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `id_surat_masuk` int(11) NOT NULL,
  `id_petugas` int(11) UNSIGNED NOT NULL,
  `dibuat_pada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `jenis_surat` (
  `id_jenis_surat` int(5) NOT NULL,
  `jenis_surat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `konsep` (
  `id_konsep` int(11) NOT NULL,
  `no_reg` varchar(50) NOT NULL,
  `pangkat` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_register` date NOT NULL,
  `jenis_kesatuan` varchar(10) NOT NULL,
  `berkas_konsep` varchar(50) NOT NULL,
  `dibuat_pada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `nominatif` (
  `id_nominatif` int(11) NOT NULL,
  `tahun` int(5) NOT NULL,
  `bulan` int(5) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `pelaku` varchar(50) NOT NULL,
  `jml_perkara_masuk` int(10) NOT NULL,
  `jml_perkara_putus` int(10) NOT NULL,
  `dibuat_pada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `petugas` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tgl_lahir` varchar(15) NOT NULL,
  `alamat` tinytext DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `surat_keluar` (
  `id_surat_keluar` int(10) NOT NULL,
  `no_surat` varchar(50) DEFAULT NULL,
  `tgl_surat` date DEFAULT NULL,
  `perihal` varchar(100) DEFAULT NULL,
  `pengirim` varchar(50) DEFAULT NULL,
  `kepada` varchar(50) DEFAULT NULL,
  `id_jenis_surat` int(5) DEFAULT NULL,
  `sifat_surat` enum('Rahasia','Penting','Segera','Biasa') DEFAULT NULL,
  `id_petugas` int(11) UNSIGNED DEFAULT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `dibuat_pada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `surat_masuk` (
  `id_surat_masuk` int(11) NOT NULL,
  `no_surat` varchar(50) DEFAULT NULL,
  `tgl_surat` date DEFAULT NULL,
  `perihal` varchar(100) DEFAULT NULL,
  `id_jenis_surat` int(5) DEFAULT NULL,
  `pengirim` varchar(50) DEFAULT NULL,
  `ditujukan` varchar(50) DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL,
  `id_petugas` int(11) UNSIGNED DEFAULT NULL,
  `sifat_surat` enum('Rahasia','Penting','Segera','Biasa') DEFAULT NULL,
  `status_disposisi` enum('Sudah Disposisi','Belum Disposisi') DEFAULT NULL,
  `dibuat_pada` int(11) NOT NULL,
  `berkas_surat` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `v_disposisi_surat_masuk` (
`id` int(11)
,`no_surat` varchar(50)
,`tgl_surat` date
,`tgl_disposisi` date
,`perihal` varchar(100)
,`dari` varchar(50)
,`kepada` varchar(50)
,`keterangan` varchar(100)
,`username` varchar(100)
,`dibuat_pada` int(11)
);

CREATE TABLE `v_petugas` (
`id` int(11) unsigned
,`nama_petugas` varchar(35)
,`username` varchar(100)
,`email` varchar(254)
,`group_id` mediumint(8) unsigned
);

CREATE TABLE `v_surat_keluar` (
`id` int(10)
,`no_surat` varchar(50)
,`tgl_surat` date
,`perihal` varchar(100)
,`pengirim` varchar(50)
,`kepada` varchar(50)
,`jenis_surat` varchar(40)
,`sifat_surat` enum('Rahasia','Penting','Segera','Biasa')
,`petugas` varchar(100)
,`deskripsi` longtext
,`dibuat_pada` int(11)
);

CREATE TABLE `v_surat_masuk` (
`id` int(11)
,`no_surat` varchar(50)
,`tgl_surat` date
,`perihal` varchar(100)
,`jenis_surat` varchar(40)
,`pengirim` varchar(50)
,`ditujukan` varchar(50)
,`deskripsi` mediumtext
,`username` varchar(100)
,`berkas_surat` varchar(25)
,`sifat_surat` enum('Rahasia','Penting','Segera','Biasa')
,`status_disposisi` enum('Sudah Disposisi','Belum Disposisi')
,`dibuat_pada` int(11)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `disposisi_surat_masuk`
  ADD CONSTRAINT `fk_disposisi_surat_masuk_petugas1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_disposisi_surat_masuk_surat_masuk1` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk` (`id_surat_masuk`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `surat_keluar`
  ADD CONSTRAINT `fk_surat_keluar__jenis_surat1` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id_jenis_surat`),
  ADD CONSTRAINT `fk_surat_keluar_petugas1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id`);

ALTER TABLE `surat_masuk`
  ADD CONSTRAINT `fk_surat_masuk_jenis_surat1` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id_jenis_surat`),
  ADD CONSTRAINT `fk_surat_masuk_petugas1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id`);

ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `petugas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

