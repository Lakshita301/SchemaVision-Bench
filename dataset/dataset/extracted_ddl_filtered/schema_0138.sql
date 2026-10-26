-- Source: https://github.com/big-data-residency/bank-user-portrait/blob/54f08d29a9f4aa5bac8d956a7108a8674d050633/%E6%95%B0%E6%8D%AE%E5%BA%93.sql?raw=true
-- Tables detected: 12 | FK/REFERENCES mentions: 15

CREATE TABLE `college`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CollegeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Type` int(11) NULL DEFAULT NULL COMMENT '学院分类 1234=文理工商',
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `comment_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TagID` int(11) NULL DEFAULT NULL,
  `CommentID` int(11) NULL DEFAULT NULL,
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位：0 is 正常，1 is 删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `TagID`(`TagID`) USING BTREE,
  INDEX `CommentID`(`CommentID`) USING BTREE,
  CONSTRAINT `comment_tag_ibfk_1` FOREIGN KEY (`TagID`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_tag_ibfk_2` FOREIGN KEY (`CommentID`) REFERENCES `student_select_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程编号',
  `CourseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TeacherID` int(11) NULL DEFAULT NULL,
  `StudentNumber` int(11) NULL DEFAULT NULL COMMENT '课程人数',
  `StartWeek` int(11) NULL DEFAULT NULL,
  `EndWeek` int(11) NULL DEFAULT NULL,
  `IsSingleWeek` int(11) NULL DEFAULT 0 COMMENT '单双周标记：0 is 常规课程，1 is 单周课程，2 is 双周课程',
  `Credit` double(11, 1) NULL DEFAULT 0.0 COMMENT '学分数',
  `ExaminingForm` int(11) NULL DEFAULT 0 COMMENT '考试方式：0 is 闭卷考试，1 is 开卷考试，2 is 论文结课，3 is 其他',
  `CollegeID` int(11) NULL DEFAULT NULL COMMENT '开课学院ID',
  `MajorID` int(11) NULL DEFAULT NULL COMMENT '所属专业ID，若为空则为所属学院的任意专业',
  `Level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应ABCDE类课',
  `HasMidExam` int(11) NULL DEFAULT 0 COMMENT '是否有期中考试 0=没有 1=有',
  `FinalExamWeight` int(11) NULL DEFAULT NULL,
  `MidExamWeight` int(11) NULL DEFAULT NULL,
  `PassingCourse` int(11) NULL DEFAULT 0 COMMENT '是否是通过制 0=否 1=是 默认0',
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位：0 is 正常，1 is 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `TeacherID`(`TeacherID`) USING BTREE,
  INDEX `CollegeID`(`CollegeID`) USING BTREE,
  INDEX `MajorID`(`MajorID`) USING BTREE,
  INDEX `LevelID`(`Level`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`CollegeID`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_3` FOREIGN KEY (`MajorID`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 648 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `course_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LevelName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `course_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ClassId` int(11) NULL DEFAULT NULL,
  `StartLesson` int(11) NULL DEFAULT NULL,
  `EndLesson` int(11) NULL DEFAULT NULL,
  `LessonDay` int(11) NULL DEFAULT NULL,
  `DeleteStatus` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ClassId`(`ClassId`) USING BTREE,
  CONSTRAINT `course_time_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1032 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

CREATE TABLE `file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FilePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UpdateTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `StudentID` int(11) NULL DEFAULT NULL COMMENT '上传人ID',
  `CourseID` int(11) NULL DEFAULT NULL,
  `DownloadNum` int(11) NULL DEFAULT NULL,
  `DeleteStatus` int(11) NULL DEFAULT 0 COMMENT '删除位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `StudentID`(`StudentID`) USING BTREE,
  INDEX `CourseID`(`CourseID`) USING BTREE,
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MajorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CollegeID` int(11) NULL DEFAULT NULL,
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CollegeID`(`CollegeID`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Gender` int(11) NULL DEFAULT 0 COMMENT '性别：0 is 未知，1 is 男，2 is 女',
  `NickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StudentNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Grade` int(11) NULL DEFAULT NULL,
  `CollegeID` int(11) NULL DEFAULT NULL,
  `MajorID` int(11) NULL DEFAULT NULL,
  `StudentPortrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Privilege` int(11) NOT NULL DEFAULT 0 COMMENT '0=普通用户 1=管理员',
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位：0 is 正常，1 is 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CollegeID`(`CollegeID`) USING BTREE,
  INDEX `MajorID`(`MajorID`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`MajorID`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `student_comment_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SelectID` int(11) NULL DEFAULT 0,
  `Comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GradeScore` int(11) NULL DEFAULT NULL COMMENT '成绩打分',
  `ContentScore` int(11) NULL DEFAULT NULL,
  `LikeNumber` int(11) NULL DEFAULT 0,
  `Anonymous` int(11) NULL DEFAULT 0 COMMENT '0=不匿名，1=匿名 默认不匿名',
  `CommentTime` timestamp(6) NULL DEFAULT NULL,
  `BearScore` int(11) NULL DEFAULT NULL,
  `InterestingScore` int(11) NULL DEFAULT NULL,
  `EasyScore` int(11) NULL DEFAULT NULL,
  `KnowledgeScore` int(11) NULL DEFAULT NULL,
  `DeleteStatus` int(11) NOT NULL DidEFAULT 0 COMMENT '删除位：0 is 正常，1 is 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `SelectID`(`SelectID`) USING BTREE,
  CONSTRAINT `student_comment_course_ibfk_1` FOREIGN KEY (`SelectID`) REFERENCES `student_select_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 355 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `student_select_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NULL DEFAULT NULL,
  `CourseID` int(11) NULL DEFAULT NULL,
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位：0 is 正常，1 is 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `StudentID`(`StudentID`) USING BTREE,
  INDEX `CourseID`(`CourseID`) USING BTREE,
  CONSTRAINT `student_select_course_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_select_course_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1089 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TagName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Gender` int(11) NULL DEFAULT 0 COMMENT '性别：0 is 未知，1 is 男，2 is 女',
  `TelPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OfficeAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址',
  `CollegeID` int(11) NULL DEFAULT NULL,
  `TeacherPortrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Level` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeleteStatus` int(11) NOT NULL DEFAULT 0 COMMENT '删除位：0 is 正常，1 is 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CollegeID`(`CollegeID`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

