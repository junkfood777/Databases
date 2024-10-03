SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET ARITHABORT ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

CREATE VIEW dbo.vw_AuthorGenreBookCount
WITH SCHEMABINDING
AS
SELECT 
    a.ID_Author,
    a.Full_Name,
    g.ID_Genre,
    g.Title AS Genre_Title,
    COUNT_BIG(*) AS Book_Count
FROM 
    dbo.Authors AS a
    INNER JOIN dbo.Books AS b ON a.ID_Author = b.ID_Author
    INNER JOIN dbo.Genres AS g ON b.ID_Genre = g.ID_Genre
GROUP BY 
    a.ID_Author,
    a.Full_Name,
    g.ID_Genre,
    g.Title;
GO
