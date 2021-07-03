--Homework requirement 1a/2

--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details)
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and
--Teacher on input (regardless the Course)

CREATE PROCEDURE dbo.CreateGrade (@StudentId INT, @TeacherId INT)
AS
BEGIN

		INSERT TO