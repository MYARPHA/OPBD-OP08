USE [ispp3511]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 14.10.2024 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- средняя цена игры по категории
CREATE FUNCTION [dbo].[GetAvgPrice]
(
	@idCategory INT
)
RETURNS DECIMAL(16,2)
AS
BEGIN
	DECLARE @avgPrice DECIMAL(16,2);

	SET @avgPrice = (SELECT AVG(Price)
						FROM Game
						WHERE @idCategory = CategoryId);

	RETURN @avgPrice;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetSum]    Script Date: 14.10.2024 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- 1
SELECT имяФункции(параметры); -- SELECT GetDate();

-- 2
SET имяПеременной = имяФункции(параметры);

-- 3
SELECT имяФункции(имяСтолбца)
FROM ...;

SELECT Name, Price, ROUND(Price, -2)
FROM Game;

SELECT...
FROM имяФункции(параметры);
*/
-- сумма двух чисел
CREATE FUNCTION [dbo].[GetSum]
(
	@a INT,
	@b INT = 1 -- значение по умолчанию
)
RETURNS INT
AS
BEGIN
	RETURN @a+@b;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetTicketPrice]    Script Date: 14.10.2024 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTicketPrice]
(
	@sessionId INT,
	@visitorId INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
	DECLARE @ticketCheck DECIMAL(10, 2)

SELECT @ticketCheck = Price
FROM Session
WHERE SessionId = @sessionId

RETURN @ticketCheck
END


GO
/****** Object:  UserDefinedFunction [dbo].[GetGamesByCategory]    Script Date: 14.10.2024 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- список игр по категории
CREATE FUNCTION [dbo].[GetGamesByCategory]
(
	@name NVARCHAR(100)
)
RETURNS TABLE 
AS
	RETURN 
	(
		SELECT Game.*
		FROM Game JOIN Category ON Game.CategoryId=Category.CategoryId
		WHERE Category.Name = @name
	)

GO
