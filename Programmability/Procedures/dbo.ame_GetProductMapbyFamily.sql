SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_GetProductMapbyFamily]
@SapModel nchar(20)
AS
set nocount on
	declare @result nchar(20)
	DECLARE @PM nchar(20)
BEGIN

delete FROM dbo.ProductMap  WHERE ProductMap=''

IF EXISTS (select *
		from ProductMap
		where SAPModel=@SAPModel)
	begin

		select @PM= dbo.ProductMap.ProductMap
		from ProductMap
		where SAPModel=@SAPModel
	END

	ELSE
	begin
		select @PM='NG'

		select TOP 1 * 	from ProductMap where SAPModel like left(@SAPModel,len(@SAPModel)-1)
	END

	SET @result = @PM
	SELECT @result AS Result
	
END


/*

select * from ProductMap where sapmodel like'7400%'

exec ame_GetProductMapbyFamily '740021409'
*/
GO