SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_GetProductMap]
	@SAPModel nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result nchar(20)
	DECLARE @PM nchar(20)
	
	IF EXISTS (select * from ProductMap where SAPModel=@SAPModel)
	begin
		--SELECT 'OK' AS Result
		select @PM= dbo.ProductMap.ProductMap from ProductMap where SAPModel=@SAPModel
	END

ELSE
	begin
		select @PM='NG'
	END

	SET @result = @PM
	SELECT @result AS Result


/*

select * from ProductMap where sapmodel ='gd4130-bk'

exec ame_GetProductMap 'gd4130-bk'
*/
GO