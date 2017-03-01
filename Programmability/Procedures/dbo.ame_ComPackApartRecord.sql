SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_ComPackApartRecord]
	@BoxComPackApart nchar(20)=NULL
-- Define code
AS
	declare @Number int
	
	set nocount on
	select @Number=max(ComPackingNo) from ComPackingRecord where BoxNumber=@BoxComPackApart
	if(@Number=null)
		begin
			set @Number=1
		end
	else
		begin
			set @Number=@Number+1
		end
	insert into tmpCR (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear from PackingRecord
		where BoxNumber=@BoxComPackApart
	update tmpCR set ComPackingNo=@Number
	insert into ComPackingRecord (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,ComPackingNo) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,ComPackingNo from tmpCR
	delete from tmpCR
	delete UnPackingParts where Serial in (select Serial from tmpPackingRecord where BoxNumber=@BoxComPackApart)
	return
GO