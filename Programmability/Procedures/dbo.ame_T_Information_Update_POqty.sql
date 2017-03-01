SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[ame_T_Information_Update_POqty] 
@T_ProdOrder nchar ( 20 )  
--@T_Quantity int 
AS 




BEGIN 
set nocount on;
declare @T_Quantity nchar(20);
declare @T_Packed nchar(20);

set @T_Packed =0
set @T_Quantity =0

select @T_Quantity = count(*) from TFFC_SerialNumbers where TFFC_ProdOrder = @T_ProdOrder
select @T_Packed = count(*) from PackingRecord where PONumber = @T_ProdOrder


    UPDATE T_Information SET T_Packed = @T_Packed,T_Quantity= @T_Quantity  WHERE T_ProdOrder = @T_ProdOrder 
END  


GO