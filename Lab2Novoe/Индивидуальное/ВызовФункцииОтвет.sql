DECLARE @mess VARCHAR (50)
SET @mess = 'Предполагаемая дата экзамена - ' + CAST(dbo.DateOfExam('А-12-01','Графика') AS VARCHAR(50))
PRINT @mess