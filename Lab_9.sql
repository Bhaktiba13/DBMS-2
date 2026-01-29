CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Designation (
    DesignationID INT PRIMARY KEY,
    DesignationName VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Person (
    WorkerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Salary DECIMAL(8,2),
    JoiningDate DATE,
    DepartmentID INT,
    DesignationID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);
CREATE TABLE Emp (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Emp_Salary DECIMAL(8,2),
    Department VARCHAR(50),
    Hire_Date DATE
);
INSERT INTO Department VALUES
(1,'Admin'),
(2,'IT'),
(3,'HR'),
(4,'Account');

INSERT INTO Designation VALUES
(11,'Jobber'),
(12,'Welder'),
(13,'Clerk'),
(14,'Manager'),
(15,'CEO');

INSERT INTO Person VALUES
(101,'Rahul','Anshu',56000,'1990-01-01',1,12),
(102,'Hardik','Hinsu',18000,'1990-09-25',2,11),
(103,'Bhavin','Kamani',25000,'1991-05-14',NULL,11),
(104,'Bhoomi','Patel',39000,'2014-02-20',1,13),
(105,'Rohit','Rajgor',17000,'1990-07-23',2,15),
(106,'Priya','Mehta',25000,'1990-10-18',2,NULL),
(107,'Neha','Trivedi',18000,'2014-02-20',3,15);

SELECT*FROM Department
SELECT*FROM Designation
SELECT*FROM Person

                           ----------Part – A --------------

--1. Create a stored procedure that takes department name as an input and returns a table with all workers working in that department. 
CREATE OR ALTER PROCEDURE GetWorkersByDepartment
    @DeptName VARCHAR(100)
AS
BEGIN
    SELECT p.*
    FROM Person p
    JOIN Department d ON p.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName = @DeptName
END

EXEC GetWorkersByDepartment 'IT'


--2. Create procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name. 
CREATE PROCEDURE GetWorkerByDeptAndDesig
    @DeptName VARCHAR(100),
    @DesigName VARCHAR(100)
AS
BEGIN
    SELECT 
        p.FirstName,
        p.Salary,
        p.JoiningDate,
        d.DepartmentName
    FROM Person p
    JOIN Department d ON p.DepartmentID = d.DepartmentID
    JOIN Designation g ON p.DesignationID = g.DesignationID
    WHERE d.DepartmentName = @DeptName
      AND g.DesignationName = @DesigName
END

EXEC GetWorkerByDeptAndDesig 'Admin','Clerk'

--3. Create a Procedure that takes the first name as an input parameter and display all the details of the worker with their department & designation name. 
CREATE PROCEDURE GetWorkerByFirstName
    @FirstName VARCHAR(100)
AS
BEGIN
    SELECT 
        p.*,
        d.DepartmentName,
        g.DesignationName
    FROM Person p
    LEFT JOIN Department d ON p.DepartmentID = d.DepartmentID
    LEFT JOIN Designation g ON p.DesignationID = g.DesignationID
    WHERE p.FirstName = @FirstName
END

EXEC GetWorkerByFirstName 'Rohit'
--4. Create Procedure which displays department wise maximum, minimum & total salaries. 
CREATE PROCEDURE DeptWiseSalarySummary
AS
BEGIN
    SELECT 
        d.DepartmentName,
        MAX(p.Salary) AS MaxSalary,
        MIN(p.Salary) AS MinSalary,
        SUM(p.Salary) AS TotalSalary
    FROM Person p
    JOIN Department d ON p.DepartmentID = d.DepartmentID
    GROUP BY d.DepartmentName
END

EXEC DeptWiseSalarySummary
--5. Create Procedure which displays designation wise maximum, minimum & total salaries.
CREATE PROCEDURE DesignationWiseSalarySummary
AS
BEGIN
    SELECT 
        g.DesignationName,
        MAX(p.Salary) AS MaxSalary,
        MIN(p.Salary) AS MinSalary,
        SUM(p.Salary) AS TotalSalary
    FROM Person p
    JOIN Designation g ON p.DesignationID = g.DesignationID
    GROUP BY g.DesignationName
END

EXEC DesignationWiseSalarySummary


                                      ----------Part – B ------------


--CREATE TABLE Emp (
--    Emp_ID INT PRIMARY KEY,
--    Emp_Name VARCHAR(50) NOT NULL,
--    Emp_Salary DECIMAL(8,2) NOT NULL,
--    Department VARCHAR(50) NOT NULL,
--    Hire_Date DATE NOT NULL
--);

INSERT INTO Emp VALUES
(1,'John',50000,'Sales','2022-01-15'),
(2,'Jane',60000,'Marketing','2021-05-10'),
(3,'Mike',75000,'IT','2020-09-20'),
(4,'Emily',45000,'Finance','2023-02-28'),
(5,'David',80000,'IT','2021-11-05');

SELECT * FROM Emp;


--1. Create a Stored Procedure to Calculate Total Salary Expense.  
CREATE PROCEDURE TotalSalaryExpense
AS
BEGIN
    SELECT SUM(Emp_Salary) AS TotalSalaryExpense
    FROM Emp
END

EXEC TotalSalaryExpense

--2. Create a Stored Procedure to Calculate the Total Number of Employees in Each Department. 
CREATE PROCEDURE EmployeeCountByDepartment
AS
BEGIN
    SELECT Department, COUNT(*) AS TotalEmployees
    FROM Emp
    GROUP BY Department
END

EXEC EmployeeCountByDepartment

--3. Create a Stored Procedure to Calculate the Average Salary for Each Department. 
CREATE PROCEDURE AvgSalaryByDepartment
AS
BEGIN
    SELECT Department, AVG(Emp_Salary) AS AvgSalary
    FROM Emp
    GROUP BY Department
END

EXEC AvgSalaryByDepartment


                                         ---------Part – C ------------

--4. Create a Stored Procedure to Get Highest Paid Employee. 
CREATE PROCEDURE GetHighestPaidEmployee
AS
BEGIN
    SELECT TOP 1 *
    FROM Emp
    ORDER BY Emp_Salary DESC
END

EXEC GetHighestPaidEmployee

--5. Create a Stored Procedure to Get Employees Hired in a Specific Year. 
CREATE PROCEDURE GetEmployeesHiredInYear
    @Year INT
AS
BEGIN
    SELECT *
    FROM Emp
    WHERE YEAR(Hire_Date) = @Year
END

EXEC EmployeesByHireYear 2021;


--6. Create a Stored Procedure to Get Employees with the Longest Tenure. 
CREATE PROCEDURE GetLongestTenureEmployee
AS
BEGIN
    SELECT TOP 1 *
    FROM Emp
    ORDER BY Hire_Date ASC
END

EXEC GetLongestTenureEmployee;

--7. Create a Stored Procedure to Generate Monthly Salary Report. 
CREATE PROCEDURE GenerateMonthlySalaryReport
AS
BEGIN
    SELECT 
        Emp_ID,
        Emp_Name,
        Emp_Salary,
        (Emp_Salary / 12) AS MonthlySalary
    FROM Emp
END

EXEC GenerateMonthlySalaryReport;

