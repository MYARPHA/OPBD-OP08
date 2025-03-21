USE [ispp3511]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[ClientUser]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[DeletedCategory]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeletedCategory](
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DeletedDate] [datetime2](7) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeletedVisitors]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeletedVisitors](
	[VisitorId] [int] NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BirthDay] [datetime2](7) NULL,
	[Email] [varchar](150) NULL,
	[ChangingDate] [datetime2](7) NOT NULL,
	[DeletedOriginalLogin] [nvarchar](100) NULL,
 CONSTRAINT [PK_DeletedVisitors] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC,
	[ChangingDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 14.10.2024 12:29:50 ******/
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
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 14.10.2024 12:29:50 ******/
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
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GamePrice]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePrice](
	[GameId] [int] NOT NULL,
	[Price] [decimal](16, 2) NOT NULL,
	[ChangingDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_GamePrice] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC,
	[ChangingDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[Hall]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[Sale]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NOT NULL,
	[SaledKeys] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[Visitor]    Script Date: 14.10.2024 12:29:50 ******/
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
/****** Object:  Table [dbo].[VisitorInfo]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorInfo](
	[VisitorId] [int] NOT NULL,
	[Email] [varchar](150) NULL,
	[ChangingDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_VisitorInfo] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC,
	[ChangingDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (1, N'admin', N'Админ')
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (2, N'Смиронов', N'Админ')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Симулятор')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Шутер')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'RPG')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (5, N'')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (1, N'Иванов', N'Клиент')
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (2, N'Петров', N'Клиент')
GO
INSERT [dbo].[DeletedCategory] ([CategoryId], [Name], [DeletedDate], [Login]) VALUES (4, N'arcada', CAST(N'2024-09-30T12:39:49.0433333' AS DateTime2), N'ispp3511')
GO
INSERT [dbo].[DeletedVisitors] ([VisitorId], [PhoneNumber], [Name], [BirthDay], [Email], [ChangingDate], [DeletedOriginalLogin]) VALUES (4, N'8902191424', N'fkbyf', CAST(N'2005-09-12T00:00:00.0000000' AS DateTime2), N'afadeevaa0011@gmail.com', CAST(N'2024-10-01T10:10:59.7833333' AS DateTime2), N'ispp3511')
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (1, N'Собиратель душ ', 90, 2024, N'1990-е годы, штат Орегон. Агент ФБР Ли Харкер, обладающая чем-то вроде дара ясновидения, начинает заниматься глухим делом без единой зацепки.', N'1', N'18', CAST(N'2024-07-25' AS Date), CAST(N'2024-09-25' AS Date), N'Триллер', 0)
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (2, N'Криминальное чтиво', 90, 1994, N'Двое бандитов Винсент Вега и Джулс Винфилд ведут философские беседы в перерывах между разборками и решением проблем с должниками криминального босса Марселласа Уоллеса.', N'1', N'18', CAST(N'2024-07-26' AS Date), CAST(N'2024-10-15' AS Date), N'Детектив', 0)
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (3, N'Убить Билла', 247, 2004, N'В беременную наёмную убийцу по кличке Чёрная Мамба во время бракосочетания стреляет человек по имени Билл. Но голова у женщины оказалась крепкой — пролежав четыре года в коме, бывшая невеста приходит в себя.', N'1', N'18', CAST(N'2024-07-27' AS Date), CAST(N'2024-11-16' AS Date), N'Боевик', 0)
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (4, N'Бойцовский клуб', 139, 1999, N'Сотрудник страховой компании страдает хронической бессонницей и отчаянно пытается вырваться из мучительно скучной жизни. Однажды в очередной командировке он встречает некоего Тайлера Дёрдена — харизматического торговца мылом с извращенной философией', N'1', N'18', CAST(N'2024-07-30' AS Date), CAST(N'2024-12-31' AS Date), N'Боевик', 1)
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (5, N'Леон', 133, 1994, N'Профессиональный убийца Леон неожиданно для себя самого решает помочь 12-летней соседке Матильде, семью которой убили коррумпированные полицейские. ', N'1', N'18', CAST(N'2024-02-12' AS Date), CAST(N'2024-06-15' AS Date), N'Драма', 0)
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (6, N'Мальчик в полосатой пижаме', 94, 2008, N'История, происходящая во время Второй мировой войны и показанная сквозь глаза невинного и ничего не подозревающего о происходящих событиях Бруно, восьмилетнего сына коменданта концентрационного лагеря.', N'1', N'12', CAST(N'2024-05-24' AS Date), CAST(N'2024-10-06' AS Date), N'Драма', 1)
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (7, N'Страх и ненависть в Лас-Вегасе', 118, 1998, N'Два приятеля отправляются в Лас-Вегас. Спортивный обозреватель Рауль Дюк едет осветить знаменитую гонку «Минт 400». Его спутника зовут Доктор Гонзо, и он адвокат. Обзор «Минт 400» из-за непогоды и отсутствия интереса у рецензента оборачивается полным провалом, поэтому Дюк и Гонзо отправляются в казино.', N'1', N'18', CAST(N'2024-06-24' AS Date), CAST(N'2024-08-10' AS Date), N'Комедия', 0)
INSERT [dbo].[Film] ([FilmId], [FilmTitle], [FilmSession], [Date], [Description], [FilmPoster], [AgeRating], [RentalBeginning], [RentalEnd], [Genre], [IsDeleted]) VALUES (8, N'Борат', 84, 2006, N'Сюжет: телеведущий из Казахстана Борат отправляется в США, чтобы сделать репортаж об этой «величайшей в мире стране». Однако по прибытии оказывается, что главная цель его визита — поиски Памелы Андерсон с целью жениться на ней, а вовсе не съёмки документального фильма.', N'1', N'18', CAST(N'2024-07-30' AS Date), CAST(N'2024-10-11' AS Date), NULL, 0)
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (3, 1, N'SimCity', CAST(1501.00 AS Decimal(16, 2)), N'Градостроительный симулятор снова с вами! Создайте город своей мечты', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (4, 2, N'TITANFALL', CAST(2301.00 AS Decimal(16, 2)), N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (5, 2, N'Battlefield 4', CAST(901.40 AS Decimal(16, 2)), N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (6, 1, N'The Sims 4', CAST(1233.00 AS Decimal(16, 2)), N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! 
		Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (7, 3, N'Dark Souls 2', CAST(213132.00 AS Decimal(16, 2)), N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит 
		нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто.', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (8, 3, N'The Elder Scrolls V: Skyrim', CAST(1401.00 AS Decimal(16, 2)), N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, 
		и разгорелся конфликт. К тому же, как предсказывали древние свитки, в мир вернулись жестокие и беспощадные драконы. Теперь будущее Скайрима и всей 
		империи зависит от драконорожденного — человека, в жилах которого течет кровь легендарных существ.', 0)
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
INSERT [dbo].[GamePrice] ([GameId], [Price], [ChangingDate]) VALUES (6, CAST(17.00 AS Decimal(16, 2)), CAST(N'2024-09-30T12:29:42.7333333' AS DateTime2))
INSERT [dbo].[GamePrice] ([GameId], [Price], [ChangingDate]) VALUES (7, CAST(951.00 AS Decimal(16, 2)), CAST(N'2024-09-30T12:29:44.9133333' AS DateTime2))
GO
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Боевик')
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Детектив')
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Драма')
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Комедия')
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Мелодрама')
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Роман')
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Трагикомедия')
INSERT [dbo].[Genre] ([Genre]) VALUES (N'Триллер')
GO
SET IDENTITY_INSERT [dbo].[Hall] ON 

INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (1, 40, 4, N'Мираж', 3, 0)
INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (3, 60, 5, N'Русь', 1, 1)
INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (4, 10, 10, N'Титан-Арена', 10, 0)
SET IDENTITY_INSERT [dbo].[Hall] OFF
GO
INSERT [dbo].[ManagerUser] ([UserId], [Name], [Role]) VALUES (1, N'Федоров', N'Менеджер')
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleId], [Name], [SaledKeys]) VALUES (1, 2, 4)
INSERT [dbo].[Sale] ([SaleId], [Name], [SaledKeys]) VALUES (2, 3, 155)
INSERT [dbo].[Sale] ([SaleId], [Name], [SaledKeys]) VALUES (3, 3, 22)
INSERT [dbo].[Sale] ([SaleId], [Name], [SaledKeys]) VALUES (4, 6, 111)
INSERT [dbo].[Sale] ([SaleId], [Name], [SaledKeys]) VALUES (5, 7, 11)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionId], [Price], [DateTime], [Is3D], [FilmId], [HallId]) VALUES (1, CAST(100 AS Decimal(4, 0)), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 0, 1, 3)
INSERT [dbo].[Session] ([SessionId], [Price], [DateTime], [Is3D], [FilmId], [HallId]) VALUES (2, CAST(200 AS Decimal(4, 0)), CAST(N'2024-09-23T10:04:39.1933333' AS DateTime2), 1, 3, 1)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
INSERT [dbo].[VisitorInfo] ([VisitorId], [Email], [ChangingDate]) VALUES (4, N'afadeevaa011@gmail.com', CAST(N'2024-10-01T09:27:03.6200000' AS DateTime2))
INSERT [dbo].[VisitorInfo] ([VisitorId], [Email], [ChangingDate]) VALUES (4, N'afadeevaa0011@gmail.com', CAST(N'2024-10-01T09:27:33.0900000' AS DateTime2))
INSERT [dbo].[VisitorInfo] ([VisitorId], [Email], [ChangingDate]) VALUES (4, N'afadeevaa0011@gmail.com', CAST(N'2024-10-01T09:29:34.2166667' AS DateTime2))
INSERT [dbo].[VisitorInfo] ([VisitorId], [Email], [ChangingDate]) VALUES (5, N'chtotakoe444@gmail.com', CAST(N'2024-10-01T09:29:34.2166667' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cinema]    Script Date: 14.10.2024 12:29:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Cinema] ON [dbo].[Hall]
(
	[CinemaName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_HallNumber]    Script Date: 14.10.2024 12:29:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_HallNumber] ON [dbo].[Hall]
(
	[HallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_SessionId]    Script Date: 14.10.2024 12:29:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SessionId] ON [dbo].[Session]
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Place]    Script Date: 14.10.2024 12:29:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Place] ON [dbo].[Ticket]
(
	[Place] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Row]    Script Date: 14.10.2024 12:29:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Row] ON [dbo].[Ticket]
(
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VisitorEmail]    Script Date: 14.10.2024 12:29:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VisitorEmail] ON [dbo].[Visitor]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VisitorPhone]    Script Date: 14.10.2024 12:29:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VisitorPhone] ON [dbo].[Visitor]
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeletedVisitors] ADD  DEFAULT (getdate()) FOR [ChangingDate]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_FilmSession]  DEFAULT ((90)) FOR [FilmSession]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_Date]  DEFAULT (datepart(year,getdate())) FOR [Date]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Game] ADD  CONSTRAINT [DF_Game_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GamePrice] ADD  DEFAULT (getdate()) FOR [ChangingDate]
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
ALTER TABLE [dbo].[VisitorInfo] ADD  DEFAULT (getdate()) FOR [ChangingDate]
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
/****** Object:  Trigger [dbo].[trSaveCategory]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trSaveCategory]
ON [dbo].[Category]
AFTER DELETE
AS
BEGIN
		INSERT INTO DeletedCategory(CategoryId, Name,DeletedDate, Login)
		SELECT CategoryId, Name, GetDate(), ORIGINAL_LOGIN()
		FROM deleted;
END;
GO
ALTER TABLE [dbo].[Category] ENABLE TRIGGER [trSaveCategory]
GO
/****** Object:  Trigger [dbo].[trDeletedFilm]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trDeletedFilm]
ON [dbo].[Film]
INSTEAD OF DELETE
AS
BEGIN
	UPDATE Film
	SET IsDeleted = 1
	WHERE FilmId IN (SELECT FilmId FROM deleted)
END;
GO
ALTER TABLE [dbo].[Film] ENABLE TRIGGER [trDeletedFilm]
GO
/****** Object:  Trigger [dbo].[trChangedGamesCount]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trChangedGamesCount]
ON [dbo].[Game]
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    PRINT CONCAT_WS(' ', 'Изменено строк:',
	@@ROWCOUNT)
END
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [trChangedGamesCount]
GO
/****** Object:  Trigger [dbo].[trDeletedGame]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trDeletedGame]
ON [dbo].[Game]
INSTEAD OF DELETE
AS
BEGIN
		UPDATE Game 
		SET IsDeleted = 1
		WHERE GameId IN (SELECT GameId 
							FROM deleted)
END;
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [trDeletedGame]
GO
/****** Object:  Trigger [dbo].[trSavePrice]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trSavePrice]
ON [dbo].[Game]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Price)
		INSERT INTO GamePrice(GameId, Price)
		SELECT GameId, Price
		FROM deleted;
END;
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [trSavePrice]
GO
/****** Object:  Trigger [dbo].[trSaveEmail]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trSaveEmail]
ON [dbo].[Visitor]
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
GO
ALTER TABLE [dbo].[Visitor] ENABLE TRIGGER [trSaveEmail]
GO
/****** Object:  Trigger [dbo].[trSaveVisitor]    Script Date: 14.10.2024 12:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trSaveVisitor]
ON [dbo].[Visitor]
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
GO
ALTER TABLE [dbo].[Visitor] ENABLE TRIGGER [trSaveVisitor]
GO
