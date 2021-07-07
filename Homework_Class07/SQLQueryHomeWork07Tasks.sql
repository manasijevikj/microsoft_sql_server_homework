--Homework requirement 1/1

--Add error handling on CreateGradeDetailprocedure
BEGIN TRY  
 
    EXEC dbo.[CreateGradeDetail] @GradeID='3', @AchievementTypeID = '2', @Points = '60', @MaxPoints = '100', @Date = '2006.12.19';  

END TRY  
BEGIN CATCH  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  

END CATCH;  
GO 


--Test the error handling by inserting not-existing values for AchievementTypeID
BEGIN TRY  
 
    EXEC dbo.[CreateGradeDetail] @GradeID='3', @AchievementTypeID = '-4', @Points = '60', @MaxPoints = '100', @Date = '2006.12.19';  

END TRY  
BEGIN CATCH  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  

END CATCH;  
GO 