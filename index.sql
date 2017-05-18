

ALTER FUNCTION [dbo].niceDate
(
    @d datetime
)
RETURNS VARCHAR(50)
AS
BEGIN

   DECLARE @diff int
DECLARE @weekdiff int
DECLARE @timepart varchar(5)
DECLARE @rv varchar(30)



SET @timepart=FORMAT(DATEPART(hh,@d), '00')+':'+FORMAT(DATEPART(mi,@d), '00')


SELECT @diff=DATEDIFF(dd, GETDATE(), @d)
SELECT @weekdiff=DATEDIFF(wk, GETDATE(), @d)

IF (@diff = 0) SET @rv = 'Today'
IF (@diff = 1) SET @rv = 'Tomorrow' 
IF (@diff = -1) SET @rv = 'Yesterday'
IF (@diff >1 AND @diff < 6) BEGIN
	SET @rv= 'Coming '+ DATENAME(dw,@d)
END 
IF (@diff >1 AND @diff <= 6) BEGIN
	SET @rv= 'Coming '+ DATENAME(dw,@d)
END 


IF (@diff >=-6 AND @diff < -1) BEGIN
	SET @rv= 'Last '+ DATENAME(dw,@d)
END 



IF (@diff >6) BEGIN
	IF (@diff/7 >= 2) BEGIN
		SET @rv = 'In '+CONVERT(varchar(2), @diff/7)+' Weeks '
	END
	
	ELSE BEGIn
		SET @rv = 'In 1 week '
	END 
	SET @rv=@rv + 'and '+CONVERT(varchar(2), @diff %7) +' days,' 
END

IF (@diff <-6) BEGIN
	IF (@diff/7 <= -2) BEGIN
		SET @rv = CONVERT(varchar(2), -1*(@diff/7))+' Weeks '
	END
	
	ELSE BEGIn
		SET @rv = '1 week '
	END 
	SET @rv=@rv + 'and '+CONVERT(varchar(2), -1*(@diff % 7)) +' days ago,' 
END



RETURN  @rv+' at '+ @timepart

END
go
DECLARE @d DATETIME
SET @d=DATEADD(mi, -18, getdate())
SELECT dbo.niceDate(@d)
SELECT dbo.niceDate('2017-05-24')

SELECT DATEDIFF(dd, GETDATE(),'2017-05-24')

