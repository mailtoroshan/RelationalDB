USE [RelationalDbEssentials]
GO

DECLARE @Id INT
DECLARE @dob DATE 

SET @Id = 1
SET @dob = ('1960-01-01')

WHILE @Id <= 1000000
BEGIN 
   
 	INSERT INTO [dbo].[patient_demographics]
           ([patient_id]
           ,[patient_firstname]
           ,[patient_lastname]
           ,[patient_middlename]
           ,[patient_dob]
           ,[patient_gender]
           ,[created_datetime]
           ,[created_by])
     VALUES
           (@Id
           ,'firstname' + CAST(@Id as nvarchar(10))
           ,'lastname' + CAST(@Id as nvarchar(10))
           ,NULL
           ,@dob
           ,CASE WHEN (@Id % 2 > 0) THEN 'MALE' ELSE 'FEMALE' END
           ,GETDATE()
           ,'DATALOAD')

   PRINT @Id
   SET @Id = @Id + 1
   IF (@Id % 10000 = 0)
	SET @dob = ('1960-10-25')
	ELSE
	SET @dob = (SELECT DATEADD(DAY, 1, @dob))
END


--SELECT * FROM patient_demographics

--DELETE FROM patient_demographics