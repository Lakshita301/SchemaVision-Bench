-- Source: https://github.com/selarassolusindo/siat2/blob/57a4f3ce2854fef4c58e46f3eacdc68c3d210662/db_siat2.sql?raw=true
-- Tables detected: 29 | FK constraints: 4

CREATE TABLE `t01_company` (
  `idcompany` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t02_akun` (
  `idakun` int(11) NOT NULL,
  `Kode` varchar(10) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Induk` int(11) NOT NULL,
  `Urut` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t03_saldoawal` (
  `idsa` int(11) NOT NULL,
  `idakun` int(11) NOT NULL,
  `Debit` double NOT NULL DEFAULT 0,
  `Kredit` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t04_tglsaldoawal` (
  `idtgl` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t05_customer` (
  `idcustomer` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `ContactPerson` varchar(50) NOT NULL,
  `Telepon` varchar(25) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t06_shipper` (
  `idshipper` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `ContactPerson` varchar(50) NOT NULL,
  `Telepon` varchar(25) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t07_vendor` (
  `idvendor` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `ContactPerson` varchar(50) NOT NULL,
  `Telepon` varchar(25) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t08_armada` (
  `idarmada` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Merk` varchar(50) NOT NULL,
  `Tipe` varchar(25) NOT NULL,
  `TahunPembuatan` varchar(4) NOT NULL,
  `NoPol` varchar(15) NOT NULL,
  `NomorRangka` varchar(50) NOT NULL,
  `NomorMesin` varchar(50) NOT NULL,
  `TglBeli` date NOT NULL,
  `JatuhTempoPajak` date NOT NULL,
  `JatuhTempoKir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t09_sparepart` (
  `idsparepart` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Merk` varchar(50) NOT NULL,
  `Tipe` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t10_service` (
  `idservice` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t11_cost` (
  `idcost` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Akun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t12_lokasi` (
  `idlokasi` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t13_satuan` (
  `idsatuan` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Tipe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t14_bank` (
  `idbank` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `NamaRekening` varchar(50) NOT NULL,
  `Cabang` varchar(50) NOT NULL,
  `NomorRekening` varchar(50) NOT NULL,
  `JenisRekening` varchar(50) NOT NULL,
  `Akun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t15_driver` (
  `iddriver` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` text NOT NULL,
  `HP` varchar(50) NOT NULL,
  `KTP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t16_ekor` (
  `idekor` int(11) NOT NULL,
  `Kode` varchar(5) NOT NULL,
  `Merk` varchar(50) NOT NULL,
  `Tipe` enum('Panjang','Pendek') NOT NULL,
  `TglBeli` date NOT NULL,
  `TglKir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t30_jo` (
  `idjo` int(11) NOT NULL,
  `NoJO` varchar(25) NOT NULL,
  `TglJO` date NOT NULL,
  `idcustomer` int(11) NOT NULL,
  `idshipper` int(11) NOT NULL,
  `TglMB` date NOT NULL,
  `idlokasi` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t31_csheet` (
  `idcsheet` int(11) NOT NULL,
  `nocsheet` varchar(10) NOT NULL,
  `tglcsheet` date NOT NULL,
  `idjo` int(11) NOT NULL,
  `totalcsheet` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t31_csheet_0` (
  `idcsheet` int(11) NOT NULL,
  `NoCSheet` varchar(10) NOT NULL,
  `TglCSheet` date NOT NULL,
  `idjo` int(11) NOT NULL,
  `Total` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t32_csheetd` (
  `idcsheetd` int(11) NOT NULL,
  `idcsheet` int(11) NOT NULL,
  `idcost` int(11) NOT NULL,
  `Qty` double NOT NULL,
  `idsatuan` int(11) NOT NULL,
  `Harga` double NOT NULL,
  `Jumlah` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t33_invoice` (
  `idinvoice` int(11) NOT NULL,
  `NoInvoice` varchar(10) NOT NULL,
  `TglInvoice` date NOT NULL,
  `idjo` int(11) NOT NULL,
  `Total` double NOT NULL,
  `PPNpersen` double NOT NULL,
  `PPNnilai` double NOT NULL,
  `GrandTotal` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t34_invoiced` (
  `idinvoiced` int(11) NOT NULL,
  `idinvoice` int(11) NOT NULL,
  `idservice` int(11) NOT NULL,
  `Qty` double NOT NULL,
  `idsatuan` int(11) NOT NULL,
  `Harga` double NOT NULL,
  `Jumlah` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t35_jod` (
  `idjod` int(11) NOT NULL,
  `idjo` int(11) NOT NULL,
  `idarmada` int(11) NOT NULL,
  `no_cont` varchar(25) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t44_menus` (
  `idmenus` int(11) NOT NULL,
  `Menus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t45_users_menus` (
  `idusersmenus` int(11) NOT NULL,
  `idusers` int(11) UNSIGNED NOT NULL,
  `idmenus` int(11) NOT NULL,
  `rights` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t46_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t47_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t48_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t49_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `t45_users_menus`
  ADD CONSTRAINT `t45_users_menus_ibfk_1` FOREIGN KEY (`idusers`) REFERENCES `t46_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `t45_users_menus_ibfk_2` FOREIGN KEY (`idmenus`) REFERENCES `t44_menus` (`idmenus`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `t48_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `t47_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `t46_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

