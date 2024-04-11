IF OBJECT_ID (N'Publishing_Houses', N'U') IS NOT NULL
	DROP TABLE Publishing_Houses
IF OBJECT_ID (N'Books_Example', N'U') IS NOT NULL
	DROP TABLE Books_Example
IF OBJECT_ID (N'Book_Journal', N'U') IS NOT NULL
	DROP TABLE Book_Journal
IF OBJECT_ID (N'Reader', N'U') IS NOT NULL
	DROP TABLE Reader
IF OBJECT_ID (N'Books', N'U') IS NOT NULL
	DROP TABLE Books
IF OBJECT_ID (N'Authors', N'U') IS NOT NULL
	DROP TABLE Authors
IF OBJECT_ID (N'Genres', N'U') IS NOT NULL
	DROP TABLE Genres
IF OBJECT_ID (N'Libraries', N'U') IS NOT NULL
	DROP TABLE Libraries



--/*	


	


CREATE TABLE Authors
( 
 ID_Author	int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Authors PRIMARY KEY, 
 Full_Name	nvarchar(50) NOT NULL,
 Date_Of_Birth date,
 Place_Of_Birth nvarchar(50) NOT NULL,
 Count_Of_Published_Books int NOT NULL
) 

CREATE TABLE Genres
( 
 ID_Genre	int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Genres PRIMARY KEY, 
 Title		nvarchar(30) NOT NULL,
 Descr		nvarchar(100) NOT NULL

) 


CREATE TABLE Books
(
ID_Book		int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Books PRIMARY KEY,
ID_Author	int FOREIGN KEY REFERENCES Authors(ID_Author) NOT NULL,
ID_Genre	int FOREIGN KEY REFERENCES Genres(ID_Genre) NOT NULL,
Title		nvarchar(50) NOT NULL,
Native_Language nvarchar(30),
Date_Of_Publishing date
)


CREATE TABLE Publishing_Houses
(
ID_Publishing_House	int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Publishing_Houses PRIMARY KEY,
Title nvarchar(30) NOT NULL,
Place_Of_Registration nvarchar(30) NOT NULL,
Annual_Sales_Turnover int NOT NULL
)


CREATE TABLE Libraries
(
ID_Library int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Library PRIMARY KEY,
Title nvarchar(30) NOT NULL,
Adress nvarchar(50) NOT NULL
)


CREATE TABLE Books_Example
(
ID_Books_Example int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Books_Example PRIMARY KEY,
Amount_Of_Pages int NOT NULL,
Type_Of_Paper nvarchar(30) NOT NULL,
Type_Of_Binding nvarchar(30) NOT NULL,
ID_Book int FOREIGN KEY REFERENCES Books(ID_Book) NOT NULL,
ID_Publishing_House int FOREIGN KEY REFERENCES Publishing_Houses(ID_Publishing_House) NOT NULL,
ID_Library int FOREIGN KEY REFERENCES Libraries(ID_Library) NOT NULL
)

CREATE TABLE Reader
(
ID_Reader int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Reader PRIMARY KEY,
Full_Name nvarchar(50) NOT NULL,
Phone_Number nvarchar(50) NOT NULL, 
Date_Of_Birth date,
ID_Library int FOREIGN KEY REFERENCES Libraries(ID_Library) NOT NULL
)


CREATE TABLE Book_Journal
(
ID_Record int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Book_Journal PRIMARY KEY,
ID_Reader int FOREIGN KEY REFERENCES Reader(ID_Reader) NOT NULL,
ID_Books_Example int FOREIGN KEY REFERENCES Books_Example(ID_Books_Example) NOT NULL,
Date_Of_Taking date,
Date_Of_Bringing_Back date
)




INSERT INTO Authors (Full_Name, Date_Of_Birth, Place_Of_Birth, Count_Of_Published_Books)
VALUES	('Елизаров Михаил Юрьевич', '1973.01.28', 'СССР', 7),
		('Пелевин Виктор Олегович', '1962.11.22', 'СССР', 19),
		('Мамлеев Юрий Витальевич', '1931.12.11', 'СССР', 23),
		('Набоков Владимир Владимирович','1899.04.22', 'Россия', 31),
		('Довлатов Сергей Донатович', '1941.09.03', 'СССР', 21),
		('Агата Кристи', '1890.09.15','Великобритания', 42),
		('Герберт Уэллс','1866.09.21', 'Великобритания', 15),
		('Джон Руэл Рональд Толкин', '1892.01.03', 'Великобритания', 9)

INSERT INTO Genres(Title,Descr)	
VALUES	('Криминальный Детектив', 'История раскрытия преступления'),
		('Фентези','История вымышленного  мира'),
		('Научная фантастика', 'Раскрытие потенциала научных достижений'),
		('Современная русская', 'Освещение проблем страны в современных контекстах')


INSERT INTO Books(ID_Author,ID_Genre,Title,Native_Language, Date_Of_Publishing)
VALUES 	(1,4,'Земля','Русский', '1999.12.05'),
		(6,1,'Убийства по алфавиту','Английский', '1934.11.09'),
		(7,3,'Машина Времени','Английский','1911.08.11'),
		(2,4,'Generation P','Русский','1995.06.21'),
		(8,2,'Властелин Колец: Две Крепости','Английский', '1945.10.09');


INSERT INTO Publishing_Houses(Title, Place_Of_Registration, Annual_Sales_Turnover)
VALUES	('Букер','Москва, Россия', 1000),
		('Ротфронт','Санкт-Петербург, Россия', 900),
		('Книжный Дом','Саратов, Россия', 200);


INSERT INTO Libraries(Title, Adress)
VALUES 	('Библиотека №1', 'Улица Московская, 88'),
		('Дом Книги','Улица Астраханская, 13'),
		('Городская библиотека','Площадь Ленина, 12');

INSERT INTO Books_Example(Amount_Of_Pages, Type_Of_Paper, Type_Of_Binding, ID_Book, ID_Publishing_House, ID_Library)
VALUES 	(1000, 'Бумага', 'Бумага', 1, 3, 1),
		(500,'Береста','Картон', 3, 2, 2),
		(900,'Папирус','Бумага', 4, 3, 1);

INSERT INTO Reader(Full_Name, Phone_Number, Date_Of_Birth, ID_Library)
VALUES 	('Пушкин Александр Сергеевич', '89175555555','1999.09.08', 1),
		('Гоголь Николай Васильевич','89653456781','2000.03.04', 2),
		('Тургенев Иван Александрович','89543128543','1976.02.06', 3);

INSERT INTO Book_Journal(ID_Reader, ID_Books_Example, Date_Of_Taking, Date_Of_Bringing_Back)
VALUES 	(1, 3, '2024.01.02','2024.02.28'),
		(2, 2, '2024.02.25','2024.03.25'),
		(3, 1, '2023.11.27','2024.02.15');


		
		

SELECT * FROM Authors
SELECT * FROM Genres
SELECT * FROM Books
SELECT * FROM Publishing_Houses
SELECT * FROM Libraries
SELECT * FROM Books_Example
SELECT * FROM Reader
SELECT * FROM Book_Journal

-- */