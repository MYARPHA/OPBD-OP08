USE [ispp3511]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[ClientUser]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[DeletedCategory]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[DeletedVisitors]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Film]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[GamePrice]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Hall]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Sale]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[Visitor]    Script Date: 14.10.2024 11:36:44 ******/
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
/****** Object:  Table [dbo].[VisitorInfo]    Script Date: 14.10.2024 11:36:44 ******/
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
