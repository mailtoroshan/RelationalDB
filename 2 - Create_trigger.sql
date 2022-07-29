/**
 Create trigger for populate audit table
*/
CREATE TRIGGER [dbo].[LOG_INSERT] ON [dbo].[patient_registration]
					FOR INSERT 
					AS 
	INSERT INTO [dbo].[audit_patient_registration]
           ([registration_id]
           ,[patient_id]
           ,[registration_datetime]
           ,[referral_doctor]
           ,[created_datetime]
           ,[created_by]
           ,[action]
           ,[logdate])
     SELECT
           [registration_id]
           ,[patient_id]
           ,[registration_datetime]
           ,[referral_doctor]
           ,[created_datetime]
           ,[created_by]
           ,'Insert'
           ,GETDATE() FROM INSERTED
GO

