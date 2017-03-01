SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_CheckBoxExist]
	@BoxNumber nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result nchar(20)
	declare @PONumber nchar(20)
	if exists(select BoxNumber from PackingRecord where BoxNumber=@BoxNumber)
	begin
		set @result='OK'
		select @PONumber=PONumber from PackingRecord where BoxNumber=@BoxNumber
	end
	else
	begin
		set @result='NG'
		set @PONumber='N/A'
	end
	select @result as Result
	select @PONumber as PONumber
	return
GO