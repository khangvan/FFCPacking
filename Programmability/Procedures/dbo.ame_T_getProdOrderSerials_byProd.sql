SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_T_getProdOrderSerials_byProd] 
@ProdOrder char ( 20 ) = NULL 
AS 
SET NOCOUNT ON 

BEGIN 
    IF EXISTS 
    ( 
        SELECT TFFC_ProdOrder FROM TFFC_SerialNumbers WHERE TFFC_ProdOrder = @ProdOrder 
    ) 
    BEGIN 
        SELECT 'OK' 

        SELECT 
        TFFC_SerialNumber , 
        TFFC_Material 
        FROM TFFC_SerialNumbers WHERE TFFC_ProdOrder = @ProdOrder 

    END 
    ELSE 
    BEGIN 
        SELECT ' NONE ' 

    END 
END 

RETURN 



GO