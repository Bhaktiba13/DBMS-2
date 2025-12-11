CREATE DATABASE BHAKTIBA_24030401102-

  --LAB 1--
  
CREATE TABLE STUDENT
(StuID Int,
Name Varchar (100),
EnrollmentNo Varchar (12),
Division Varchar (50),
Sem Int,
BirthDate Datetime,
Email Varchar (100),
ContactNo Varchar (50)
);

INSERT INTO STUDENT VALUES
(101,' Naimish Patel', '090200107051',' BCX-3', 3, '1992-12-06', 'naimishp49@gmail.com',' 8866205253'),
(102, 'Firoz A. S.','090200107090',' BCY-3', 3, '1994-05-03', 'Firoz.me@gmail.com', '8885999922'),
(103, 'Krunal Vyas', '090243107101', 'BCZ-5', 5, '1984-03-01', 'Krunal.vyas@gmail.com' ,'9990888877'),
(104, 'Vijay Patel' ,'090200107102', 'BCX-5', 5, '1985-02-15' ,'Vijay.patel123@gmail.com' ,'8787878787'),
(105, 'Maulik Trivedi', '090200107103', 'BCY-3' ,3 ,'1988-01-20', 'Maulik123@gmail.com' ,'8789564512')

--1. Display all the records of Student table.
SELECT * FROM STUDENT


--2. Display Name, Enrollment number & Division of 3rd semester student only.
SELECT Name, EnrollmentNo,Division FROM STUDENT
WHERE Sem=3


--3. Display the Name & ID of student and label the columns as “Student Name” and “Student ID”.
SELECT Name AS [STUDENT NAME],StuID AS [STUDENT ID] FROM STUDENT



--4. Display Name of Student who belongs to Semester 5 and belong to BCX-5 division.
SELECT Name,Sem,Division FROM STUDENT
WHERE Sem=5


--5. Find Student Name & Enrollment number in which Student Id between 102 to 105. (Use AND & BETWEEN).
SELECT NAME,EnrollmentNo,StuID FROM STUDENT
WHERE StuID BETWEEN 102 AND 105


--6. Find Student Name, Enrollment number with their Email who belongs to 5th or 3rd Semester. (Use IN & OR).
SELECT Name,EnrollmentNo,Email,Sem FROM STUDENT
WHERE Sem=5 OR SEM=3

--7. Display student Name & Id who does not belongs to BCY-3 and BCX-3 division.
SELECT Name,StuID FROM STUDENT
WHERE Division NOT IN('BCY-3','BCX-3')

--8. Display all the students whose name starts with “v”.
SELECT Name FROM STUDENT
WHERE NAME LIKE 'V%'

--9. Display All the Details of first two students.
SELECT TOP 2 * FROM STUDENT

--10. Display all the student details order by Birth Date.
SELECT * FROM STUDENT
ORDER BY BirthDate

--11. Display student ID, Name, Enrollment number and Email ID whose semester is either 3 or 5 and division in
--BCZ-5 and BCY-3.
SELECT * FROM STUDENT
WHERE SEM IN(3,5) AND Division IN('BCZ-5','BCY-3')


--12. Display Name & Enrollment no of first 30% Students.
SELECT TOP 30 PERCENT Name,EnrollmentNo FROM STUDENT

--13. Display Unique Semesters.
SELECT DISTINCT Sem FROM STUDENT

--14. Find the student details who born between year 1984 and 1990.
SELECT * FROM STUDENT
WHERE BirthDate BETWEEN '1984' AND '1990'


--15. Retrieve all the Students who have no Enrollment.
SELECT * FROM STUDENT
WHERE EnrollmentNo IS NULL

--16. Retrieve all the students name and semester whose email id contain “123”.
SELECT * FROM STUDENT
WHERE Email LIKE '%123%'

--17. Find Students who born before date 01-01-1986 & belongs to 4th semester.
SELECT * FROM STUDENT
WHERE Sem=4 AND BirthDate < '01-01-1986'

--18. Display all the students order by name in descending order.
SELECT * FROM STUDENT
ORDER BY Name DESC

--19. Write an SQL query to clone a new table Student_New from Student table with all data.
SELECT * INTO Student_New FROM STUDENT
SELECT * FROM Student_New

--20. Insert a new row in Student_New table: (106, “Chirag Patel”, 090200107104, “BCY-5”, 5, 1987-03-23,
--“chirag_s@gmail.com”, 7788998893)
INSERT INTO Student_New VALUES
(106, 'Chirag Patel','090200107104', 'BCY-5', 5, '1987-03-23','chirag_s@gmail.com', '7788998893')
SELECT * FROM Student_New



--EXTRA
--DISPLY OLDEST STUDENT
SELECT TOP 1 * FROM STUDENT
ORDER BY BirthDate

--DISPLAY YOUGEST STUDENT
SELECT TOP 1 * FROM STUDENT
ORDER BY BirthDate DESC

--ENROLLMENT NUMBER DOES NOT START WITH '09'
SELECT * FROM STUDENT
WHERE EnrollmentNo NOT LIKE '09%'

--TOP 3 STUDENT BASED ON EARLIEST BIRTHDATES
SELECT TOP 3 * FROM STUDENT
ORDER BY BirthDate

--DISPLAY STUDENT WHOSE EMAIL IS NULL,EMPTY OR MISSING
SELECT * FROM STUDENT
WHERE Email IS NULL

--DISPLAY STUDENT BORN IN FEBRUARY OR MARCH,REGARDLESS OF YEAR
SELECT * FROM STUDENT
WHERE MONTH(BirthDate) IN ('02','03')

--NAME CONTAINS TWO WORDS AND SECOND WORD STARTS WITH 'P'
SELECT * FROM STUDENT
WHERE NAME LIKE '%_[P]%'

--DISPLAY ALL STUDENTS WHOSE EMAILID CONTAINS THEIR FIRST NAME
SELECT * FROM STUDENT
WHERE Email LIKE '%'+
SUBSTRING(NAME,1,CHARINDEX(' ',NAME+' ')-1)+'%'


--LAB 2--

CREATE TABLE Employee (
    EID INT PRIMARY KEY,
    EName VARCHAR(100),
    Gender VARCHAR(10),
    JoiningDate DATETIME,
    Salary DECIMAL(8,2),
    City VARCHAR(100)
);

INSERT INTO Employee (EID, EName, Gender, JoiningDate, Salary, City) VALUES
(1, 'Nick', 'Male', '2013-01-01', 4000, 'London'),
(2, 'Julian', 'Female', '2014-10-01', 3000, 'New York'),
(3, 'Roy', 'Male', '2016-06-01', 3500, 'London'),
(4, 'Tom', 'Male', NULL, 4500, 'London'),
(5, 'Jerry', 'Male', '2013-02-01', 2800, 'Sydney'),
(6, 'Philip', 'Male', '2015-01-01', 7000, 'New York'),
(7, 'Sara', 'Female', '2017-08-01', 4800, 'Sydney'),
(8, 'Emily', 'Female', '2015-01-01', 5500, 'New York'),
(9, 'Michael', 'Male', NULL, 6500, 'London'),
(10, 'John', 'Male', '2015-01-01', 8800, 'London');


--1. Display all the employees whose name starts with “m” and 4th character is “h”. 
SELECT * FROM Employee
WHERE EName LIKE 'm__h%';


--2. Find the value of 3 raised to 5. Label the column as output. 
SELECT POWER(3, 5) AS output;


--3. Write a query to subtract 20 days from the current date. 
SELECT DATEADD(DAY, -20, GETDATE()) AS ResultDate;



--4. Produce output like <Ename> having <salary> salary (i.e. Nick having 4000 salary). 
SELECT CONCAT(EName, ' having ', Salary, ' salary') AS Result
FROM Employee;


--5. Write a query to display name of employees whose name starts with “j” and contains “n” in their name. 
SELECT * FROM Employee
WHERE EName LIKE 'j%n%' OR EName LIKE 'j%N%';


--6. Display 2nd to 9th character of the given string “SQL Programming”. 
SELECT SUBSTRING('SQL Programming', 2, 8) AS Output;


--7. Display name of the employees whose city name ends with “ney” & contains six characters. 
SELECT * FROM Employee
WHERE City LIKE '%ney'
  AND LEN(City) = 6;


--8. Convert all employee names to Uppercase whose name starts with “j” and having salary more than 3000. 
SELECT UPPER(EName) AS NameUpper
FROM Employee
WHERE EName LIKE 'j%' AND Salary > 3000;


--9. Write a query to convert value 15 to string. 
SELECT CAST(15 AS CHAR) AS StringValue;


--10. Count the number of employees in each city. 
SELECT City, COUNT(*) AS EmpCount
FROM Employee
GROUP BY City;


--11. Concatenate the city and employee name and generate the output like: <EName> belongs to <City> city 
---(i.e. Tom belongs to London city). 
SELECT CONCAT(EName, ' belongs to ', City, ' city') AS Result
FROM Employee;


--12. Get the sum of salaries for employees who joined after 2014. 
SELECT SUM(Salary) AS TotalSalary
FROM Employee
WHERE YEAR(JoiningDate) > 2014;


--13. Display all the employees whose name ends with either “n” or “y”. 
SELECT * FROM Employee
WHERE EName LIKE '%n' OR EName LIKE '%y';


--14. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2. 
SELECT CEILING(63.1) AS Val1,
       CEILING(63.8) AS Val2,
       CEILING(-63.2) AS Val3;


--15. Calculate the Total, Average, Minimum, and Maximum Salaries by City. 
SELECT City,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AvgSalary,
       MIN(Salary) AS MinSalary,
       MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY City;


--16. Display all employees whose joining date is not specified. 
SELECT * FROM Employee
WHERE JoiningDate IS NULL;


--17. Display name of the employees in capital letters and city in small letters. 
SELECT UPPER(EName) AS NameUpper,
       LOWER(City) AS CityLower
FROM Employee;


--18. Display gender wise maximum salary. 
SELECT Gender, MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY Gender;


--19. Calculate the Number of Days Each Employee Has Worked (If JoiningDate is Not Null). 
SELECT EName,
       DATEDIFF(DAY, JoiningDate, GETDATE()) AS DaysWorked
FROM Employee
WHERE JoiningDate IS NOT NULL;


--20. Display name of the employees and their experience in years. 
SELECT EName,
       DATEDIFF(YEAR, JoiningDate, GETDATE()) AS ExperienceYears
FROM Employee
WHERE JoiningDate IS NOT NULL;


--LAB 3--

--1. Update the salary of an employee to 4500 whose EID is 1. 
UPDATE Employee
SET Salary = 4500
WHERE EID = 1;


--2. Increase the salary of all the employee by 7% who belongs to “London” city. 
UPDATE Employee
SET Salary = Salary * 1.07
WHERE City = 'London';


--3. Add a new column department Varchar (50) to the employee table. 
ALTER TABLE Employee
ADD Department VARCHAR(50);


--4. Delete Employee Record Where EID = 5. 
DELETE FROM Employee
WHERE EID = 5;


--5. Delete employees who have 'NULL' in their JoiningDate. 
DELETE FROM Employee
WHERE JoiningDate IS NULL;


--6. Modify the salary column to allow for 10 digits and 2 decimal places.
ALTER TABLE Employee
ALTER COLUMN Salary DECIMAL(10,2);


--7. Add new columns, Email and PhoneNumber, to store employee emails and phone numbers. 
ALTER TABLE Employee
ADD Email VARCHAR(100),
    PhoneNumber VARCHAR(20);


--8. Set JoiningDate to NULL for employees in “Sydney”. 
UPDATE Employee
SET JoiningDate = NULL
WHERE City = 'Sydney';


--9. Reduce salary by 200 for all employees earning above 5000. 
UPDATE Employee
SET Salary = Salary - 200
WHERE Salary > 5000;


--10. Rename the Salary column to MonthlySalary. 
EXEC sp_rename 'Employee.Salary', 'MonthlySalary', 'COLUMN';


--11. Remove column PhoneNumber from employee table. 
ALTER TABLE Employee
DROP COLUMN PhoneNumber;


--12. Rename a column from Ename to FirstName. 
EXEC sp_rename 'Employee.EName', 'FirstName', 'COLUMN';


--13. Rename a table from Employee to EmpMaster. 
EXEC sp_rename 'Employee', 'EmpMaster';


--14. Remove City column from the EmpMaster table. 
ALTER TABLE EmpMaster
DROP COLUMN City;


--15. Drop EmpMaster table from the database.
DROP TABLE EmpMaster;







