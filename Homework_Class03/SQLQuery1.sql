--Homework requirement1/3

--Calculate the count of all grades in the system
SELECT COUNT(g.Grade) AS TotalGrades
FROM Grade AS g
GO

--Calculate the count of all grades per Teacher in the system
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM Grade AS g
INNER JOIN Teacher AS t ON g.TeacherID = t.ID
GROUP BY t.ID, t.FirstName, t.LastName
ORDER BY t.ID ASC
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM Grade AS g
INNER JOIN Teacher AS t ON g.TeacherID = t.ID
WHERE g.StudentID < 100
GROUP BY t.ID, t.FirstName, t.LastName
ORDER BY t.ID ASC
GO


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.ID, s.FirstName, s.LastName, MAX(g.Grade) AS MaxGrad, AVG(g.Grade) AS AvgGrade
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.ID
GROUP BY s.ID, s.FirstName, s.LastName
ORDER BY s.ID ASC
GO




--Homework requirement2/3

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM Grade AS g
INNER JOIN Teacher AS t ON g.TeacherID = t.ID
GROUP BY t.ID, t.FirstName, t.LastName
HAVING COUNT(g.Grade) > '200'
ORDER BY COUNT(g.Grade) ASC
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
-- and filter teachers with more than 50 Grade count
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM Grade AS g
INNER JOIN Teacher AS t ON g.TeacherID = t.ID
WHERE g.StudentID < 100
GROUP BY t.ID, t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 50
ORDER BY COUNT(g.Grade) ASC
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system.
--Filter only records where Maximal Grade is equal to Average Grade
SELECT s.ID, s.FirstName, s.LastName,COUNT(g.Grade) AS GradesCount, MAX(g.Grade) AS MaxGrad, AVG(g.Grade) AS AvgGrade
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.ID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
ORDER BY s.ID ASC
GO

--List Student First Name and Last Name next to the other details from previous query
SELECT s.ID, CONCAT(s.FirstName,' ',s.LastName) AS FullName ,COUNT(g.Grade) AS GradesCount, MAX(g.Grade) AS MaxGrad, AVG(g.Grade) AS AvgGrade
FROM Student AS s
INNER JOIN Grade AS g ON g.StudentID = s.ID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
ORDER BY s.ID ASC
GO




--Homework requirement3/3

--Create new view (vv_StudentGrades) that will List all StudentIdsand count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT S.ID , COUNT(g.Grade) AS GradesCount
FROM Grade AS g
INNER JOIN [Student] AS S ON s.ID=g.StudentID
GROUP BY s.ID
GO
SELECT * FROM vv_StudentGrades
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT CONCAT (s.FirstName,' ', s.LastName) AS FullName , COUNT(g.Grade) AS GradesCount
FROM Grade AS g
INNER JOIN Student as s ON s.ID=g.StudentID
GROUP BY CONCAT (s.FirstName,' ', s.LastName)
GO
SELECT * FROM vv_StudentGrades

--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY [GradesCount] DESC
GO

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName)
-- and Count the courses he passed through the exam(Ispit)

