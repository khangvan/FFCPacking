﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DoCloseStation]
	
	
       @idkey int
     
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE dbo.StationReport
	SET
	 	    dbo.StationReport.Status = N'End' -- nchar
			WHERE idkey = @idkey

END
GO