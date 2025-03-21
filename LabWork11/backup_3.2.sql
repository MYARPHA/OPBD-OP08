USE [ispp3511]
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
SET IDENTITY_INSERT [dbo].[Hall] ON 

INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (1, 40, 4, N'Мираж', 3, 0)
INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (3, 60, 5, N'Русь', 1, 1)
INSERT [dbo].[Hall] ([HallId], [RowPlaceAmount], [RowsAmount], [CinemaName], [HallNumber], [IsVIP]) VALUES (4, 10, 10, N'Титан-Арена', 10, 0)
SET IDENTITY_INSERT [dbo].[Hall] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionId], [Price], [DateTime], [Is3D], [FilmId], [HallId]) VALUES (1, CAST(100 AS Decimal(4, 0)), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 0, 1, 3)
INSERT [dbo].[Session] ([SessionId], [Price], [DateTime], [Is3D], [FilmId], [HallId]) VALUES (2, CAST(200 AS Decimal(4, 0)), CAST(N'2024-09-23T10:04:39.1933333' AS DateTime2), 1, 3, 1)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
