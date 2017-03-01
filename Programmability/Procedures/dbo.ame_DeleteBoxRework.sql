SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_DeleteBoxRework]
	@PONumber nchar(20)=NULL,
	@BoxRework nchar(20)=NULL
-- Define code
AS
	set nocount on
	exec ame_ReworkRecord @PONumber,@BoxRework
	delete from PackingRecord where PONumber=@PONumber and BoxNumber=@BoxRework
	return
GO