-- Source: https://github.com/rifqiadliansyah/FinalProjectPBO_6/blob/8cde966bcd2b4bb33b2eca4efe59f7d440ffcc79/Database%20koperasi%20Export/koperasi.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE `individu` (
  `idNasabah` int(10) NOT NULL,
  `nik` int(100) DEFAULT NULL,
  `npwp` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `nasabah` (
  `idNasabah` int(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `perusahaan` (
  `idNasabah` int(10) NOT NULL,
  `nib` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rekening` (
  `no_rekening` int(10) NOT NULL,
  `saldo` double(16,2) DEFAULT NULL,
  `idNasabah` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `individu`
  ADD CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`) ON UPDATE CASCADE;

ALTER TABLE `perusahaan`
  ADD CONSTRAINT `perusahaan_ibfk_1` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`) ON UPDATE CASCADE;

ALTER TABLE `rekening`
  ADD CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`) ON UPDATE CASCADE;

