--Homework requirement1/3

--Calculate the count of all grades in the system
SELECT COUNT(g.Grade) AS TotalGrades
FROM dbo.[Grade] AS g
GO

--Calculate the count of all grades per Teacher in the system
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Teacher] AS t ON g.TeacherID = t.ID
GROUP BY t.ID, t.FirstName, t.LastName
ORDER BY t.ID ASC
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.ID, t.FirstName, t.LastName, COUNT(g.Grade) AS TotalGrades
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Teacher] AS t ON g.TeacherID = t.ID
WHERE g.StudentID < 100
GROUP BY t.ID, t.FirstName, t.LastName
ORDER BY t.ID ASC
GO


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.ID, s.FirstName, s.LastName, MAX(g.Grade) AS MaxGrad, AVG(g.Grade) AS AvgGrade
FROM dbo.[Student] AS s
INNER JOIN dbo.[Grade] AS g ON g.StudentID = s.ID
GROUP BY s.ID, s.FirstName, s.LastName
ORDER BY s.ID ASC
GO