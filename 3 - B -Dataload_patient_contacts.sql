USE [RelationalDbEssentials]
GO

DECLARE @Id INT
DECLARE @patientId INT
DECLARE @contactCount INT

SET @Id =1
SET @patientId = 1


WHILE @patientId <= 100000
BEGIN 
	SET @contactCount = 1
	WHILE @contactCount < 4
	BEGIN 
		INSERT INTO [dbo].[patient_contacts]
			   ([contact_id]
			   ,[patient_id]
			   ,[contact_type]
			   ,[contact_no])
		 VALUES
			   (@Id
			   ,@patientId
			   , CASE WHEN @contactCount = 1 THEN 'Home Phone' WHEN @contactCount = 2 THEN 'Mobile' WHEN @contactCount = 3 THEN 'Office' END
			   , CASE WHEN @contactCount = 1 THEN '0112789789' WHEN @contactCount = 2 THEN '0773123456' WHEN @contactCount = 3 THEN '0112123456' END)

		SET @Id = @Id + 1
		SET @contactCount = @contactCount +1
	END
	SET @patientId = @patientId + 1
END
GO

-- SELECT * FROM [patient_contacts]
-- DELETE FROM [patient_contacts]
