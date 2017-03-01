SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_PackingRecord1]
	@BoxNumber nchar(20)=NULL
-- Define code
AS
	set nocount on
	insert into PackingRecord (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear from tmpPackingRecord
		where BoxNumber=@BoxNumber
		
	
	insert into [DLVNDB].[dbo].[ProdPackingRecord] (PONumber,Model,Serial,BoxNumber,PackingDateTime,Series,Line) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,Series,Line from tmp_ProPackingRecord
		where BoxNumber=@BoxNumber
	
	delete from tmp_ProPackingRecord
		where BoxNumber=@BoxNumber
	
	update tmpBoxNumber set IsUsing='0',Packed='1' where BoxNumber=@BoxNumber
	return
GO