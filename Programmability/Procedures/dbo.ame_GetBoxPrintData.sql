SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetBoxPrintData]
	@PONumber char(20)=NULL,
	@BoxNumber char(7)=NULL
-- Define code
AS
	set nocount on
	select Serial from PackingRecord where PONumber=@PONumber and BoxNumber=@BoxNumber
	return
GO