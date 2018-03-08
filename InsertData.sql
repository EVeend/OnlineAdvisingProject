--Insert Students

Insert into Student(Student_ID, First_Name, Last_Name, Middle_Name, Password, Email, Birthdate, Program, Block, College, Current_Units, Retention_Status, Status,  AccountStatus, Term, Year, PaymentStatus, Student_Picture)
Values(2015081874, 'Rafael Edward', 'Vendivil', 'De Jesus', '02/25/1999', '2015081874@ust-ics.mygbiz.com', '02/25/1999', 'BS Computer Science', '3CS-C', 'Institute of Information and Computing Sciences', 20, 2, 1, 1, 1, 3, 2, 'assets/img/2015081874.PNG');
Insert into Student(Student_ID, First_Name, Last_Name, Middle_Name, Password, Email, Birthdate, Program, Block, College, Current_Units, Retention_Status, Status,  AccountStatus, Term, Year, PaymentStatus, Student_Picture)
Values(2015081873, 'Carrie Lyle', 'Untalan', 'Villamil', '09/04/1998', '2015081873@ust-ics.mygbiz.com', '09/04/1998', 'BS Computer Science', '3CS-C', 'Institute of Information and Computing Sciences', 25, 2, 1, 1, 1, 3, 2, 'assets/img/2015081873.PNG');
Insert into Student(Student_ID, First_Name, Last_Name, Middle_Name, Password, Email, Birthdate, Program, Block, College, Current_Units, Retention_Status, Status,  AccountStatus, Term, Year, PaymentStatus, Student_Picture)
Values(2015081830, 'Laiza Marie', 'Alcones', 'Asaldo', '11/16/1998', '2015081830@ust-ics.mygbiz.com', '11/16/1998', 'BS Computer Science', '3CS-C', 'Institute of Information and Computing Sciences', 25, 2, 1, 1, 1, 3, 2, 'assets/img/2015081830.PNG');

--Insert Adviser
Insert into Adviser(Teacher_ID, Department, College, Rank, First_Name, Last_Name, Middle_Name, Password, Email, Birthdate, AccountStatus, Advisor_Picture)
Values(987654321, 'Department of Electronics Engineering','Faculty of Engineering', 'Assistan Professor', 'Angelo', 'Dela Cruz', 'A', '1/1/1969', 'jseño@gmail.com', '1/1/1969', 1, 'assets/img/Angelo.jpg')

SELECT * FROM Course
--Insert Courses
Insert into Course (Course_ID, Course_Name, Prerequisite, Lec_Units , Lab_Units)
Values ('COMP 202', 'Computer Programming 2', 'Computer Programming 1', 2 , 1)
Insert into Course (Course_ID, Course_Name, Prerequisite, Lec_Units , Lab_Units)
Values ('MATH 208', 'Differential Equations', 'Math 109A', 2 , 0)
Insert into Course (Course_ID, Course_Name, Prerequisite, Lec_Units , Lab_Units)
Values ('Math 109A', 'Integral Calculus', 'Math 108A', 2 , 0)
Insert into Course (Course_ID, Course_Name, Prerequisite, Lec_Units , Lab_Units)
Values ('ECE 311', 'Electronic Devices and Circuits', null, 3 , 0)
Insert into Course (Course_ID, Course_Name, Prerequisite, Lec_Units , Lab_Units)
Values ('ECE 311L', 'Electronic Devices and Circuits (Lab)', null, 0 , 1)

DROP TABLE Student_Back_Subjects
SELECT * FROM Student_Back_Subjects
--Insert Back subjects
Insert into Student_Back_Subjects(Student_ID, Course_ID)
Values(2015081873, 'COMP 202');
Insert into Student_Back_Subjects(Student_ID, Course_ID)
Values(2015081874, 'COMP 202');
Insert into Student_Back_Subjects(Student_ID, Course_ID)
Values(2015081874, 'MATH 109A');
Insert into Student_Back_Subjects(Student_ID, Course_ID)
Values(2015081830, 'MATH 208');

--Insert available courses
Insert into Available_Courses (Course_ID, Section, Room, Start_Time , End_Time, Day, AvailableSlot, MaxSlot, Instructor, CourseType)
Values ('COMP 202', '3EE-A', 'Comp Lab 1', '7:00 AM', '9:00 AM', 'Monday', 40, 40, 987654321, 1);

Insert into Available_Courses (Course_ID, Section, Room, Start_Time , End_Time, Day, AvailableSlot, MaxSlot, Instructor, CourseType)
Values ('COMP 202', '3EE-A', 'Comp Lab 1', '7:00 AM', '8:00 AM', 'Tuesday', 40, 40, 987654321, 1);

Insert into Available_Courses (Course_ID, Section, Room, Start_Time , End_Time, Day, AvailableSlot, MaxSlot, Instructor, CourseType)
Values ('COMP 202', '3EE-B', 'Comp Lab 1', '12:00 PM', '3:00 PM', 'Tuesday', 40, 40, 987654321, 1);

Insert into Available_Courses (Course_ID, Section, Room, Start_Time , End_Time, Day, AvailableSlot, MaxSlot, Instructor, CourseType)
Values ('COMP 202', '3EE-C', 'Comp Lab 1', '7:00 AM', '9:00 AM', 'Monday', 40, 40, 987654321, 1);

Insert into Available_Courses (Course_ID, Section, Room, Start_Time , End_Time, Day, AvailableSlot, MaxSlot, Instructor, CourseType)
Values ('COMP 202', '3EE-D', 'Comp Lab 1', '7:00 AM', '9:00 AM', 'Friday', 0, 40, 987654321, 1);

Insert into Available_Courses (Course_ID, Section, Room, Start_Time , End_Time, Day, AvailableSlot, MaxSlot, Instructor, CourseType)
Values ('MATH 208', '2EE-A', 'Rm. 303', '7:00 AM', '9:00 AM', 'Monday', 40, 40, 987654321, 1);

Insert into Available_Courses (Course_ID, Section, Room, Start_Time , End_Time, Day, AvailableSlot, MaxSlot, Instructor, CourseType)
Values ('MATH 208', '2EE-B', 'Rm. 47', '7:00 AM', '9:00 AM', 'Tuesday', 40, 40, 987654321, 1);
