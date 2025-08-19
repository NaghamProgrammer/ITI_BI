-- lab 5 part 1 ITI database

SELECT COUNT(*) AS StudentsWithAge
FROM Student
WHERE st_Age IS NOT NULL;


SELECT DISTINCT ins_Name
FROM Instructor;


SELECT 
  S.st_ID AS StudentID,
  ISNULL(S.st_Fname, '') + ' ' + ISNULL(S.st_Lname, '') AS FullName,
  ISNULL(D.dept_Name, 'No Department') AS DepartmentName
FROM Student S
LEFT JOIN Department D ON S.Dept_Id = D.dept_ID;


SELECT 
  S.st_Fname + ' ' + S.st_Lname AS StudentFullName,
  C.crs_Name AS CourseName
FROM Student S
JOIN Stud_Course SC ON S.st_ID = SC.St_Id
JOIN Course C ON SC.Crs_ID = C.crs_ID
WHERE SC.Grade IS NOT NULL;


SELECT 
  T.Name AS TopicName,
  COUNT(C.ID) AS CourseCount
FROM Topic T
LEFT JOIN Course C ON T.ID = C.Top_ID
GROUP BY T.Name;




SELECT 
  MAX(Salary) AS MaxSalary,
  MIN(Salary) AS MinSalary
FROM Instructor;


--aggregation no need for is null
SELECT *
FROM Instructor
WHERE Salary < (SELECT AVG(Salary) FROM Instructor );



SELECT TOP 1 D.dept_Name AS DepartmentName
FROM Instructor I
JOIN Department D ON I.Dept_ID = D.dept_ID
WHERE I.Salary = (SELECT MIN(Salary) FROM Instructor WHERE Salary IS NOT NULL);




SELECT DISTINCT TOP 2 Salary
FROM Instructor
WHERE Salary IS NOT NULL
ORDER BY Salary DESC;




SELECT 
  ins_Name,
  COALESCE(CAST(Salary AS VARCHAR), CAST(Bonus AS VARCHAR)) AS Compensation
FROM Instructor;



SELECT AVG(Salary) AS AverageSalary
FROM Instructor
WHERE Salary IS NOT NULL;



SELECT 
  S.st_Fname AS StudentFirstName, I.*
FROM Student S
LEFT JOIN Instructor I ON S.st_Super = I.ins_ID;



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

