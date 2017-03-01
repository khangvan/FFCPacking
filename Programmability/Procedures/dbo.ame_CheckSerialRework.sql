SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_CheckSerialRework]
	@PONumber nchar(20)=NULL,
	@Model nchar(20)=NULL,
	@Serial nchar(20)=NULL,
	@BoxRework nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result char(30)
	declare @Box char(30)
	declare @Box1 char(30)
	declare @PO char(30)
	select @Box=BoxNumber,@PO=PONumber from PackingRecord where Model=@Model and Serial=@Serial
	if (@Box=Null)
	begin
		select @Box=BoxNumber,@PO=PONumber from tmpPackingRecord where Model=@Model and Serial=@Serial			
		if (@Box=Null)
		begin
			set @result='OK'
		end
		else
		begin
			set @result='Dang Packing'
		end
	end
	else
	begin
		if (ltrim(rtrim(@Box))=ltrim(rtrim(@BoxRework)))
		begin
			select @Box1=BoxNumber,@PO=PONumber from tmpPackingRecord where Model=@Model and Serial=@Serial			
			if (@Box1=Null)
			begin
				set @result='OK'
			end
			else
			begin
				set @result='Dang Packing'
			end
		end
		else
		begin
			if(rtrim(ltrim(@PONumber))=rtrim(ltrim(@PO)))
			begin
				set @result='NG'
			end
			else
			begin
				set @result='NGP'
			end
		end			
	end		
	select @result as Result
	select @box as Box,@PO as PO
	return
GO