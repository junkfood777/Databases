GO
CREATE TRIGGER trg_1
ON Books
FOR INSERT
AS
BEGIN
    DECLARE @ID_Author INT
    SELECT @ID_Author = ID_Author FROM inserted

    IF (SELECT Count_Of_Published_Books FROM Authors WHERE ID_Author = @ID_Author) < 1
    BEGIN
        RAISERROR('Автор должен иметь хотя бы одну опубликованную книгу.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO
SELECT * FROM Books
GO
DROP TRIGGER trg_1
SELECT * FROM Books
--GO

--CREATE TRIGGER trg_2
--ON Books_Example
--FOR INSERT
--AS
--BEGIN
--    DECLARE @ID_Library INT
--    SELECT @ID_Library = ID_Library FROM inserted

--    IF NOT EXISTS (SELECT 1 FROM Libraries WHERE ID_Library = @ID_Library)
--    BEGIN
--        RAISERROR('Библиотека не существует.', 16, 1)
--        ROLLBACK TRANSACTION
--    END
--END
--GO
--DROP TRIGGER trg_2
--CREATE TRIGGER trg_3
--ON Authors
--FOR UPDATE
--AS
--BEGIN
--    IF UPDATE(Count_Of_Published_Books)
--    BEGIN
--        DECLARE @NewCount INT
--        SELECT @NewCount = Count_Of_Published_Books FROM inserted

--        IF @NewCount < 0
--        BEGIN
--            RAISERROR('Количество опубликованных книг не может быть отрицательным.', 16, 1)
--            ROLLBACK TRANSACTION
--        END
--    END
--END

--GO
--DROP TRIGGER trg_3
--GO
--CREATE TRIGGER trg_4
--ON Books_Example
--FOR UPDATE
--AS
--BEGIN
--    IF UPDATE(Amount_Of_Pages)
--    BEGIN
--        DECLARE @ID_Books_Example INT, @NewPages INT
--        SELECT @ID_Books_Example = ID_Books_Example, @NewPages = Amount_Of_Pages FROM inserted

--        IF @NewPages <= 0
--        BEGIN
--            RAISERROR('Количество страниц должно быть положительным.', 16, 1)
--            ROLLBACK TRANSACTION
--        END
--    END
--END

--GO
--DROP TRIGGER trg_4
--GO
--CREATE TRIGGER trg_5
--ON Books
--FOR DELETE
--AS
--BEGIN
--    DECLARE @ID_Book INT
--    SELECT @ID_Book = ID_Book FROM deleted

--    IF EXISTS (SELECT 1 FROM Books_Example WHERE ID_Book = @ID_Book)
--    BEGIN
--        RAISERROR('Невозможно удалить книгу, так как существуют связанные экземпляры.', 16, 1)
--        ROLLBACK TRANSACTION
--    END
--END

--GO
--DROP TRIGGER trg_5
--GO
--CREATE TRIGGER trg_6
--ON Libraries
--FOR DELETE
--AS
--BEGIN
--    DECLARE @ID_Library INT
--    SELECT @ID_Library = ID_Library FROM deleted

--    DELETE FROM Reader WHERE ID_Library = @ID_Library
--    DELETE FROM Books_Example WHERE ID_Library = @ID_Library
--END

--GO
--DROP TRIGGER trg_6
--GO
--CREATE TRIGGER trg_7
--ON Books_Example
--INSTEAD OF INSERT
--AS
--BEGIN
--    DECLARE @Amount_Of_Pages INT, @Type_Of_Paper NVARCHAR(30), @Type_Of_Binding NVARCHAR(30), @ID_Book INT, @ID_Publishing_House INT, @ID_Library INT
--    SELECT @Amount_Of_Pages = Amount_Of_Pages, @Type_Of_Paper = Type_Of_Paper, @Type_Of_Binding = Type_Of_Binding, @ID_Book = ID_Book, @ID_Publishing_House = ID_Publishing_House, @ID_Library = ID_Library FROM inserted

--    IF @Amount_Of_Pages <= 0
--    BEGIN
--        RAISERROR('Количество страниц должно быть положительным.', 16, 1)
--        RETURN
--    END

--    INSERT INTO Books_Example (Amount_Of_Pages, Type_Of_Paper, Type_Of_Binding, ID_Book, ID_Publishing_House, ID_Library)
--    VALUES (@Amount_Of_Pages, @Type_Of_Paper, @Type_Of_Binding, @ID_Book, @ID_Publishing_House, @ID_Library)
--END

--GO
--DROP TRIGGER trg_7
--GO
--CREATE TRIGGER trg_8
--ON Reader
--INSTEAD OF UPDATE
--AS
--BEGIN
--    DECLARE @ID_Reader INT, @NewFullName NVARCHAR(50), @NewPhoneNumber NVARCHAR(50), @NewDateOfBirth DATE, @NewID_Library INT
--    SELECT @ID_Reader = ID_Reader, @NewFullName = Full_Name, @NewPhoneNumber = Phone_Number, @NewDateOfBirth = Date_Of_Birth, @NewID_Library = ID_Library FROM inserted

--    IF LEFT(@NewPhoneNumber, 1) <> '8'
--    BEGIN
--        RAISERROR('Неверный формат номера телефона. Номер должен содержать 11 цифр и начинаться с "8".', 16, 1)
--        RETURN
--    END

--    UPDATE Reader
--    SET Full_Name = @NewFullName, Phone_Number = @NewPhoneNumber, Date_Of_Birth = @NewDateOfBirth, ID_Library = @NewID_Library
--    WHERE ID_Reader = @ID_Reader
--END

--GO
--DROP TRIGGER trg_8
--GO
--CREATE TRIGGER trg_9
--ON Publishing_Houses
--INSTEAD OF DELETE
--AS
--BEGIN
--    DECLARE @ID_Publishing_House INT
--    SELECT @ID_Publishing_House = ID_Publishing_House FROM deleted

--    IF EXISTS (SELECT 1 FROM Books_Example WHERE ID_Publishing_House = @ID_Publishing_House)
--    BEGIN
--        RAISERROR('Невозможно удалить издательство, так как существуют связанные экземпляры книг.', 16, 1)
--        RETURN
--    END

--    DELETE FROM Publishing_Houses WHERE ID_Publishing_House = @ID_Publishing_House
--END
