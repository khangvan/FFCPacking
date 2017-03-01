SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_T_addSerialToTFFC_serialnumbers]
@Serial char ( 20 ) = NULL , 
@Material char ( 20 ) = NULL , 
@ProdOrder nchar ( 20 ) = NULL 
AS 
SET NOCOUNT ON 
--check for sub ffc---
    DECLARE @issubFFC BIT
    SET @issubFFC =0
   -- DECLARE @Material VARCHAR(30)
   --   SET @Material ='52-0064-00'

if exists (

select SAPModel from ProductMapSubFFC
where sapmodel =@Material
)
  BEGIN

  SET @issubFFC = 1 -- is sub ffc
    
  end
--check for sub ffc---

    IF NOT EXISTS 
    ( 
        SELECT TFFC_SerialNumber FROM TFFC_SerialNumbers 
        WHERE TFFC_ProdOrder = @ProdOrder 
        AND TFFC_SerialNumber = @Serial 
    ) 
    BEGIN 
		if ((@Material not like '700260[56]0[12345]') OR (@issubFFC=0)/*not sub ffc*/)
		begin
			INSERT INTO TFFC_SerialNumbers ( TFFC_ProdOrder , TFFC_SerialNumber , TFFC_Material ) 
			VALUES ( @ProdOrder , @Serial , @Material ) 
		end
    END 

SELECT 'OK'
GO