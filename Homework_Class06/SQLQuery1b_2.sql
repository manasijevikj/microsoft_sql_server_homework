--Homework requirement 1b/2

--Create new procedure called CreateGradeDetail
--Procedure should add details for specific Grade
--(new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints
--calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade


CREATE PROCEDURE dbo.CreateGradeDetail (@GradeID INT, @AchievementTypeID INT, @Points INT, @MaxPoints INT, @Date DATE)
AS
BEGIN

	INSERT INTO dbo.GradeDetails([GradeID], [AchievementTypeID], [AchievementPoints], [AchievementMaxPoints], [AchievementDate])
	VALUES (@GradeID, @AchievementTypeID, @Points, @MaxPoints, @Date)

	SELECT G.Grade, SUM(GD.AchievementPoints/GD.AchievementMaxPoints*A.ParticipationRate) AS SumOfGradePoints
	FROM dbo.[GradeDetails] AS GD
	INNER JOIN dbo.[AchievementType] AS A ON A.ID = GD.AchievementTypeID
	INNER JOIN dbo.[Grade] AS G ON G.ID = GD.GradeID
	WHERE GD.GradeID = @GradeID
	GROUP BY G.Grade
END
GO

EXEC dbo.CreateGradeDetail @GradeID='3', @AchievementTypeID = '2', @Points = '60', @MaxPoints = '100', @Date = '2006.12.19'
SELECT * FROM Grade
WHERE ID=3