USE Volkov
DECLARE KolvoDvoek CURSOR LOCAL FORWARD_ONLY STATIC
	FOR SELECT COUNT(*) FROM Exam WHERE Mark<25 AS KD, Student.FIO, Student.NameGroup
	JOIN STUDENT ON Exam.Id_student = Student.Id_Student
	Group BY Student.Name Group
DECLARE @ime VARCHAR (50), @grr VARCHAR(50), @ke SMALLINT, @c SMALLINT
SET @c = 0
Open KolvoDvoek
DECLARE @bgr TABLE (bgr SMALLINT)
FETCH NEXT FROM KolvoDvoek INTO @ime, @grr, @ke
WHILE @@FETCH_STATUS = 0
BEGIN
	IF EXISTS (SELECT * FROM @bgr WHERE bgr = @grr)
		Begin
			Print CAST(@c AS VARCHAR(2)) + CAST(@ime AS VARCHAR(2)) + CAST(@ke AS VARCHAR(2)) + 'двоек'
			SET @c = @c + 1 
		END
	ELSE 
		BEGIN
			SET @c = 1
			Print 'Группа ' + CAST(@grr AS VARCHAR(2))
		END
END
CLOSE KolvoDvoek
DEALLOCATE KolvoDvoek