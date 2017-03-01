SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_DeleteBoxNewPack]
	@BoxNewPack nchar(20)=NULL
-- Define code
AS
	set nocount on
	delete UnPackingParts where Serial in (select Serial from tmpPackingRecord where BoxNumber=@BoxNewPack)
	return
GO