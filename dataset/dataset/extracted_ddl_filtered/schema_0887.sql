-- Source: https://github.com/talapparasat/Decode-online-back/blob/75c64a9475e5a0c2b09858dd3d3631c217dffe26/services/db_backup_temp/export_2020-8-24-6-1-0.sql?raw=true
-- Tables detected: 22 | FK/REFERENCES mentions: 58

CREATE TABLE public."CommentTypes" (
    id integer NOT NULL,
    "commentId" integer,
    type character varying(255),
    "typeId" integer
);

CREATE TABLE public."Comments" (
    id integer NOT NULL,
    content text,
    "like" integer DEFAULT 0,
    dislike integer DEFAULT 0,
    date timestamp with time zone,
    "userId" integer
);

CREATE TABLE public."Courses" (
    id integer NOT NULL,
    name character varying(255),
    description text,
    img character varying(255),
    "order" integer DEFAULT 1
);

CREATE TABLE public."Feedbacks" (
    id integer NOT NULL,
    feedback text,
    "userId" integer
);

CREATE TABLE public."Friends" (
    id integer NOT NULL,
    first_user_id integer,
    second_user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);

CREATE TABLE public."Help" (
    id integer NOT NULL,
    "TaskName" character varying(255),
    description text,
    "time" timestamp with time zone,
    "taskId" integer,
    "userId" integer
);

CREATE TABLE public."LastActivities" (
    id integer NOT NULL,
    info character varying(255),
    "time" timestamp with time zone,
    type public."enum_LastActivities_type",
    "userId" integer
);

CREATE TABLE public."LastLessons" (
    id integer NOT NULL,
    "time" timestamp with time zone,
    "lessonId" integer,
    "userId" integer
);

CREATE TABLE public."LastTasks" (
    id integer NOT NULL,
    "time" timestamp with time zone,
    "taskId" integer,
    "userId" integer
);

CREATE TABLE public."Lessons" (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    number_of_likes integer DEFAULT 0,
    number_of_dislikes integer DEFAULT 0,
    "order" integer DEFAULT 0,
    short_content text,
    content text,
    "levelId" integer,
    "preLessonId" integer
);

CREATE TABLE public."Levels" (
    id integer NOT NULL,
    title character varying(255),
    "order" integer,
    price integer DEFAULT 0,
    "sectionId" integer
);

CREATE TABLE public."Likes" (
    id integer NOT NULL,
    type character varying(255),
    "commentId" integer,
    "userId" integer,
    "replyId" integer
);

CREATE TABLE public."Replies" (
    id integer NOT NULL,
    content text,
    "like" integer DEFAULT 0,
    dislike integer DEFAULT 0,
    date timestamp with time zone NOT NULL,
    "userId" integer,
    "commentId" integer
);

CREATE TABLE public."SectionPrerequisites" (
    id integer NOT NULL,
    "preSectionId" integer,
    "postSectionId" integer NOT NULL
);

CREATE TABLE public."Sections" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    prerequisite integer DEFAULT 0,
    level_count integer DEFAULT 0,
    img character varying(255),
    "order" integer DEFAULT 1,
    "courseId" integer
);

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);

CREATE TABLE public."Statuses" (
    id integer NOT NULL,
    status character varying(255)
);

CREATE TABLE public."Tasks" (
    id integer NOT NULL,
    title character varying(255),
    description text,
    requirements text,
    content text,
    solution text,
    chakra integer,
    "order" integer,
    "lessonId" integer
);

CREATE TABLE public."UserCourses" (
    id integer NOT NULL,
    chakra integer DEFAULT 0,
    "courseId" integer,
    "userId" integer
);

CREATE TABLE public."UserLevels" (
    id integer NOT NULL,
    level integer DEFAULT 1 NOT NULL,
    "sectionId" integer,
    "userId" integer
);

CREATE TABLE public."UserTasks" (
    id integer NOT NULL,
    solution text,
    date timestamp with time zone,
    "taskId" integer,
    "userId" integer
);

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    role public."enum_Users_role" DEFAULT 'user'::public."enum_Users_role",
    avatar character varying(255),
    "statusId" integer DEFAULT 1,
    date timestamp with time zone
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE ONLY public."CommentTypes"
    ADD CONSTRAINT "CommentTypes_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES public."Comments"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Feedbacks"
    ADD CONSTRAINT "Feedbacks_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Help"
    ADD CONSTRAINT "Help_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES public."Tasks"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Help"
    ADD CONSTRAINT "Help_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."LastActivities"
    ADD CONSTRAINT "LastActivities_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."LastLessons"
    ADD CONSTRAINT "LastLessons_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lessons"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."LastLessons"
    ADD CONSTRAINT "LastLessons_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."LastTasks"
    ADD CONSTRAINT "LastTasks_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES public."Tasks"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."LastTasks"
    ADD CONSTRAINT "LastTasks_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Lessons"
    ADD CONSTRAINT "Lessons_levelId_fkey" FOREIGN KEY ("levelId") REFERENCES public."Levels"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Lessons"
    ADD CONSTRAINT "Lessons_preLessonId_fkey" FOREIGN KEY ("preLessonId") REFERENCES public."Lessons"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Levels"
    ADD CONSTRAINT "Levels_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES public."Sections"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Likes"
    ADD CONSTRAINT "Likes_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES public."Comments"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Likes"
    ADD CONSTRAINT "Likes_replyId_fkey" FOREIGN KEY ("replyId") REFERENCES public."Replies"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Likes"
    ADD CONSTRAINT "Likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Replies"
    ADD CONSTRAINT "Replies_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES public."Comments"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Replies"
    ADD CONSTRAINT "Replies_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."SectionPrerequisites"
    ADD CONSTRAINT "SectionPrerequisites_postSectionId_fkey" FOREIGN KEY ("postSectionId") REFERENCES public."Sections"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."SectionPrerequisites"
    ADD CONSTRAINT "SectionPrerequisites_preSectionId_fkey" FOREIGN KEY ("preSectionId") REFERENCES public."Sections"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Sections"
    ADD CONSTRAINT "Sections_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES public."Courses"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Tasks"
    ADD CONSTRAINT "Tasks_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lessons"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."UserCourses"
    ADD CONSTRAINT "UserCourses_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES public."Courses"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."UserCourses"
    ADD CONSTRAINT "UserCourses_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."UserLevels"
    ADD CONSTRAINT "UserLevels_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES public."Sections"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."UserLevels"
    ADD CONSTRAINT "UserLevels_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."UserTasks"
    ADD CONSTRAINT "UserTasks_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES public."Tasks"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."UserTasks"
    ADD CONSTRAINT "UserTasks_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."Statuses"(id) ON DELETE CASCADE;

