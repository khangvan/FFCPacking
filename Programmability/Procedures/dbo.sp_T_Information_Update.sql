SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- ==========================================================================================
-- Entity Name: sp_T_Information_Update
-- Author: Mehdi Keramati
-- Create date: 1/13/2014 11:48:21 PM
-- Description: This stored procedure is intended for updating T_Information table
-- ==========================================================================================
CREATE PROCEDURE [dbo].[sp_T_Information_Update] 
@T_ProdOrder nchar ( 20 ) , 
@T_Quantity int 
AS 
BEGIN 
    UPDATE T_Information 
    SET 
    [T_Quantity] = @T_Quantity 

    WHERE 
    [T_ProdOrder] = @T_ProdOrder 

END 


GO