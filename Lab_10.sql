CREATE TABLE Employee
(
    EID INT,
    EName VARCHAR(100),
    Gender VARCHAR(10),
    JoiningDate DATETIME,
    Salary DECIMAL(8,2),
    City VARCHAR(100)
);
INSERT INTO Employee VALUES
(1,'Nick','Male','2013-01-01',4000,'London'),
(2,'Julian','Female','2014-10-01',3000,'New York'),
(3,'Roy','Male','2016-01-01',3500,'London'),
(4,'Tom','Male',NULL,4500,'London'),
(5,'Jerry','Male','2013-02-01',2800,'Sydney'),
(6,'Philip','Male','2015-01-01',7000,'New York'),
(7,'Sara','Female','2017-08-01',4800,'Sydney'),
(8,'Emily','Female','2015-01-01',5500,'New York'),
(9,'Michael','Male',NULL,6500,'London'),
(10,'John','Male','2015-01-01',8800,'London');


-- Part – A 
-- 1. Create a function which displays total number of employees. 
CREATE FUNCTION fn_TotalEmployees()
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM Employee);
END;
SELECT dbo.fn_TotalEmployees();

-- 2. Create a function which count unique city from employee table. 
CREATE FUNCTION fn_UniqueCity()
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(DISTINCT City) FROM Employee);
END;
SELECT dbo.fn_UniqueCity();

-- 3. Create a Scalar-valued function that returns the name combined with salary of an employee based on their employee id and displayed output like ‘Roy having 3500 salaries’. 
CREATE FUNCTION fn_NameSalary(@EName VARCHAR(100))
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @Result VARCHAR(200);
    SELECT @Result = EName + ' having ' + CAST(Salary AS VARCHAR) + ' salary'
    FROM Employee
    WHERE EName = @EName;
    RETURN @Result;
END;
SELECT dbo.fn_NameSalary('Roy');

-- 4. Create a function which returns highest salary from Employee table.
CREATE FUNCTION fn_HighestSalary()
RETURNS DECIMAL(8,2)
AS
BEGIN
    RETURN (SELECT MAX(Salary) FROM Employee);
END;
SELECT dbo.fn_HighestSalary();

-- Part – B 
-- 5. Create a function to get the experience of the employee based on their joining date.
CREATE FUNCTION fn_Experience(@JoinDate DATETIME)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @JoinDate, GETDATE());
END;
SELECT EName, dbo.fn_Experience(JoiningDate) AS Experience
FROM Employee
WHERE JoiningDate IS NOT NULL;

-- 6. Create a function which returns minimum salary of female employee.
CREATE FUNCTION fn_MinFemaleSalary()
RETURNS DECIMAL(8,2)
AS
BEGIN
    RETURN (SELECT MIN(Salary) FROM Employee WHERE Gender='Female');
END;
SELECT dbo.fn_MinFemaleSalary();



-- Table Valued Functions 
-- Part – A 
-- 1. Create a function which retrieve the data of Employee table. 
CREATE FUNCTION fn_AllEmployees()
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Employee
);
SELECT * FROM dbo.fn_AllEmployees();

-- 2. Create a function which returns an employee table with city wise total salary.  
CREATE FUNCTION fn_CityWiseSalary()
RETURNS TABLE
AS
RETURN
(
    SELECT City, SUM(Salary) AS TotalSalary
    FROM Employee
    GROUP BY City
);
SELECT * FROM dbo.fn_CityWiseSalary();


-- 3. Create a function which returns an employee table with gender wise maximum, minimum, total and average salaries. 
CREATE FUNCTION fn_GenderWiseSalary()
RETURNS TABLE
AS
RETURN
(
    SELECT Gender,
           MAX(Salary) AS MaxSalary,
           MIN(Salary) AS MinSalary,
           SUM(Salary) AS TotalSalary,
           AVG(Salary) AS AvgSalary
    FROM Employee
    GROUP BY Gender
);
SELECT * FROM dbo.fn_GenderWiseSalary();

-- 4. Create a function which return an employee table with details of employee whose name starts with J. 
CREATE FUNCTION fn_NameStartsWithJ()
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Employee WHERE EName LIKE 'J%'
);
SELECT * FROM dbo.fn_NameStartsWithJ();


-- 5. Create a function to get all the male employees. 
CREATE FUNCTION fn_MaleEmployees()
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Employee WHERE Gender='Male'
);
SELECT * FROM dbo.fn_MaleEmployees();


-- Part – B 
-- 6. Create a function to get employees from a given city. 
CREATE FUNCTION fn_EmployeeByCity(@City VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Employee WHERE City=@City
);
SELECT * FROM dbo.fn_EmployeeByCity('London');


-- 7. Create a function that displays employees with a salary greater than a specified amount.
CREATE FUNCTION fn_SalaryGreater(@Amount DECIMAL(8,2))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Employee WHERE Salary > @Amount
);
SELECT * FROM dbo.fn_SalaryGreater(5000);


-- 8. Create a function to get employees who joined after a given specified date. 
CREATE FUNCTION fn_JoinedAfter(@Date DATETIME)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM Employee WHERE JoiningDate > @Date
);
SELECT * FROM dbo.fn_JoinedAfter('2015-01-01');


