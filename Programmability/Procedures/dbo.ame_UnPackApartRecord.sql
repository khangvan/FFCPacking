SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_UnPackApartRecord]
	@BoxUnPackApart nchar(20)=NULL
-- Define code
AS
	declare @Number int
	
	set nocount on
	select @Number=max(UnPackingNo) from UnPackingRecord where BoxNumber=@BoxUnPackApart
	if(@Number=null)
		begin
			set @Number=1
		end
	else
		begin
			set @Number=@Number+1
		end
	insert into tmpUR (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear from PackingRecord
		where BoxNumber=@BoxUnPackApart
	update tmpUR set UnPackingNo=@Number
	insert into UnPackingRecord (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,UnPackingNo) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,UnPackingNo from tmpUR
	delete from tmpUR
	insert into UnPackingParts 
		select PONumber,Model,Serial from PackingRecord where BoxNumber=@BoxUnPackApart and Serial not in
		(select Serial from tmpPackingRecord where BoxNumber=@BoxUnPackApart)
	return
GO