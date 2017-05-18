# niceDate()
A *SQL Server* function that with a given input, provides a 'Nice date' 😊😊😊

## usage

`SELECT dbo.niceDate(DATEADD(dd,12, GETDATE()))`

returns e.g.

`In 1 week and 5 days, at 15:28`

## query
`SELECT getdate(),dbo.niceDate('2017-05-18 00:50'), `

	`dbo.niceDate('2017-05-17 00:50'),`
  
	`dbo.niceDate('2017-05-18 22:50'),`
  
	`dbo.niceDate('2017-05-22 22:50'),`
  
	`dbo.niceDate('2017-05-27 22:50')`
  
  
## results
`2017-05-18 22:28:04.757`	

`Today, 21 hours and 38 minutes ago	`

`Yesterday at 00:50	`

`Today, in 21 minutes` 	

`Coming Monday at 22:50	`

`In 1 week and 2 days, at 22:50`
