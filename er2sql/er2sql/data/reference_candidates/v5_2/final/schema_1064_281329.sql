-- Source: https://github.com/markina/db_ifmo/blob/ffa5cbc508e17da9fb407507923ecad85852b370/dz2/task.sql?raw=true
-- Tables detected: 5 | FK constraints: 4
create table Teacher (
    Id int not null primary key,
    FirstName varchar(50) not null,
    SecondName varchar(50) not null,
    Birthday date
);
create table Subjects (
    Id int not null primary key,
    Name varchar(50) not null,
    Semester int not null
);
create table StudentGroup (
    Id int not null primary key,
    Name varchar(10) not null
);
create table Students (
    Id int not null primary key,
    FirstName varchar(50) not null,
    SecondName varchar(50) not null,
    Birthday date,
    StudentGroupId int not null,
    constraint students_StudentGroup_fk foreign key (StudentGroupId) references StudentGroup(Id)
);
create table Marks (
    Name char not null,
    MarkDate date,
    StudentId int not null,
    SubjectId int not null,
    TeacherId int not null,
    primary key(StudentId, SubjectId),
    constraint marks_student_fk foreign key (StudentId) references Students(Id),
    constraint marks_teacher_fk foreign key (TeacherId) references Teacher(Id),
    constraint marks_subject_fk foreign key (SubjectId) references Subjects(Id)
);
