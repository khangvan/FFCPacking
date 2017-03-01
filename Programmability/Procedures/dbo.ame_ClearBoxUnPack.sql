SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_ClearBoxUnPack]
	@PONumber char(30)=NULL
-- Define code
AS
	set nocount on
	
	delete from tmpBoxUnPack where PONumber=@PONumber
	return
GO