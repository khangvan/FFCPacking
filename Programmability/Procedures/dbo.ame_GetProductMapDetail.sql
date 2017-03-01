SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_GetProductMapDetail] 
@SAPModel nchar ( 20 ) = NULL , 
@Description nchar ( 60 ) = NULL output 
-- Define code
AS 
SET NOCOUNT ON 
DECLARE @result nchar ( 20 ) 
--@Description nchar ( 60 ) 

SELECT 
@result = Productmap , 
@Description = Description 
FROM ProductMap WHERE SAPModel = @SAPModel 

IF ( @result = NULL ) 
BEGIN 
    SET @result = 'NG' 
END 
SELECT @result AS Result 

SELECT @Description AS Description 

RETURN 


GO