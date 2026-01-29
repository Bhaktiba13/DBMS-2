--LAB 5



CREATE TABLE Student36 (
    RNo INT,
    Name VARCHAR(50),
    Branch VARCHAR(10),
    SPI DECIMAL(4,2),
    Bklog INT
);

INSERT INTO Student36 VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 1),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', 'EC', 4.50, 3);

SELECT * FROM STUDENT36

--2. Complex View
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
);

INSERT INTO Customer VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Johnson'),
(4, 'Mark', 'Wood'),
(5, 'Moin', 'Khan');

SELECT*FROM Customer

CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    Balance DECIMAL(10,2),
    AccountType VARCHAR(20),
    CreatedDate DATE
);

INSERT INTO Account VALUES
(101, 1, 5000, 'Current', '2023-01-01'),
(102, 1, 8000, 'Saving', '2023-02-25'),
(103, 2, 10000, 'Saving', '2023-03-30'),
(104, 4, 15000, 'Current', '2020-06-15'),
(105, 3, 7500, 'Saving', '2021-11-27'),
(106, 5, 13450, 'Current', '2019-10-13');

SELECT *FROM Account

--------------PART - A ------------
--1. Create a view Personal with all columns.
CREATE VIEW PERSONAL AS 
SELECT *FROM Student36

--2. Create a view Student_Details having columns Name, Branch & SPI. 
CREATE VIEW STUDENT_DETAILS AS
SELECT NAME,BRANCH,SPI FROM Student36

SELECT * FROM Student36

--3. Create a view Academic having columns RNo, Name, Branch.
CREATE VIEW ACADEMIC AS
SELECT RNO,NAME,BRANCH FROM Student36

SELECT * FROM ACADEMIC

--4. Create a view Student_Data having all columns but students whose bklogs are more than 2.
CREATE VIEW STUDENT_DATA AS
SELECT * FROM Student36

WHERE Bklog>2

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of fourletters.
CREATE VIEW STUDENT_PATTERN AS
SELECT RNO,NAME,BRANCH FROM Student36

WHERE NAME LIKE '____'

SELECT*FROM Student36



-------------------PART -B -----------------
---6. Insert a new record to Academic view. (107, Meet, ME). Remaining all columns must be null. 
INSERT INTO ACADEMIC(RNO,NAME,BRANCH)
VALUES(107,'MEET','ME')

SELECT * FROM ACADEMIC

---7. Update the branch of Amit from CE to ME in Student_Details view. 
UPDATE Student36
SET BRANCH = 'ME'
WHERE NAME = 'AMIT';

SELECT * FROM ACADEMIC

---8. Delete a student whose roll number is 104 from Academic view. 
DELETE STUDENT36
WHERE RNO=104

SELECT * FROM ACADEMIC

---9. Create a view that displays information of all students whose spi is above 8.5. 
CREATE VIEW HIGH_SPI AS
SELECT * FROM STUDENT36 
WHERE SPI > 8.5;

SELECT * FROM HIGH_SPI

---10. Create a view that displays 0 backlog students.
CREATE OR ALTER VIEW BACKLOG_STUDENTS AS
SELECT * FROM Student36
WHERE BKLOG = 0;

SELECT * FROM BACKLOG_STUDENTS

-------------------------PART-C-----------------
---11. Create a view Computer that displays CE branch data only. 
CREATE VIEW COMPUTER AS
SELECT*FROM Student36

WHERE Branch='CE'

---12. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC. 
CREATE VIEW RESULT_EC AS
SELECT NAME,SPI FROM STUDENT36
WHERE BRANCH='EC' AND SPI <5

---13. Update the result of student Sanjay to 4.90 in Result_EC view. 
UPDATE Student36
SET SPI = 4.90
WHERE NAME = 'SANJAY';

SELECT * FROM Student36

---14. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5. 
CREATE VIEW STU_BKLOG AS
SELECT RNO,NAME,BKLOG
FROM Student36
WHERE NAME LIKE 'M%' AND Bklog>5

---15. Drop the Computer view from the database. 
DROP VIEW COMPUTER




-----------------------------------COMPLEX VIEW-----------------
--------------PART-A-----------------

---1. Create view that displays all the customers along with their corresponding account balances. 
CREATE VIEW CUSTOMER_ACCOUNT AS
SELECT C.FIRSTNAME, C.LASTNAME, A.BALANCE
FROM CUSTOMER C
JOIN ACCOUNT A ON C.CUSTOMERID = A.CUSTOMERID;

SELECT*FROM CUSTOMER_ACCOUNT

---2. Create view that displays total balance for each customer. 
CREATE VIEW TOTAL_BALANCE AS
SELECT C.CUSTOMERID, C.FIRSTNAME, SUM(A.BALANCE) AS TOTALBALANCE
FROM CUSTOMER C
JOIN ACCOUNT A ON C.CUSTOMERID = A.CUSTOMERID
GROUP BY C.CUSTOMERID, C.FIRSTNAME;

SELECT * FROM TOTAL_BALANCE

---3. Create view that displays customers who have multiple accounts. 
CREATE OR ALTER VIEW MULTIPLE_ACCOUNTS AS
SELECT C.FIRSTNAME,COUNT(A.ACCOUNTID) AS MULTIPLE_ACC
FROM ACCOUNT A 
JOIN CUSTOMER C ON C.CUSTOMERID = A.CUSTOMERID
GROUP BY C.FIRSTNAME
HAVING COUNT(ACCOUNTID) > 1;

SELECT * FROM MULTIPLE_ACCOUNTS

---------------------PART-B------------
---4. Create a view that displays customer details who have an account created in the last month. 
CREATE VIEW RECENT_ACCOUNT AS
SELECT C.* 
FROM Customer C JOIN Account A 
ON C.CustomerID=A.CustomerID
WHERE A.CreatedDate>=DATEADD(MONTH,-1,GETDATE())


---5. Create a view that displays customers who have the highest account balance. 
CREATE VIEW HIGHEST_BALANCE AS
SELECT C.FIRSTNAME,C.LASTNAME,A.BALANCE
FROM CUSTOMER C JOIN Account A
ON C.CustomerID=A.CustomerID
WHERE A.Balance=(SELECT MAX(BALANCE) FROM Account)

--------------------PART - C------------
--6. Create a view that displays name of the customers whose account balance is between 5000 to 10000 and account type is Saving.
CREATE VIEW DISPLAY_NAME AS
SELECT C.FIRSTNAME,C.LASTNAME,A.Balance
FROM Customer C JOIN ACCOUNT A
ON C.CustomerID=A.CustomerID
WHERE A.BALANCE BETWEEN 5000 AND 10000 AND A.AccountType='SAVING'


--7. Create a view that displays minimum and maximum balance for each customer.
CREATE VIEW DISPLAY_MINMAX AS
SELECT C.CUSTOMERID,C.FIRSTNAME,
       MIN(A.BALANCE) AS MIN_BALANCE,
	   MAX(A.BALANCE) AS MAX_BALANCE FROM CUSTOMER C
JOIN ACCOUNT A ON C.CUSTOMERID=A.CUSTOMERID
GROUP BY C.CUSTOMERID,C.FIRSTNAME


