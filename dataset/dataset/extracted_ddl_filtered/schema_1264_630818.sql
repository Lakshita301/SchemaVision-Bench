-- Source: https://github.com/kiki091/SchemaRS/blob/e4593e1fc9b4cf4a59e1787ffbce22c2e7362d62/database/schema_rs.sql?raw=true
-- Tables detected: 19 | FK constraints: 17

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(45) DEFAULT NULL,
  `foto_images` varchar(100) DEFAULT NULL,
  `fullname` varchar(65) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `street` text,
  `districts` varchar(50) DEFAULT NULL COMMENT 'indo:kecamatan',
  `city` varchar(50) DEFAULT NULL COMMENT 'indo:kota',
  `province` varchar(50) DEFAULT NULL COMMENT 'indo:provinsi',
  `phone_number` varchar(15) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `religion` int(1) DEFAULT NULL COMMENT '1:Islam, 2:Kristen Katolik, 3:Kristen Protestan, 4:Hindu, 5:Budha, 6:Lainnya',
  `place_of_birth` varchar(55) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `specialist` varchar(40) DEFAULT NULL,
  `marital_status` varchar(45) DEFAULT NULL,
  `citizen` int(2) DEFAULT NULL COMMENT '1:WNI, 2:WNA',
  `country` varchar(40) DEFAULT NULL,
  `poliklinik_id` int(5) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nik_UNIQUE` (`nik`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(15) DEFAULT NULL,
  `hour_of_entry` time DEFAULT NULL,
  `hour_of_out` time DEFAULT NULL,
  `description` text,
  `doctor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jadwal_dokter_1_idx` (`doctor_id`),
  CONSTRAINT `fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `history_disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_of_felt` text COMMENT 'id:keluhan',
  `diagnosis` text,
  `actions` enum('0','1','2','3') DEFAULT NULL COMMENT '- 0 = Rawat Jalan\n- 1 = Rawat Inap\n- 2 = Rujukan RS Lain\n- 3 = Meninggal',
  `medical_record_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_history_disease_1_idx` (`medical_record_id`),
  CONSTRAINT `fk_history_disease_1` FOREIGN KEY (`medical_record_id`) REFERENCES `medical_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `laboratorium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `laboratorium_name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_laboratorium_1_idx` (`room_id`),
  CONSTRAINT `fk_laboratorium_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `laboratorium_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_id` int(11) DEFAULT NULL,
  `laboratorium_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_laboratorium_result_1_idx` (`registration_id`),
  KEY `fk_laboratorium_result_2_idx` (`laboratorium_id`),
  CONSTRAINT `fk_laboratorium_result_1` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_laboratorium_result_2` FOREIGN KEY (`laboratorium_id`) REFERENCES `laboratorium` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `laboratorium_result_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `laboratorium_result_id` int(11) DEFAULT NULL,
  `category_result` varchar(45) DEFAULT NULL COMMENT 'HEMATOLOGI\nHITUNG JENIS\nNARKOBA\nURINALISA',
  `sub_category_result` varchar(45) DEFAULT NULL COMMENT 'HEMATOLOGI RUTIN\nMARKROSKOPIK\nKIMIA URIN\nMIKROSKOPIK/SEDIMEN URIN',
  `result_name` varchar(45) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `satuan` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_id` varchar(45) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `polyclinic_id` int(5) DEFAULT NULL,
  `patient_status` tinyint(1) DEFAULT NULL COMMENT '- 1 = Umum\n- 2 = Asuransi Swasta\n- 3 = BPJS\n- 4 = KIS',
  `follow_up` tinyint(1) DEFAULT NULL COMMENT '- 1 = Rawat Jalan\n- 2 = Rawat Inap\n- 3 = Rujukan RS Lain\n- 4 = Meninggal\n- 5 = Check Up',
  `kesimpulan` text,
  `saran` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medical_records_1_idx` (`patient_id`),
  KEY `fk_medical_records_2_idx` (`doctor_id`),
  KEY `fk_medical_records_3_idx` (`polyclinic_id`),
  CONSTRAINT `fk_medical_records_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_medical_records_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_medical_records_3` FOREIGN KEY (`polyclinic_id`) REFERENCES `policlinic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `medical_records_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_records_id` int(11) DEFAULT NULL,
  `jenis_pemeriksaan` varchar(45) DEFAULT NULL COMMENT 'Fisik\nKepala\nTelinga\nHidung\nRongga Mulut\nThoraks\nAbdomen\nAnggota Badan',
  `category_pemeriksaan` varchar(45) DEFAULT NULL COMMENT 'KEPALA\nTELINGA\nHIDUNG\nRONGGA MULUT\nTHORAKS\nABDOMEN\nANGGOTA BADAN\nLainnya',
  `nama_pemeriksaan` varchar(70) DEFAULT NULL,
  `value` varchar(70) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medical_records_detail_1_idx` (`medical_records_id`),
  CONSTRAINT `fk_medical_records_detail_1` FOREIGN KEY (`medical_records_id`) REFERENCES `medical_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicament_code` varchar(45) DEFAULT NULL COMMENT 'Kode Obat',
  `medicament_name` varchar(65) DEFAULT NULL COMMENT 'Nama Obat',
  `how_to_use` varchar(45) DEFAULT NULL COMMENT 'Aturan pakai',
  `at_moment` enum('Sesudah Makan','Sebelum Makan') DEFAULT NULL COMMENT '1: Sesudah Makan\n2: Sebelum Makan',
  `quantity` varchar(20) DEFAULT NULL COMMENT 'Jumlah Obat (/pac)',
  `production_date` datetime DEFAULT NULL COMMENT 'Tanggal Produksi',
  `expired_date` datetime DEFAULT NULL COMMENT 'Tanggal Kadarluarsa',
  `category_diseases` varchar(45) DEFAULT NULL COMMENT 'Kategori Penyakit',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `nurse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(45) DEFAULT NULL,
  `foto_images` varchar(100) DEFAULT NULL,
  `fullname` varchar(65) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `street` text,
  `districts` varchar(50) DEFAULT NULL COMMENT 'indo:kecamatan',
  `city` varchar(50) DEFAULT NULL COMMENT 'indo:kota',
  `province` varchar(50) DEFAULT NULL COMMENT 'indo:provinsi',
  `phone_number` varchar(15) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `place_of_birth` varchar(55) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `religion` int(1) DEFAULT NULL COMMENT '1:Islam, 2:Kristen Katolik, 3:Kristen Protestan, 4:Hindu, 5:Budha, 6:Lainnya',
  `specialist` varchar(40) DEFAULT NULL,
  `marital_status` varchar(45) DEFAULT NULL,
  `citizen` int(2) DEFAULT NULL COMMENT '1:WNI, 2:WNA',
  `country` varchar(40) DEFAULT NULL,
  `policlinic_id` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nik_UNIQUE` (`nik`),
  KEY `fk_perawat_1_idx` (`policlinic_id`),
  CONSTRAINT `fk_perawat_1` FOREIGN KEY (`policlinic_id`) REFERENCES `policlinic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `nurse_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(15) DEFAULT NULL,
  `hour_of_entry` time DEFAULT NULL,
  `hour_of_out` time DEFAULT NULL,
  `week` int(1) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `description` text,
  `nurse_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nurse_idx` (`nurse_id`),
  CONSTRAINT `fk_nurse` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(45) DEFAULT NULL,
  `fullname` varchar(70) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `place_of_birth` varchar(60) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `street` text,
  `districts` varchar(50) DEFAULT NULL COMMENT 'indo:kecamatan',
  `city` varchar(50) DEFAULT NULL COMMENT 'indo:kota',
  `province` varchar(50) DEFAULT NULL COMMENT 'indo:provinsi',
  `age` int(2) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `description` text,
  `religion` int(1) DEFAULT NULL COMMENT '1:Islam, 2:Kristen Katolik, 3:Kristen Protestan, 4:Hindu, 5:Budha, 6:Lainnya',
  `education` varchar(10) DEFAULT NULL COMMENT '1: SD, 2:SMP, 3:SMA, 4:D3, 5:S1, 6:S2, 7:S3',
  `blood` varchar(2) DEFAULT NULL,
  `work` varchar(40) DEFAULT NULL,
  `citizen` int(1) DEFAULT NULL COMMENT '1:WNI, 2:WNA',
  `country` varchar(40) DEFAULT NULL,
  `marital_status` tinyint(1) DEFAULT NULL COMMENT '1: Belum Menikah\n2: Sudah Menikah',
  `registration_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nik_UNIQUE` (`nik`),
  KEY `fk_pasien_1_idx` (`registration_id`),
  CONSTRAINT `fk_pasien_1` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `policlinic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policlinic_name` varchar(45) DEFAULT NULL,
  `rooms_id` int(5) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poliklinik_1_idx` (`rooms_id`),
  CONSTRAINT `fk_poliklinik_1` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_number` varchar(45) DEFAULT NULL,
  `users_id` int(3) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registration_number_UNIQUE` (`registration_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `registration_inpatient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_id` int(11) DEFAULT NULL,
  `person_in_charge` varchar(55) DEFAULT NULL COMMENT 'penanggung jawab',
  `relation_family` varchar(45) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `type_reference` int(1) DEFAULT NULL COMMENT '1: Kemauan Sendiri\n2: Rujukan Rs Lain\n3: Rujukan Internal',
  `hospital_name` varchar(60) DEFAULT NULL,
  `description_reference` text,
  `complaint_of_felt` text,
  `registration_note` text,
  `room_care_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_registration_inpatient_1_idx` (`registration_id`),
  KEY `fk_registration_inpatient_2_idx` (`room_care_id`),
  KEY `fk_registration_inpatient_3_idx` (`doctor_id`),
  CONSTRAINT `fk_registration_inpatient_1` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_registration_inpatient_2` FOREIGN KEY (`room_care_id`) REFERENCES `room_care` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_registration_inpatient_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `room_care` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(55) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `capacity` int(2) DEFAULT NULL,
  `cost` varchar(45) DEFAULT NULL,
  `rooms_id` int(5) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kamar_inap_1_idx` (`rooms_id`),
  CONSTRAINT `fk_kamar_inap_1` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flor` int(2) DEFAULT NULL,
  `rooms_number` varchar(45) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_ruangan_UNIQUE` (`rooms_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

