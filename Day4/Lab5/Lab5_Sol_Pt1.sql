-- lab 5 part 1 ITI database

CREATE VIEW V_StudentPassedCourses AS
SELECT 
  S.St_Fname + ' ' + S.St_Lname AS StudentFullName,
  C.Crs_Name AS CourseName
FROM Student S
JOIN Stud_Course SC ON S.St_Id = SC.St_Id
JOIN Course C ON SC.Crs_Id = C.Crs_Id
WHERE SC.Grade > 50;



CREATE VIEW V_ManagerTopics AS
SELECT 
  I.Ins_Name AS ManagerName,
  T.Top_Name AS TopicName
FROM Department D
JOIN Instructor I ON D.Dept_Manager = I.Ins_Id
JOIN Ins_Course IC ON I.Ins_Id = IC.Ins_Id
JOIN Course C ON IC.Crs_Id = C.Crs_Id
JOIN Topic T ON C.Top_Id = T.Top_Id;


CREATE VIEW V_SD_Java_Instructors AS
SELECT 
  I.Ins_Name AS InstructorName,
  D.Dept_Name AS DepartmentName
FROM Instructor I
JOIN Department D ON I.Dept_Id = D.Dept_Id
WHERE D.Dept_Name IN ('SD', 'Java');
