SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_UnPackRecord]
	@BoxUnPack nchar(20)=NULL
-- Define code
AS
	declare @Part int
	declare @Packed int
	declare @PONumber char(30)
	
	set nocount on	
	insert into tmpUAR (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear from PackingRecord
		where BoxNumber=@BoxUnPack
	update tmpUAR set UnPackingAllDateTime=getdate()
	select @PONumber=PONumber,@Part=count(*) from tmpUAR group by PONumber,BoxNumber having BoxNumber=@BoxUnPack
	select @Packed=T_Packed from T_Information where T_ProdOrder=@PONumber
	set @Packed=@Packed-@Part
	if (@Packed<0) 
	begin
		set @Packed=0
	end
	update T_Information set T_Packed=@Packed  where T_ProdOrder=@PONumber
	update tmpBoxNumber set Packed=0 where BoxNumber=@BoxUnPack
	insert into UnPackingAllRecord (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,UnPackingAllDateTime) 
		select PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear,UnPackingAllDateTime from tmpUAR
	delete from tmpUAR
	return
GO