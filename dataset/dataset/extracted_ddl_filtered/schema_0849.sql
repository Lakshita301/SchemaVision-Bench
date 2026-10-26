-- Source: https://github.com/haewhybabs/d-support/blob/629b51690cb75b9b65863f7f07951f36c97d4671/d-support.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 27

CREATE TABLE `audit` (
  `id` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `task` text NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `diagnosis_exception_requirement` (
  `id` int(30) NOT NULL,
  `possible_diagnosis_id` int(40) NOT NULL,
  `diagnosis_question_id` int(40) NOT NULL,
  `expected_outcome` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `diagnosis_questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `allow_option` int(11) NOT NULL DEFAULT 1,
  `createdTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `diagnosis_question_outcome` (
  `id` int(40) NOT NULL,
  `diagnosis_question_id` int(40) NOT NULL,
  `outcome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `diagnosis_question_result` (
  `id` int(11) NOT NULL,
  `question_summary_id` int(11) NOT NULL,
  `possible_diagnosis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `diagnosis_requirement` (
  `id` int(30) NOT NULL,
  `possible_diagnosis_id` int(20) NOT NULL,
  `diagnosis_question_id` int(20) NOT NULL,
  `expected_outcome` int(11) NOT NULL,
  `alternative_id` int(11) DEFAULT NULL,
  `alternative_outcome` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `head_test_tbl` (
  `id` int(10) UNSIGNED NOT NULL,
  `head_test_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `patient_diagnosis` (
  `id` int(20) UNSIGNED NOT NULL,
  `pqt_summary_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `appointment_time` datetime DEFAULT NULL,
  `taken_diagnosis_questions` int(11) NOT NULL COMMENT '	1:Yes , 0:NO	',
  `diagnosis_status` int(11) NOT NULL DEFAULT 0 COMMENT '1:Concluded , 2:Initiated, 0:Not Started',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `patient_diagnosis_question_response` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `pqt_summary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_question_test_detail` (
  `id` int(11) NOT NULL,
  `pqt_summary_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `userOption` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_question_test_summary` (
  `id` int(40) NOT NULL,
  `patient_id` int(40) UNSIGNED NOT NULL,
  `diagnosis_completed` int(10) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_test_detail` (
  `detail_id` int(10) UNSIGNED NOT NULL,
  `summary_id` int(10) UNSIGNED NOT NULL,
  `sub_test_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `patient_test_summary` (
  `summary_id` int(10) UNSIGNED NOT NULL,
  `stage` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `therapist_id` int(20) NOT NULL,
  `diagnosis_id` int(20) UNSIGNED NOT NULL,
  `head_test_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `possible_diagnosis` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sub_test_tbl` (
  `sub_test_id` int(10) UNSIGNED NOT NULL,
  `sub_test_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_test_id` int(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `test_flow_tbl` (
  `flow_id` int(10) UNSIGNED NOT NULL,
  `sub_test_id` int(10) UNSIGNED NOT NULL,
  `stage` int(11) NOT NULL,
  `sub_test_depending_id` int(11) UNSIGNED DEFAULT NULL,
  `previous_status` tinyint(2) DEFAULT NULL COMMENT '1:Postive, 0:Negative',
  `final_diagnosis` tinyint(3) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_ID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `diagnosis_exception_requirement`
  ADD CONSTRAINT `diagnosis_exception_requirement_ibfk_1` FOREIGN KEY (`diagnosis_question_id`) REFERENCES `diagnosis_questions` (`id`),
  ADD CONSTRAINT `diagnosis_exception_requirement_ibfk_2` FOREIGN KEY (`possible_diagnosis_id`) REFERENCES `possible_diagnosis` (`id`),
  ADD CONSTRAINT `diagnosis_exception_requirement_ibfk_3` FOREIGN KEY (`expected_outcome`) REFERENCES `diagnosis_question_outcome` (`id`);

ALTER TABLE `diagnosis_question_outcome`
  ADD CONSTRAINT `diagnosis_question_outcome_ibfk_1` FOREIGN KEY (`diagnosis_question_id`) REFERENCES `diagnosis_questions` (`id`);

ALTER TABLE `diagnosis_question_result`
  ADD CONSTRAINT `diagnosis_question_result_ibfk_1` FOREIGN KEY (`possible_diagnosis_id`) REFERENCES `possible_diagnosis` (`id`),
  ADD CONSTRAINT `diagnosis_question_result_ibfk_2` FOREIGN KEY (`question_summary_id`) REFERENCES `patient_question_test_summary` (`id`);

ALTER TABLE `diagnosis_requirement`
  ADD CONSTRAINT `diagnosis_requirement_ibfk_1` FOREIGN KEY (`possible_diagnosis_id`) REFERENCES `possible_diagnosis` (`id`),
  ADD CONSTRAINT `diagnosis_requirement_ibfk_2` FOREIGN KEY (`diagnosis_question_id`) REFERENCES `diagnosis_questions` (`id`),
  ADD CONSTRAINT `diagnosis_requirement_ibfk_3` FOREIGN KEY (`expected_outcome`) REFERENCES `diagnosis_question_outcome` (`id`),
  ADD CONSTRAINT `diagnosis_requirement_ibfk_4` FOREIGN KEY (`alternative_id`) REFERENCES `diagnosis_questions` (`id`),
  ADD CONSTRAINT `diagnosis_requirement_ibfk_5` FOREIGN KEY (`alternative_outcome`) REFERENCES `diagnosis_question_outcome` (`id`);

ALTER TABLE `patient_diagnosis`
  ADD CONSTRAINT `patient_diagnosis_ibfk_1` FOREIGN KEY (`pqt_summary_id`) REFERENCES `patient_question_test_summary` (`id`),
  ADD CONSTRAINT `patient_diagnosis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_diagnosis_question_response`
  ADD CONSTRAINT `patient_diagnosis_question_response_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `diagnosis_questions` (`id`),
  ADD CONSTRAINT `patient_diagnosis_question_response_ibfk_2` FOREIGN KEY (`pqt_summary_id`) REFERENCES `patient_question_test_summary` (`id`);

ALTER TABLE `patient_question_test_detail`
  ADD CONSTRAINT `patient_question_test_detail_ibfk_1` FOREIGN KEY (`pqt_summary_id`) REFERENCES `patient_question_test_summary` (`id`),
  ADD CONSTRAINT `patient_question_test_detail_ibfk_2` FOREIGN KEY (`userOption`) REFERENCES `diagnosis_question_outcome` (`id`),
  ADD CONSTRAINT `patient_question_test_detail_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `diagnosis_questions` (`id`);

ALTER TABLE `patient_question_test_summary`
  ADD CONSTRAINT `patient_question_test_summary_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_test_detail`
  ADD CONSTRAINT `patient_test_detail_sub_test_id_foreign` FOREIGN KEY (`sub_test_id`) REFERENCES `sub_test_tbl` (`sub_test_id`),
  ADD CONSTRAINT `patient_test_detail_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `patient_test_summary` (`summary_id`);

ALTER TABLE `patient_test_summary`
  ADD CONSTRAINT `diagnosis_id` FOREIGN KEY (`diagnosis_id`) REFERENCES `patient_diagnosis` (`id`),
  ADD CONSTRAINT `patient_test_summary_head_test_id_foreign` FOREIGN KEY (`head_test_id`) REFERENCES `head_test_tbl` (`id`),
  ADD CONSTRAINT `patient_test_summary_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `sub_test_tbl`
  ADD CONSTRAINT `head_test_id` FOREIGN KEY (`head_test_id`) REFERENCES `head_test_tbl` (`id`);

ALTER TABLE `test_flow_tbl`
  ADD CONSTRAINT `sub_test_depending_id` FOREIGN KEY (`sub_test_depending_id`) REFERENCES `sub_test_tbl` (`sub_test_id`),
  ADD CONSTRAINT `test_flow_tbl_sub_test_id_foreign` FOREIGN KEY (`sub_test_id`) REFERENCES `sub_test_tbl` (`sub_test_id`);

