SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_GetSAPDescription]
	@SAPModel char(30)=NULL
-- Define code
AS
	set nocount on
	declare @result char(200)
	declare @resultMPN char(200)
	select @result=Description from ProductMap where SAPModel=@SAPModel
	if (@result=Null)
	begin
		set @result='NG'
		return
	end
	
	select @result as Result


	select @resultMPN=dbo.ProductMap.MPN from ProductMap where SAPModel=@SAPModel
	if (@resultMPN=Null)
	begin
		set @resultMPN=''
		
	end
	select @resultMPN as MPN
	return
GO