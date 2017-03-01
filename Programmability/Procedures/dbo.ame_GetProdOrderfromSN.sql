SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_GetProdOrderfromSN] 
-- Define code
( 
@Serialnumberinput char ( 15 ) , 
@ProdOrder char ( 20 ) OUT 
) 
AS BEGIN 

SELECT @ProdOrder = tffc_prodorder FROM tffc_serialnumbers WHERE tffc_serialnumber = @Serialnumberinput 



END 
GO