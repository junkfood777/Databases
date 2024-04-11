SELECT *
FROM Authors
INNER JOIN Books ON Authors.ID_Author = Books.ID_Author;

SELECT *
FROM Genres
LEFT JOIN Books ON Genres.ID_Genre = Books.ID_Genre;

SELECT *
FROM Books
RIGHT JOIN Books_Example ON Books.ID_Book = Books_Example.ID_Book;

SELECT *
FROM Publishing_Houses
FULL JOIN Books_Example ON Publishing_Houses.ID_Publishing_House = Books_Example.ID_Publishing_House;

SELECT *
FROM Books
CROSS JOIN Genres;

SELECT *
FROM Books
CROSS APPLY (SELECT * FROM Authors) AS Authors;

SELECT a1.Full_Name AS Author1, a2.Full_Name AS Author2
FROM Authors a1, Authors a2
WHERE a1.ID_Author <> a2.ID_Author;

SELECT *
FROM Authors
WHERE EXISTS (SELECT * FROM Books WHERE Books.ID_Author = Authors.ID_Author);

SELECT *
FROM Genres
WHERE ID_Genre IN (SELECT ID_Genre FROM Books);

SELECT *
FROM Authors
WHERE Count_Of_Published_Books BETWEEN 10 AND 30;

SELECT *
FROM Books
WHERE Title LIKE 'З%';

SELECT Full_Name,
	CASE 
		WHEN Count_Of_Published_Books < 10 THEN 'Мало'
		WHEN Count_Of_Published_Books >= 10 AND Count_Of_Published_Books < 20 THEN 'Средне'
		ELSE 'Много'
	END AS Published_Books_Category
FROM Authors;

SELECT CAST(Annual_Sales_Turnover AS float) AS Turnover_Float
FROM Publishing_Houses;

SELECT ISNULL(Date_Of_Birth, NULL) AS Birth_Date
FROM Authors;

SELECT IIF(Count_Of_Published_Books > 20, 'Много', 'Мало') AS Books_Count_Info
FROM Authors;

SELECT LOWER(Title) AS Lowercase_Title
FROM Books;

SELECT UPPER(Title) AS Uppercase_Title
FROM Books;

SELECT REPLACE(Place_Of_Birth, 'СССР', 'Россия') AS Birthplace
FROM Authors;


SELECT CAST(Annual_Sales_Turnover AS float) AS Turnover_Float
FROM Publishing_Houses;

SELECT 
    Full_Name,
    COALESCE(IIF(Date_Of_Birth > '1965-01-01', 'После 1965 года', 'До 1965 года'),  'Дата неизвестна') AS Birth_Date,
    ISNULL(Place_Of_Birth, 'Место неизвестно') AS Birth_Place,
    CHOOSE(Count_Of_Published_Books, 'Мало', 'Средне', 'Много') AS Books_Count_Status,
    IIF(Date_Of_Publishing > '2000-01-01', 'После 2000 года', 'До 2000 года') AS Publishing_Year_Status
FROM 
    Authors
LEFT JOIN
    Books ON Authors.ID_Author = Books.ID_Author;


SELECT Full_Name, DATEPART(year, Date_Of_Birth) AS Birth_Year
FROM Authors;

SELECT DATEADD(year, 5, Date_Of_Birth) AS After_Five_Years
FROM Authors;


SELECT GETDATE() AS Current_DateTime;


SELECT Genres.Title, COUNT(*) AS Books_Count
FROM Genres
LEFT JOIN Books ON Genres.ID_Genre = Books.ID_Genre
GROUP BY Genres.Title
HAVING COUNT(*) > 1;


SELECT ID_Library, SUM(Amount_Of_Pages) AS Total_Pages
FROM Books_Example
GROUP BY ID_Library;


SELECT ID_Author, AVG(Count_Of_Published_Books) AS Avg_Books_Per_Genre
FROM Authors
GROUP BY ID_Author;

SELECT MAX(Count_Of_Published_Books) AS Max_Books_Published
FROM Authors;


SELECT MIN(Annual_Sales_Turnover) AS Min_Sales_Turnover
FROM Publishing_Houses;



SELECT ID_Library, COUNT(*) AS Books_Count
FROM Books_Example
GROUP BY ID_Library
HAVING COUNT(*) > 1;


SELECT COUNT(*) AS Total_Books
FROM Books;


SELECT COUNT(DISTINCT Place_Of_Registration) AS Unique_Places
FROM Publishing_Houses;


SELECT *
FROM Books
WHERE NOT Native_Language = 'Русский';


SELECT *
FROM Authors
ORDER BY Date_Of_Birth DESC;


SELECT *
FROM Books
WHERE Title LIKE '%время%';



SELECT ID_Publishing_House,
	CASE
		WHEN Annual_Sales_Turnover > 500 THEN 'High'
		ELSE 'Low'
	END AS Turnover_Category,
	SUM(Annual_Sales_Turnover) AS Total_Turnover
FROM Publishing_Houses
GROUP BY ID_Publishing_House, Annual_Sales_Turnover;


SELECT Full_Name
FROM Authors
WHERE ID_Author IN (SELECT ID_Author FROM Books WHERE Title = 'Убийства по алфавиту');


SELECT *
FROM Books
INNER JOIN Authors ON Books.ID_Author = Authors.ID_Author
INNER JOIN Genres ON Books.ID_Genre = Genres.ID_Genre;


SELECT g.Title AS Genre, SUM(be.Amount_Of_Pages) AS Total_Pages
FROM Genres g
JOIN Books b ON g.ID_Genre = b.ID_Genre
JOIN Books_Example be ON b.ID_Book = be.ID_Book
GROUP BY g.Title;


SELECT ph.Title AS Publishing_House, COUNT(be.ID_Book) AS Total_Books
FROM Publishing_Houses ph
JOIN Books_Example be ON ph.ID_Publishing_House = be.ID_Publishing_House
GROUP BY ph.Title;
