SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DoUpdateStation]
	
	@StationName nchar(30),
       @IP nchar(30),
       @PPVersion nchar(30),
       @StartUpPath nchar(200),
       @StartUpTime nchar(30),
       @Status nchar(30),
	   @idkey int
AS
BEGIN

	SET NOCOUNT ON;

   INSERT dbo.StationReport
   (
       --IDRPT - this column value is auto-generated
       StationName,
       IP,
       PPVersion,
       StartUpPath,
       StartUpTime,
       Status,
	   idkey
   )
   VALUES
   (
       -- IDRPT - int
     @StationName ,
       @IP ,
       @PPVersion ,
       @StartUpPath,
       @StartUpTime ,
       @Status,
	   @idkey
   )
END
GO