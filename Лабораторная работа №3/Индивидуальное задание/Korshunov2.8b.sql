USE Volkov
GO
CREATE TRIGGER ChangeStip ON Student
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
			INSERT INTO Student SELECT * FROM inserted
		ELSE
			UPDATE STUDENT SET Stip = @max WHERE Id_Student = (SELECT id_student FROM INSERTED)
		END
	ELSE
		INSERT INTO Student SELECT * FROM inserted
	END		
END