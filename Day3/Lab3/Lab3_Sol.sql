SELECT D.Dnumber, D.Dname, E.SSN AS ManagerSSN, E.Fname + E.Lname AS ManagerName
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.MGRSSN = E.SSN;



SELECT D.Dname AS DepartmentName, P.Pname AS ProjectName
FROM DEPARTMENT D
JOIN PROJECT P ON D.Dnumber = P.Dnum;


SELECT DEP.*, E.Fname + E.Lname AS EmployeeName
FROM DEPENDENT DEP
JOIN EMPLOYEE E ON DEP.ESSN = E.SSN;


SELECT P.Pnumber, P.Pname, P.Plocation
FROM PROJECT P
WHERE P.Plocation IN ('Cairo', 'Alex');



SELECT *
FROM PROJECT
WHERE LOWER(Pname) LIKE 'a%';



SELECT *
FROM EMPLOYEE
WHERE Dno = 30 AND Salary BETWEEN 1000 AND 2000;



SELECT E.Fname + E.Lname AS EmployeeName
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.SSN = W.ESSN
JOIN PROJECT P ON W.Pno = P.Pnumber
WHERE E.Dno = 10 AND P.Pname = 'AL Rabwah' AND W.Hours >= 10;



SELECT E.Fname + E.Lname AS EmployeeName
FROM EMPLOYEE E
JOIN EMPLOYEE S ON E.Super_ssn = S.SSN
WHERE S.Fname = 'Kamel' AND S.Lname = 'Mohamed';


SELECT E.Fname + E.Lname AS EmployeeName, P.Pname AS ProjectName
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.SSN = W.ESSN
JOIN PROJECT P ON W.Pno = P.Pnumber
ORDER BY P.Pname;


SELECT 
  P.Pnumber, 
  D.Dname AS DepartmentName, 
  M.Lname AS ManagerLastName, 
  M.Address, 
  M.Bdate
FROM PROJECT P
JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
JOIN EMPLOYEE M ON D.MGRSSN = M.SSN
WHERE P.Plocation = 'Cairo';



SELECT DISTINCT E.*
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.SSN = D.MGRSSN;


SELECT E.*, DEP.*
FROM EMPLOYEE E
LEFT JOIN DEPENDENT DEP ON E.SSN = DEP.ESSN;


INSERT INTO EMPLOYEE (Fname, Lname, SSN, Super_ssn, Dno, Salary)
VALUES ('Nagham', 'Wael', 102672, 112233, 30, 3000);


INSERT INTO EMPLOYEE (Fname, Lname, SSN, Dno)
VALUES ('FriendFirstName', 'FriendLastName', 102660, 30);


UPDATE EMPLOYEE
SET Salary = Salary * 1.2
WHERE SSN = 102672;


