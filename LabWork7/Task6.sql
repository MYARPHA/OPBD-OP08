-- Задание 6
CREATE FUNCTION GetFilmByGenre
(
	@genreName NVARCHAR(50)
)
RETURNS TABLE
AS
	RETURN
	(
		SELECT Film.FilmId, Film.FilmTitle, Film.FilmSession, Film.Genre
		FROM Film
		WHERE Genre LIKE @genreName
	)



