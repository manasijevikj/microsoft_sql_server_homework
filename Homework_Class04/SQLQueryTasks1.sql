--Homework requirement1/2

--1
--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students  having FirstName  same as the variable

DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT * 
FROM dbo.[Student] AS S
WHERE S.FirstName = @FirstName
GO


--2
--Declare table variable that will contain StudentId, StudentNameand DateOfBirth
--Fill the  table variable with all Female  students
DECLARE @Students TABLE
(StudentId int not null, StudentName NVARCHAR(50), DateOfBirth DATE)

INSERT INTO @Students(StudentId,StudentName,DateOfBirth)
SELECT Id,FirstName,DateOfBirth
FROM Student
WHERE Gender='F'

SELECT * 
FROM @Students 
GO


--3
--Declare temp table that will contain LastNameand EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve  the students  from the  table which last name  is with 7 characters
CREATE TABLE #TempTable
(LastName nvarchar(100) null, EnrolledDate DATE);

INSERT INTO #TempTable
SELECT LastName,EnrolledDate
FROM Student
WHERE Gender='M' AND FirstName LIKE 'A%'

SELECT *
FROM #TempTable
WHERE LEN(LastName)=7
GO
DROP TABLE #TempTable
GO


--3
--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName  and LastNameare the same
SELECT *
FROM dbo.[Teacher] AS T
WHERE LEN(T.FirstName) = '5'
AND SUBSTRING(T.FirstName, 1, 3) = SUBSTRING(T.LastName, 1, 3)
GO