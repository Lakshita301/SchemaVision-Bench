-- Source: https://github.com/nailanahdiyah/SIG-TerminalKotaMalang/blob/4c15f6d65a42dac5b56ddf13fc6038fcf2005608/prakgis_project.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 1

CREATE TABLE `akun` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `jk` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `jadwal_keberangkatan` (
  `id` int(11) NOT NULL,
  `id_terminal` int(11) NOT NULL,
  `operator` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `jam_berangkat` varchar(20) NOT NULL,
  `jam_datang` varchar(30) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `waktu_tempuh` varchar(30) NOT NULL,
  `harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `terminal` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `tipe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `jadwal_keberangkatan`
  ADD CONSTRAINT `jadwal_keberangkatan_ibfk_1` FOREIGN KEY (`id_terminal`) REFERENCES `terminal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

