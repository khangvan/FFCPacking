SET QUOTED_IDENTIFIER ON

SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetPartRun2]
	@ProdOrder nchar(20)=NULL,
	@Rework char(1)=NULL,
	@BoxNumber nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result int
	declare @result1 int
	declare @result2 int
	
	if (ltrim(rtrim(@Rework))='1')
	begin
		select @result1=Qty from PackingRecordwoACS where PONumber=@ProdOrder and BoxNumber<>@BoxNumber
	end
	else
	begin
		select @result1=sum(Qty) from PackingRecordwoACS where PONumber=@ProdOrder
	end
	select @result2=count(*) from tmpPackingRecord where PONumber=@ProdOrder
	set @result=@result1+@result2
	return @result
GO