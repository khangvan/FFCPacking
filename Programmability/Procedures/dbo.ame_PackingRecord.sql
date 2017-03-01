SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO







CREATE PROCEDURE [dbo].[ame_PackingRecord] @PONumber nchar(20) =NULL
,                                          @BoxNumber nchar(20)=NULL
-- Define code
AS
	set nocount on
	--khai bao so luong update
	declare @countpacking int
	set @countpacking =0

	declare @countpacking1 int
	set @countpacking1 =0

	declare @Result nchar(20)
	set @Result ='NG'

-- count so luong chuyen di
begin
	select @countpacking= count (*)
	from tmpPackingRecord
	where PONumber=@PONumber and BoxNumber=@BoxNumber
	if (@countpacking =0)
	
			set @Result ='OK'
	
	else begin
		insert into PackingRecord ( PONumber, Model, Serial, BoxNumber, PackingDateTime, PYear )
		select PONumber
		,      Model
		,      Serial
		,      BoxNumber
		,      PackingDateTime
		,      PYear
		from tmpPackingRecord
		where PONumber=@PONumber and BoxNumber=@BoxNumber

		/*
		Code here to do a duplicate a packingdata package
		*/
		
		/*
		Coded By Truong Ngo
		******************************************************************************************************
		******************************************************************************************************
		*/
		/*
		DELETE FROM [DLVNDB].[dbo].[PackagingRecord] WHERE DATEDIFF(DAY,PackingDateTime,GETDATE()-3) >= '0'
		INSERT INTO [DLVNDB].[dbo].[PackagingRecord] (PONumber,Model,Serial,BoxNumber,PackingDateTime)
				SELECT PONumber,Model,Serial,BoxNumber,PackingDateTime FROM [FFCPacking].[dbo].[tmpPackingRecord]
																	   WHERE PONumber=@PONumber and BoxNumber=@BoxNumber
		*/
		/*
		******************************************************************************************************
		******************************************************************************************************
		*/
		begin
			--clear packing record
			exec ame_ClearPackingRecord @PONumber
			,                           @BoxNumber
			set @Result ='OK'
			select @Result as Result
		END
			/*
		Code here
		*/

	end
end
	/*
	if not exists(select BoxNumber from ProdPackingRecord where BoxNumber=@BoxNumber)
	begin
	if not exists(select Serial from ProdPackingRecord where Serial in (select Serial from tmpPackingRecord where BoxNumber=@BoxNumber))
	begin
	insert into ProdPackingRecord (PONumber,Model,Serial,BoxNumber,PackingDateTime,Series,Line)
	select PONumber,Model,Serial,BoxNumber,PackingDateTime,Series,Line from tmpPackingRecord
	where PONumber=@PONumber and BoxNumber=@BoxNumber
	end
	end
	
	*/

	/*insert into [DLVNDB].[dbo].[ProdPackingRecord] (PONumber,Model,Serial,BoxNumber,PackingDateTime,Series,Line)
	select PONumber,Model,Serial,BoxNumber,PackingDateTime,Series,Line from tmp_ProPackingRecord
	where PONumber=@PONumber and BoxNumber=@BoxNumber
	
	delete from tmp_ProPackingRecord
	where PONumber=@PONumber and BoxNumber=@BoxNumber*/


	update tmpBoxNumber
	set IsUsing = '0'
	,   Packed  = '1'
	where BoxNumber=@BoxNumber
--return
GO