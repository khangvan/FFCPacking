SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_Get_ProductVerify]
	@ProductMap nchar(20)=NULL
-- Define code
as
	SET NOCOUNT ON;
	declare @result int
	

	IF EXISTS ( SELECT * FROM ProductVerify WHERE dbo.ProductVerify.ProductMap= @ProductMap)
	 BEGIN
	 SELECT "OK"
	 SELECT * FROM ProductVerify WHERE dbo.ProductVerify.ProductMap= @ProductMap
	 
	 END
	 ELSE
	 BEGIN
	 SELECT "NG-ProductMap is not correct"
	 end

	
	

	/*
	select * from ProductVerify
	*/
GO