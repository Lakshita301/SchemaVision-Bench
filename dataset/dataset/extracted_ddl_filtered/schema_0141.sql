-- Source: https://github.com/vertudez02/SYDPManagementSystem/blob/0c001c0049e2eef123ba4273e6dff50b123d4aa7/sydp.sql?raw=true
-- Tables detected: 25 | FK/REFERENCES mentions: 25

CREATE TABLE `r_academic_year` (
  `acadyr_id` int(11) NOT NULL,
  `acadyr_startyear` year(4) NOT NULL,
  `acadyr_endyear` year(4) NOT NULL,
  `acadyr_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `acadyr_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `r_beneficiary` (
  `beneficiary_id` int(11) NOT NULL,
  `beneficiary_name` varchar(255) NOT NULL,
  `beneficiary_description` varchar(255) NOT NULL,
  `beneficiary_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `beneficiary_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `r_course` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_description` varchar(255) NOT NULL,
  `course_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `course_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `r_requirement` (
  `req_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `req_name` varchar(255) NOT NULL,
  `req_remarks` varchar(255) NOT NULL,
  `req_dateregistered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `r_scholar` (
  `scholar_id` int(11) NOT NULL,
  `scholar_type` varchar(255) NOT NULL,
  `scholar_description` varchar(255) NOT NULL,
  `scholar_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `scholar_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `r_semester` (
  `semester_id` int(11) NOT NULL,
  `semester_description` varchar(255) NOT NULL,
  `semester_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `semester_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `r_university` (
  `univ_id` int(11) NOT NULL,
  `univ_code` varchar(255) NOT NULL,
  `univ_name` varchar(255) NOT NULL,
  `univ_description` varchar(255) NOT NULL,
  `univ_location` varchar(255) NOT NULL,
  `univ_type` varchar(255) NOT NULL,
  `univ_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `univ_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `r_userrole` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) NOT NULL,
  `roledateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `rolestatus` enum('active','inactive',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_accounts` (
  `acc_id` int(11) NOT NULL,
  `acc_username` varchar(255) NOT NULL,
  `acc_password` varchar(255) NOT NULL,
  `acc_name` varchar(255) NOT NULL,
  `roleid` int(11) NOT NULL,
  `acc_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `acc_status` enum('active','inactive',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_application_batchyear` (
  `app_batch_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `app_batch_year` varchar(255) NOT NULL,
  `app_batch_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `app_batch_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_application_educationalbg` (
  `app_educ_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `app_educ_level` varchar(255) NOT NULL,
  `app_educ_schoolname` varchar(255) NOT NULL,
  `app_educ_type` varchar(255) NOT NULL,
  `app_educ_yeargraduated` varchar(255) NOT NULL,
  `app_educ_awards` varchar(255) NOT NULL,
  `app_educ_gwa` varchar(255) NOT NULL,
  `app_educ_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `app_educ_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_application_student_familybg` (
  `app_familiy_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `app_family_relationship` varchar(255) NOT NULL,
  `app_family_firstname` varchar(255) NOT NULL,
  `app_family_middlename` varchar(255) NOT NULL,
  `app_family_lastname` varchar(255) NOT NULL,
  `app_family_age` varchar(255) NOT NULL,
  `app_family_civilstatus` varchar(255) NOT NULL,
  `app_family_educational` varchar(255) NOT NULL,
  `app_family_occupation` varchar(255) NOT NULL,
  `app_family_income` varchar(255) NOT NULL,
  `app_family_location` varchar(255) NOT NULL,
  `app_familiy_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `app_family_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_application_student_personalinfo` (
  `app_personal_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `app_personal_address` varchar(255) NOT NULL,
  `app_personal_barangay` varchar(255) NOT NULL,
  `app_personal_district` varchar(255) NOT NULL,
  `app_personal_birthdate` varchar(255) NOT NULL,
  `app_personal_age` varchar(255) NOT NULL,
  `app_personal_weight` varchar(255) NOT NULL,
  `app_personal_height` varchar(255) NOT NULL,
  `app_personal_civilstatus` varchar(255) NOT NULL,
  `app_personal_citizenship` varchar(255) NOT NULL,
  `app_personal_religion` varchar(255) NOT NULL,
  `app_personal_gender` varchar(255) NOT NULL,
  `app_personal_noofbrothers` varchar(255) NOT NULL,
  `app_personal_noofsisters` varchar(255) NOT NULL,
  `app_personal_ordinalposition` varchar(255) NOT NULL,
  `app_personal_teleno` varchar(255) NOT NULL,
  `app_personal_mobileno` varchar(255) NOT NULL,
  `app_personal_email` varchar(255) NOT NULL,
  `app_personal_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `app_personal_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_application_student_profile` (
  `app_profile_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `app_profile_firstname` varchar(255) NOT NULL,
  `app_profile_middlename` varchar(255) NOT NULL,
  `app_profile_lastname` varchar(255) NOT NULL,
  `app_profile_extensionname` varchar(255) NOT NULL,
  `univ_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `app_profile_studyear` varchar(255) NOT NULL,
  `app_profile_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `app_profile_status` enum('Pending','Approved','Scholar',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_renewal` (
  `renewal_id` int(11) NOT NULL,
  `scholar_profile_no` varchar(255) NOT NULL,
  `renewal_status` enum('Pending','Approved',',') NOT NULL,
  `renewal_dateregistered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_scholar_student` (
  `scholar_student_id` int(11) NOT NULL,
  `scholar_student_no` varchar(255) NOT NULL,
  `scholar_id` int(11) NOT NULL,
  `scholar_status` enum('Continue','Stop','Graduate',',') NOT NULL,
  `scholar_dateregistered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_scholar_student1_profile` (
  `scholar_profile_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `scholar_profile_no` varchar(255) NOT NULL,
  `scholar_profile_firstname` varchar(255) NOT NULL,
  `scholar_profile_middlename` varchar(255) NOT NULL,
  `scholar_profile_lastname` varchar(255) NOT NULL,
  `scholar_profile_extensionname` varchar(255) NOT NULL,
  `scholar_id` int(11) NOT NULL,
  `univ_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `scholar_profile_studyear` varchar(255) NOT NULL,
  `scholar_profile_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `scholar_profile_status` enum('Continue','Stop','Graduate','Not Renew',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_scholar_student2_personalinfo` (
  `scholar_personal_id` int(11) NOT NULL,
  `scholar_profile_no` varchar(255) NOT NULL,
  `scholar_personal_address` varchar(255) NOT NULL,
  `scholar_personal_barangay` varchar(255) NOT NULL,
  `scholar_personal_district` varchar(255) NOT NULL,
  `scholar_personal_birthdate` varchar(255) NOT NULL,
  `scholar_personal_age` varchar(255) NOT NULL,
  `scholar_personal_weight` varchar(255) NOT NULL,
  `scholar_personal_height` varchar(255) NOT NULL,
  `scholar_personal_civilstatus` varchar(255) NOT NULL,
  `scholar_personal_citizenship` varchar(255) NOT NULL,
  `scholar_personal_religion` varchar(255) NOT NULL,
  `scholar_personal_gender` varchar(255) NOT NULL,
  `scholar_personal_noofbrothers` varchar(255) NOT NULL,
  `scholar_personal_noofsisters` varchar(255) NOT NULL,
  `scholar_personal_ordinalposition` varchar(255) NOT NULL,
  `scholar_personal_teleno` varchar(255) NOT NULL,
  `scholar_personal_mobileno` varchar(255) NOT NULL,
  `scholar_personal_email` varchar(255) NOT NULL,
  `scholar_personal_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `scholar_personal_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_scholar_student3_familybg` (
  `scholar_family_id` int(11) NOT NULL,
  `scholar_profile_no` varchar(255) NOT NULL,
  `scholar_family_relationship` varchar(255) NOT NULL,
  `scholar_family_firstname` varchar(255) NOT NULL,
  `scholar_family_middlename` varchar(255) NOT NULL,
  `scholar_family_lastname` varchar(255) NOT NULL,
  `scholar_family_age` varchar(255) NOT NULL,
  `scholar_family_civilstatus` varchar(255) NOT NULL,
  `scholar_family_educational` varchar(255) NOT NULL,
  `scholar_family_occupation` varchar(255) NOT NULL,
  `scholar_family_income` varchar(255) NOT NULL,
  `scholar_family_location` varchar(255) NOT NULL,
  `scholar_family_contact` varchar(255) NOT NULL,
  `scholar_family_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `scholar_family_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_scholar_student4_educationalbg` (
  `scholar_educ_id` int(11) NOT NULL,
  `scholar_profile_no` varchar(255) NOT NULL,
  `scholar_educ_level` varchar(255) NOT NULL,
  `scholar_educ_schoolname` varchar(255) NOT NULL,
  `scholar_educ_address` varchar(255) NOT NULL,
  `scholar_educ_type` varchar(255) NOT NULL,
  `scholar_educ_yeargraduated` varchar(255) NOT NULL,
  `scholar_educ_awards` varchar(255) NOT NULL,
  `scholar_educ_gwa` varchar(255) NOT NULL,
  `scholar_educ_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `scholar_educ_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_scholar_student5_batchyear` (
  `scholar_batch_id` int(11) NOT NULL,
  `scholar_profile_no` varchar(255) NOT NULL,
  `scholar_batch_year` varchar(255) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `scholar_batch_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `scholar_batch_status` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_step2_appreq` (
  `app_step2_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `app_step2_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `app_step2_status` enum('Completed','Incomplete',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_step3_appinterview` (
  `app_step3_id` int(11) NOT NULL,
  `app_profile_no` varchar(255) NOT NULL,
  `app_step3_scheduledate` varchar(255) NOT NULL,
  `app_step3_scheduletime` varchar(255) NOT NULL,
  `app_step3_remarks` enum('For Interview','Passed','Failed',',') NOT NULL,
  `app_step3_datergistered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_stipen` (
  `stipen_id` int(11) NOT NULL,
  `scholar_profile_no` varchar(255) NOT NULL,
  `stipen_scheduledate` varchar(255) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `stipen_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `stipen_status` enum('Pending','For Release','Claimed','Unclaimed',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_userlog` (
  `log_NO` int(255) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `log_datestamp` date NOT NULL,
  `log_timestamp` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `r_requirement`
  ADD CONSTRAINT `r_requirement_ibfk_1` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_accounts`
  ADD CONSTRAINT `t_accounts_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `r_userrole` (`roleid`);

ALTER TABLE `t_application_batchyear`
  ADD CONSTRAINT `t_application_batchyear_ibfk_1` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_application_educationalbg`
  ADD CONSTRAINT `t_application_educationalbg_ibfk_1` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_application_student_familybg`
  ADD CONSTRAINT `t_application_student_familybg_ibfk_1` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_application_student_personalinfo`
  ADD CONSTRAINT `t_application_student_personalinfo_ibfk_1` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_application_student_profile`
  ADD CONSTRAINT `t_application_student_profile_ibfk_1` FOREIGN KEY (`univ_id`) REFERENCES `r_university` (`univ_id`),
  ADD CONSTRAINT `t_application_student_profile_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `r_course` (`course_id`);

ALTER TABLE `t_renewal`
  ADD CONSTRAINT `t_renewal_ibfk_1` FOREIGN KEY (`scholar_profile_no`) REFERENCES `t_scholar_student1_profile` (`scholar_profile_no`);

ALTER TABLE `t_scholar_student`
  ADD CONSTRAINT `t_scholar_student_ibfk_2` FOREIGN KEY (`scholar_id`) REFERENCES `r_scholar` (`scholar_id`);

ALTER TABLE `t_scholar_student1_profile`
  ADD CONSTRAINT `t_scholar_student1_profile_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `r_course` (`course_id`),
  ADD CONSTRAINT `t_scholar_student1_profile_ibfk_2` FOREIGN KEY (`univ_id`) REFERENCES `r_university` (`univ_id`),
  ADD CONSTRAINT `t_scholar_student1_profile_ibfk_3` FOREIGN KEY (`scholar_id`) REFERENCES `r_scholar` (`scholar_id`),
  ADD CONSTRAINT `t_scholar_student1_profile_ibfk_4` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_scholar_student2_personalinfo`
  ADD CONSTRAINT `t_scholar_student2_personalinfo_ibfk_1` FOREIGN KEY (`scholar_profile_no`) REFERENCES `t_scholar_student1_profile` (`scholar_profile_no`);

ALTER TABLE `t_scholar_student3_familybg`
  ADD CONSTRAINT `t_scholar_student3_familybg_ibfk_1` FOREIGN KEY (`scholar_profile_no`) REFERENCES `t_scholar_student1_profile` (`scholar_profile_no`);

ALTER TABLE `t_scholar_student4_educationalbg`
  ADD CONSTRAINT `t_scholar_student4_educationalbg_ibfk_1` FOREIGN KEY (`scholar_profile_no`) REFERENCES `t_scholar_student1_profile` (`scholar_profile_no`);

ALTER TABLE `t_scholar_student5_batchyear`
  ADD CONSTRAINT `t_scholar_student5_batchyear_ibfk_1` FOREIGN KEY (`scholar_profile_no`) REFERENCES `t_scholar_student1_profile` (`scholar_profile_no`),
  ADD CONSTRAINT `t_scholar_student5_batchyear_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `r_semester` (`semester_id`);

ALTER TABLE `t_step2_appreq`
  ADD CONSTRAINT `t_step2_appreq_ibfk_2` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_step3_appinterview`
  ADD CONSTRAINT `t_step3_appinterview_ibfk_2` FOREIGN KEY (`app_profile_no`) REFERENCES `t_application_student_profile` (`app_profile_no`);

ALTER TABLE `t_stipen`
  ADD CONSTRAINT `t_stipen_ibfk_1` FOREIGN KEY (`scholar_profile_no`) REFERENCES `t_scholar_student1_profile` (`scholar_profile_no`),
  ADD CONSTRAINT `t_stipen_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `r_semester` (`semester_id`);

ALTER TABLE `t_userlog`
  ADD CONSTRAINT `t_userlog_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `r_userrole` (`roleid`),
  ADD CONSTRAINT `t_userlog_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `t_accounts` (`acc_id`);

