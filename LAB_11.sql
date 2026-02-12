CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

INSERT INTO Employees VALUES (1, 'John', 'Doe', 30, 'HR'),
 (2, 'Jane', 'Smith', 25, 'Finance'),
 (3, 'Michael', 'Johnson', 35, 'IT'),
 (4, 'Emily', 'Williams', 28, 'Marketing'),
 (5, 'Robert', 'Brown', 22, 'IT');

-- Part – A 
-- 1. Create UDF to get the full name and department of an employee. 
CREATE FUNCTION GetFullNameDept (@EmpID INT)
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @Result VARCHAR(200);

    SELECT @Result = First_Name + ' ' + Last_Name + ' - ' + Department
    FROM Employees
    WHERE Employee_ID = @EmpID;

    RETURN @Result;
END
    SELECT dbo.GetFullNameDept(1);


-- 2. Create UDF to get the number of employees in a specific department. 
CREATE FUNCTION GetEmployeeCount (@Dept VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Employees
    WHERE Department = @Dept;

    RETURN @Count;
END
    SELECT dbo.GetEmployeeCount('IT');


-- 3. Create UDF to concatenate the first name and last name with a custom separator. 
CREATE FUNCTION GetFullNameWithSeparator
(
    @EmpID INT,
    @Separator VARCHAR(10)
)
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @Name VARCHAR(200);

    SELECT @Name = First_Name + @Separator + Last_Name
    FROM Employees
    WHERE Employee_ID = @EmpID;

    RETURN @Name;
END
    SELECT dbo.GetFullNameWithSeparator(1, '-');


-- 4. Create UDF to check if an employee is part of the IT department. 
CREATE FUNCTION IsInITDepartment (@EmpID INT)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @Result VARCHAR(10);

    IF EXISTS (
        SELECT 1 FROM Employees
        WHERE Employee_ID = @EmpID AND Department = 'IT'
    )
        SET @Result = 'Yes';
    ELSE
        SET @Result = 'No';

    RETURN @Result;
END
    SELECT dbo.IsInITDepartment(3);


-- 5. Create UDF to convert age into a friendly message. 
CREATE FUNCTION GetAgeMessage (@EmpID INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Age INT;
    DECLARE @Message VARCHAR(100);

    SELECT @Age = Age FROM Employees WHERE Employee_ID = @EmpID;

    SET @Message = 'Employee age is ' + CAST(@Age AS VARCHAR) + ' years.';

    RETURN @Message;
END
    SELECT dbo.GetAgeMessage(2);


-- Part – B 
-- 6. Create UDF to find the average age of employees in a department. 
CREATE FUNCTION GetAverageAge (@Dept VARCHAR(50))
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @AvgAge DECIMAL(5,2);

    SELECT @AvgAge = AVG(Age)
    FROM Employees
    WHERE Department = @Dept;

    RETURN @AvgAge;
END
    SELECT dbo.GetAverageAge('IT');


-- 7. Create UDF to get the last name in uppercase. 
CREATE FUNCTION GetLastNameUpper (@EmpID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @LastName VARCHAR(50);

    SELECT @LastName = UPPER(Last_Name)
    FROM Employees
    WHERE Employee_ID = @EmpID;

    RETURN @LastName;
END
    SELECT dbo.GetLastNameUpper(1);



-- Part – C 
-- 8. Create UDF to check if an employee is older than a specific age.
CREATE FUNCTION IsOlderThan
(
    @EmpID INT,
    @AgeLimit INT
)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @Result VARCHAR(10);

    IF EXISTS (
        SELECT 1 FROM Employees
        WHERE Employee_ID = @EmpID AND Age > @AgeLimit
    )
        SET @Result = 'Yes';
    ELSE
        SET @Result = 'No';

    RETURN @Result;
END
    SELECT dbo.IsOlderThan(1, 25);


-- 9. Create UDF to get the first initial of an employee's first name. 
CREATE FUNCTION GetFirstInitial (@EmpID INT)
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @Initial CHAR(1);

    SELECT @Initial = LEFT(First_Name, 1)
    FROM Employees
    WHERE Employee_ID = @EmpID;

    RETURN @Initial;
END
    SELECT dbo.GetFirstInitial(4);


-- 10. Create UDF to get the number of employees older than a specific age. 
CREATE FUNCTION CountOlderThan (@AgeLimit INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Employees
    WHERE Age > @AgeLimit;

    RETURN @Count;
END
    SELECT dbo.CountOlderThan(25);


-- 11. Create UDF to calculate the years of experience based on the current year and an employee's starting year. 
CREATE FUNCTION CalculateExperience
(
    @StartYear INT
)
RETURNS INT
AS
BEGIN
    DECLARE @CurrentYear INT;
    DECLARE @Experience INT;

    SET @CurrentYear = YEAR(GETDATE());
    SET @Experience = @CurrentYear - @StartYear;

    RETURN @Experience;
END
SELECT dbo.CalculateExperience(2020);


