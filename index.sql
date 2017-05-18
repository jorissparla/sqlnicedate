DECLARE @d datetime
DECLARE @diff int
DECLARE @weekdiff int
DECLARE @timepart varchar(5)
DECLARE @rv varchar(30)



SET @d = DATEADD(dd,7, getdate())
SET @timepart=DATENAME(hh,@d)+':'+DATENAME(mi,@d)
SELECT 'datum'=@d



SELECT @diff=DATEDIFF(dd, GETDATE(), @d)
SELECT @weekdiff=DATEDIFF(wk, GETDATE(), @d)

PRINT @weekdiff

IF (@diff = 1) SET @rv = 'Tomorrow' 
IF (@diff = -1) SET @rv = 'Yesterday'
IF (@diff >1 AND @diff < 6) BEGIN
	SET @rv= 'Coming '+ DATENAME(dw,@d)
END 
IF (@diff >1 AND @diff < 6) BEGIN
	SET @rv= 'Coming '+ DATENAME(dw,@d)
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

SELECT 'Nice date'=@rv+' at '+ @timepart