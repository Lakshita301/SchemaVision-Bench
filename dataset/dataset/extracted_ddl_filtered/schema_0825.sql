-- Source: https://github.com/egorshulga/bsuir-coursework-latex/blob/6dafe71df31aac5b4c3f602db62b3c65b8537aa3/note/attachments/db_mysql.sql?raw=true
-- Tables detected: 53 | FK/REFERENCES mentions: 77

CREATE TABLE `activities`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`activity_type_id` INT NOT NULL,
	`description` VARCHAR(255) 	 NULL,
	CONSTRAINT `PK_activities` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `activity_events`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`event_start` DATETIME NOT NULL,
	`event_end` DATETIME NOT NULL,
	`place` INT 	 NULL,
	`note` VARCHAR(255) 	 NULL,
	`activity_id` INT NOT NULL,
	`activity_type` ENUM ('subject_activity', 'examination') default 'subject_activity' NOT NULL,
	CONSTRAINT `PK_events` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `activity_types`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	CONSTRAINT `PK_activity_types` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `auditoriums`
(
	`id` INT NOT NULL,
	`number` VARCHAR(50) NOT NULL,
	`building_id` INT NOT NULL,
	`description` VARCHAR(255) 	 NULL,
	CONSTRAINT `PK_auditoriums` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `buildings`
(
	`id` INT NOT NULL,
	`name` VARCHAR(255) 	 NULL,
	`description` VARCHAR(255) 	 NULL,
	CONSTRAINT `PK_buildings` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `chair_news`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(255) NOT NULL DEFAULT '',
	`text` TEXT NOT NULL,
	`chair_id` INT NOT NULL,
	CONSTRAINT `PK_chair_news` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `chair_news_attachments`
(
	`news_id` INT NOT NULL,
	`file_id` INT NOT NULL,
	CONSTRAINT `PK_chair_news_attachments` PRIMARY KEY (`news_id` ASC, `file_id` ASC)
);

CREATE TABLE `chairs`
(
	`id` INT NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`faculty_id` INT NOT NULL,
	CONSTRAINT `PK_chairs` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `chairs_admins`
(
	`chair_id` INT NOT NULL,
	`user_assignment_id` INT NOT NULL,
	CONSTRAINT `PK_chairs_admins` PRIMARY KEY (`chair_id` ASC, `user_assignment_id` ASC)
);

CREATE TABLE `examination_attempts`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_examination_id` INT NOT NULL,
	CONSTRAINT `PK_examination_attempts` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `examinations`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`subject_id` INT NOT NULL,
	`lecturer_id` INT NOT NULL,
	CONSTRAINT `PK_examinations` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `faculties`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`university_id` INT NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	CONSTRAINT `PK_faculties` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `faculties_admins`
(
	`faculty_id` INT NOT NULL,
	`user_assignment_id` INT NOT NULL,
	CONSTRAINT `PK_faculties_admins` PRIMARY KEY (`user_assignment_id` ASC, `faculty_id` ASC)
);

CREATE TABLE `faculty_news`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(255) NOT NULL DEFAULT '',
	`text` TEXT NOT NULL,
	`faculty_id` INT NOT NULL,
	CONSTRAINT `PK_faculty_news` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `faculty_news_attachments`
(
	`news_id` INT NOT NULL,
	`file_id` INT NOT NULL,
	CONSTRAINT `PK_faculty_news_attachments` PRIMARY KEY (`news_id` ASC, `file_id` ASC)
);

CREATE TABLE `files`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`file_name` VARCHAR(255) NOT NULL ,
	`file_path` VARCHAR(255) NOT NULL ,
	CONSTRAINT `PK_files` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `groups`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`number` VARCHAR(255) NOT NULL,
	`enter_year` INT NOT NULL,
	`specialty_id` INT NOT NULL,
	CONSTRAINT `PK_groups` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `groups_students`
(
	`student_id` INT NOT NULL,
	`group_id` INT NOT NULL,
	CONSTRAINT `PK_groups_students` PRIMARY KEY (`student_id` ASC, `group_id` ASC)
);

CREATE TABLE `lecturer_chairs`
(
	`id` INT NOT NULL,
	`lecturer_id` INT NOT NULL,
	`chair_id` INT NOT NULL,
	`appointment_date` DATETIME NOT NULL,
	`repeal_date` DATETIME 	 NULL ,
	CONSTRAINT `PK_lecturer_chairs` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `lecturers`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`number` VARCHAR(255) NOT NULL,
	`position` VARCHAR(255) NOT NULL ,
	`assignment_id` INT NOT NULL,
	CONSTRAINT `PK_lecturer` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `messages`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`time` DATETIME NOT NULL DEFAULT NOW(),
	`from` INT NOT NULL,
	`to` INT NOT NULL,
	`text` TEXT NOT NULL,
	CONSTRAINT `PK_messages` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `messages_attachments`
(
	`message_id` INT NOT NULL,
	`file_id` INT NOT NULL,
	CONSTRAINT `PK_messages_attachments` PRIMARY KEY (`message_id` ASC, `file_id` ASC)
);

CREATE TABLE `non_registered_students`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_name` VARCHAR(255) NOT NULL,
	CONSTRAINT `PK_non_registered_students` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `notifications`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`time_posted` DATETIME NOT NULL DEFAULT NOW(),
	`user_id` INT NOT NULL,
	`type` ENUM ('event', 'task', 'subject', 'none') default 'none' NOT NULL,
	`reason_id` INT 	 NULL,
	`description` VARCHAR(255) 	 NULL,
	CONSTRAINT `PK_notifications` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `semesters`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`semester_start` DATE NOT NULL,
	`semester_end` DATE NOT NULL,
	`type` ENUM ('autumn', 'spring') default 'autumn' NOT NULL,
	CONSTRAINT `PK_semester` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `specialties`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`chair_id` INT NOT NULL,
	CONSTRAINT `PK_specialty` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `students`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`number` VARCHAR(255) NOT NULL,
	`assignment_id` INT NOT NULL,
	CONSTRAINT `PK_students` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `students_activities`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`activity_id` INT NOT NULL,
	`student_id` INT NOT NULL,
	`supervisor_id` INT NOT NULL,
	`mark` VARCHAR(50) 	 NULL,
	CONSTRAINT `PK_students_activities` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `students_attendancies`
(
	`student_in_list_id` INT NOT NULL,
	`subject_event_id` INT NOT NULL,
	`attended` BOOL NOT NULL DEFAULT TRUE,
	CONSTRAINT `PK_attendancy_lists` PRIMARY KEY (`student_in_list_id` ASC, `subject_event_id` ASC)
);

CREATE TABLE `students_examinations`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_in_list_id` INT NOT NULL,
	`examination_id` INT NOT NULL,
	`mark` VARCHAR(50) 	 NULL 
	CONSTRAINT `PK_students_examinations` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `students_in_lists`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`list_id` INT NOT NULL,
	`student_id` INT NOT NULL,
	`is_student_registered` BOOL NOT NULL DEFAULT TRUE,
	CONSTRAINT `PK_students_in_lists` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `students_lists`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`activity_id` INT NOT NULL,
	`description` VARCHAR(255) 	 NULL,
	CONSTRAINT `PK_students_lists` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `students_tasks`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_in_list_id` INT NOT NULL,
	`task_id` INT NOT NULL,
	`mark` VARCHAR(50) 	 NULL ,
	`status` ENUM ('submitted', 'under_examination', 'under_revision', 'completed') default 'submitted' NOT NULL,
	CONSTRAINT `PK_students_tasks` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `subject_activities`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`subject_id` INT NOT NULL,
	`lecturer_id` INT 	 NULL ,
	`activity_id` INT NOT NULL,
	CONSTRAINT `PK_subject_activities` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `subject_activities_groups`
(
	`group_id` INT NOT NULL,
	`subject_activity_id` INT NOT NULL,
	CONSTRAINT `PK_subject_activities_groups` PRIMARY KEY (`group_id` ASC, `subject_activity_id` ASC)
);

CREATE TABLE `subject_activity_event`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`group_id` INT NOT NULL,
	`subgroup` INT NOT NULL,
	`subject_activity_id` INT NOT NULL,
	CONSTRAINT `PK_subject_activity_event` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `subject_activity_task_types`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	CONSTRAINT `PK_task_types` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `subject_activity_tasks`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`description` TEXT NOT NULL,
	`task_type_id` INT NOT NULL,
	`subject_activity_id` INT NOT NULL,
	CONSTRAINT `PK_tasks` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `subject_activity_types`
(
	`id` INT NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	CONSTRAINT `PK_activity_type` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `subjects`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`chair_id` INT NOT NULL,
	CONSTRAINT `PK_subject` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `subjects_in_semesters`
(
	`subject_id` INT NOT NULL,
	`semester_id` INT 	 NULL,
	CONSTRAINT `PK_subject_in_semester` PRIMARY KEY (`subject_id` ASC)
);

CREATE TABLE `task_attachments`
(
	`file_id` INT NOT NULL AUTO_INCREMENT,
	`task_id` INT NOT NULL,
	CONSTRAINT `PK_task_attachments` PRIMARY KEY (`file_id` ASC, `task_id` ASC)
);

CREATE TABLE `task_defence_attempts`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_task_id` INT NOT NULL,
	`report` TEXT NOT NULL,
	`time_submitted` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`response` TEXT 	 NULL ,
	`is_attempt_successful` BOOL NOT NULL DEFAULT TRUE,
	CONSTRAINT `PK_task_defence_attempts` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `task_defence_attempts_attachments`
(
	`task_defence_attempt_id` INT NOT NULL,
	`file_id` INT NOT NULL,
	CONSTRAINT `PK_task_defence_attempts_attachments` PRIMARY KEY (`task_defence_attempt_id` ASC, `file_id` ASC)
);

CREATE TABLE `textbooks`
(
	`activity_id` INT NOT NULL,
	`file_id` INT NOT NULL,
	CONSTRAINT `PK_textbooks` PRIMARY KEY (`activity_id` ASC, `file_id` ASC)
);

CREATE TABLE `universities`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`description` TEXT 	 NULL,
	CONSTRAINT `PK_universities` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `university_admins`
(
	`university_id` INT NOT NULL,
	`user_assignment_id` INT NOT NULL,
	CONSTRAINT `PK_university_admins` PRIMARY KEY (`university_id` ASC, `user_assignment_id` ASC)
);

CREATE TABLE `university_news`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(255) NOT NULL DEFAULT '',
	`text` TEXT NOT NULL,
	`university_id` INT 	 NULL,
	CONSTRAINT `PK_university_news` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `university_news_attachments`
(
	`news_id` INT NOT NULL,
	`file_id` INT NOT NULL,
	CONSTRAINT `PK_university_news_attachments` PRIMARY KEY (`news_id` ASC, `file_id` ASC)
);

CREATE TABLE `user_assignments`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`name` ENUM ('student', 'lecturer', 'university_admin', 'faculty_admin', 'chair_admin') default 'student' NOT NULL ,
	`assignment_date` DATETIME NOT NULL,
	`repeal_date` DATETIME 	 NULL ,
	CONSTRAINT `PK_id` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `user_links`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`link` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) 	 NULL,
	CONSTRAINT `PK_user_links` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `users`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	CONSTRAINT `PK_users` PRIMARY KEY (`id` ASC)
);

CREATE TABLE `users_authentication`
(
	`id` INT NOT NULL,
	`user_id` INT NOT NULL,
	`hashed_password` VARBINARY(255) NOT NULL,
	`salt` VARBINARY(255) NOT NULL,
	`time_set` DATETIME NOT NULL DEFAULT NOW(),
	`time_changed` DATETIME 	 NULL,
	CONSTRAINT `PK_users_authentication` PRIMARY KEY (`id` ASC)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `activities` 
 ADD CONSTRAINT `FK_activities_activity_types`
	FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `activity_events` 
 ADD CONSTRAINT `FK_activity_events_auditoriums`
	FOREIGN KEY (`place`) REFERENCES `auditoriums` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `activity_events` 
 ADD CONSTRAINT `FK_activity_events_examination_attempts`
	FOREIGN KEY (`activity_id`) REFERENCES `examination_attempts` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `activity_events` 
 ADD CONSTRAINT `FK_activity_events_subject_activity_event`
	FOREIGN KEY (`activity_id`) REFERENCES `subject_activity_event` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `auditoriums` 
 ADD CONSTRAINT `FK_auditoriums_buildings`
	FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `chair_news` 
 ADD CONSTRAINT `FK_chair_news_chairs`
	FOREIGN KEY (`chair_id`) REFERENCES `chairs` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `chair_news_attachments` 
 ADD CONSTRAINT `FK_chair_news_attachments_chair_news`
	FOREIGN KEY (`news_id`) REFERENCES `chair_news` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `chair_news_attachments` 
 ADD CONSTRAINT `FK_chair_news_attachments_files`
	FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `chairs` 
 ADD CONSTRAINT `FK_chairs_faculties`
	FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `chairs_admins` 
 ADD CONSTRAINT `FK_chairs_admins_chairs`
	FOREIGN KEY (`chair_id`) REFERENCES `chairs` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `chairs_admins` 
 ADD CONSTRAINT `FK_chairs_admins_users_roles`
	FOREIGN KEY (`user_assignment_id`) REFERENCES `user_assignments` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `examination_attempts` 
 ADD CONSTRAINT `FK_examination_attempts_students_examinations`
	FOREIGN KEY (`student_examination_id`) REFERENCES `students_examinations` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `examinations` 
 ADD CONSTRAINT `FK_examinations_lecturers`
	FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `examinations` 
 ADD CONSTRAINT `FK_examinations_subject_in_semester`
	FOREIGN KEY (`subject_id`) REFERENCES `subjects_in_semesters` (`subject_id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `faculties` 
 ADD CONSTRAINT `FK_faculties_universities`
	FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `faculties_admins` 
 ADD CONSTRAINT `FK_faculties_admins_faculties`
	FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `faculties_admins` 
 ADD CONSTRAINT `FK_faculties_admins_users_roles`
	FOREIGN KEY (`user_assignment_id`) REFERENCES `user_assignments` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `faculty_news` 
 ADD CONSTRAINT `FK_faculty_news_faculties`
	FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `faculty_news_attachments` 
 ADD CONSTRAINT `FK_faculty_news_attachments_faculty_news`
	FOREIGN KEY (`news_id`) REFERENCES `faculty_news` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `faculty_news_attachments` 
 ADD CONSTRAINT `FK_faculty_news_attachments_files`
	FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `groups` 
 ADD CONSTRAINT `FK_groups_specialty`
	FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `groups_students` 
 ADD CONSTRAINT `FK_groups_students_groups`
	FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `groups_students` 
 ADD CONSTRAINT `FK_groups_students_students`
	FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `lecturer_chairs` 
 ADD CONSTRAINT `FK_lecturer_chairs_chairs`
	FOREIGN KEY (`chair_id`) REFERENCES `chairs` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `lecturer_chairs` 
 ADD CONSTRAINT `FK_lecturer_chairs_lecturer`
	FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `lecturers` 
 ADD CONSTRAINT `FK_lecturer_user_assignments`
	FOREIGN KEY (`assignment_id`) REFERENCES `user_assignments` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `messages` 
 ADD CONSTRAINT `FK_messages_users`
	FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `messages` 
 ADD CONSTRAINT `FK_messages_users_02`
	FOREIGN KEY (`to`) REFERENCES `users` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `messages_attachments` 
 ADD CONSTRAINT `FK_messages_attachments_files`
	FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `messages_attachments` 
 ADD CONSTRAINT `FK_messages_attachments_messages`
	FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `notifications` 
 ADD CONSTRAINT `FK_notifications_activity_events`
	FOREIGN KEY (`reason_id`) REFERENCES `activity_events` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `notifications` 
 ADD CONSTRAINT `FK_notifications_students_tasks`
	FOREIGN KEY (`reason_id`) REFERENCES `students_tasks` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `notifications` 
 ADD CONSTRAINT `FK_notifications_subject_in_semester`
	FOREIGN KEY (`reason_id`) REFERENCES `subjects_in_semesters` (`subject_id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `notifications` 
 ADD CONSTRAINT `FK_notifications_users`
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `specialties` 
 ADD CONSTRAINT `FK_specialty_chairs`
	FOREIGN KEY (`chair_id`) REFERENCES `chairs` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students` 
 ADD CONSTRAINT `FK_students_users_roles`
	FOREIGN KEY (`assignment_id`) REFERENCES `user_assignments` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_activities` 
 ADD CONSTRAINT `FK_students_activities_activities`
	FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_activities` 
 ADD CONSTRAINT `FK_students_activities_lecturers`
	FOREIGN KEY (`supervisor_id`) REFERENCES `lecturers` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_activities` 
 ADD CONSTRAINT `FK_students_activities_students`
	FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_attendancies` 
 ADD CONSTRAINT `FK_students_attendancies_students_in_lists`
	FOREIGN KEY (`student_in_list_id`) REFERENCES `students_in_lists` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_attendancies` 
 ADD CONSTRAINT `FK_students_attendancies_subject_activity_event`
	FOREIGN KEY (`subject_event_id`) REFERENCES `subject_activity_event` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_examinations` 
 ADD CONSTRAINT `FK_students_examinations_examinations`
	FOREIGN KEY (`examination_id`) REFERENCES `examinations` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_examinations` 
 ADD CONSTRAINT `FK_students_examinations_students_in_lists`
	FOREIGN KEY (`student_in_list_id`) REFERENCES `students_in_lists` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_in_lists` 
 ADD CONSTRAINT `FK_students_in_lists_non_registered_students_02`
	FOREIGN KEY (`student_id`) REFERENCES `non_registered_students` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_in_lists` 
 ADD CONSTRAINT `FK_students_in_lists_students`
	FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_in_lists` 
 ADD CONSTRAINT `FK_students_in_lists_students_lists`
	FOREIGN KEY (`student_id`) REFERENCES `students_lists` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_lists` 
 ADD CONSTRAINT `FK_students_lists_subject_activities`
	FOREIGN KEY (`activity_id`) REFERENCES `subject_activities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_tasks` 
 ADD CONSTRAINT `FK_students_tasks_students_in_lists`
	FOREIGN KEY (`student_in_list_id`) REFERENCES `students_in_lists` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `students_tasks` 
 ADD CONSTRAINT `FK_students_tasks_tasks`
	FOREIGN KEY (`task_id`) REFERENCES `subject_activity_tasks` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activities` 
 ADD CONSTRAINT `FK_subject_activities_activity_type`
	FOREIGN KEY (`activity_id`) REFERENCES `subject_activity_types` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activities` 
 ADD CONSTRAINT `FK_subject_activities_lecturer`
	FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activities` 
 ADD CONSTRAINT `FK_subject_activities_subject_in_semester`
	FOREIGN KEY (`subject_id`) REFERENCES `subjects_in_semesters` (`subject_id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activities_groups` 
 ADD CONSTRAINT `FK_subject_activities_groups_groups`
	FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activities_groups` 
 ADD CONSTRAINT `FK_subject_activities_groups_subject_activities`
	FOREIGN KEY (`subject_activity_id`) REFERENCES `subject_activities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activity_event` 
 ADD CONSTRAINT `FK_subject_activity_event_groups`
	FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activity_event` 
 ADD CONSTRAINT `FK_subject_activity_event_subject_activities`
	FOREIGN KEY (`subject_activity_id`) REFERENCES `subject_activities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activity_tasks` 
 ADD CONSTRAINT `FK_tasks_subject_activities`
	FOREIGN KEY (`subject_activity_id`) REFERENCES `subject_activities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subject_activity_tasks` 
 ADD CONSTRAINT `FK_tasks_task_types`
	FOREIGN KEY (`task_type_id`) REFERENCES `subject_activity_task_types` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subjects` 
 ADD CONSTRAINT `FK_subject_chairs`
	FOREIGN KEY (`chair_id`) REFERENCES `chairs` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subjects_in_semesters` 
 ADD CONSTRAINT `FK_subject_in_semester_semesters`
	FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `subjects_in_semesters` 
 ADD CONSTRAINT `FK_subjects_in_semesters_subjects`
	FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `task_attachments` 
 ADD CONSTRAINT `FK_task_attachments_files`
	FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `task_attachments` 
 ADD CONSTRAINT `FK_task_attachments_subject_activity_tasks`
	FOREIGN KEY (`task_id`) REFERENCES `subject_activity_tasks` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `task_defence_attempts` 
 ADD CONSTRAINT `FK_task_defence_attempts_students_tasks`
	FOREIGN KEY (`student_task_id`) REFERENCES `students_tasks` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `task_defence_attempts_attachments` 
 ADD CONSTRAINT `FK_task_defence_attempts_attachments_files`
	FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `task_defence_attempts_attachments` 
 ADD CONSTRAINT `FK_task_defence_attempts_attachments_task_defence_attempts`
	FOREIGN KEY (`task_defence_attempt_id`) REFERENCES `task_defence_attempts` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `textbooks` 
 ADD CONSTRAINT `FK_textbooks_files`
	FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `textbooks` 
 ADD CONSTRAINT `FK_textbooks_subject_activities`
	FOREIGN KEY (`activity_id`) REFERENCES `subject_activities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `university_admins` 
 ADD CONSTRAINT `FK_university_admins_universities`
	FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `university_admins` 
 ADD CONSTRAINT `FK_university_admins_user_assignments`
	FOREIGN KEY (`user_assignment_id`) REFERENCES `user_assignments` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `university_news` 
 ADD CONSTRAINT `FK_university_news_universities`
	FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `university_news_attachments` 
 ADD CONSTRAINT `FK_university_news_attachments_files`
	FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `university_news_attachments` 
 ADD CONSTRAINT `FK_university_news_attachments_university_news`
	FOREIGN KEY (`news_id`) REFERENCES `university_news` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `user_assignments` 
 ADD CONSTRAINT `FK_user_assignments_users`
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `user_links` 
 ADD CONSTRAINT `FK_user_links_users`
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE Restrict ON UPDATE Restrict;

ALTER TABLE `users_authentication` 
 ADD CONSTRAINT `FK_users_authentication_users`
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE Restrict ON UPDATE Restrict;

