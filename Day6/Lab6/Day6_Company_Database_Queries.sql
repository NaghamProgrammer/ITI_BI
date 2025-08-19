--Create a stored procedure that will check for the # of employees in the project p1 if they are more than 3 print message to the user “'The number of employees in the project p1 is 3 or more'” if they are less display a message to the user “'The following employees work for the project p1'” in addition to the first name and last name of each one. [Company DB] 
CREATE PROCEDURE sp_CheckProjectP1
AS
BEGIN
    DECLARE @EmpCount INT;

    SELECT @EmpCount = COUNT(*)
    FROM Works_for w
    JOIN Project p ON w.Pno = p.Pnumber
    WHERE p.Pname = 'p1';

    IF @EmpCount >= 3
        PRINT 'The number of employees in the project p1 is 3 or more';
    ELSE
    BEGIN
        PRINT 'The following employees work for the project p1';
        SELECT e.Fname, e.Lname
        FROM Employee e
        JOIN Works_for w ON e.SSN = w.ESSN
        JOIN Project p ON w.Pno = p.Pnumber
        WHERE p.Pname = 'p1';
    END
END;



--Create a stored procedure that will be used in case there is an old employee has left the project and a new one become instead of him. The procedure should take 3 parameters (old Emp. number, new Emp. number and the project number) and it will be used to update works_on table. [Company DB]
CREATE PROCEDURE sp_ReplaceEmployeeInProject
    @OldEmpSSN INT,
    @NewEmpSSN INT,
    @ProjectNo INT
AS
BEGIN
    UPDATE Works_On
    SET ESSN = @NewEmpSSN
    WHERE ESSN = @OldEmpSSN AND Pno = @ProjectNo;
END;


--add column budget in project table and insert any draft values in it 
ALTER TABLE Project
ADD Budget MONEY;

UPDATE Project
SET Budget = 100000
WHERE Pnumber = 2;  

CREATE TABLE ProjectBudgetAudit (
    ProjectNo INT,
    UserName NVARCHAR(100),
    ModifiedDate DATETIME,
    Budget_Old MONEY,
    Budget_New MONEY
);

CREATE TRIGGER trg_AuditBudgetUpdate
ON Project
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Budget)
    BEGIN
        INSERT INTO ProjectBudgetAudit (ProjectNo, UserName, ModifiedDate, Budget_Old, Budget_New)
        SELECT 
            i.Pnumber,
            SYSTEM_USER,
            GETDATE(),
            d.Budget,
            i.Budget
        FROM inserted i
        JOIN deleted d ON i.Pnumber = d.Pnumber;
    END
END;

--Create a trigger that prevents the insertion Process for Employee table in March
CREATE TRIGGER trg_PreventMarchEmployeeInsert
ON Employee
INSTEAD OF INSERT
AS
BEGIN
    IF MONTH(GETDATE()) = 3
    BEGIN
        PRINT 'You cannot insert a new employee record in March.';
        RETURN;
    END
    ELSE
    BEGIN
        INSERT INTO Employee (SSN, Fname, Lname, Dno, Salary, Superssn)
        SELECT SSN, Fname, Lname, Dno, Salary, Superssn FROM inserted;
    END
END;
