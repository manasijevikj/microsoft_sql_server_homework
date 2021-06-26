--Homework requirement2/2

--Declare scalar function (fn_FormatStudentName) for retrieving the Student
--description for specific StudentIdin the following format:

--StudentCardNumberwithout “sc-”
--“ –“
--First character  of student  FirstName
--“.”
--Student LastName

CREATE FUNCTION dbo.fn_FormatStudentName(@StudentId INT)
	RETURNS nvarchar(150)
	AS
	BEGIN		
		DECLARE @Result NVARCHAR(150)

			SELECT @Result = SUBSTRING(S.StudentCardNumber,4,5) +' - '+LEFT(S.FirstName,1)+'.'+S.LastName
			FROM dbo.[Student] AS S
			WHERE @StudentId = S.ID
			 
		RETURN @Result
	END
	GO

	SELECT *, [dbo].fn_FormatStudentName(5) AS Result
	FROM [dbo].[Student] AS S
	WHERE S.ID = 5
	GO

	DROP FUNCTION dbo.fn_FormatStudentName
	GO
