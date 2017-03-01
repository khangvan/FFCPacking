SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_GetPoInformationDetail] 
@PoNumber nchar ( 20 ) = NULL 

-- Define code
AS 
SET NOCOUNT ON 
DECLARE @result nchar ( 20 ) 
--@Description nchar ( 60 ) 
 SELECT 'OK' 

SELECT        T_Information.T_ProdOrder, T_Information.T_Material, T_Information.T_Revision, ProductMap.Description, ProductMap.ProductMap, T_Information.T_Quantity, 
                         T_Information.T_Packed
FROM            T_Information INNER JOIN
                         ProductMap ON T_Information.T_Material = ProductMap.SAPModel
WHERE        (T_Information.T_ProdOrder = @PoNumber) 

IF ( @result = NULL ) 
BEGIN 
    SET @result = 'NG' 
END 
SELECT @result AS Result 



RETURN 
GO