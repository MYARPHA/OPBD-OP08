USE [ispp3511]
GO
/****** Object:  User [user1]    Script Date: 14.10.2024 11:39:58 ******/
CREATE USER [user1] FOR LOGIN [login1] WITH DEFAULT_SCHEMA=[user1]
GO
/****** Object:  User [user2]    Script Date: 14.10.2024 11:39:58 ******/
CREATE USER [user2] FOR LOGIN [login2] WITH DEFAULT_SCHEMA=[user2]
GO
/****** Object:  User [user3]    Script Date: 14.10.2024 11:39:58 ******/
CREATE USER [user3] FOR LOGIN [login3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user4]    Script Date: 14.10.2024 11:39:58 ******/
CREATE USER [user4] FOR LOGIN [login4] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user2]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [user2]
GO
