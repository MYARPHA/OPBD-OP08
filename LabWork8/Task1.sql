ALTER PROCEDURE dbo.AddCinema
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

EXEC AddCinema DEFAULT, 10, 10, 10