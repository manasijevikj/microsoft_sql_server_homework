--Homework requirement3/3

--Create new view (vv_StudentGrades) that will List all StudentIdsand count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT S.ID , COUNT(g.Grade) AS GradesCount
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Student] AS S ON s.ID=g.StudentID
GROUP BY s.ID
GO
SELECT * FROM vv_StudentGrades
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT CONCAT (s.FirstName,' ', s.LastName) AS FullName , COUNT(g.Grade) AS GradesCount
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Student] as s ON s.ID=g.StudentID
GROUP BY CONCAT (s.FirstName,' ', s.LastName)
GO
SELECT * FROM vv_StudentGrades

--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY [GradesCount] DESC
GO

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName)
-- and Count the courses he passed through the exam(Ispit)
CREATE VIEW vv_StudentGradeDetails
AS
SELECT CONCAT(s.FirstName, ' ', s.LastName) AS FullName, COUNT(g.Grade) AS PassedCourses
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Student] AS s ON g.StudentID = s.ID
INNER JOIN dbo.[GradeDetails] AS gd ON g.ID = gd.GradeID
INNER JOIN dbo.[AchievementType] AS a ON gd.AchievementTypeID = a.ID
WHERE gd.AchievementPoints >= a.ParticipationRate
AND
a.Name = 'ispit'
GROUP BY s.FirstName, s.LastName
GO
SELECT * FROM vv_StudentGradeDetails
ORDER BY PassedCourses DESC
GO