SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO


CREATE   PROCEDURE [dbo].[ame_PackingRecord2]
	@PONumber nchar(20)=NULL,
	@Model nchar(20)=NULL,
	@Serial nchar(20)=NULL,
	@BoxNumber nchar(20)=NULL,
	@PYear nchar(20)=NULL
-- Define code
AS
	
	declare @iSeries nchar(30)
	declare @iLine nchar(30)	
	
	set nocount on	
	
	insert into PackingRecord (PONumber,Model,Serial,BoxNumber,PackingDateTime,PYear) 
		values (@PONumber,@Model,@Serial,@BoxNumber,getdate(),@PYear)
		
	/* the following is coded by Truong
	*/
	SELECT TOP 1 @iSeries=Series FROM [DLMDB].[dbo].[KANBANModelSeries] where Model= @Model
	SELECT TOP 1 @iLine=Sect FROM [DLMDB].[dbo].[KANBANModelSeries] where Model= @Model
	
	insert into [DLVNDB].[dbo].[ProdPackingRecord] (PONumber,Model,Serial,BoxNumber,PackingDateTime,Series,Line) 
		values (@PONumber,@Model,@Serial,@BoxNumber,getdate(),@iSeries,@iLine)	
	/*
	*/
	
	return


GO