SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_UpdatePartRun2TInformation] 
@ProdOrder nchar ( 20 ) = NULL , 
@result int 
-- Define code
AS 
SET NOCOUNT ON 
--DECLARE @result int 

--UPDATE T_Information SET T_Packed = @result WHERE T_ProdOrder = @ProdOrder

exec ame_UpdatePartRun @ProdOrder
 
RETURN 


GO