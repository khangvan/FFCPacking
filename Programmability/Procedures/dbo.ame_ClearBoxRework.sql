SET QUOTED_IDENTIFIER ON

SET ANSI_NULLS OFF
GO

CREATE  PROCEDURE [dbo].[ame_ClearBoxRework]
	@BoxNumber char(30)=NULL
-- Define code
AS
	set nocount on
	
	delete from tmpBoxRework where BoxNumber=@BoxNumber
	return

GO