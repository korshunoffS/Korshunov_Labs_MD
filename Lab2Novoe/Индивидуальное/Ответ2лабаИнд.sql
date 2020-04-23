CREATE FUNCTION DateOfExam
(
	@grr VARCHAR(50), @suu VARCHAR(50)
)
RETURNS DATE
AS
BEGIN
	DECLARE @dox DATE
	SELECT @dox = DataExamena FROM dbo.ExCount(@grr, @suu) WHERE KolvoStudentov = (SELECT MAX(KolvoStudentov) FROM dbo.ExCount(@grr, @suu))
	RETURN @dox
END 