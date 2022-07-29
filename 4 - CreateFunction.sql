/**
Create function
*/
CREATE FUNCTION AGE(@DateOfBirth AS DATE)
RETURNS INT
AS
BEGIN

DECLARE @Years AS INT
DECLARE @BirthdayDate AS DATE
DECLARE @Age AS INT

--Calculate difference in years
SET @Years = DATEDIFF(YY,@DateOfBirth,GETDATE())
--Add years to DateOfBirth
SET @BirthdayDate = DATEADD(YY,@Years,@DateOfBirth)
--Subtract a year if birthday is after today
SET @Age = @Years -

CASE
	WHEN @BirthdayDate>GETDATE() THEN 1
	ELSE 0
END

--Return the result

RETURN @Age

END

--DROP FUNCTION AGE
