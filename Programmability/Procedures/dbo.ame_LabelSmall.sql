SET QUOTED_IDENTIFIER ON

SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_LabelSmall]
	@Model char(30)=NULL

-- Define code
AS
	set nocount on
	declare @result char(30)

	set @result='NG'
	if exists(select SAPModel from LabelSmall where SAPModel=@Model)
	begin
		set @result='OK'
	end

	select @result as Result
	return
GO