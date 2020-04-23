USE Volkov
Go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION dbo.ExCount
(
	@gr VARCHAR(50), @su VARCHAR (50)
)
RETURNS TABLE
AS
RETURN 
(
	SELECT EXAM_DATE AS DataExamena, COUNT (*) AS [KolvoStudentov] FROM EXAM JOIN STUDENT ON Student.Id_Student = Exam.Id_Student
	WHERE Exam.Subject = @su AND Student.NameGroup = @gr
	GROUP BY Exam_Date
)

