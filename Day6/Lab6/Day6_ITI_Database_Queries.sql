--Create a stored procedure without parameters to show the number of students per department name.[use ITI DB]
CREATE PROCEDURE sp_StudentCountPerDept
AS
BEGIN
    SELECT d.Dept_Name, COUNT(s.St_Id) AS StudentCount
    FROM Student s
    JOIN Department d ON s.Dept_Id = d.Dept_Id
    GROUP BY d.Dept_Name;
END;


--Create a trigger to prevent anyone from inserting a new record in the Department table [ITI DB]
CREATE TRIGGER trg_PreventDeptInsert
ON Department
INSTEAD OF INSERT
AS
BEGIN
    PRINT 'You can’t insert a new record in the Department table.';
END;


--Create a trigger on student table after insert to add Row in Student Audit table (Server User Name , Date, Note) where note will be “[username] Insert New Row with Key=[Key Value] in table [table name]”
CREATE TABLE Student_Audit (
    ServerUserName NVARCHAR(100),
    ActionDate DATETIME,
    Note NVARCHAR(MAX)
);

CREATE TRIGGER trg_AuditStudentInsert
ON Student
AFTER INSERT
AS
BEGIN
    DECLARE @User NVARCHAR(100) = SYSTEM_USER;
    INSERT INTO Student_Audit (ServerUserName, ActionDate, Note)
    SELECT 
        @User,
        GETDATE(),
        @User + ' Inserted new row with Key = ' + CAST(i.St_Id AS NVARCHAR) + ' in table Student'
    FROM inserted i;
END;


--Create a trigger on student table instead of delete to add Row in Student Audit table (Server User Name, Date, Note) where note will be“ try to delete Row with Key=[Key Value]”
CREATE TRIGGER trg_AuditStudentDelete
ON Student
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @User NVARCHAR(100) = SYSTEM_USER;
    INSERT INTO Student_Audit (ServerUserName, ActionDate, Note)
    SELECT 
        @User,
        GETDATE(),
        'Try to delete Row with Key = ' + CAST(d.St_Id AS NVARCHAR)
    FROM deleted d;
END;


