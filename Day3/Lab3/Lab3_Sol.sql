--Display the Department id, name and id and the name of its manager.
SELECT D.Dnum, D.Dname, E.SSN AS ManagerSSN, E.Fname + E.Lname AS ManagerName
FROM DEPARTMENTs D
JOIN EMPLOYEE E ON D.MGRSSN = E.SSN;


--Display the name of the departments and the name of the projects under its control
SELECT D.Dname AS DepartmentName, P.Pname AS ProjectName
FROM DEPARTMENTS D
JOIN PROJECT P ON D.Dnum = P.Dnum;


--Display the full data about all the dependence associated with the name of the employee they depend on him/her
SELECT DEP.*, E.Fname + E.Lname AS EmployeeName
FROM DEPENDENT DEP
JOIN EMPLOYEE E ON DEP.ESSN = E.SSN;


--Display the Id, name and location of the projects in Cairo or Alex city
SELECT P.Pnumber, P.Pname, P.Plocation
FROM PROJECT P
WHERE P.Plocation IN ('Cairo', 'Alex');


--Display the Projects full data of the projects with a name starts with "a" letter
SELECT *
FROM PROJECT
WHERE LOWER(Pname) LIKE 'a%';


--display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
SELECT *
FROM EMPLOYEE
WHERE Dno = 30 AND Salary BETWEEN 1000 AND 2000;


--Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project
SELECT E.Fname + E.Lname AS EmployeeName
FROM EMPLOYEE E
JOIN WORKS_for W ON E.SSN = W.ESSN
JOIN PROJECT P ON W.Pno = P.Pnumber
WHERE E.Dno = 10 AND P.Pname = 'AL Rabwah' AND W.Hours >= 10;


--Find the names of the employees who directly supervised with Kamel Mohamed
SELECT E.Fname + E.Lname AS EmployeeName
FROM EMPLOYEE E
JOIN EMPLOYEE S ON E.Superssn = S.SSN
WHERE S.Fname = 'Kamel' AND S.Lname = 'Mohamed';


--Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
SELECT E.Fname + E.Lname AS EmployeeName, P.Pname AS ProjectName
FROM EMPLOYEE E
JOIN WORKS_for W ON E.SSN = W.ESSN
JOIN PROJECT P ON W.Pno = P.Pnumber
ORDER BY P.Pname;


--For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
SELECT 
  P.Pnumber, 
  D.Dname AS DepartmentName, 
  M.Lname AS ManagerLastName, 
  M.Address, 
  M.Bdate
FROM PROJECT P
JOIN DEPARTMENTS D ON P.Dnum = D.Dnum
JOIN EMPLOYEE M ON D.MGRSSN = M.SSN
WHERE P.Plocation = 'Cairo';


--Display All Data of the managers
SELECT DISTINCT E.*
FROM EMPLOYEE E
JOIN DEPARTMENTS D ON E.SSN = D.MGRSSN;


--Display All Employees data and the data of their dependents even if they have no dependents
SELECT E.*, DEP.*
FROM EMPLOYEE E
LEFT JOIN DEPENDENT DEP ON E.SSN = DEP.ESSN;


--Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000
INSERT INTO EMPLOYEE (Fname, Lname, SSN, Superssn, Dno, Salary)
VALUES ('Nagham', 'Wael', 102672, 112233, 30, 3000);


--Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him
INSERT INTO EMPLOYEE (Fname, Lname, SSN, Dno)
VALUES ('FriendFirstName', 'FriendLastName', 102660, 30);


--Upgrade your salary by 20 % of its last value
UPDATE EMPLOYEE
SET Salary = Salary * 1.2
WHERE SSN = 102672;



