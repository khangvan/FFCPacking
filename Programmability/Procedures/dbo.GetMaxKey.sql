SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMaxKey]
	--@maxkey int OUTPUT
AS
BEGIN
DECLARE @maxkey int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT @maxkey=count(sr.IDRPT) from dbo.StationReport sr

select @maxkey+1
END
GO