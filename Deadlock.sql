/**
Sample Deadlock creation script

*/

BEGIN TRAN

UPDATE patient_demographics SET patient_firstname = 'Mahesh' WHERE patient_id = 1

UPDATE patient_contacts SET contact_no = '0773321321' WHERE patient_id = 1 AND contact_type='Mobile'

--COMMIT TRAN

ROLLBACK TRAN



BEGIN TRAN

UPDATE patient_contacts SET contact_no = '0773123123' WHERE patient_id = 1 AND contact_type='Mobile'

UPDATE patient_demographics SET patient_firstname = 'Nilesh' WHERE patient_id = 1

--COMMIT TRAN

ROLLBACK TRAN