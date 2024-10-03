--SELECT A.Full_Name, B.Title, G.Title AS Genre, L.Title AS Library
--FROM Books B
--JOIN Authors A ON B.ID_Author = A.ID_Author
--JOIN Genres G ON B.ID_Genre = G.ID_Genre
--JOIN Books_Example BE ON B.ID_Book = BE.ID_Book
--JOIN Libraries L ON BE.ID_Library = L.ID_Library;

--CREATE NONCLUSTERED INDEX ind_1 ON Books_Example(ID_Book, ID_Library);


--SELECT A.Full_Name, B.Title, G.Title AS Genre, L.Title AS Library
--FROM Books B
--JOIN Authors A ON B.ID_Author = A.ID_Author
--JOIN Genres G ON B.ID_Genre = G.ID_Genre
--JOIN Books_Example BE ON B.ID_Book = BE.ID_Book
--JOIN Libraries L ON BE.ID_Library = L.ID_Library;

--DROP INDEX ind_1 ON Books_Example;

--DROP INDEX ind_2 ON Libraries;

--SELECT Full_Name, Date_Of_Birth, Phone_Number
--FROM Reader
--WHERE EXISTS (SELECT 1 FROM Libraries L WHERE L.ID_Library = Reader.ID_Library AND L.Title LIKE 'Д%');

--CREATE NONCLUSTERED INDEX ind_2 ON Libraries(Title) INCLUDE (ID_Library);


--SELECT Full_Name, Date_Of_Birth, Phone_Number
--FROM Reader
--WHERE EXISTS (SELECT 1 FROM Libraries L WHERE L.ID_Library = Reader.ID_Library AND L.Title LIKE 'Д%');

--DROP INDEX ind_2 ON Libraries;

--SELECT 
--    SUBSTRING(Full_Name, 1, 10) AS Short_Name, 
--    REPLACE(Phone_Number, '8', '+7') AS Formatted_Phone
--FROM Reader
--WHERE Full_Name LIKE 'П%';

--CREATE NONCLUSTERED INDEX ind_3 ON Reader(Full_Name) INCLUDE (Phone_Number);


--SELECT 
--    SUBSTRING(Full_Name, 1, 10) AS Short_Name, 
--    REPLACE(Phone_Number, '8', '+7') AS Formatted_Phone
--FROM Reader
--WHERE Full_Name LIKE 'П%';

--DROP INDEX ind_3 ON READER


--DROP INDEX ind_4 ON Reader;
--SELECT 
--    Full_Name, 
--    DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Reader
--WHERE DATEPART(MONTH, Date_Of_Birth) = 9;

--CREATE NONCLUSTERED INDEX ind_4 ON Reader(Date_Of_Birth) INCLUDE (Full_Name);


--SELECT 
--    Full_Name, 
--    DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Reader
--WHERE DATEPART(MONTH, Date_Of_Birth) = 9;


--DROP INDEX ind_4 ON Reader;

--SELECT A.Full_Name, COUNT(B.ID_Book) AS Total_Books
--FROM Authors A
--JOIN Books B ON A.ID_Author = B.ID_Author
--GROUP BY A.Full_Name
--HAVING COUNT(B.ID_Book) > 5;

--CREATE NONCLUSTERED INDEX ind_5 ON Books(ID_Author);


--SELECT A.Full_Name, COUNT(B.ID_Book) AS Total_Books
--FROM Authors A
--JOIN Books B ON A.ID_Author = B.ID_Author
--GROUP BY A.Full_Name
--HAVING COUNT(B.ID_Book) > 5;

--DROP INDEX ind_5 ON Books

--SELECT A.Full_Name, (SELECT COUNT(*) FROM Books B WHERE B.ID_Author = A.ID_Author) AS Total_Books
--FROM Authors A
--WHERE (SELECT COUNT(*) FROM Books B WHERE B.ID_Author = A.ID_Author) > 3;

--CREATE NONCLUSTERED INDEX ind_6 ON Books(ID_Author);

--SELECT A.Full_Name, (SELECT COUNT(*) FROM Books B WHERE B.ID_Author = A.ID_Author) AS Total_Books
--FROM Authors A
--WHERE (SELECT COUNT(*) FROM Books B WHERE B.ID_Author = A.ID_Author) > 3;


----DROP INDEX ind_6 ON Books

--SELECT Full_Name FROM Authors
--UNION
--SELECT Full_Name FROM Reader;

--SELECT Full_Name FROM Authors
--INTERSECT
--SELECT Full_Name FROM Reader;

--CREATE NONCLUSTERED INDEX ind_7_1 ON Authors(Full_Name);
--CREATE NONCLUSTERED INDEX ind_7_2 ON Reader(Full_Name);


--SELECT Full_Name FROM Authors
--UNION
--SELECT Full_Name FROM Reader;

--SELECT Full_Name FROM Authors
--INTERSECT
--SELECT Full_Name FROM Reader;

--DROP INDEX ind_7_1 ON Authors
--DROP INDEX ind_7_2 ON Reader





--SELECT a1.Full_Name, a2.Full_Name
--FROM Authors a1
--JOIN Authors a2 ON a1.Place_Of_Birth = a2.Place_Of_Birth
--WHERE a1.ID_Author != a2.ID_Author;

--CREATE NONCLUSTERED INDEX ind_8

--ON Authors (Full_Name, ID_Author, Place_Of_Birth, Count_Of_Published_Books)


--SELECT a1.Full_Name, a2.Full_Name
--FROM Authors a1
--JOIN Authors a2 ON a1.Place_Of_Birth = a2.Place_Of_Birth
--WHERE a1.ID_Author != a2.ID_Author;


--DROP INDEX ind_8 ON Authors

--SELECT Title 
--FROM Books
--WHERE ID_Author IN (SELECT ID_Author FROM Authors WHERE Count_Of_Published_Books BETWEEN 5 AND 20);

--CREATE NONCLUSTERED INDEX ind_9
--ON Books (ID_Author)




--SELECT Title 
--FROM Books
--WHERE ID_Author IN (SELECT ID_Author FROM Authors WHERE Count_Of_Published_Books BETWEEN 5 AND 20);

--DROP INDEX ind_9 ON Books



SELECT 
    REPLACE(Full_Name, ' ', '-') AS Replaced_Name
FROM Authors
WHERE SUBSTRING(Full_Name, 1, 1) = 'А';

CREATE NONCLUSTERED INDEX ind_10

ON Authors (Full_Name, Count_Of_Published_Books, Date_Of_Birth);


SELECT 
    REPLACE(Full_Name, ' ', '-') AS Replaced_Name
FROM Authors
WHERE SUBSTRING(Full_Name, 1, 1) = 'А';

DROP INDEX ind_10 ON Authors



--SELECT Full_Name, DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Reader
--WHERE DATEPART(MONTH, Date_Of_Birth) = 9;

--CREATE NONCLUSTERED INDEX ind_11
--ON Reader (Date_Of_Birth)
--INCLUDE (Full_Name);


--SELECT Full_Name, DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Reader
--WHERE DATEPART(MONTH, Date_Of_Birth) = 9;

--DROP INDEX ind_11 ON Reader

--SELECT ID_Library, COUNT(*) AS Reader_Count
--FROM Reader
--GROUP BY ID_Library
--HAVING COUNT(*) > 1;

--CREATE NONCLUSTERED INDEX ind_12
--ON Reader (ID_Library);

--SELECT ID_Library, COUNT(*) AS Reader_Count
--FROM Reader
--GROUP BY ID_Library
--HAVING COUNT(*) > 1;

--DROP INDEX ind_12 ON Reader

--SELECT Title
--FROM Books
--WHERE ID_Book IN (SELECT ID_Book FROM Books_Example WHERE Amount_Of_Pages > 1000);

--CREATE NONCLUSTERED INDEX ind_13
--ON Books_Example (Amount_Of_Pages)
--INCLUDE (ID_Book);


--SELECT Title
--FROM Books
--WHERE ID_Book IN (SELECT ID_Book FROM Books_Example WHERE Amount_Of_Pages > 1000);

--DROP INDEX ind_13 ON Books_Example

--SELECT Title FROM Books WHERE ID_Genre = 1
--UNION
--SELECT Title FROM Books WHERE ID_Genre = 2;

--CREATE NONCLUSTERED INDEX ind_14
--ON Books (ID_Genre)
--INCLUDE (Title);


--SELECT Title FROM Books WHERE ID_Genre = 1
--UNION
--SELECT Title FROM Books WHERE ID_Genre = 2;

--DROP INDEX ind_14 ON Books



--SELECT a1.Full_Name AS Author1, a2.Full_Name AS Author2, a1.Place_Of_Birth, 
--       a1.Count_Of_Published_Books AS Author1_Books, a2.Count_Of_Published_Books AS Author2_Books
--FROM Authors a1
--JOIN Authors a2 ON a1.Place_Of_Birth = a2.Place_Of_Birth AND a1.ID_Author <> a2.ID_Author;



--CREATE UNIQUE NONCLUSTERED INDEX ind_15
--ON Authors (Place_Of_Birth, Count_Of_Published_Books, Full_Name)
--INCLUDE (ID_Author);


--SELECT a1.Full_Name AS Author1, a2.Full_Name AS Author2, a1.Place_Of_Birth, 
--       a1.Count_Of_Published_Books AS Author1_Books, a2.Count_Of_Published_Books AS Author2_Books
--FROM Authors a1
--JOIN Authors a2 ON a1.Place_Of_Birth = a2.Place_Of_Birth AND a1.ID_Author <> a2.ID_Author;


--SELECT 
--    REPLACE(Full_Name, ' ', '_') AS Replaced_Name
--FROM Authors
--WHERE SUBSTRING(Full_Name, 1, 2) = 'Джо';

--CREATE UNIQUE NONCLUSTERED INDEX ind_16
--ON Authors (Full_Name, Date_Of_Birth, Count_OF_Published_Books);

--SELECT 
--    REPLACE(Full_Name, ' ', '_') AS Replaced_Name
--FROM Authors
--WHERE SUBSTRING(Full_Name, 1, 2) = 'Дж';

--DROP INDEX ind_16 ON Authors

--SELECT Title 
--FROM Books
--WHERE ID_Author IN (SELECT ID_Author FROM Authors WHERE Count_Of_Published_Books BETWEEN 5 AND 15);

--CREATE UNIQUE NONCLUSTERED INDEX ind_17
--ON Books (Title, ID_Author, Date_Of_Publishing)
--INCLUDE (ID_Book);

--SELECT Title 
--FROM Books
--WHERE ID_Author IN (SELECT ID_Author FROM Authors WHERE Count_Of_Published_Books BETWEEN 5 AND 15);

--DROP INDEX ind_17 ON Books

--SELECT Full_Name, DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Authors
--WHERE DATEPART(MONTH, Date_Of_Birth) < 9;

--CREATE UNIQUE NONCLUSTERED INDEX ind_18
--ON Authors (Date_Of_Birth, Count_Of_Published_Books, Full_Name)
--INCLUDE (ID_Author);


--SELECT Full_Name, DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Authors
--WHERE DATEPART(MONTH, Date_Of_Birth) < 9;

--DROP INDEX ind_18 ON Authors

--SELECT l.Title, COUNT(r.ID_Reader) AS Reader_Count
--FROM Libraries l
--JOIN Reader r ON l.ID_Library = r.ID_Library
--GROUP BY l.Title
--HAVING COUNT(r.ID_Reader) > 1;


--CREATE UNIQUE NONCLUSTERED INDEX ind_19
--ON Reader (ID_Library, Full_Name)
--INCLUDE (ID_Reader);


--SELECT l.Title, COUNT(r.ID_Reader) AS Reader_Count
--FROM Libraries l
--JOIN Reader r ON l.ID_Library = r.ID_Library
--GROUP BY l.Title
--HAVING COUNT(r.ID_Reader) > 1;

--DROP INDEX ind_19 ON Reader

--SELECT Title
--FROM Books
--WHERE ID_Book IN (SELECT ID_Book FROM Books_Example WHERE Amount_Of_Pages > 300);

--CREATE UNIQUE NONCLUSTERED INDEX ind_20
--ON Books_Example (ID_Book, Type_Of_Binding, Type_Of_Paper)
--INCLUDE (Amount_Of_Pages);


--SELECT Title
--FROM Books
--WHERE ID_Book IN (SELECT ID_Book FROM Books_Example WHERE Amount_Of_Pages > 300);

--DROP INDEX ind_20 ON Books_Example

--SELECT Title FROM Books WHERE ID_Genre = 1
--UNION
--SELECT Title FROM Books WHERE ID_Genre = 2;

--CREATE UNIQUE NONCLUSTERED INDEX ind_21
--ON Books (Title, ID_Author, Date_Of_Publishing)
--INCLUDE (ID_Genre);


--SELECT Title FROM Books WHERE ID_Genre = 1
--UNION
--SELECT Title FROM Books WHERE ID_Genre = 2;


--DROP INDEX ind_21 ON Books

--SELECT 
--    a.Full_Name AS Author_Name, 
--    b.Title AS Book_Title, 
--    g.Title AS Genre_Title,
--    l.Title AS Library_Title
--FROM 
--    Authors a
--JOIN 
--    Books b ON a.ID_Author = b.ID_Author
--JOIN 
--    Genres g ON b.ID_Genre = g.ID_Genre
--JOIN 
--    Books_Example be ON b.ID_Book = be.ID_Book
--JOIN 
--    Libraries l ON be.ID_Library = l.ID_Library
--WHERE 
--    l.Title LIKE 'Б%';


--CREATE NONCLUSTERED INDEX ind_22 ON Authors (ID_Author) INCLUDE (Full_Name) 


--SELECT 
--    a.Full_Name AS Author_Name, 
--    b.Title AS Book_Title, 
--    g.Title AS Genre_Title,
--    l.Title AS Library_Title
--FROM 
--    Authors a
--JOIN 
--    Books b ON a.ID_Author = b.ID_Author
--JOIN 
--    Genres g ON b.ID_Genre = g.ID_Genre
--JOIN 
--    Books_Example be ON b.ID_Book = be.ID_Book
--JOIN 
--    Libraries l ON be.ID_Library = l.ID_Library
--WHERE 
--    l.Title LIKE 'Б%';

--DROP INDEX ind_22 ON Authors

--SELECT Full_Name
--FROM Reader
--WHERE ID_Library IN (SELECT ID_Library FROM Libraries WHERE Title LIKE '%Б%');

--CREATE NONCLUSTERED INDEX ind_23
--ON Reader (ID_Library)
--INCLUDE (Full_Name)



--SELECT Full_Name
--FROM Reader
--WHERE ID_Library IN (SELECT ID_Library FROM Libraries WHERE Title LIKE '%Б%');

--DROP INDEX ind_23 ON Reader

--SELECT Full_Name, REPLACE(Phone_Number, '8', '+7') AS Formatted_Phone
--FROM Reader;

--CREATE NONCLUSTERED INDEX ind_24
--ON Reader (Full_Name)
--INCLUDE (Phone_Number)


--SELECT Full_Name, REPLACE(Phone_Number, '8', '+7') AS Formatted_Phone
--FROM Reader;

--DROP INDEX ind_24 ON Reader

--SELECT Full_Name, DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Reader
--WHERE DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) > 30;

--CREATE NONCLUSTERED INDEX ind_25
--ON Reader (Date_Of_Birth)
--INCLUDE (Full_Name)

--SELECT Full_Name, DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age
--FROM Reader
--WHERE DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) > 30;

--DROP INDEX ind_25 ON Reader

--SELECT 
--    a.Full_Name,
--    COUNT(b.ID_Book) AS Total_Books,
--    MIN(b.Date_Of_Publishing) AS Earliest_Publication,
--    MAX(b.Date_Of_Publishing) AS Latest_Publication
--FROM 
--    Authors a
--JOIN 
--    Books b ON a.ID_Author = b.ID_Author
--GROUP BY 
--    a.Full_Name
--HAVING 
--    COUNT(b.ID_Book) >= 3 
--ORDER BY 
--    Total_Books DESC; 

--CREATE NONCLUSTERED INDEX ind_26
--ON Authors (Full_Name)
--INCLUDE (Count_Of_Published_Books, Date_Of_Birth)


--SELECT 
--    a.Full_Name,
--    COUNT(b.ID_Book) AS Total_Books,
--    MIN(b.Date_Of_Publishing) AS Earliest_Publication,
--    MAX(b.Date_Of_Publishing) AS Latest_Publication
--FROM 
--    Authors a
--JOIN 
--    Books b ON a.ID_Author = b.ID_Author
--GROUP BY 
--    a.Full_Name
--HAVING 
--    COUNT(b.ID_Book) >= 1000 
--ORDER BY 
--    Total_Books DESC; 
--DROP INDEX ind_26 ON Authors

--SELECT Full_Name
--FROM Reader
--WHERE ID_Library = (SELECT ID_Library FROM Libraries WHERE Title = 'П');

--CREATE NONCLUSTERED INDEX ind_27
--ON Reader (ID_Library)
--INCLUDE (Full_Name)


--SELECT Full_Name
--FROM Reader
--WHERE ID_Library = (SELECT ID_Library FROM Libraries WHERE Title = 'П');

--DROP INDEX ind_27 ON Reader

--SELECT Full_Name FROM Reader WHERE ID_Library = 1
--UNION
--SELECT Full_Name FROM Reader WHERE ID_Library = 2;

--CREATE NONCLUSTERED INDEX ind_28
--ON Reader (ID_Library)
--INCLUDE (Full_Name)


--SELECT Full_Name FROM Reader WHERE ID_Library = 1
--UNION
--SELECT Full_Name FROM Reader WHERE ID_Library = 2;

--DROP INDEX ind_28 ON Reader

--DROP INDEX ind_29 ON Authors

--SELECT 
--    a.Full_Name AS Author_Name, 
--    b.Title AS Book_Title 
--FROM 
--    Authors a
--LEFT JOIN 
--    Books b ON a.ID_Author = b.ID_Author;


--CREATE NONCLUSTERED INDEX ind_29
--ON Authors (Count_Of_Published_Books);


--SELECT 
--    a.Full_Name AS Author_Name, 
--    b.Title AS Book_Title 
--FROM 
--    Authors a
--LEFT JOIN 
--    Books b ON a.ID_Author = b.ID_Author;

--DROP INDEX ind_29 ON Authors

--SELECT 
--    Full_Name 
--FROM 
--    Authors 
--WHERE 
--    ID_Author IN (SELECT ID_Author FROM Books WHERE Date_Of_Publishing BETWEEN '1900-01-01' AND '1901-12-31');


--CREATE NONCLUSTERED INDEX ind_30
--ON Books (Date_Of_Publishing)
--WHERE Date_Of_Publishing < '1901-12-31';


--SELECT 
--    Full_Name 
--FROM 
--    Authors 
--WHERE 
--    ID_Author IN (SELECT ID_Author FROM Books WHERE Date_Of_Publishing BETWEEN '1900-01-01' AND '1900-05-01');

--DROP INDEX ind_30 ON Books

--SELECT 
--    Full_Name, 
--    REPLACE(Full_Name, ' ', '-') AS Full_Name_Modified 
--FROM 
--    Authors;


--CREATE NONCLUSTERED INDEX ind_31
--ON Authors (Full_Name)
--WHERE Full_Name = 'П';


--SELECT 
--    Full_Name, 
--    REPLACE(Full_Name, ' ', '-') AS Full_Name_Modified 
--FROM 
--    Authors;

--DROP INDEX ind_31 ON Authors

--SELECT 
--    Full_Name, 
--    DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age 
--FROM 
--    Authors 
--WHERE 
--    DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) > 30;

--CREATE NONCLUSTERED INDEX ind_32
--ON Authors (Date_Of_Birth)
--WHERE DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) > 30;


--SELECT 
--    Full_Name, 
--    DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age 
--FROM 
--    Authors 
--WHERE 
--    DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) > 30;

--DROP TABLE Authors_1

--SELECT *
--INTO Authors_1
--FROM Authors

--SELECT a.Full_Name, b.Title
--FROM Authors_1 a
--JOIN Books b ON a.ID_Author = b.ID_Author;

--CREATE CLUSTERED INDEX ind_36 ON Authors_1(Place_Of_Birth);

--SELECT a.Full_Name, b.Title
--FROM Authors_1 a
--JOIN Books b ON a.ID_Author = b.ID_Author;

--SELECT *
--INTO Books_2
--FROM Books

--SELECT b.Title
--FROM Books_2 b
--WHERE EXISTS (SELECT 1 FROM Authors a WHERE a.ID_Author = b.ID_Author);

--CREATE CLUSTERED INDEX ind_37 ON Books_2(Title);


--SELECT b.Title
--FROM Books b
--WHERE EXISTS (SELECT 1 FROM Authors a WHERE a.ID_Author = b.ID_Author);

--DROP INDEX ind_37 ON Books_2

--SELECT *
--INTO Authors_2
--FROM Authors

--SELECT REPLACE(Full_Name, ' ', '-') AS ModifiedName
--FROM Authors_2;

--CREATE CLUSTERED INDEX ind_38 ON Authors_2(Full_Name);


--SELECT REPLACE(Full_Name, ' ', '-') AS ModifiedName
--FROM Authors_2;

--SELECT *
--INTO Authors_3
--FROM Authors


--SELECT Full_Name, DATEPART(year, Date_Of_Birth) AS YearOfBirth
--FROM Authors_3;

--CREATE CLUSTERED INDEX ind_39 ON Authors_3(Date_Of_Birth);


--SELECT Full_Name, DATEPART(year, Date_Of_Birth) AS YearOfBirth
--FROM Authors_3;

--SELECT *
--INTO Authors_4
--FROM Authors

--SELECT Place_Of_Birth, COUNT(*) AS AuthorCount
--FROM Authors_4
--GROUP BY Place_Of_Birth
--HAVING COUNT(*) > 1;

--CREATE CLUSTERED INDEX ind_40 ON Authors_4(Place_Of_Birth);


--SELECT Place_Of_Birth, COUNT(*) AS AuthorCount
--FROM Authors_4
--GROUP BY Place_Of_Birth
--HAVING COUNT(*) > 1;

--SELECT *
--INTO Books_4
--FROM Books

--SELECT Full_Name
--FROM Authors
--WHERE ID_Author IN (SELECT ID_Author FROM Books_4 WHERE Native_Language = 'Русский');

--CREATE CLUSTERED INDEX ind_41 ON Books_4(Native_Language);



--SELECT Full_Name
--FROM Authors
--WHERE ID_Author IN (SELECT ID_Author FROM Books_4 WHERE Native_Language = 'Русский');

--SELECT *
--INTO Reader_1
--FROM Reader

--SELECT Full_Name FROM Authors
--UNION
--SELECT Full_Name FROM Reader_1;

--CREATE CLUSTERED INDEX ind_42 ON Reader_1(Full_Name);


--SELECT Full_Name FROM Authors
--UNION
--SELECT Full_Name FROM Reader_1;
