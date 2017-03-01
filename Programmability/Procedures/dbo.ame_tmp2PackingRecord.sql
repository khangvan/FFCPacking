SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/* Khang create to update local data to Packingrecord Directly 

*/ 

CREATE PROCEDURE [dbo].[ame_tmp2PackingRecord] 
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

INSERT INTO PackingRecord ( PONumber , Model , Serial , BoxNumber , PackingDateTime , PYear ) 
VALUES ( @PONumber , @Model , @Serial , @BoxNumber , getdate ( ) , @PYear ) 

/* the following is coded by Truong

SELECT TOP 1 @iSeries = Series FROM [DLMDB].[dbo].[KANBANModelSeries] WHERE Model = @Model 

SELECT TOP 1 @iLine = Sect FROM [DLMDB].[dbo].[KANBANModelSeries] WHERE Model = @Model 

IF NOT EXISTS 
( 
SELECT Serial FROM [DLVNDB].[dbo].[ProdPackingRecord] WHERE Serial = @Serial 
) 
BEGIN 
INSERT INTO tmp_ProPackingRecord ( PONumber , Model , Serial , BoxNumber , PackingDateTime , Series , Line ) 
VALUES ( @PONumber , @Model , @Serial , @BoxNumber , getdate ( ) , @iSeries , @iLine ) 
END 


*/ 

RETURN 


GO