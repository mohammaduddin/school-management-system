-- School Management System 

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SchoolMgtSystem')
CREATE DATABASE SchoolMgtSystem
GO


CREATE TABLE school
(   
	school_id INTEGER PRIMARY KEY IDENTITY(1,1),
    school_name VARCHAR(150),
    address VARCHAR(50),
    city VARCHAR(20),
    Country VARCHAR(15)
);
GO


CREATE TABLE course(
    course_id INTEGER PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(50),
    credits INTEGER,
	school_id INTEGER,
	FOREIGN KEY (school_id) REFERENCES school (school_id)
);
GO

	

CREATE TABLE teacher
(
    teacher_id INTEGER PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(15),
    age VARCHAR(25),
	address VARCHAR(150),
	course_id INTEGER,
	school_id INTEGER,
	FOREIGN KEY (course_id) REFERENCES course (course_id),
	FOREIGN KEY (school_id) REFERENCES school (school_id)
);
GO





CREATE TABLE student(
    student_id INTEGER PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(25),
    age VARCHAR(15),
	address VARCHAR (150),
	grade VARCHAR(10),
	course_id INTEGER,
	teacher_id INTEGER,
	school_id INTEGER,
	FOREIGN KEY (course_id) REFERENCES course (course_id),
	FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id),
	FOREIGN KEY (school_id) REFERENCES school (school_id)
);
GO







INSERT INTO school VALUES('Tannytown Elementary School', '112 Berry street', 'Virgina', 'USA');
GO

Select * from school;
GO
--1	First Step Elementary School	101 robert street		London	UK
--2	Tannytown Elementary School		112 Berry street		Virgina	USA

INSERT INTO course VALUES('Fundamental of Art and Design',4,2);
GO

Select * from course;
GO
--1	Indroduction to Geography		3	1
--2	Indroduction to Math			4	1
--3	Fundamental of natural science	3	2
--4	Fundamental of Art and Design	4	2

INSERT INTO teacher VALUES('Meghan',34, '715 Herold Sq, Virginia, USA',3,2);
GO

Select * from teacher;
GO

--2	Jacob	27	10 Strling Road, Virginia, USA	1	2
--3	Hannah	29	76 Shunny Lane, London, UK		2	1
--4	Parisha	29	115 Lakeview Rd, London, UK		4	1
--5	Meghan	34	715 Herold Sq, Virginia, USA	3	2