SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_DeleteBoxComPackApart]
	@BoxComPackApart nchar(20)=NULL
-- Define code
AS
	set nocount on
	exec ame_ComPackApartRecord @BoxComPackApart
	--delete from PackingRecord where BoxNumber=@BoxComPackApart
	return
GO