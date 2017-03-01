SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetDateTime]
	
-- Define code
AS
	set nocount on
	declare @result char(20)
	
	set @result=convert(char(20),getdate(),106)
	
	select @result as Result
	return
GO