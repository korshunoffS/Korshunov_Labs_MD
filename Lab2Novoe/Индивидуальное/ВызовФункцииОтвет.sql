DECLARE @mess VARCHAR (50)
SET @mess = '�������������� ���� �������� - ' + CAST(dbo.DateOfExam('�-12-01','�������') AS VARCHAR(50))
PRINT @mess