SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddTicket
	@phoneNumber CHAR(10),
	@sessionId INT,
	@seatsNumber tinyint,
	@rowNumber tinyint
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
END
GO
