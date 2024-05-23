CREATE PROCEDURE AddNewBook
    @AuthorName NVARCHAR(50),
    @AuthorDOB DATE,
    @AuthorPOB NVARCHAR(50),
    @GenreTitle NVARCHAR(30),
    @GenreDescr NVARCHAR(100),
    @BookTitle NVARCHAR(50),
    @NativeLanguage NVARCHAR(30),
    @DateOfPublishing DATE
AS
BEGIN
    DECLARE @AuthorID INT, @GenreID INT;

    -- Проверка и добавление автора, если он не существует
    IF NOT EXISTS (SELECT 1 FROM Authors WHERE Full_Name = @AuthorName)
    BEGIN
        INSERT INTO Authors (Full_Name, Date_Of_Birth, Place_Of_Birth, Count_Of_Published_Books)
        VALUES (@AuthorName, @AuthorDOB, @AuthorPOB, 0);
    END

    -- Получение ID автора
    SELECT @AuthorID = ID_Author FROM Authors WHERE Full_Name = @AuthorName;

    -- Проверка и добавление жанра, если он не существует
    IF NOT EXISTS (SELECT 1 FROM Genres WHERE Title = @GenreTitle)
    BEGIN
        INSERT INTO Genres (Title, Descr) VALUES (@GenreTitle, @GenreDescr);
    END

    -- Получение ID жанра
    SELECT @GenreID = ID_Genre FROM Genres WHERE Title = @GenreTitle;

    -- Добавление книги
    INSERT INTO Books (ID_Author, ID_Genre, Title, Native_Language, Date_Of_Publishing)
    VALUES (@AuthorID, @GenreID, @BookTitle, @NativeLanguage, @DateOfPublishing);
END;
GO

CREATE PROCEDURE UpdateReaderInfo
    @ReaderID INT,
    @FullName NVARCHAR(50),
    @PhoneNumber NVARCHAR(50),
    @DateOfBirth DATE,
    @LibraryID INT
AS
BEGIN
    UPDATE Reader
    SET Full_Name = @FullName,
        Phone_Number = @PhoneNumber,
        Date_Of_Birth = @DateOfBirth,
        ID_Library = @LibraryID
    WHERE ID_Reader = @ReaderID;
END;
GO

CREATE PROCEDURE IssueBook
    @ReaderID INT,
    @BookExampleID INT,
    @DateOfTaking DATE
AS
BEGIN
    DECLARE @BookJournalID INT;

    -- Добавление записи в журнал
    INSERT INTO Book_Journal (ID_Reader, ID_Books_Example, Date_Of_Taking)
    VALUES (@ReaderID, @BookExampleID, @DateOfTaking);

    -- Установка даты возврата по умолчанию (например, через 30 дней)
    SET @BookJournalID = SCOPE_IDENTITY();
    UPDATE Book_Journal
    SET Date_Of_Bringing_Back = DATEADD(DAY, 30, @DateOfTaking)
    WHERE ID_Record = @BookJournalID;
END;
GO

CREATE PROCEDURE ReturnBook
    @ReaderID INT,
    @BookExampleID INT,
    @DateOfBringingBack DATE
AS
BEGIN
    -- Обновление даты возврата
    UPDATE Book_Journal
    SET Date_Of_Bringing_Back = @DateOfBringingBack
    WHERE ID_Reader = @ReaderID AND ID_Books_Example = @BookExampleID
      AND Date_Of_Bringing_Back IS NULL;
END;
GO

CREATE PROCEDURE GetBooksByGenre
    @GenreTitle NVARCHAR(30)
AS
BEGIN
    SELECT 
        B.Title AS BookTitle,
        A.Full_Name AS AuthorName,
        B.Native_Language,
        B.Date_Of_Publishing
    FROM 
        Books B
    JOIN 
        Authors A ON B.ID_Author = A.ID_Author
    JOIN 
        Genres G ON B.ID_Genre = G.ID_Genre
    WHERE 
        G.Title = @GenreTitle;
END;
GO

