USE [ispp3511]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 14.10.2024 11:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory] 
    @name NVARCHAR(100),
    @id INT OUTPUT 
AS
BEGIN
    INSERT INTO Category(name) VALUES(@name);
	SET @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddCinema]    Script Date: 14.10.2024 11:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCinema]
	@cinema NVARCHAR(50)='Титан-Арена',
	@hallNumber tinyint,
	@seatsAmount tinyint,
	@rowsAmount tinyint
AS
	INSERT INTO dbo.Hall
		(CinemaName,
		HallNumber,
		RowsAmount,
		RowPlaceAmount)
	VALUES
		(@cinema,
		@hallNumber,
		@seatsAmount,
		@rowsAmount)
GO
