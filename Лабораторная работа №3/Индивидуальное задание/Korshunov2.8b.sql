USE Volkov
GO
ALTER TRIGGER ChangeStip ON Student
INSTEAD OF UPDATE
AS
BEGIN
DECLARE @c INT
DECLARE @olds INT, @news INT, @raz INT, @max INT
SELECT @c = COUNT(*) FROM inserted
SELECT @olds = Stip FROM deleted
SELECT @news = Stip FROM inserted
IF @c = 1
	BEGIN
	IF @olds IS NOT NULL AND @news IS NOT NULL
		BEGIN 
		SET @max = @olds / 100 * 90
		IF @news >= @max
			UPDATE STUDENT SET Stip = (SELECT Stip FROM inserted) WHERE Id_Student = (SELECT id_student FROM inserted) 
		ELSE
			UPDATE STUDENT SET Stip = @max WHERE Id_Student = (SELECT id_student FROM INSERTED)
		END
	ELSE
		UPDATE STUDENT SET Stip = (SELECT Stip FROM inserted) WHERE Id_Student = (SELECT id_student FROM inserted) 
	END		
END
