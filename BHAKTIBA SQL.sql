CREATE DATABASE BHAKTIBA_24030401102

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
(105, 'Maulik Trivedi', '090200107103', 'BCY-3' ,3 ,'1988-01-20', 'Maulik123@gmail.com' ,'8789564512')--1. Display all the records of Student table.
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