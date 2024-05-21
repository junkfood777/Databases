--Составной некластерный:
--1:

SELECT b.Title AS BookTitle, a.Full_Name AS AuthorName, g.Title AS GenreTitle
FROM Books b
INNER JOIN Authors a ON b.ID_Author = a.ID_Author
INNER JOIN Genres g ON b.ID_Genre = g.ID_Genre;

CREATE NONCLUSTERED INDEX IDX_Books_Example_Book_Pub_Lib
ON Books_Example (ID_Book, ID_Publishing_House, ID_Library);

SELECT b.Title AS BookTitle, a.Full_Name AS AuthorName, g.Title AS GenreTitle
FROM Books b
INNER JOIN Authors a ON b.ID_Author = a.ID_Author
INNER JOIN Genres g ON b.ID_Genre = g.ID_Genre;

--2:
SELECT b.Title, b.Date_Of_Publishing
FROM Books b
WHERE b.Date_Of_Publishing > ALL (
    SELECT bj.Date_Of_Taking
    FROM Book_Journal bj
    WHERE bj.ID_Books_Example = b.ID_Book
);

CREATE NONCLUSTERED INDEX IDX_Books_Author_Genre_Date
ON Books (ID_Author, ID_Genre, Date_Of_Publishing);

SELECT b.Title, b.Date_Of_Publishing
FROM Books b
WHERE b.Date_Of_Publishing > ALL (
    SELECT bj.Date_Of_Taking
    FROM Book_Journal bj
    WHERE bj.ID_Books_Example = b.ID_Book
);

--3:
SELECT Title, 
       SUBSTRING(Title, 1, 10) AS SubstrTitle
FROM Books
WHERE Native_Language = 'Русский'

CREATE NONCLUSTERED INDEX IDX_Books_Title_Language
ON Books (Title, Native_Language);

SELECT Title, 
       SUBSTRING(Title, 1, 10) AS SubstrTitle
FROM Books
WHERE Native_Language = 'Русский'

--4:
SELECT Title, 
       DATEPART(year, Date_Of_Publishing) AS PublishYear
FROM Books
WHERE DATEPART(month, Date_Of_Publishing) = 12;

CREATE NONCLUSTERED INDEX IDX_Books_Date_Author
ON Books (Date_Of_Publishing, ID_Author);

SELECT Title, 
       DATEPART(year, Date_Of_Publishing) AS PublishYear
FROM Books
WHERE DATEPART(month, Date_Of_Publishing) = 12;

--5:

SELECT be.ID_Library, b.ID_Author, SUM(be.Amount_Of_Pages) AS TotalPages
FROM Books_Example be
JOIN Books b ON be.ID_Book = b.ID_Book
GROUP BY be.ID_Library, b.ID_Author
HAVING SUM(be.Amount_Of_Pages) > 1000;

CREATE NONCLUSTERED INDEX IDX_Books_Example_Library_Book
ON Books_Example (ID_Library, ID_Book);

SELECT be.ID_Library, b.ID_Author, SUM(be.Amount_Of_Pages) AS TotalPages
FROM Books_Example be
JOIN Books b ON be.ID_Book = b.ID_Book
GROUP BY be.ID_Library, b.ID_Author
HAVING SUM(be.Amount_Of_Pages) > 1000;

--6:

SELECT Full_Name
FROM Authors
WHERE ID_Author IN (
    SELECT ID_Author
    FROM Books
    WHERE ID_Genre > 10);


CREATE NONCLUSTERED INDEX IDX_Books_Author_Genre
ON Books (ID_Author, ID_Genre);

SELECT Full_Name
FROM Authors
WHERE ID_Author IN (
    SELECT ID_Author
    FROM Books
    WHERE ID_Genre > 10);
--7

SELECT Full_Name
FROM Authors
WHERE Date_Of_Birth < '1980-01-01'
UNION
SELECT Full_Name
FROM Authors
WHERE Date_Of_Birth > '1990-01-01';


CREATE NONCLUSTERED INDEX IDX_Authors_BirthDate
ON Authors (Date_Of_Birth);


SELECT Full_Name
FROM Authors
WHERE Date_Of_Birth < '1980-01-01'
UNION
SELECT Full_Name
FROM Authors
WHERE Date_Of_Birth > '1990-01-01';