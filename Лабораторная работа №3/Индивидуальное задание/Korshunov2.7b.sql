USE Volkov	
GO
CREATE TRIGGER Perevod ON Student
AFTER UPDATE
AS 
BEGIN
DECLARE @kod SMALLINT,@oldg VARCHAR(10), @newg VARCHAR (10)
SELECT @kod = (SELECT Id_Student FROM inserted)
SELECT @oldg = (SELECT NameGroup FROM deleted)
SELECT @newg = (SELECT NameGroup FROM inserted)
INSERT INTO dbo.JournalOfTransfer VALUES(@kod, @oldg, @newg, GETDATE())
END
GO


UPDATE Student SET NameGroup = 'À-13-10' WHERE NameGroup = 'À-13-01'