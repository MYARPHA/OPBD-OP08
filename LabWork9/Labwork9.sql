--задание 1--
CREATE TABLE VisitorInfo 
(
	[VisitorId] [int] NOT NULL,
	[Email] [varchar](150) NULL,
	ChangingDate DATETIME2 DEFAULT GetDate()
 CONSTRAINT [PK_VisitorInfo] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC,
	[ChangingDate] ASC
)
)

ALTER TRIGGER trSaveEmail
ON Visitor
AFTER UPDATE
AS
BEGIN
	IF UPDATE(Email)
	INSERT INTO VisitorInfo
	(
		VisitorId, Email
	)
	SELECT VisitorId, Email
	FROM deleted
END;


--Задание 2--
CREATE TRIGGER trDeletedFilm
ON Film
INSTEAD OF DELETE
AS
BEGIN
	UPDATE Film
	SET IsDeleted = 1
	WHERE FilmId IN (SELECT FilmId FROM deleted)
END;


--Задание 3--
CREATE TABLE DeletedVisitors
(
	[VisitorId] [int] NOT NULL,
	PhoneNumber CHAR(10) NOT NULL,
	Name NVARCHAR(50),
	BirthDay DATETIME2(7),
	[Email] [varchar](150) NULL,
	ChangingDate DATETIME2 DEFAULT GetDate()

 CONSTRAINT [PK_DeletedVisitors] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC,
	[ChangingDate] ASC
)
)

CREATE TRIGGER trSaveVisitor
ON Visitor
AFTER DELETE
AS
BEGIN
	INSERT INTO DeletedVisitors
	(
		VisitorId, Name, PhoneNumber, BirthDay, Email, ChangingDate, DeletedOriginalLogin
	)
	SELECT VisitorId, Name, PhoneNumber, BirthDay, Email, GetDate(), ORIGINAL_LOGIN()
	FROM deleted;
END;