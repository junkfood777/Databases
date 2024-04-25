
declare @n int = 0;
declare @k int = 20;
declare @a char = 'À', @z char = 'ÿ', @w int, @l int
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idAuthors int;
declare @FullName nvarchar(50);
declare @Count int;
DECLARE @DATEOFBIRTH DATE
DECLARE @PlaceOfBirth NVARCHAR(50);

while (@n<10 )
begin
	
	if (@k>80) SET @k=20


	SET @idAuthors =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1 
	
	SET @Count =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1 
    SET @DATEOFBIRTH= DATEADD(DAY,CAST(ROUND(RAND() * 1000,0)AS NUMERIC)%366,'04.04.2023')  
	
	if (len(@FullName)>50) SET @FullName = ' ' else SET @FullName= @FullName+char(round(rand() * @w, 0) + @l)
	if (len(@PlaceOfBirth)>50) SET @PlaceOfBirth = ' ' else SET @PlaceOfBirth= @PlaceOfBirth+char(round(rand() * @w, 0) + @l)
	
	insert into [dbo].Authors([ID_Author],[Full_Name], [Date_Of_Birth],[Place_Of_Birth],[Count_Of_Published_Books])
	values (@idAuthors,@FullName, @DATEOFBIRTH,@PlaceOfBirth,@Count)

	SET @n=@n+1
	SET @k=@k+1
end
SELECT * FROM Authors

SET @n = 0;
SET @k = 20;
SET @a = 'À'; 
SET @z = 'ÿ';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idGenres int;
declare @Title nvarchar(50);
DECLARE @Descr NVARCHAR(100);

while (@n<5000 )
begin
	
	if (@k>80) SET @k=20


	SET @idGenres =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1 
  
	
	if (len(@Title)>50) SET @Title = ' ' else SET @Title= @Title+char(round(rand() * @w, 0) + @l)
	if (len(@Descr)>100) SET @Descr = ' ' else SET @Descr= @Descr+char(round(rand() * @w, 0) + @l)
	
	insert into [dbo].Genres([ID_Genre],[Title], [Descr])
	values (@idGenres,@Title, @Descr)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Genres

SET @n = 0;
SET @k = 20;
SET @a = 'À'; 
SET @z = 'ÿ';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idBook int;
declare @TitleBook nvarchar(50);
DECLARE @NatLang NVARCHAR(30);
DECLARE @DATEOFPUBL DATE

while (@n<5000 )
begin
	
	if (@k>80) SET @k=20


	SET @idBook =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	SET @DATEOFPUBL= DATEADD(DAY,CAST(ROUND(RAND() * 1000,0)AS NUMERIC)%366,'04.04.2023')
  
	
	if (len(@TitleBook)>50) SET @Title = ' ' else SET @Title= @Title+char(round(rand() * @w, 0) + @l)
	if (len(@NatLang)>30) SET @Descr = ' ' else SET @Descr= @Descr+char(round(rand() * @w, 0) + @l)
	
	insert into [dbo].Books([ID_Book],[ID_Author],[ID_Genre],[Title], [Native_Language],[Date_Of_Publishing])
	values (@idBook,@idAuthors,@idGenres,@Title, @NatLang,@DATEOFPUBL)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Books


SET @n = 0;
SET @k = 20;
SET @a = 'À'; 
SET @z = 'ÿ';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idPubH int;
declare @TitlePubH nvarchar(30);
DECLARE @RegPlace NVARCHAR(30);
DECLARE @AnnSalesTurn int

while (@n<100 )
begin
	
	if (@k>80) SET @k=20


	SET @idPubH =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	SET @AnnSalesTurn=CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	
  
	
	if (len(@TitlePubH)>30) SET @Title = ' ' else SET @Title= @Title+char(round(rand() * @w, 0) + @l)
	if (len(@RegPlace)>30) SET @Descr = ' ' else SET @Descr= @Descr+char(round(rand() * @w, 0) + @l)
	
	insert into [dbo].Publishing_Houses([ID_Publishing_House],[Title],[Place_Of_Registration],[Annual_Sales_Turnover])
	values (@idPubH,@TitlePubH,@RegPlace,@AnnSalesTurn)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Publishing_Houses

SET @n = 0;
SET @k = 20;
SET @a = 'À'; 
SET @z = 'ÿ';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idLib int;
declare @TitleLib nvarchar(30);
DECLARE @Adress NVARCHAR(50);


while (@n<100 )
begin
	
	if (@k>80) SET @k=20


	SET @idLib =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1

	
  
	
	if (len(@TitleLib)>30) SET @Title = ' ' else SET @Title= @Title+char(round(rand() * @w, 0) + @l)
	if (len(@Adress)>50) SET @Descr = ' ' else SET @Descr= @Descr+char(round(rand() * @w, 0) + @l)
	
	insert into [dbo].Libraries([ID_Library],[Title],[Adress])
	values (@idLib,@TitleLib,@Adress)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Libraries

SET @n = 0;
SET @k = 20;
SET @a = 'À'; 
SET @z = 'ÿ';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idBookEx int;
declare @AmOfPages int;
declare @TypeOfPaper nvarchar(30);
DECLARE @TypeOfBind NVARCHAR(30);

while (@n<10000 )
begin
	
	if (@k>80) SET @k=20


	SET @idBookEx =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	SET @AmOfPages=CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	
  
	
	if (len(@TypeOfPaper)>30) SET @Title = ' ' else SET @Title= @Title+char(round(rand() * @w, 0) + @l)
	if (len(@TypeOfBind)>30) SET @Descr = ' ' else SET @Descr= @Descr+char(round(rand() * @w, 0) + @l)
	
	insert into [dbo].Books_Example([ID_Books_Example],[Amount_Of_Pages],[Type_Of_Paper],[Type_Of_Binding],[ID_Book],[ID_Publishing_House],[ID_Library])
	values (@idBookEx,@AmOfPages,@TypeOfPaper,@TypeOfBind,@idBook,@idPubH,@idLib)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Books_Example

SET @n = 0;
SET @k = 20;
SET @a = 'À'; 
SET @z = 'ÿ';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idReader int;
declare @FullNameRead nvarchar(50);
DECLARE @PhoneNumb NVARCHAR(50);
DECLARE @DateOfBirthReader DATE


while (@n<100 )
begin
	
	if (@k>80) SET @k=20


	SET @idReader =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	
	
  
	
	if (len(@FullNameRead)>50) SET @Title = ' ' else SET @Title= @Title+char(round(rand() * @w, 0) + @l)
	if (len(@PhoneNumb)>50) SET @Descr = ' ' else SET @Descr= @Descr+char(round(rand() * @w, 0) + @l)
	SET @DateOfBirthReader= DATEADD(DAY,CAST(ROUND(RAND() * 1000,0)AS NUMERIC)%366,'04.04.2023')

	insert into [dbo].Reader([ID_Reader],[Full_Name],[Phone_Number],[Date_Of_Birth],[ID_Library])
	values (@idReader,@FullNameRead,@PhoneNumb,@DateOfBirthReader, @idLib)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Reader


SET @n = 0;
SET @k = 20;
SET @a = 'À'; 
SET @z = 'ÿ';
SET @w = ascii(@z) - ascii(@a);
SET @l = ascii(@a);
declare @idREC int;
DECLARE @DateOfT DATE;
DECLARE @DateOfBB DATE;


while (@n<5000)
begin
	
	if (@k>80) SET @k=20

	SET @idREC =CAST(ROUND(RAND() * 100000,0)AS NUMERIC)%20006+1
	
	
	
  
	SET @DateOfT= DATEADD(DAY,CAST(ROUND(RAND() * 1000,0)AS NUMERIC)%366,'04.04.2023')
	SET @DateOfBB= DATEADD(DAY,CAST(ROUND(RAND() * 1000,0)AS NUMERIC)%366,'04.04.2023')

	insert into [dbo].Book_Journal([ID_Record],[ID_Reader],[ID_Books_Example],[Date_Of_Taking],[Date_Of_Bringing_Back])
	values (@idREC,@idReader,@idBookEx,@DateOfT, @DateOfBB)

	SET @n=@n+1
	SET @k=@k+1
end
Select * From Book_Journal
