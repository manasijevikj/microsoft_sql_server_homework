--Create multi-statement table value function that for specific Teacher and
--Course will return list of students (FirstName, LastName) who passed the exam,
--together with Grade and CreatedDate

DROP FUNCTION IF EXISTS dbo.fn_WhoPassedTheExam;
GO

CREATE FUNCTION dbo.fn_WhoPassedTheExam (@TeacherID INT,@CourseID INT)
RETURNS @output TABLE (FullName nvarchar(100),Grade INT, CreatedDate DATE)
AS
BEGIN
INSERT INTO @Output
SELECT s.FirstName +' '+ s.LastName AS FullName, g.Grade AS Grade, g.CreatedDate AS CreatedDate
FROM dbo.[Grade] AS g
INNER JOIN dbo.[Student] AS s ON s.ID = g.StudentID
INNER JOIN dbo.[GradeDetails] AS gd ON gd.GradeID = g.ID
INNER JOIN dbo.[AchievementType] AS a ON a.ID = gd.AchievementTypeID
WHERE gd.AchievementPoints> 50 AND  a.Name='ispit'
AND g.TeacherID = @TeacherID
AND g.CourseID = @CourseID
RETURN
END
GO

DECLARE @TeacherId INT = 1
DECLARE @CourseId INT = 1

SELECT * FROM dbo.fn_WhoPassedTheExam(@TeacherId,@CourseId)

