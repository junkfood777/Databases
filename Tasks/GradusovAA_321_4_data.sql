--DROP TABLE Book_Journal;
--DROP TABLE Books_Example;
--DROP TABLE Reader;
--DROP TABLE Libraries;
--DROP TABLE Publishing_Houses;
--DROP TABLE Books;
--DROP TABLE Authors;
--DROP TABLE Genres;

declare @n int = 0;
declare @k int = 20;
declare @AltKey nvarchar(25);
declare @a char = 'А', @z char = 'я', @w int, @l int
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
--declare @ident uniqueidentifier;
declare @FullName nvarchar(50);
declare @Count int;
DECLARE @DATEOFBIRTH DATE
DECLARE @PlaceOfBirth NVARCHAR(50);

while (@n<5000)
begin
	SET @FullName = ''
	SET @PlaceOfBirth = ''
	if (@k>80) SET @k=20


	--SET @ident = NEWID();
	--SET @AltKey = left(replace(@ident,'-',''),12);
	SET @Count =CAST(ROUND(RAND() * 1000,0)AS NUMERIC)%20006+1 
    SET @DATEOFBIRTH= DATEADD(DAY,CAST(ROUND(RAND() * 10000,0)AS NUMERIC)%100000,'04.04.1900')  
	
	if (len(@FullName)>50) SET @FullName = ' ' else SET @FullName= @FullName+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) +char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @FullName IS NULL SET @FullName = ' '
	if (len(@PlaceOfBirth)>50) SET @PlaceOfBirth = ' ' else SET @PlaceOfBirth= @PlaceOfBirth+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @PlaceOfBirth IS NULL SET @PlaceOfBirth = ' '
	insert into [dbo].[Authors]([Full_Name], [Date_Of_Birth],[Place_Of_Birth],[Count_Of_Published_Books])
	values (@FullName, @DATEOFBIRTH,@PlaceOfBirth,@Count)

	SET @n=@n+1
	SET @k=@k+1
end

SELECT * FROM Authors


SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);

declare @Title nvarchar(50);
DECLARE @Descr NVARCHAR(100);

while (@n<100)
begin
	SET @Title = ''
	SET @Descr = ''
	if (@k>80) SET @k=20


	--SET @ident = NEWID();  
	--SET @AltKey = left(replace(@ident,'-',''),12);
	if (len(@Title)>50) SET @Title = ' ' else SET @Title= @Title+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @Title IS NULL SET @Title = ' '
	if (len(@Descr)>100) SET @Descr = ' ' else SET @Descr= @Descr+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @Descr IS NULL SET @Descr = ' '
	
	insert into [dbo].Genres([Title], [Descr])
	values (@Title, @Descr)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Genres


SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idAuthors int;
declare @idGenres int;
declare @TitleBook nvarchar(50);
DECLARE @NatLang NVARCHAR(30);
DECLARE @DATEOFPUBL DATE
declare @Rus nvarchar(30)='Русский';
declare @Eng nvarchar(30)='Английский';
declare @Fr nvarchar(30)='Французский';
declare @Esp nvarchar(30) = 'Испанский';
declare @It nvarchar(30) = 'Итальянский';
declare @Lat nvarchar(30) = 'Латынь';
declare @langINT int;

while (@n<15000)
begin
	SET @TitleBook = ''
	if (@k>80) SET @k=20


	--SET @ident = NEWID();
	--SET @AltKey = left(replace(@ident,'-',''),12);
	SET @DATEOFPUBL= DATEADD(DAY,CAST(ROUND(RAND() * 10000,0)AS NUMERIC)%100000,'04.04.1900')
	SET @idAuthors = ROUND(RAND() * 10000,0)+1--%10000
	SET @idGenres = ROUND(RAND() * 5,0)+1--%10000
	
	if (len(@TitleBook)>50) SET @TitleBook = ' ' else SET @TitleBook= @TitleBook+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @TitleBook IS NULL SET @TitleBook = ' '
	SET @langINT=CAST(ROUND(RAND() * 10,0)AS NUMERIC)%6+1 
	if @langINT=1 SET @NatLang=@Rus else if @langINT=2 SET @NatLang=@Eng else if @langINT=3 SET @NatLang=@Fr else if @langINT = 4 SET @NatLang = @Esp else if @langINT=5 SET @NatLang = @It else SET @NatLang = @Lat;

	

	insert into [dbo].Books([ID_Author],[ID_Genre],[Title], [Native_Language],[Date_Of_Publishing])
	values (@idAuthors,@idGenres,@TitleBook, @NatLang,@DATEOFPUBL)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Books


SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);

declare @TitlePubH nvarchar(30);
DECLARE @RegPlace NVARCHAR(30);
DECLARE @AnnSalesTurn int

while (@n<100)
begin
	SET @TitlePubH = ''
	SET @RegPlace = ''
	if (@k>80) SET @k=20


	--SET @ident = NEWID();
	--SET @AltKey = left(replace(@ident,'-',''),12);
	SET @AnnSalesTurn=CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20000+1 
	
  
	
	if (len(@TitlePubH)>30) SET @TitlePubH = ' ' else SET @TitlePubH= @TitlePubH+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @TitlePubH IS NULL SET @TitlePubH = 'Ротфронт'
	if (len(@RegPlace)>30) SET @RegPlace = ' ' else SET @RegPlace= @RegPlace+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @RegPlace IS NULL SET @RegPlace = 'Саратов'
	
	insert into [dbo].Publishing_Houses([Title],[Place_Of_Registration],[Annual_Sales_Turnover])
	values (@TitlePubH,@RegPlace,@AnnSalesTurn)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Publishing_Houses


SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);


declare @TitleLib nvarchar(30);
DECLARE @Adress NVARCHAR(50);


while (@n<1000)
begin
	SET @TitleLib = ''
	SET @Adress = ''
	if (@k>80) SET @k=20


	--SET @ident = NEWID();
	--SET @AltKey = left(replace(@ident,'-',''),12);

	
  
	
	if (len(@TitleLib)>30) SET @TitleLib = ' ' else SET @TitleLib= @TitleLib+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if (len(@Adress)>50) SET @Adress = ' ' else SET @Adress= @Adress+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @TitleLib IS NULL SET @TitleLib = 'Библиотека номер 3'
	if @Adress IS NULL SET @Adress = 'Революционная, 52'

	insert into [dbo].Libraries([Title],[Adress])
	values (@TitleLib,@Adress)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Libraries


SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idBook int;
declare @idPubH int;
declare @idLib int;
declare @AmOfPages int;
declare @TypeOfPaper nvarchar(30);
DECLARE @TypeOfBind NVARCHAR(30);

while (@n<30000)
begin
	
	if (@k>80) SET @k=20

	SET @TypeOfBind = ''
	SET @TypeOfPaper = ''
	--SET @ident = NEWID();
	--SET @AltKey = left(replace(@ident,'-',''),12);
	SET @AmOfPages=CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	SET @idBook = ROUND(RAND() * 10000,0)+1 %10000
	SET @idPubH = ROUND(RAND() * 10000,0)+1 %1000
	SET @idLib = ROUND(RAND() * 10000,0)+1 %1000
  
	
	if (len(@TypeOfPaper)>30) SET @TypeOfPaper = ' ' else SET @TypeOfPaper= @TypeOfPaper+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if (len(@TypeOfBind)>30) SET @TypeOfBind = ' ' else SET @TypeOfBind= @TypeOfBind+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @TypeOfPaper IS NULL SET @TypeOfPaper = 'Бумага плотная'
	if @TypeOfBind IS NULL SET @TypeOfBind = 'Картон'

	insert into [dbo].Books_Example([Amount_Of_Pages],[Type_Of_Paper],[Type_Of_Binding],[ID_Book],[ID_Publishing_House],[ID_Library])
	values (@AmOfPages,@TypeOfPaper,@TypeOfBind,@idBook,@idPubH,@idLib)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Books_Example


SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
DECLARE @zero char = '0';
DECLARE @nine  char = '9';
DECLARE @pn  char = ascii(@nine) - ascii(@zero);
DECLARE @pnl char = ascii(@zero);

declare @FullNameRead nvarchar(50);
DECLARE @PhoneNumb NVARCHAR(11);
DECLARE @DateOfBirthReader DATE


while (@n<1000)
begin
	
	if (@k>80) SET @k=20

	SET @FullNameRead = ''
	SET @PhoneNumb = '8'
	
	SET @idLib = ROUND(RAND() * 10000,0)+1 %1000
  
	
	if (len(@FullNameRead)>50) SET @FullNameRead = ' ' else SET @FullNameRead= @FullNameRead+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if (len(@PhoneNumb)>50) SET @PhoneNumb = ' ' else SET @PhoneNumb= @PhoneNumb+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	
	SET @DateOfBirthReader= DATEADD(DAY,CAST(ROUND(RAND() * 10000,0)AS NUMERIC)%2000,'04.04.2000')

	insert into [dbo].Reader([Full_Name],[Phone_Number],[Date_Of_Birth],[ID_Library])
	values (@FullNameRead,@PhoneNumb,@DateOfBirthReader, @idLib)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Reader


SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);

declare @idBookEx int;
declare @idReader int;
DECLARE @DateOfT DATE;
DECLARE @DateOfBB DATE;


while (@n<6)
begin
	
	if (@k>80) SET @k=20

	SET @idReader = ROUND(RAND() * 1000,0) + 1 %1000
	SET @idBookEx = ROUND(RAND() * 1000,0) + 1 %1000
	
	
  
	SET @DateOfT= DATEADD(DAY,CAST(ROUND(RAND() * 10000,0)AS NUMERIC)%1000,'04.04.2020')
	SET @DateOfBB= DATEADD(DAY,CAST(ROUND(RAND() * 10000,0)AS NUMERIC)%1000,'04.05.2020')

	insert into [dbo].Book_Journal([ID_Reader],[ID_Books_Example],[Date_Of_Taking],[Date_Of_Bringing_Back])
	values (@idReader,@idBookEx,@DateOfT, @DateOfBB)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Book_Journal

CREATE TABLE BOOKS_1
(
idAuthors int NOT NULL,
idGenres int,
TitleBook nvarchar(50),
NatLang NVARCHAR(30),
DATEOFPUBL DATE
);

SET @n = 0;
SET @k = 20;
SET @a = 'А'; 
SET @z = 'я';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idAuthors_1 int;
declare @idGenres_1 int;
declare @TitleBook_1 nvarchar(50);
DECLARE @NatLang_1 NVARCHAR(30);
DECLARE @DATEOFPUBL_1 DATE
declare @Rus_1 nvarchar(30)='Русский';
declare @Eng_1 nvarchar(30)='Английский';
declare @Fr_1 nvarchar(30)='Французский';
declare @Esp_1 nvarchar(30) = 'Испанский';
declare @It_1 nvarchar(30) = 'Итальянский';
declare @Lat_1 nvarchar(30) = 'Латынь';
declare @langINT_1 int;

while (@n<15000)
begin
	SET @TitleBook = ''
	if (@k>80) SET @k=20


	--SET @ident = NEWID();
	--SET @AltKey = left(replace(@ident,'-',''),12);
	SET @DATEOFPUBL_1= DATEADD(DAY,CAST(ROUND(RAND() * 10000,0)AS NUMERIC)%100000,'04.04.1900')
	SET @idAuthors_1 = ROUND(RAND() * 10000,0)+1--%10000
	SET @idGenres_1 = ROUND(RAND() * 5,0)+1--%10000
	
	if (len(@TitleBook_1)>50) SET @TitleBook_1 = ' ' else SET @TitleBook_1= @TitleBook_1+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)+char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l) + char(round(rand() * @w, 0) + @l)
	if @TitleBook_1 IS NULL SET @TitleBook_1 = ' '
	SET @langINT_1=CAST(ROUND(RAND() * 10,0)AS NUMERIC)%6+1 
	if @langINT_1=1 SET @NatLang_1=@Rus else if @langINT_1=2 SET @NatLang_1=@Eng else if @langINT_1=3 SET @NatLang_1=@Fr else if @langINT_1 = 4 SET @NatLang_1 = @Esp else if @langINT_1=5 SET @NatLang_1 = @It else SET @NatLang_1 = @Lat;

	

	insert into [dbo].BOOKS_1([idAuthors],[idGenres],[TitleBook], [NatLang],[DATEOFPUBL])
	values (@idAuthors_1,@idGenres_1,@TitleBook_1, @NatLang_1,@DATEOFPUBL_1)

	SET @n=@n+1
	SET @k=@k+1
end

