CREATE DATABASE Online_Advising;

DROP DATABASE Online_Advising;

--Table ng Students
drop table Student
select * from Student;
CREATE TABLE Student(
	Student_ID		int			NOT NULL	PRIMARY KEY,
	First_Name		varchar(20) NOT NULL,
	Last_Name		varchar(20) NOT NULL,
	Middle_Name		varchar(20) NOT NULL,
	Password		varchar(20) NOT NULL,
	Email			varchar(50) NOT NULL,
	Birthdate		varchar(60) NOT NULL,
	Program			varchar(20) NOT NULL,
	Block			varchar(10) NOT NULL,
	College			varchar(50) NOT NULL,
	Current_Units	int			NOT NULL,
	Retention_Status int 		NOT NULL, --1 = Regular, 2 = Irregular, 3 = Conditional, 4 = Debarred
	Status			int NOT NULL, --1 = On-Going, 2 = Completed, 3 = Graduated, 4 = Discontinued, 5 = Temporary, 6 = Honorable Di, 7 = Cancelled
	AccountStatus 	int NOT NULL, --1 = Activated, 2 = Deactivated
	Term 			int NOT NULL, --1 = First Sem, 2 = Second Sem
	Year 			int NOT NULL, --1= First Year, 2 = Second Year, 3 = Third Year, 4 = Fourth Year, 5 = Fifth Year, 
	PaymentStatus 	int NOT NULL, --1 = Payed, 2 = Not yet Payed
	Student_Picture varchar(100)
	--Student_Picture varbinary(max)
);

--Table ng schedule ng mga students
drop table Student_Schedule
CREATE TABLE Student_Schedule(
	Student_ID		int			NOT NULL	FOREIGN KEY REFERENCES Student(Student_ID),
	Course_ID		varchar(20)	NOT NULL	FOREIGN KEY REFERENCES Course(Course_ID),
	Section			varchar(20) NOT NULL,
	Status 			int 		NOT NULL, --1 = Enrolled, 2 = Reserved(For payment pa), 3 = For approval, 4 = Not Yet Submitted
	Remark			varchar(200)
);
select * from Student_Schedule

--Table ng mga binagsak ng students
drop table Student_Back_Subjects
CREATE TABLE Student_Back_Subjects(
	Student_ID		int			NOT NULL,	
	Course_ID		varchar(20)	NOT NULL,
	FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID),
	FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID)
);

--Table ng mga Adviser
drop table Adviser
CREATE TABLE Adviser(
	Teacher_ID		int			NOT NULL	PRIMARY KEY,
	Department		varchar(50)	NOT NULL,
	College			varchar(50) NOT NULL,
	Rank			varchar(50) NOT NULL,
	First_Name		varchar(20) NOT NULL,
	Last_Name		varchar(20) NOT NULL,
	Middle_Name		varchar(20) NOT NULL,
	Password		varchar(20) NOT NULL,
	Email			varchar(50) NOT NULL,
	Birthdate		varchar(50) NOT NULL,
	AccountStatus 	int 		NOT NULL,
	Advisor_Picture varchar(100)
	--Advisor_Picture varbinary(max) 
);

select * from Adviser

--Table ng mga Course
CREATE TABLE Course(
	Course_ID		varchar(20)	NOT NULL	PRIMARY KEY,
	Course_Name		varchar(50) NOT NULL,
	Prerequisite 	varchar(50),
	Lec_Units		int			NOT NULL,
	Lab_Units		int			NOT NULL
);
select * from Course

--Table ng mga Available Course
drop table Available_Courses
CREATE TABLE Available_Courses(
	Course_ID 		varchar(20) NOT NULL FOREIGN KEY REFERENCES Course(Course_ID),
	Section			varchar(20) NOT NULL,
	Room			varchar(10)	NOT NULL,
	Start_Time		varchar(20) NOT NULL,
	End_Time		varchar(20) NOT NULL,
	Day				varchar(20) NOT NULL,
	AvailableSlot	int			NOT NULL,
	MaxSlot	int			NOT NULL,
	Instructor 		int 		NOT NULL  FOREIGN KEY REFERENCES Adviser(Teacher_ID),
	CourseType 		int 		NOT NULL, --1 = Regular, 2 = Petition, 3 = Special,
);
select * from Available_Courses

--Table ng mga Curriculum
CREATE TABLE Curriculum(
	Course_ID		varchar(20)		NOT NULL,
	Prerequisite	varchar(20),	Semester		varchar(100)	NOT NULL,
	Year			varchar(100)	NOT NULL,
	FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID),
	FOREIGN KEY(Prerequisite) REFERENCES Course(Course_ID)
);

CREATE TABLE Admin(
	Admin_ID		int			NOT NULL	PRIMARY KEY,
	First_Name		varchar(20) NOT NULL,
	Last_Name		varchar(20) NOT NULL,
	Middle_Name		varchar(20) NOT NULL,
	Password		varchar(20) NOT NULL,
	Email			varchar(50) NOT NULL,
	Birthdate		varchar(50) NOT NULL,
	AccountStatus 	int 		NOT NULL,
	Admin_Picture	varchar(100)
);

CREATE TABLE Student_Grade(
	Student_ID		int			NOT NULL,
	Course_ID		varchar(20)	NOT NULL,
	Course_Grade	decimal		NOT NULL,
	Remark			int			NOT NULL --1 = PASS, 2 = FAIL, 3 INC
	FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID),
	FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID)
);