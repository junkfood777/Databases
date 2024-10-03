--CREATE PROCEDURE CalculateTotalBooksInLibrary
--    @ID_Library INT
--AS
--BEGIN
--    DECLARE @TotalBooks INT;
    
--    SELECT @TotalBooks = COUNT(*)
--    FROM Books_Example be
--    WHERE be.ID_Library = @ID_Library;
    
--    SELECT @TotalBooks AS Total_Books;
--END;
--GO

--EXEC CalculateTotalBooksInLibrary @ID_Library = 1;
--GO



--CREATE PROCEDURE GetReaderBorrowingHistory
--    @ID_Reader INT
--AS
--BEGIN
--    SET NOCOUNT ON;

--    IF NOT EXISTS (SELECT 1 FROM Reader WHERE ID_Reader = @ID_Reader)
--    BEGIN
--        RAISERROR('Ошибка: Читатель с указанным ID не найден.', 16, 1);
--        RETURN;
--    END

--    SELECT 
--        bj.ID_Record,
--        b.Title AS Book_Title,
--        ph.Title AS Publishing_House,
--        bj.Date_Of_Taking,
--        bj.Date_Of_Bringing_Back
--    FROM 
----        Book_Journal bj
----    JOIN Books_Example be ON bj.ID_Books_Example = be.ID_Books_Example
----    JOIN Books b ON be.ID_Book = b.ID_Book
----    JOIN Publishing_Houses ph ON be.ID_Publishing_House = ph.ID_Publishing_House
----    WHERE 
----        bj.ID_Reader = @ID_Reader
----    ORDER BY 
----        bj.Date_Of_Taking DESC;
----END;
----GO



--INSERT INTO Book_Journal(ID_Reader, ID_Books_Example, Date_Of_Taking, Date_Of_Bringing_Back)
--VALUES 	(1, 3, '2024.01.02','2024.02.28'),
--		(1, 2, '2024.02.25','2024.03.25'),
--		(1, 1, '2023.11.27','2024.02.15'),
--		(1, 1605, '2024.02.25','2024.03.25'),
--		(1, 5258, '2023.11.27','2024.02.15'),
--		(1, 7119, '2024.02.25','2024.03.25'),
--		(1, 8102, '2023.11.27','2024.02.15');
--		--(1, 17, '2024.02.25','2024.03.25'),
--		--(1, 19, '2023.11.27','2024.02.15'),
--		--(1, 56, '2024.02.25','2024.03.25'),
--		--(1, 33, '2023.11.27','2024.02.15');

--EXEC GetReaderBorrowingHistory @ID_Reader = 1;
--GO




--CREATE PROCEDURE AssignBookToLibrary
--    @ID_Books_Example INT,
--    @Library_Title NVARCHAR(30),
--    @Library_Address NVARCHAR(50)
--AS
--BEGIN
--    SET NOCOUNT ON;

--    DECLARE @ID_Library INT;

--    SELECT @ID_Library = ID_Library
--    FROM Libraries
--    WHERE Title = @Library_Title AND Adress = @Library_Address;

--    IF @ID_Library IS NULL
--    BEGIN
--        RAISERROR('Ошибка: Библиотека с указанным названием и адресом не найдена.', 16, 1);
--        RETURN;
--    END

--    IF NOT EXISTS (SELECT 1 FROM Books_Example WHERE ID_Books_Example = @ID_Books_Example)
--    BEGIN
--        RAISERROR('Ошибка: Экземпляр книги с указанным ID не найден.', 16, 1);
--        RETURN;
--    END
--    IF EXISTS (SELECT 1 FROM Books_Example WHERE ID_Books_Example = @ID_Books_Example AND ID_Library = @ID_Library)
--    BEGIN
--        RAISERROR('Ошибка: Экземпляр книги уже назначен этой библиотеке.', 16, 1);
--        RETURN;
--    END

--    UPDATE Books_Example
--    SET ID_Library = @ID_Library
--    WHERE ID_Books_Example = @ID_Books_Example;

--    SELECT 'Экземпляр книги успешно назначен библиотеке.' AS Message;
--END;
--GO

--EXEC AssignBookToLibrary @ID_Books_Example = 2, @Library_Title = 'Библиотека №1', @Library_Address = 'Улица Московская, 88';
--GO

--SELECT * FROM Books_Example


--EXEC AssignBookToLibrary @ID_Books_Example = 1, @Library_Title = 'Библиотека №0', @Library_Address = 'Улица Московская, 78';
--GO

--CREATE PROCEDURE GetBooksByAuthor
--    @ID_Author INT
--AS
--BEGIN
--    SELECT b.ID_Book, b.Title, b.Native_Language, b.Date_Of_Publishing, g.Title AS Genre
--    FROM Books b
--    JOIN Genres g ON b.ID_Genre = g.ID_Genre
--    WHERE b.ID_Author = @ID_Author;
--END;
--GO


INSERT INTO Books(ID_Author,ID_Genre,Title,Native_Language, Date_Of_Publishing)
VALUES 	(259,4,'Земля','Русский', '1999.12.05'),
		(259,1,'Убийства по алфавиту','Английский', '1934.11.09'),
		(259,3,'Машина Времени','Английский','1911.08.11'),
		(259,4,'Generation P','Русский','1995.06.21'),
		(259,2,'Властелин Колец: Две Крепости','Английский', '1945.10.09'),
		(259,2,'Властелин Колец: Две Крепости','Английский', '1945.10.09');



SELECT * FROM Authors
EXEC GetBooksByAuthor @ID_Author = 259;
GO


--CREATE PROCEDURE GetBooksByGenre
--    @GenreTitle NVARCHAR(30)
--AS
--BEGIN
--    SELECT 
--        B.Title AS BookTitle,
--        A.Full_Name AS AuthorName,
--        B.Native_Language,
--        B.Date_Of_Publishing
--    FROM 
--        Books B
--    JOIN 
--        Authors A ON B.ID_Author = A.ID_Author
--    JOIN 
--        Genres G ON B.ID_Genre = G.ID_Genre
--    WHERE 
--        G.Title = @GenreTitle;
--END;
--GO

--EXEC GetBooksByGenre @GenreTitle = 'Фентези';
--GO
