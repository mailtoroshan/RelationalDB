USE [RelationalDbEssentials]
GO

DECLARE @registrationId INT
DECLARE @patientId INT
DECLARE @registrationTime DATETIME
DECLARE @registrationCount INT

SET @registrationId =1 -- 1001
SET @patientId = 1 -- 1001
SET @registrationTime = ('2022-07-20 07:00:00.000')



WHILE @patientId <= 1000 -- 1001
BEGIN 
	SET @registrationCount = 1
	
	WHILE @registrationCount < 2 -- 3
	BEGIN 
		

	INSERT INTO [dbo].[patient_registration]
           ([registration_id]
           ,[patient_id]
           ,[registration_datetime]
           ,[referral_doctor]
           ,[created_datetime]
           ,[created_by])
     VALUES
           (@registrationId
           ,@patientId
           ,@registrationTime
           ,NULL
           ,GETDATE()
           ,'DATALOAD')

		   
		SET @registrationId = @registrationId + 1
		SET @registrationCount = @registrationCount +1
		SET @registrationTime = (SELECT DATEADD(HOUR, 1, @registrationTime))
	END
	SET @patientId = @patientId + 1
END
GO

-- SELECT * FROM [patient_registration]
-- DELETE FROM [patient_registration]

