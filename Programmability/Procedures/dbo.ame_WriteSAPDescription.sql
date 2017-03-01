SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_WriteSAPDescription]
	@SAPModel char(30)=NULL,
	@Description char(200)=NULL
-- Define code
AS
	set nocount on
	declare @result char(20)
	
	update ProductMap set Description=@Description where SAPModel=@SAPModel
	return
GO