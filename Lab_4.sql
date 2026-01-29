--LAB 4--


create table Department(
    DepartmentId int primary key,
    DepartmentName varchar(100) not null unique,
    DepartmentCode varchar(50) not null unique,
    Location varchar(50) not null
);

Insert into Department values
    (1,'Admin','Adm','A-Block'),
    (2,'Computer','CE','C-Block'),
    (3,'Civil','CI','G-Block'),
    (4,'Electrical','EE','E-Block'),
    (5,'Mechanical','ME','B-Block');

create table Person(
	PersonId int primary key,
    PersonName varchar(100) not null,
    DepartmentId int null,
    foreign key (DepartmentId) references Department(DepartmentId),
    Salary decimal(8,2) not null,
    JoiningDate datetime not null,
    City varchar(100) not null
);

INSERT INTO Person VALUES
(101,'Rahul Tripathi',2,56000,'2000-01-01','Rajkot'),
(102,'Hardik Pandya',3,18000,'2001-09-25','Ahmedabad'),
(103,'Bhavin Kanani',4,25000,'2000-05-14','Baroda'),
(104,'Bhoomi Vaishnav',1,39000,'2005-02-08','Rajkot'),
(105,'Rohit Topiya',2,17000,'2001-07-23','Jamnagar'),
(106,'Priya Menpara',NULL,9000,'2000-10-18','Ahmedabad'),
(107,'Neha Sharma',2,34000,'2002-12-25','Rajkot'),
(108,'Nayan Goswami',3,25000,'2001-07-01','Rajkot'),
(109,'Mehul Bhundiya',4,13500,'2005-01-09','Baroda'),
(110,'Mohit Maru',5,14000,'2000-05-25','Jamnagar');

SELECT*FROM DEPARTMENT
SELECT*FROM PERSON

--1. Find all persons with their department name & code.
select p.personname,d.departmentname,d.departmentcode
from Person p
inner join department d
on p.departmentid=d.departmentid

--2. Give department wise maximum & minimum salary with department name. 
SELECT d.DepartmentName,
       MAX(p.Salary) AS MaxSalary,
       MIN(p.Salary) AS MinSalary
FROM Person p
INNER JOIN Department d
ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName

--3. Find all departments whose total salary is exceeding 100000. 
SELECT d.DepartmentName, SUM(p.Salary) AS TotalSalary
FROM Person p
INNER JOIN Department d
ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(p.Salary) > 100000


--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT p.PersonName, p.Salary, d.DepartmentName
FROM Person p
INNER JOIN Department d
ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Jamnagar'

--5. Find all persons who does not belongs to any department. 
SELECT PersonName, Salary
FROM Person
WHERE DepartmentID IS NULL


--6. Find department wise person counts.
SELECT d.DepartmentName, COUNT(p.PersonID) AS TotalPersons
FROM Department d
LEFT JOIN Person p
ON d.DepartmentID = p.DepartmentID
group by d.departmentname

--7. Find average salary of person who belongs to Ahmedabad city. 
SELECT AVG(Salary) AS AvgSalary
FROM Person
WHERE City = 'Ahmedabad'

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly (In Single Column).
SELECT concat( p.PersonName  ,'earns ' , p.Salary , ' from department ',  d.DepartmentName , ' monthly') AS Output
FROM Person p
INNER JOIN Department d
ON p.DepartmentID = d.DepartmentID

--9. List all departments who have no persons. 
SELECT d.DepartmentName
FROM Department d
LEFT JOIN Person p
on d.DepartmentID = p.DepartmentID
where p.personid is null


--10. Find city & department wise total, average & maximum salaries.
SELECT p.City, d.DepartmentName,
       SUM(p.Salary) AS TotalSalary,
       AVG(p.Salary) AS AvgSalary,
       MAX(p.Salary) AS MaxSalary
FROM Person p
INNER JOIN Department d
ON p.DepartmentID = d.DepartmentID
GROUP BY p.city,d.departmentname

--11. Display Unique city names. 
SELECT DISTINCT City
FROM Person

--12. List out department names in which more than two persons. 
SELECT d.DepartmentName
FROM Person p
INNER JOIN Department d
ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(p.PersonID) > 2


--13. Combine person name’s first three characters with city name’s last three characters in single column.
SELECT 
SUBSTRING(PersonName, 1, 3) + SUBSTRING(City, LEN(City)-2, 3) AS CombinedValue
FROM Person

--14. Give 10% increment in Computer department employee’s salary. 
UPDATE Person
SET Salary = Salary + (Salary * 0.10)
WHERE DepartmentID = (
    SELECT DepartmentID 
    FROM Department 
    WHERE DepartmentName = 'Computer'
)
select*from department


--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.
SELECT PersonName
FROM Person
WHERE DATEDIFF(day, JoiningDate, GETDATE()) > 365






-- extra queries
1.Show city having maximum number of employees
2.Find departments where average salary is greater than overall average salary
3.Find department(s) with highest total salary
4.List persons whose salary is greater than department average
5.Find persons who earn same salary as someone else
6.List persons who joined in the same year as another person
7.Find departments where no employee earns less than 15000
8.Display persons whose name starts and ends with vowel
9.Display persons who earn exactly the department’s average salary
10.Display salary difference between highest & lowest salary per department
