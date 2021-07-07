--Homework requirement 1a/2

--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details)
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and
--Teacher on input (regardless the Course)

CREATE PROCEDURE dbo.CreateGrade (@StudentId INT, @CourseId INT, @TeacherId INT, @Grade INT, @CreateDate DATE)
AS
BEGIN
	INSERT INTO dbo.[Grade] ([StudentID], [CourseId], [TeacherID], [Grade], [CreatedDate])
	VALUES (@StudentId, @CourseId, @TeacherId, @Grade, @CreateDate)

	SELECT COUNT(*) AS TotalNumberOfGrades
	FROM dbo.[Grade] G
	WHERE StudentId = @StudentId

	SELECT MAX(G.Grade) AS MaxGrade
	FROM dbo.[Grade] G
	WHERE StudentId = @StudentId
	AND
	TeacherID = @TeacherID
END
GO

EXEC dbo.CreateGrade @Grade='7', @CreateDate = '2006.12.19', @StudentId = '1',  @CourseID='1', @TeacherId = '1'
SELECT *
FROM dbo.Grade AS G
WHERE G.StudentId = 1 AND G.TeacherId = 1
GO


