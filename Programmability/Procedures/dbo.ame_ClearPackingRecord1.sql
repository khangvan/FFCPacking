SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_ClearPackingRecord1]
	@BoxNumber char(20)=NULL
-- Define code
AS
	set nocount on
	delete from tmpPackingRecord where BoxNumber=@BoxNumber
	exec ame_ClearBoxRework @BoxNumber
	return
GO