SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetPartRun]
	@ProdOrder nchar(20)=NULL,
	@Rework char(1)=NULL,
	@BoxNumber nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result int
	declare @result1 int
	declare @result2 int
	declare @result3 int
	if (ltrim(rtrim(@Rework))='1')
	begin
		select @result1=count(*) from PackingRecord where PONumber=@ProdOrder and BoxNumber<>@BoxNumber
	end
	else
	begin
		select @result1=count(*) from PackingRecord where PONumber=@ProdOrder
	end
	select @result2=count(*) from tmpPackingRecord where PONumber=@ProdOrder
	select @result3=count(*) from UnPackingParts where PONumber=@ProdOrder
	set @result=@result1+@result2+@result3
	return @result
GO