USE [ispp3511]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'games1000'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'games1000'
GO
/****** Object:  StoredProcedure [dbo].[AddCinema]    Script Date: 30.09.2024 11:28:23 ******/
DROP PROCEDURE [dbo].[AddCinema]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 30.09.2024 11:28:23 ******/
DROP PROCEDURE [dbo].[AddCategory]
GO
ALTER TABLE [dbo].[ManagerUser] DROP CONSTRAINT [CK_ManagerUser]
GO
ALTER TABLE [dbo].[ClientUser] DROP CONSTRAINT [CK_ClientUser]
GO
ALTER TABLE [dbo].[AdminUser] DROP CONSTRAINT [CK_AdminUser]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FKVisitorId]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_Ticket_Session]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [FKHallId]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [FKFilmID]
GO
ALTER TABLE [dbo].[Game] DROP CONSTRAINT [FK_Games_Categories]
GO
ALTER TABLE [dbo].[Film] DROP CONSTRAINT [FK_Film_Genre]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF_Session_3D]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF_Session_DateTime]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF_Session_Price]
GO
ALTER TABLE [dbo].[Hall] DROP CONSTRAINT [DF_Hall_VIP]
GO
ALTER TABLE [dbo].[Hall] DROP CONSTRAINT [DF_Hall_CinemaName]
GO
ALTER TABLE [dbo].[Film] DROP CONSTRAINT [DF_Film_Date]
GO
ALTER TABLE [dbo].[Film] DROP CONSTRAINT [DF_Film_FilmSession]
GO
/****** Object:  Index [UQ_VisitorPhone]    Script Date: 30.09.2024 11:28:23 ******/
DROP INDEX [UQ_VisitorPhone] ON [dbo].[Visitor]
GO
/****** Object:  Index [UQ_VisitorEmail]    Script Date: 30.09.2024 11:28:23 ******/
DROP INDEX [UQ_VisitorEmail] ON [dbo].[Visitor]
GO
/****** Object:  Index [UQ_Row]    Script Date: 30.09.2024 11:28:23 ******/
DROP INDEX [UQ_Row] ON [dbo].[Ticket]
GO
/****** Object:  Index [UQ_Place]    Script Date: 30.09.2024 11:28:23 ******/
DROP INDEX [UQ_Place] ON [dbo].[Ticket]
GO
/****** Object:  Index [UQ_SessionId]    Script Date: 30.09.2024 11:28:23 ******/
DROP INDEX [UQ_SessionId] ON [dbo].[Session]
GO
/****** Object:  Index [UQ_HallNumber]    Script Date: 30.09.2024 11:28:23 ******/
DROP INDEX [UQ_HallNumber] ON [dbo].[Hall]
GO
/****** Object:  Index [UQ_Cinema]    Script Date: 30.09.2024 11:28:23 ******/
DROP INDEX [UQ_Cinema] ON [dbo].[Hall]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Visitor]') AND type in (N'U'))
DROP TABLE [dbo].[Visitor]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
DROP TABLE [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genre]') AND type in (N'U'))
DROP TABLE [dbo].[Genre]
GO
/****** Object:  View [dbo].[UsersView]    Script Date: 30.09.2024 11:28:23 ******/
DROP VIEW [dbo].[UsersView]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminUser]') AND type in (N'U'))
DROP TABLE [dbo].[AdminUser]
GO
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ManagerUser]') AND type in (N'U'))
DROP TABLE [dbo].[ManagerUser]
GO
/****** Object:  Table [dbo].[ClientUser]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientUser]') AND type in (N'U'))
DROP TABLE [dbo].[ClientUser]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 30.09.2024 11:28:23 ******/
DROP VIEW [dbo].[View_1]
GO
/****** Object:  View [dbo].[games1000]    Script Date: 30.09.2024 11:28:23 ******/
DROP VIEW [dbo].[games1000]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGamesByCategory]    Script Date: 30.09.2024 11:28:23 ******/
DROP FUNCTION [dbo].[GetGamesByCategory]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
DROP TABLE [dbo].[Game]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 30.09.2024 11:28:23 ******/
DROP VIEW [dbo].[View_2]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hall]') AND type in (N'U'))
DROP TABLE [dbo].[Hall]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 30.09.2024 11:28:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Film]') AND type in (N'U'))
DROP TABLE [dbo].[Film]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTicketPrice]    Script Date: 30.09.2024 11:28:23 ******/
DROP FUNCTION [dbo].[GetTicketPrice]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSum]    Script Date: 30.09.2024 11:28:23 ******/
DROP FUNCTION [dbo].[GetSum]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 30.09.2024 11:28:23 ******/
DROP FUNCTION [dbo].[GetAvgPrice]
GO
USE [master]
GO
/****** Object:  Database [ispp3511]    Script Date: 30.09.2024 11:28:23 ******/
DROP DATABASE [ispp3511] --удлаить drop,create,update
GO
/****** Object:  Database [ispp3511]    Script Date: 30.09.2024 11:28:23 ******/
CREATE DATABASE [ispp3511]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ispp3511', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ispp3511.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ispp3511_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ispp3511_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ispp3511] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ispp3511].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ispp3511] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ispp3511] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ispp3511] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ispp3511] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ispp3511] SET ARITHABORT OFF 
GO
ALTER DATABASE [ispp3511] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ispp3511] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ispp3511] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ispp3511] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ispp3511] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ispp3511] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ispp3511] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ispp3511] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ispp3511] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ispp3511] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ispp3511] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ispp3511] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ispp3511] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ispp3511] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ispp3511] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ispp3511] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ispp3511] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ispp3511] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ispp3511] SET  MULTI_USER 
GO
ALTER DATABASE [ispp3511] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ispp3511] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ispp3511] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ispp3511] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ispp3511] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ispp3511] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ispp3511] SET QUERY_STORE = OFF
GO
USE [ispp3511]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 30.09.2024 11:28:24 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetSum]    Script Date: 30.09.2024 11:28:24 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetTicketPrice]    Script Date: 30.09.2024 11:28:24 ******/
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
/****** Object:  Table [dbo].[Film]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[FilmId] [int] IDENTITY(1,1) NOT NULL,
	[FilmTitle] [nvarchar](100) NOT NULL,
	[FilmSession] [smallint] NOT NULL,
	[Date] [smallint] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[FilmPoster] [varchar](max) NULL,
	[AgeRating] [varchar](10) NULL,
	[RentalBeginning] [date] NULL,
	[RentalEnd] [date] NULL,
	[Genre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hall](
	[HallId] [tinyint] IDENTITY(1,1) NOT NULL,
	[RowPlaceAmount] [tinyint] NOT NULL,
	[RowsAmount] [tinyint] NOT NULL,
	[CinemaName] [nvarchar](50) NOT NULL,
	[HallNumber] [tinyint] NOT NULL,
	[IsVIP] [bit] NOT NULL,
 CONSTRAINT [PK_Hall] PRIMARY KEY CLUSTERED 
(
	[HallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](4, 0) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Is3D] [bit] NOT NULL,
	[FilmId] [int] NOT NULL,
	[HallId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        CAST(dbo.Hall.RowPlaceAmount AS int) AS Expr1
FROM            dbo.Film INNER JOIN
                         dbo.Session ON dbo.Film.FilmId = dbo.Session.FilmId INNER JOIN
                         dbo.Hall ON dbo.Session.HallId = dbo.Hall.HallId
GO
/****** Object:  Table [dbo].[Category]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](16, 2) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGamesByCategory]    Script Date: 30.09.2024 11:28:24 ******/
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
/****** Object:  View [dbo].[games1000]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[games1000]
WITH  VIEW_METADATA
AS
SELECT        GameId, CategoryId, Name, Price, Description
FROM            dbo.Game
WHERE        (Price < 1000)
WITH CHECK OPTION
GO
/****** Object:  View [dbo].[View_1]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Game.Price, dbo.Game.Name AS Category, dbo.Game.GameId, dbo.Category.Name
FROM            dbo.Category INNER JOIN
                         dbo.Game ON dbo.Category.CategoryId = dbo.Game.CategoryId
WHERE        (dbo.Category.Name = N'RPG')
GO
/****** Object:  Table [dbo].[ClientUser]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientUser](
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__ClientUs__1788CC4C57693DE4] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerUser](
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__Managern__1788CC4CCA9C90E6] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__AdminUse__1788CC4CB227E0AC] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UsersView]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UsersView]
AS
SELECT *
FROM AdminUser
UNION ALL
SELECT *
FROM ClientUser
UNION ALL
SELECT *
FROM ManagerUser

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Genre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genre_1] PRIMARY KEY CLUSTERED 
(
	[Genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[Place] [tinyint] NOT NULL,
	[Row] [tinyint] NOT NULL,
	[SessionId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 30.09.2024 11:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BirthDay] [datetime2](7) NULL,
	[Email] [varchar](150) NULL,
 CONSTRAINT [PK_Visitor] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (1, N'admin', N'Админ')
GO
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (2, N'Смиронов', N'Админ')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Симулятор')
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Шутер')
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'RPG')
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'arcada')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (1, N'Иванов', N'Клиент')
GO
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (2, N'Петров', N'Клиент')
GO
SET IDENTITY_INSERT [dbo].[Film] ON 
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (1, N'Собиратель душ ', 90, 2024, N'1990-е годы, штат Орегон. Агент ФБР Ли Харкер, обладающая чем-то вроде дара ясновидения, начинает заниматься глухим делом без единой зацепки.', N'1', N'18', CAST(N'2024-07-25' AS Date), CAST(N'2024-09-25' AS Date), N'Триллер')
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (2, N'Криминальное чтиво', 90, 1994, N'Двое бандитов Винсент Вега и Джулс Винфилд ведут философские беседы в перерывах между разборками и решением проблем с должниками криминального босса Марселласа Уоллеса.', N'1', N'18', CAST(N'2024-07-26' AS Date), CAST(N'2024-10-15' AS Date), N'Детектив')
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (3, N'Убить Билла', 247, 2004, N'В беременную наёмную убийцу по кличке Чёрная Мамба во время бракосочетания стреляет человек по имени Билл. Но голова у женщины оказалась крепкой — пролежав четыре года в коме, бывшая невеста приходит в себя.', N'1', N'18', CAST(N'2024-07-27' AS Date), CAST(N'2024-11-16' AS Date), N'Боевик')
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (4, N'Бойцовский клуб', 139, 1999, N'Сотрудник страховой компании страдает хронической бессонницей и отчаянно пытается вырваться из мучительно скучной жизни. Однажды в очередной командировке он встречает некоего Тайлера Дёрдена — харизматического торговца мылом с извращенной философией', N'1', N'18', CAST(N'2024-07-30' AS Date), CAST(N'2024-12-31' AS Date), N'Боевик')
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (5, N'Леон', 133, 1994, N'Профессиональный убийца Леон неожиданно для себя самого решает помочь 12-летней соседке Матильде, семью которой убили коррумпированные полицейские. ', N'1', N'18', CAST(N'2024-02-12' AS Date), CAST(N'2024-06-15' AS Date), N'Драма')
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (6, N'Мальчик в полосатой пижаме', 94, 2008, N'История, происходящая во время Второй мировой войны и показанная сквозь глаза невинного и ничего не подозревающего о происходящих событиях Бруно, восьмилетнего сына коменданта концентрационного лагеря.', N'1', N'12', CAST(N'2024-05-24' AS Date), CAST(N'2024-10-06' AS Date), N'Драма')
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (7, N'Страх и ненависть в Лас-Вегасе', 118, 1998, N'Два приятеля отправляются в Лас-Вегас. Спортивный обозреватель Рауль Дюк едет осветить знаменитую гонку «Минт 400». Его спутника зовут Доктор Гонзо, и он адвокат. Обзор «Минт 400» из-за непогоды и отсутствия интереса у рецензента оборачивается полным провалом, поэтому Дюк и Гонзо отправляются в казино.', N'1', N'18', CAST(N'2024-06-24' AS Date), CAST(N'2024-08-10' AS Date), N'Комедия')
GO
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre]) VALUES (8, N'Борат', 84, 2006, N'Сюжет: телеведущий из Казахстана Борат отправляется в США, чтобы сделать репортаж об этой «величайшей в мире стране». Однако по прибытии оказывается, что главная цель его визита — поиски Памелы Андерсон с целью жениться на ней, а вовсе не съёмки документального фильма.', N'1', N'18', CAST(N'2024-07-30' AS Date), CAST(N'2024-10-11' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
SET IDENTITY_INSERT [dbo].[Game] ON 
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (3, 1, N'SimCity', CAST(1499.00 AS Decimal(16, 2)), N'Градостроительный симулятор снова с вами! Создайте город своей мечты')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (4, 2, N'TITANFALL', CAST(2299.00 AS Decimal(16, 2)), N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (5, 2, N'Battlefield 4', CAST(899.40 AS Decimal(16, 2)), N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (6, 1, N'The Sims 4', CAST(15.00 AS Decimal(16, 2)), N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! 
		Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (7, 3, N'Dark Souls 2', CAST(949.00 AS Decimal(16, 2)), N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит 
		нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто.')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (8, 3, N'The Elder Scrolls V: Skyrim', CAST(1399.00 AS Decimal(16, 2)), N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, 
		и разгорелся конфликт. К тому же, как предсказывали древние свитки, в мир вернулись жестокие и беспощадные драконы. Теперь будущее Скайрима и всей 
		империи зависит от драконорожденного — человека, в жилах которого течет кровь легендарных существ.')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (9, 1, N'FIFA 14', CAST(699.00 AS Decimal(16, 2)), N'Достоверный, красивый, эмоциональный футбол! Проверенный временем геймплей FIFA стал ещё лучше благодаря инновациям, поощряющим творческую игру в
		 центре поля и позволяющим задавать её темп.')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (10, 1, N'Need for Speed Rivals', CAST(1000.00 AS Decimal(16, 2)), N'Забудьте про стандартные режимы игры. Сотрите грань между одиночным и многопользовательским режимом в постоянном соперничестве 
		между гонщиками и полицией. Свободно войдите в мир, в котором ваши друзья уже участвуют в гонках и погонях. ')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (11, 2, N'Crysis 3', CAST(1299.00 AS Decimal(16, 2)), N'Действие игры разворачивается в 2047 году, а вам предстоит выступить в роли Пророка.')
GO
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (12, 2, N'Dead Space 3', CAST(499.00 AS Decimal(16, 2)), N'В Dead Space 3 Айзек Кларк и суровый солдат Джон Карвер отправляются в космическое путешествие, чтобы узнать о происхождении некроморфов.')
GO
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Боевик')
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Детектив')
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Драма')
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Комедия')
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Мелодрама')
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Роман')
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Трагикомедия')
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Триллер')
GO
SET IDENTITY_INSERT [dbo].[Hall] ON 
GO
INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (1, 40, 4, N'Мираж', 3, 0)
GO
INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (3, 60, 5, N'Русь', 1, 1)
GO
INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (4, 10, 10, N'Титан-Арена', 10, 0)
GO
SET IDENTITY_INSERT [dbo].[Hall] OFF
GO
INSERT [dbo].[ManagerUser] ([UserId], [Name], [Role]) VALUES (1, N'Федоров', N'Менеджер')
GO
SET IDENTITY_INSERT [dbo].[Session] ON 
GO
INSERT [dbo].[Session] ([SessionId], [Price], [DateTime], [Is3D], [FilmId], [HallId]) VALUES (1, CAST(100 AS Decimal(4, 0)), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 0, 1, 3)
GO
INSERT [dbo].[Session] ([SessionId], [Price], [DateTime], [Is3D], [FilmId], [HallId]) VALUES (2, CAST(200 AS Decimal(4, 0)), CAST(N'2024-09-23T10:04:39.1933333' AS DateTime2), 1, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cinema]    Script Date: 30.09.2024 11:28:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Cinema] ON [dbo].[Hall]
(
	[CinemaName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_HallNumber]    Script Date: 30.09.2024 11:28:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_HallNumber] ON [dbo].[Hall]
(
	[HallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_SessionId]    Script Date: 30.09.2024 11:28:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SessionId] ON [dbo].[Session]
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Place]    Script Date: 30.09.2024 11:28:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Place] ON [dbo].[Ticket]
(
	[Place] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Row]    Script Date: 30.09.2024 11:28:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Row] ON [dbo].[Ticket]
(
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VisitorEmail]    Script Date: 30.09.2024 11:28:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VisitorEmail] ON [dbo].[Visitor]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VisitorPhone]    Script Date: 30.09.2024 11:28:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VisitorPhone] ON [dbo].[Visitor]
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_FilmSession]  DEFAULT ((90)) FOR [FilmSession]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_Date]  DEFAULT (datepart(year,getdate())) FOR [Date]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_CinemaName]  DEFAULT (N'Макси') FOR [CinemaName]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_VIP]  DEFAULT ((0)) FOR [IsVIP]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Price]  DEFAULT ((200)) FOR [Price]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_3D]  DEFAULT ((0)) FOR [Is3D]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Genre] FOREIGN KEY([Genre])
REFERENCES [dbo].[Genre] ([Genre])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Genre]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Games_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Games_Categories]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FKFilmID] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Film] ([FilmId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FKFilmID]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FKHallId] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FKHallId]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Session]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FKVisitorId] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[Visitor] ([VisitorId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FKVisitorId]
GO
ALTER TABLE [dbo].[AdminUser]  WITH CHECK ADD  CONSTRAINT [CK_AdminUser] CHECK  (([Role]='Админ'))
GO
ALTER TABLE [dbo].[AdminUser] CHECK CONSTRAINT [CK_AdminUser]
GO
ALTER TABLE [dbo].[ClientUser]  WITH CHECK ADD  CONSTRAINT [CK_ClientUser] CHECK  (([Role]='Клиент'))
GO
ALTER TABLE [dbo].[ClientUser] CHECK CONSTRAINT [CK_ClientUser]
GO
ALTER TABLE [dbo].[ManagerUser]  WITH CHECK ADD  CONSTRAINT [CK_ManagerUser] CHECK  (([Role]='Менеджер'))
GO
ALTER TABLE [dbo].[ManagerUser] CHECK CONSTRAINT [CK_ManagerUser]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 30.09.2024 11:28:24 ******/
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
/****** Object:  StoredProcedure [dbo].[AddCinema]    Script Date: 30.09.2024 11:28:24 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Game"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'games1000'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'games1000'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Category"
            Begin Extent = 
               Top = 24
               Left = 21
               Bottom = 120
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Game"
            Begin Extent = 
               Top = 10
               Left = 385
               Bottom = 140
               Right = 559
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Session"
            Begin Extent = 
               Top = 87
               Left = 286
               Bottom = 299
               Right = 473
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Hall"
            Begin Extent = 
               Top = 80
               Left = 507
               Bottom = 286
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Film"
            Begin Extent = 
               Top = 65
               Left = 32
               Bottom = 292
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
USE [master]
GO
ALTER DATABASE [ispp3511] SET  READ_WRITE 
GO
