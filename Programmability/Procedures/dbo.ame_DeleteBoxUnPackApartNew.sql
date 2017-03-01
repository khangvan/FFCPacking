SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_DeleteBoxUnPackApartNew]
	@BoxUnPackApart nchar(20)=NULL,
	@BoxUnPackNew nchar(20)=NULL
-- Define code
AS
	set nocount on
	exec ame_UnPackApartNewRecord @BoxUnPackApart,@BoxUnPackNew
--	delete from PackingRecord where BoxNumber=@BoxUnPackApart
	return
GO