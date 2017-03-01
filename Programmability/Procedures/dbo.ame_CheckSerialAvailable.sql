SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_CheckSerialAvailable]
	@Serial nchar(30)=NULL
-- Define code
AS
	set nocount on
	declare @result nchar(20)
	declare @Model char(30)
	declare @PONumber char(30)
	declare @ProductMap char(30)
	declare @i int
	declare @j int
	declare @realSerial char(30)
	if exists(select Serial from UnPackingParts where Serial=@Serial)
	begin
		select @PONumber=PONumber,@Model=Model from UnPackingParts where Serial=@Serial
		select @ProductMap=ProductMap from ProductMap where SAPModel=@Model
		if (ltrim(rtrim(@ProductMap))='FFC' or ltrim(rtrim(@ProductMap))='DLM')
		begin
			set @result='Model-Serial'
		end
		else if (ltrim(rtrim(@ProductMap))='BASE')
		begin
			set @result='OK'
		end
	end
	else
	begin
		set @i=0
		set @j=len(ltrim(rtrim(@Serial)))
		while (substring(ltrim(rtrim(@Serial)),@j-@i,1)<>'-')
		begin
			set @i=@i+1
		end
		set @realSerial=right(ltrim(rtrim(@Serial)),@i)
		set @Model=left(ltrim(rtrim(@Serial)),@j-@i-1)
		set @Serial=@realSerial
		if exists(select Serial from UnPackingParts where Serial=@Serial)
		begin
			set @result='OK'
			select @PONumber=PONumber from UnPackingParts where Serial=@Serial
		end
		else
		begin
			set @result='NG'
		end
	end
	select @result as Result
	select @PONumber as PONumber,@Model as Model,@Serial as Serial
	return
GO