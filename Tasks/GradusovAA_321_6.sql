CREATE VIEW vw_BooksAuthorsGenres
AS
SELECT 
    B.ID_Book,
    B.Title AS BookTitle,
    A.Full_Name AS AuthorName,
    G.Title AS GenreTitle,
    B.Native_Language,
    B.Date_Of_Publishing
FROM 
    Books B
JOIN 
    Authors A ON B.ID_Author = A.ID_Author
JOIN 
    Genres G ON B.ID_Genre = G.ID_Genre;
GO

-- Проверка
SELECT * FROM vw_BooksAuthorsGenres;

CREATE VIEW vw_ReadersLibraries
AS
SELECT 
    R.ID_Reader,
    R.Full_Name AS ReaderName,
    R.Phone_Number,
    R.Date_Of_Birth,
    L.Title AS LibraryName,
    L.Adress
FROM 
    Reader R
JOIN 
    Libraries L ON R.ID_Library = L.ID_Library;
GO

-- Проверка
SELECT * FROM vw_ReadersLibraries;

CREATE VIEW vw_BooksInLibraries
AS
SELECT 
    BE.ID_Books_Example,
    B.Title AS BookTitle,
    BE.Amount_Of_Pages,
    BE.Type_Of_Paper,
    BE.Type_Of_Binding,
    P.Title AS PublishingHouseTitle,
    L.Title AS LibraryName
FROM 
    Books_Example BE
JOIN 
    Books B ON BE.ID_Book = B.ID_Book
JOIN 
    Publishing_Houses P ON BE.ID_Publishing_House = P.ID_Publishing_House
JOIN 
    Libraries L ON BE.ID_Library = L.ID_Library;
GO

-- Проверка
SELECT * FROM vw_BooksInLibraries;

EXEC sp_helptext 'vw_BooksAuthorsGenres';

CREATE VIEW vw_EncryptedBooksAuthorsGenres
WITH ENCRYPTION
AS
SELECT 
    B.ID_Book,
    B.Title AS BookTitle,
    A.Full_Name AS AuthorName,
    G.Title AS GenreTitle,
    B.Native_Language,
    B.Date_Of_Publishing
FROM 
    Books B
JOIN 
    Authors A ON B.ID_Author = A.ID_Author
JOIN 
    Genres G ON B.ID_Genre = G.ID_Genre;
GO

-- Попытка просмотра зашифрованного кода
EXEC sp_helptext 'vw_EncryptedBooksAuthorsGenres';

CREATE VIEW vw_UpdateBooks
AS
SELECT 
    ID_Book,
    Title,
    Native_Language,
    Date_Of_Publishing
FROM 
    Books
WHERE 
    Native_Language = 'Русский'
WITH CHECK OPTION;
GO

-- Вставка данных через обновляемое представление
INSERT INTO vw_UpdateBooks (Title, Native_Language, Date_Of_Publishing)
VALUES ('Новая Русская Книга', 'Русский', '2024-05-01');
GO

-- Проверка обновленного представления
SELECT * FROM vw_UpdateBooks;

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON;
GO

CREATE VIEW vw_IndexedBooksAuthors
WITH SCHEMABINDING
AS
SELECT 
    B.ID_Book,
    B.Title AS BookTitle,
    A.Full_Name AS AuthorName,
    B.Date_Of_Publishing
FROM 
    dbo.Books B
JOIN 
    dbo.Authors A ON B.ID_Author = A.ID_Author;
GO

CREATE UNIQUE CLUSTERED INDEX IX_IndexedBooksAuthors_ID_Book
ON vw_IndexedBooksAuthors (ID_Book);
GO

-- Запрос без использования индексированного представления
SELECT 
    B.ID_Book,
    B.Title AS BookTitle,
    A.Full_Name AS AuthorName,
    B.Date_Of_Publishing
FROM 
    Books B
JOIN 
    Authors A ON B.ID_Author = A.ID_Author;
GO

-- Запрос с использованием индексированного представления
SELECT * FROM vw_IndexedBooksAuthors WITH (NOEXPAND);
GO
