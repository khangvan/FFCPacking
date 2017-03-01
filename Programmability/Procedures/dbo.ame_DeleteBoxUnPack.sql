SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_DeleteBoxUnPack]
	@BoxUnPack nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @PartQuantity int
	exec ame_UnPackRecord @BoxUnPack
	select @PartQuantity=count(*) from PackingRecord where BoxNumber=@BoxUnPack
	delete from PackingRecord where BoxNumber=@BoxUnPack
	select @PartQuantity as PartQuantity
	
	return
GO