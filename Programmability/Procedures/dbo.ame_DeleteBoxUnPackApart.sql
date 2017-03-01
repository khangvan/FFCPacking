SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_DeleteBoxUnPackApart]
	@BoxUnPackApart nchar(20)=NULL
-- Define code
AS
	set nocount on
	exec ame_UnPackApartRecord @BoxUnPackApart
	delete from PackingRecord where BoxNumber=@BoxUnPackApart
	return
GO