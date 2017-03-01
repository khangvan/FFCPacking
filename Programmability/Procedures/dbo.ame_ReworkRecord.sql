SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_ReworkRecord]
	@PONumber nchar(20)=NULL,
	@BoxRework nchar(20)=NULL
-- Define code
AS
	declare @Number int
	set nocount on
	select @Number=max(ReworkNo) from ReworkRecord where PONumber=@PONumber and BoxNumber=@BoxRework
	if(@Number=null)
		begin
			set @Number=1
		end
	else
		begin
			set @Number=@Number+1
		end
	insert into tmpRR (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear from PackingRecord
		where PONumber=@PONumber and BoxNumber=	@BoxRework
	update tmpRR set ReworkNo=@Number
	insert into ReworkRecord (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,ReworkNo) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,ReworkNo from tmpRR
	delete from tmpRR
	return
GO