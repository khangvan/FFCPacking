SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_GetProductVerify]
	@ProductMap nchar(20)=NULL
-- Define code
as
	SET NOCOUNT ON;
	declare @result int
	

	IF EXISTS ( SELECT * FROM ProductVerify WHERE dbo.ProductVerify.ProductMap= @ProductMap)
	 BEGIN
	 SELECT 'OK' AS Result
	 SELECT * FROM ProductVerify WHERE dbo.ProductVerify.ProductMap= @ProductMap
	 
	 END
	 ELSE
	 BEGIN
	 SELECT 'NG-ProductMap is not correct' AS Result
	 end

	
	

	/*
	select * from ProductVerify
	*/
GO