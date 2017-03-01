SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_DeleteBoxUnPackApartAll]
	@BoxUnPackApart nchar(20)=NULL
-- Define code
AS
	set nocount on
	exec ame_UnPackApartAllRecord @BoxUnPackApart
	delete from PackingRecord where BoxNumber=@BoxUnPackApart
	update tmpBoxNumber set IsUsing='0',Packed='1' where BoxNumber=@BoxUnPackApart
	return
GO