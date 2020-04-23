USE VOLKOV	
DECLARE @fio VARCHAR(50), @bt DATE
DECLARE @cur_date DATE
DECLARE dbc CURSOR LOCAL FORWARD_ONLY STATIC
FOR SELECT FIO, BIRTHDAY 
FROM Student

DECLARE @i VARCHAR(50), @ch SMALLINT
DECLARE @mess VARCHAR(50)
SET @cur_date = '02/07/1998'
OPEN dbc
	SET @ch = 0
	FETCH NEXT FROM dbc INTO @fio, @bt
	WHILE @@FETCH_STATUS = 0
BEGIN
	IF @bt IS NULL 
		PRINT 'Встретился студент с неуказанной датой рождения'
	IF @bt BETWEEN DATEADD(MONTH,-1, @cur_date) AND DATEADD(MONTH,1,@cur_date)
	BEGIN
		SET @ch = @ch + 1
		SET @mess = @fio+'    '+CAST(@bt AS VARCHAR(11))
		PRINT @mess
	END
	FETCH NEXT FROM dbc INTO @fio, @bt
END
SET @i = 'Найдено ' + CAST(@ch AS VARCHAR(2)) + ' студентов'
Print @i 
CLOSE dbc 
DEALLOCATE dbc