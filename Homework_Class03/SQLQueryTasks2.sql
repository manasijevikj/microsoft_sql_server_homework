--Homework requirement2/3

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Teacher] AS t ON g.TeacherID = t.ID
GROUP BY t.ID, t.FirstName, t.LastName
HAVING COUNT(g.Grade) > '200'
ORDER BY COUNT(g.Grade) ASC
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
-- and filter teachers with more than 50 Grade count
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Teacher] AS t ON g.TeacherID = t.ID
WHERE g.StudentID < 100
GROUP BY t.ID, t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 50
ORDER BY COUNT(g.Grade) ASC
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system.
--Filter only records where Maximal Grade is equal to Average Grade
SELECT s.ID, s.FirstName, s.LastName,COUNT(g.Grade) AS GradesCount, MAX(g.Grade) AS MaxGrad, AVG(g.Grade) AS AvgGrade
FROM dbo.[Student] AS s
INNER JOIN dbo.[Grade] AS g ON g.StudentID = s.ID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
ORDER BY s.ID ASC
GO

--List Student First Name and Last Name next to the other details from previous query
SELECT s.ID, CONCAT(s.FirstName,' ',s.LastName) AS FullName ,COUNT(g.Grade) AS GradesCount, MAX(g.Grade) AS MaxGrad, AVG(g.Grade) AS AvgGrade
FROM dbo.[Student] AS s
INNER JOIN dbo.[Grade] AS g ON g.StudentID = s.ID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
ORDER BY s.ID ASC
GO