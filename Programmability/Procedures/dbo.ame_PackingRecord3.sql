SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO


CREATE   PROCEDURE [dbo].[ame_PackingRecord3]
	@BoxNumber nchar(20)=NULL
-- Define code
AS
	set nocount on

	update tmpBoxNumber set IsUsing='0',Packed='1' where BoxNumber=@BoxNumber

	return


GO