SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_UpdatePartRun]
	@ProdOrder nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result int
	declare @result1 int
	declare @result2 int
	select @result1=count(*) from PackingRecord where PONumber=@ProdOrder
	select @result2=count(*) from UnPackingParts where PONumber=@ProdOrder
	
	set @result=@result1+@result2
	update T_Information set T_Packed=@result where T_ProdOrder=@ProdOrder
	return
GO