SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_tmpPackingRecord] 
@PONumber nchar ( 20 ) = NULL , 
@Model nchar ( 20 ) = NULL , 
@Serial nchar ( 20 ) = NULL , 
@BoxNumber nchar ( 20 ) = NULL , 
@PYear nchar ( 20 ) = NULL 
-- Define code  
AS 

DECLARE @iSeries nchar ( 30 ) 
DECLARE @iLine nchar ( 30 ) 

SET NOCOUNT ON 

--#region Before 14 Sep - temp first, then copy to packingrecord
--INSERT INTO tmpPackingRecord ( PONumber , Model , Serial , BoxNumber , PackingDateTime , PYear ) 
--VALUES ( @PONumber , @Model , @Serial , @BoxNumber , getdate ( ) , @PYear ) 
--#endregion Before 14 Sep

--#region 14-Sep 2015 - Direct to packingrecord
INSERT INTO PackingRecord ( PONumber , Model , Serial , BoxNumber , PackingDateTime , PYear ) 
VALUES ( @PONumber , @Model , @Serial , @BoxNumber , getdate ( ) , @PYear )
--#endregion 14-Sep 2015
 



RETURN 



GO