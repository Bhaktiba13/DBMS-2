                                        ------LAB 7-----


									-----Part – A------

--1. Write a PL/ SQL program to print a welcome message on a screen.
BEGIN
	PRINT 'WELCOME!!!'
END
--2. Write a PL/SQL program to addition of two numbers.
DECLARE @NUM1 INT = 10;
DECLARE @NUM2 INT = 20;
DECLARE @SUM INT = @NUM1 + @NUM2;

PRINT 'ADDITION:'+ CAST(@SUM AS VARCHAR);

--3. Write a PL/SQL program to print maximum number out of three numbers.
DECLARE @NUM1 INT = 10;
DECLARE @NUM2 INT = 20;
DECLARE @NUM3 INT = 30;

IF(@NUM1 > @NUM2 AND @NUM1 > @NUM3)

	PRINT(CAST(@NUM1 AS VARCHAR) +' IS MAXIMUM!!')

ELSE IF(@NUM2 > @NUM3 AND @NUM2 > @NUM1)
	
	PRINT(CAST(@NUM2 AS VARCHAR) +' IS MAXIMUM!!')

ELSE
	
	PRINT(CAST(@NUM3 AS VARCHAR) +' IS MAXIMUM!!')


--4. Write a PL/ SQL program to print number from 1 to 10. (Using while loop)
DECLARE @I INT = 1
WHILE(@I<=10)
BEGIN
	PRINT @I;
	SET @I=@I+1;
END

--5. Write a PL/ SQL program to check where given number is ODD or EVEN.
DECLARE @NUM INT =5;

IF(@NUM % 2 = 0)
	
	PRINT(CAST(@NUM AS VARCHAR) +' IS EVEN!!')

ELSE

	PRINT(CAST(@NUM AS VARCHAR) +' IS ODD!!')


										----Part – B---

--6. Write a PL/ SQL program to inserting even numbers into even table & odd numbers into odd table between 1 to 50.
CREATE TABLE EVEN_NUMBERS (NUM INT);
CREATE TABLE ODD_NUMBERS (NUM INT);

DECLARE @I INT = 1
WHILE(@I<=50)
BEGIN
	IF(@I % 2 = 0)
	
	INSERT INTO EVEN_NUMBERS VALUES(@I)

	ELSE

	INSERT INTO ODD_NUMBERS VALUES(@I)
SET @I=@I+1;
END


SELECT * FROM EVEN_NUMBERS
SELECT * FROM ODD_NUMBERS

--7. Write a PL/ SQL program to calculate the factorial of N number and display the result.
DECLARE @NUM INT = 5,@FACT INT = 1
WHILE(@NUM>0)
BEGIN
	SET @FACT = @FACT * @NUM;
	SET @NUM = @NUM - 1
END

PRINT 'FACTORIAL:'+ CAST(@FACT AS VARCHAR);
   
                                ------Part – C------
--8. Write a PL/ SQL program to check weather given number is prime or not.
DECLARE @NUM INT = 23 ,@I INT = 2,@FLAG INT = 1

WHILE(@I<@NUM)
BEGIN
	IF(@NUM % @I = 0)
	BEGIN
		SET @FLAG=0;
		BREAK;
	END
		SET @I=@I+1;
END

IF(@FLAG=1)
	PRINT(CAST(@NUM AS VARCHAR) +' IS PRIME!!')
ELSE
	PRINT(CAST(@NUM AS VARCHAR) +' IS NOT PRIME!!')

--9. Write a PL/ SQL program to reverse a string and display the reversed string.
DECLARE @STR VARCHAR(20)='BHAKTIBA SOLANKI', @REVERSE VARCHAR(20)

SET @REVERSE=REVERSE(@STR)
PRINT @REVERSE

--10. Write a PL/ SQL program to generate the Fibonacci series up to N number and display the series.
DECLARE @A INT=0,@B INT =1,@TEMP INT=0,@NUM INT =10,@I INT=0

WHILE(@I<=@NUM)
BEGIN
	PRINT @A
	SET @TEMP= @A + @B
	SET @A = @B
	SET @B = @TEMP 
	SET @I= @I+1
END
