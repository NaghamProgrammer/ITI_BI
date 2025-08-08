--Display all the employees Data
SELECT * 
FROM EMPLOYEE;

--Display the employee First name, last name, Salary and Department number.
SELECT FNAME, LNAME, SALARY, DNO 
FROM EMPLOYEE;

--Display all the projects names, locations and the department which is responsible about it.
SELECT PNAME, PLOCATION, DNUM 
FROM PROJECT;

--If you know that the company policy is to pay an annual commission for each employee with specific percent equals 10% of his/her annual salary. Display each employee full name and his annual commission in an ANNUAL COMM column (alias).
SELECT 
    FNAME + LNAME AS FULL_NAME, 
    SALARY * 12 * 0.10 AS ANNUAL_COMM 
FROM EMPLOYEE;

--Display the employees Id, name who earns more than 1000 LE monthly.
SELECT SSN, FNAME, LNAME 
FROM EMPLOYEE 
WHERE SALARY > 1000;

--Display the employees Id, name who earns more than 10000 LE annually.
SELECT SSN, FNAME, LNAME 
FROM EMPLOYEE 
WHERE SALARY * 12 > 10000;

--Display the names and salaries of the female employees 
SELECT FNAME, LNAME, SALARY 
FROM EMPLOYEE 
WHERE SEX = 'F';

--Display each department id, name which managed by a manager with id equals 968574
SELECT DNUM, DNAME 
FROM DEPARTMENTS 
WHERE MGRSSN = '968574';


--Display the ids, names and locations of the projects which controled with department 10
SELECT PNUMBER, PNAME, PLOCATION 
FROM PROJECT 
WHERE DNUM = 10;
