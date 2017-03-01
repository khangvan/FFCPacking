SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_ClearBoxNumber]
	@boxNumber char(30)=NULL
-- Define code
AS
	set nocount on
	
	update tmpBoxNumber set IsUsing='0' where BoxNumber=@boxNumber
	return
GO