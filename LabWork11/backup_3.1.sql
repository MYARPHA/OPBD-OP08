USE [ispp3511]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 14.10.2024 11:45:49 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 14.10.2024 11:45:49 ******/
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
/****** Object:  Table [dbo].[Hall]    Script Date: 14.10.2024 11:45:49 ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 14.10.2024 11:45:49 ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14.10.2024 11:45:49 ******/
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
/****** Object:  Table [dbo].[Visitor]    Script Date: 14.10.2024 11:45:49 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cinema]    Script Date: 14.10.2024 11:45:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Cinema] ON [dbo].[Hall]
(
	[CinemaName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_HallNumber]    Script Date: 14.10.2024 11:45:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_HallNumber] ON [dbo].[Hall]
(
	[HallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_SessionId]    Script Date: 14.10.2024 11:45:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SessionId] ON [dbo].[Session]
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Place]    Script Date: 14.10.2024 11:45:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Place] ON [dbo].[Ticket]
(
	[Place] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Row]    Script Date: 14.10.2024 11:45:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Row] ON [dbo].[Ticket]
(
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VisitorEmail]    Script Date: 14.10.2024 11:45:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VisitorEmail] ON [dbo].[Visitor]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VisitorPhone]    Script Date: 14.10.2024 11:45:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_VisitorPhone] ON [dbo].[Visitor]
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_FilmSession]  DEFAULT ((90)) FOR [FilmSession]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_Date]  DEFAULT (datepart(year,getdate())) FOR [Date]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
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
/****** Object:  Trigger [dbo].[trDeletedFilm]    Script Date: 14.10.2024 11:45:49 ******/
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
/****** Object:  Trigger [dbo].[trSaveEmail]    Script Date: 14.10.2024 11:45:49 ******/
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
/****** Object:  Trigger [dbo].[trSaveVisitor]    Script Date: 14.10.2024 11:45:49 ******/
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
